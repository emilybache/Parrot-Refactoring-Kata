from parrot import ParrotType, Parrot


def create_parrot(type_of_parrot, number_of_coconuts, voltage, nailed):
    match type_of_parrot:
        case ParrotType.EUROPEAN:
            parrot = Parrot(type_of_parrot, number_of_coconuts, voltage, nailed)

        case ParrotType.AFRICAN:
            parrot = Parrot(type_of_parrot, number_of_coconuts, voltage, nailed)

        case ParrotType.NORWEGIAN_BLUE:
            parrot = Parrot(type_of_parrot, number_of_coconuts, voltage, nailed)

        case _:
            raise ValueError(f"unknown parrot: {type_of_parrot}")
    return parrot
