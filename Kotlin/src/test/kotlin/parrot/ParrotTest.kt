package parrot

import org.junit.Test

import org.junit.Assert.assertEquals

class ParrotTest {

    @Test
    fun getSpeedOfEuropeanParrot() {
        val parrot = Parrot(ParrotTypeEnum.EUROPEAN, 0, 0.0, false)
        assertEquals(12.0, parrot.speed, 0.0)
    }

    @Test
    fun getSpeedOfAfricanParrot_With_One_Coconut() {
        val parrot = Parrot(ParrotTypeEnum.AFRICAN, 1, 0.0, false)
        assertEquals(3.0, parrot.speed, 0.0)
    }

    @Test
    fun getSpeedOfAfricanParrot_With_Two_Coconuts() {
        val parrot = Parrot(ParrotTypeEnum.AFRICAN, 2, 0.0, false)
        assertEquals(0.0, parrot.speed, 0.0)
    }

    @Test
    fun getSpeedOfAfricanParrot_With_No_Coconuts() {
        val parrot = Parrot(ParrotTypeEnum.AFRICAN, 0, 0.0, false)
        assertEquals(12.0, parrot.speed, 0.0)
    }

    @Test
    fun getSpeedNorwegianBlueParrot_nailed() {
        val parrot = Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 1.5, true)
        assertEquals(0.0, parrot.speed, 0.0)
    }

    @Test
    fun getSpeedNorwegianBlueParrot_not_nailed() {
        val parrot = Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 1.5, false)
        assertEquals(18.0, parrot.speed, 0.0)
    }

    @Test
    fun getSpeedNorwegianBlueParrot_not_nailed_high_voltage() {
        val parrot = Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 4.0, false)
        assertEquals(24.0, parrot.speed, 0.0)
    }

    @Test
    fun getCryOfEuropeanParrot() {
        val parrot = Parrot(ParrotTypeEnum.EUROPEAN, 0, 0.0, false)
        assertEquals("Sqoork!", parrot.cry)
    }

    @Test
    fun getCryOfAfricanParrot() {
        val parrot = Parrot(ParrotTypeEnum.AFRICAN, 1, 0.0, false)
        assertEquals("Sqaark!", parrot.cry)
    }

    @Test
    fun getCryOfNorwegianBlue_high_voltage() {
        val parrot = Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 4.0, false)
        assertEquals("Bzzzzzz", parrot.cry)
    }

    @Test
    fun getCryOfNorwegianBlue_no_voltage() {
        val parrot = Parrot(ParrotTypeEnum.NORWEGIAN_BLUE, 0, 0.0, false)
        assertEquals("...", parrot.cry)
    }
}
