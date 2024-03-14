from african_parrot import AfricanParrot
from european_parrot import EuropeanParrot
from norwegian_parrot import NorwegianBlueParrot
from parrot import ParrotType


def create_parrot(type_of_parrot, number_of_coconuts, voltage, nailed):
    match type_of_parrot:
        case ParrotType.EUROPEAN:
            parrot = EuropeanParrot()

        case ParrotType.AFRICAN:
            parrot = AfricanParrot(number_of_coconuts)

        case ParrotType.NORWEGIAN_BLUE:
            parrot = NorwegianBlueParrot(voltage, nailed)

        case _:
            raise ValueError(f"unknown parrot: {type_of_parrot}")
    return parrot
