from parrot import Parrot, ParrotType, _base_speed


class AfricanParrot(Parrot):

    def __init__(self, number_of_coconuts):
        super().__init__()
        self._number_of_coconuts = number_of_coconuts


    def speed(self):
        return max(0, _base_speed() - self._load_factor() * self._number_of_coconuts)

    def cry(self):
        return "Sqaark!"

    def _load_factor(self):
        return 9.0

