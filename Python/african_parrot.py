from parrot import Parrot, ParrotType


class AfricanParrot(Parrot):

    def __init__(self, number_of_coconuts):
        super().__init__()
        self._number_of_coconuts = number_of_coconuts


    def speed(self):
        return max(0, self._base_speed() - self._load_factor() * self._number_of_coconuts)

    def cry(self):
        return "Sqaark!"

