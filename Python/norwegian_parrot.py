from parrot import Parrot, ParrotType


class NorwegianBlueParrot(Parrot):

    def __init__(self, number_of_coconuts, voltage, nailed):
        super().__init__(ParrotType.NORWEGIAN_BLUE, number_of_coconuts, voltage, nailed)

    def speed(self):
        return 0 if self._nailed else self._compute_base_speed_for_voltage(self._voltage)

    def cry(self):
        return "Bzzzzzz" if self._voltage > 0 else "..."
