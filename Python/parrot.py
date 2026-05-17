from enum import Enum
from abc import ABC, abstractmethod


class ParrotType(Enum):
    EUROPEAN = 1
    AFRICAN = 2
    NORWEGIAN_BLUE = 3


class Parrot(ABC):

    def __init__(self, type_of_parrot, number_of_coconuts, voltage, nailed):
        self._type = type_of_parrot
        self._number_of_coconuts = number_of_coconuts
        self._voltage = voltage
        self._nailed = nailed

    @abstractmethod
    def speed(self):
        pass

    @abstractmethod
    def cry(self):
        pass

    def _compute_base_speed_for_voltage(self, voltage):
        return min([24.0, voltage * self._base_speed()])

    def _load_factor(self):
        return 9.0

    def _base_speed(self):
        return 12.0


class EuropeanParrot(Parrot):

    def __init__(self):
        super().__init__(ParrotType.EUROPEAN, 0, 0, False)

    def speed(self):
        return self._base_speed()

    def cry(self):
        return "Sqoork!"


class AfricanParrot(Parrot):

    def __init__(self, number_of_coconuts):
        super().__init__(ParrotType.AFRICAN, number_of_coconuts, 0, False)

    def speed(self):
        return max(0, self._base_speed() - self._load_factor() * self._number_of_coconuts)

    def cry(self):
        return "Sqaark!"


class NorwegianBlueParrot(Parrot):

    def __init__(self, voltage, nailed):
        super().__init__(ParrotType.NORWEGIAN_BLUE, 0, voltage, nailed)

    def speed(self):
        return 0 if self._nailed else self._compute_base_speed_for_voltage(self._voltage)

    def cry(self):
        return "Bzzzzzz" if self._voltage > 0 else "..."
