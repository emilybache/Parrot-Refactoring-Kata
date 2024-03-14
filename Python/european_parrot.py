from parrot import Parrot, ParrotType


class EuropeanParrot(Parrot):

    def __init__(self):
        super().__init__()

    def speed(self):
        return self._base_speed()

    def cry(self):
        return "Sqoork!"

