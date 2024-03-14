from parrot import Parrot, ParrotType


class EuropeanParrot(Parrot):

    def __init__(self, number_of_coconuts, voltage, nailed):
        super().__init__(number_of_coconuts, voltage, nailed)

    def speed(self):
        return self._base_speed()

    def cry(self):
        return "Sqoork!"
