List myAverage := method(
    if(self isEmpty,
        Exception raise("Cannot use method '#{call message name}' on empty list." interpolate)
    )

    if(self detect(x,
        x type != "Number"
    ),
        Exception raise("Method '#{call message name}' can only be use on lists containing numbers and nothing else" interpolate)
    )

    self sum / self size
)
