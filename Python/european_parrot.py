from parrot import Parrot, ParrotType, _base_speed


class EuropeanParrot(Parrot):

    def __init__(self):
        super().__init__()

    def speed(self):
        return _base_speed()

    def cry(self):
        return "Sqoork!"


