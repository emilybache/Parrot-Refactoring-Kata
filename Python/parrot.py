from enum import Enum


class ParrotType(Enum):
    EUROPEAN = 1
    AFRICAN = 2
    NORWEGIAN_BLUE = 3


class Parrot:

    def _load_factor(self):
        return 9.0

    def _base_speed(self):
        return 12.0
