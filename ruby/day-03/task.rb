# DAY-03
=begin

  Modify the CSV application to support an each method to return a CsvRow object.
  Use method_missing on that CsvRow to return the value for the column for a given heading.

  For example, for the file:
        one, two
        lions, tigers
  allow an API that works like this:
        csv = RubyCsv.new
        csv.each {|row| puts row.one}
  This should print "lions".

=end
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  class CsvRow
    def initialize row, headers
      @cols = headers
      @row = row
    end

    def to_s
      @row.join ' '
    end

    def method_missing name, *args
      idx = @cols.find_index(name.to_s)
      return "[no column '#{name}']" if idx == nil
      @row[idx]
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  def each
    self.csv_contents.each do |row|

      r = CsvRow.new(row, self.headers)
      yield r
    end
  end

  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect

m.each do |row|
  puts "Printing whole row: '#{row}'"
end

m.each do |row|
  puts "Printing first column: '#{row.one}' and the fourth: '#{row.four}'"
end