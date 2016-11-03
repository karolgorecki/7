class Tree
    attr_accessor :children, :node_name, :tabs
    def initialize(name, children=[], tabs=0)
        @children = []
        @tabs = tabs.to_i
        @node_name = name
        make_children(children)
    end

    def make_children(ch)
        if ch.class == Hash
            make_children_from_hash(ch)
        else
            @children = ch
        end
    end

    def make_children_from_hash(ch)
        ch.each do |k, v|
            @children.push(Tree.new(k,v, @tabs + 1))
        end
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end


ruby_tree = Tree.new("Ruby", [Tree.new("Reia" ),Tree.new("MacRuby")])

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}

puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


puts
puts

rt = Tree.new('Family tree',
{
    'grandpa' => {
        'dad' => {
            'child 1' => {},
            'child 2' => {} 
        },
        'uncle' => {
            'child 3' => {},
            'child 4' => {}
        }
    }
})

rt.visit_all do |node| 
    node.tabs.times { print '  '}
    print "#{node.node_name}\n"
end