from parrot import Parrot, ParrotType, create_parrot


def test_speedOfEuropeanParrot():
    parrot = create_parrot(type_of_parrot=ParrotType.EUROPEAN, number_of_coconuts=0, voltage=0, nailed=False)
    assert parrot.speed() == 12.0


def test_cryOfEuropeanParrot():
    parrot = create_parrot()
    assert parrot.cry() == "Sqoork!"


def test_speedOfAfricanParrot_With_One_Coconut():
    parrot = create_parrot(ParrotType.AFRICAN, 1, 0, False)
    assert parrot.speed() == 3.0


def test_cryOfAfricanParrot():
    parrot = create_parrot(ParrotType.AFRICAN, 1, 0, False)
    assert parrot.cry() == "Sqaark!"


def test_speedOfAfricanParrot_With_Two_Coconuts():
    parrot = create_parrot(ParrotType.AFRICAN, 2, 0, False)
    assert parrot.speed() == 0.0


def test_speedOfAfricanParrot_With_No_Coconuts():
    parrot = create_parrot(ParrotType.AFRICAN, 0, 0, False)
    assert parrot.speed() == 12.0


def test_speedNorwegianBlueParrot_nailed():
    parrot = create_parrot(ParrotType.NORWEGIAN_BLUE, 0, 1.5, True)
    assert parrot.speed() == 0.0


def test_speedNorwegianBlueParrot_not_nailed():
    parrot = create_parrot(ParrotType.NORWEGIAN_BLUE, 0, 1.5, False)
    assert parrot.speed() == 18.0


def test_speedNorwegianBlueParrot_not_nailed_high_voltage():
    parrot = create_parrot(ParrotType.NORWEGIAN_BLUE, 0, 4, False)
    assert parrot.speed() == 24.0

def test_cryNorwegianBlueParrot_high_voltage():
    parrot = create_parrot(ParrotType.NORWEGIAN_BLUE, 0, 4, False)
    assert parrot.cry() == "Bzzzzzz"

def test_cryNorwegianBlueParrot_no_voltage():
    parrot = create_parrot(ParrotType.NORWEGIAN_BLUE, 0, 0, False)
    assert parrot.cry() == "..."
