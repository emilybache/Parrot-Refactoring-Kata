from parrot import Parrot, ParrotType


class EuropeanParrot(Parrot):

    def __init__(self, voltage, nailed):
        super().__init__(voltage, nailed)

    def speed(self):
        return self._base_speed()

    def cry(self):
        return "Sqoork!"
