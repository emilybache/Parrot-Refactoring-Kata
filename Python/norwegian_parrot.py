from parrot import Parrot, ParrotType


class NorwegianBlueParrot(Parrot):

    def __init__(self, voltage, nailed):
        super().__init__()
        self._voltage = voltage
        self._nailed = nailed


    def speed(self):
        return 0 if self._nailed else self._compute_base_speed_for_voltage(self._voltage)

    def cry(self):
        return "Bzzzzzz" if self._voltage > 0 else "..."

    def _compute_base_speed_for_voltage(self, voltage):
        return min([24.0, voltage * self._base_speed()])

