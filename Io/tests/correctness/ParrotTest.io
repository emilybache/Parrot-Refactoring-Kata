doRelativeFile("../../io/Parrot.io")

ParrotTest := UnitTest clone do(

    testGetSpeedOfEuropeanParrot := method(
        parrot := Parrot with(ParrotType EUROPEAN, 0, 0, false)
        assertEquals(12.0, parrot getSpeed)
    )

    testGetSpeedOfAfricanParrot_With_One_Coconut := method(
        parrot := Parrot with(ParrotType AFRICAN, 1, 0, false)
        assertEquals(3.0, parrot getSpeed)
    )

    testGetSpeedOfAfricanParrot_With_Two_Coconuts := method(
        parrot := Parrot with(ParrotType AFRICAN, 2, 0, false)
        assertEquals(0.0, parrot getSpeed)
    )

    testGetSpeedOfAfricanParrot_With_No_Coconuts := method(
        parrot := Parrot with(ParrotType AFRICAN, 0, 0, false)
        assertEquals(12.0, parrot getSpeed)
    )

    testGetSpeedNorwegianBlueParrot_nailed := method(
        parrot := Parrot with(ParrotType NORWEGIAN_BLUE, 0, 1.5, true)
        assertEquals(0.0, parrot getSpeed)
    )

    testGetSpeedNorwegianBlueParrot_not_nailed := method(
        parrot := Parrot with(ParrotType NORWEGIAN_BLUE, 0, 1.5, false)
        assertEquals(18.0, parrot getSpeed)
    )

    testGetSpeedNorwegianBlueParrot_not_nailed_high_voltage := method(
        parrot := Parrot with(ParrotType NORWEGIAN_BLUE, 0, 4, false)
        assertEquals(24.0, parrot getSpeed)
    )

    testGetCryOfEuropeanParrot := method(
        parrot := Parrot with(ParrotType EUROPEAN, 0, 0, false)
        assertEquals("Sqoork!", parrot getCry)
    )

    testGetCryOfAfricanParrot := method(
        parrot := Parrot with(ParrotType AFRICAN, 1, 0, false)
        assertEquals("Sqaark!", parrot getCry)
    )

    testGetCryOfNorwegianBlueHighVoltage := method(
        parrot := Parrot with(ParrotType NORWEGIAN_BLUE, 0, 4, false)
        assertEquals("Bzzzzzz", parrot getCry)
    )

    testGetCryOfNorwegianBlueNoVoltage := method(
        parrot := Parrot with(ParrotType NORWEGIAN_BLUE, 0, 0, false)
        assertEquals("...", parrot getCry)
    )

)
