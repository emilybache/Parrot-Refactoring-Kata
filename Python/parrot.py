from enum import Enum

class ParrotType(Enum):
    EUROPEAN = 1
    AFRICAN = 2
    NORWEGIAN_BLUE = 3

class Parrot:
    def __init__(self, type, number_of_coconuts, voltage, nailed):
        self.type = type
        self.number_of_coconuts = number_of_coconuts
        self.voltage = voltage
        self.nailed = nailed

    def speed(self):
        if self.type == ParrotType.EUROPEAN:
            return self._base_speed()
        if self.type == ParrotType.AFRICAN:
            return max(0, self._base_speed() - self._load_factor() * self.number_of_coconuts)
        if self.type == ParrotType.NORWEGIAN_BLUE:
            if self.nailed:
                return 0
            else: 
                return self._compute_base_speed_for_voltage(self.voltage)

        raise ValueError("should be unreachable")

    def _compute_base_speed_for_voltage(self, voltage):
       return min([24.0, voltage * self._base_speed()])

    def _load_factor(self):
      return 9.0

    def _base_speed(self):
      return 12.0
 