from enum import Enum
from dataclasses import dataclass
from typing import Union


class ParrotType(Enum):
    EUROPEAN = 1
    AFRICAN = 2
    NORWEGIAN_BLUE = 3


def _base_speed(self):
    return 12.0

parrot_func_dict = {
    ParrotType.EUROPEAN: _base_speed,
    ParrotType.AFRICAN: ,
    ParrotType.NORWEGIAN_BLUE:
}

@dataclass
class Parrot:
    type_of_parrot: ParrotType
    number_of_coconuts: int
    voltage: Union[int, float]
    nailed: bool

    def speed(self):
        if self.type_of_parrot == ParrotType.EUROPEAN:
            return self._base_speed()
        if self.type_of_parrot == ParrotType.AFRICAN:
            return max(0, self._base_speed() - self._load_factor() * self.number_of_coconuts)
        if self.type_of_parrot == ParrotType.NORWEGIAN_BLUE: 
            if self.nailed:
                return 0
            else:
                return self._compute_base_speed_for_voltage(self.voltage)

    raise ValueError("should be unreachable")

def _compute_base_speed_for_voltage(self, voltage):
    return min([24.0, voltage * self._base_speed()])

def _load_factor(self):
    return 9.0


