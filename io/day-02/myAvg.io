// Add a slot called myAverage to a list
// that computes the average of all the numbers in a list.
// What happens if there are no numbers in a list?
// (Bonus: Raise an Io exception if any item in the list is not a number.)

List myAverage := method(
    // could use `average`
    sum := 0
    self foreach(idx, val,
        if (val type == "Number",
            sum := sum + val,
            Exception raise(val .. " (type: " .. (val type) .. ") is not a number!")
        )

        sum / self size
    )
)

ar := list(10,10,10)
ar myAverage println

arErr := list(10,10,"10")
arErr myAverage println
