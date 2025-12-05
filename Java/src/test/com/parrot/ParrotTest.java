package com.parrot;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
class ParrotTest {

    @Test
    void getSpeedOfEuropeanParrot() {
        Parrot parrot = new EuropeanParrot(0, 0, false);
        assertEquals(12.0, parrot.getSpeed(), 0.0);
    }

    @Test
    void getSpeedOfAfricanParrot_With_One_Coconut() {
        Parrot parrot = new AfricanParrot(1, 0, false);
        assertEquals(3.0, parrot.getSpeed(), 0.0);
    }

    @Test
    void getSpeedOfAfricanParrot_With_Two_Coconuts() {
        Parrot parrot = new AfricanParrot(2, 0, false);
        assertEquals(0.0, parrot.getSpeed(), 0.0);
    }

    @Test
    void getSpeedOfAfricanParrot_With_No_Coconuts() {
        Parrot parrot = new AfricanParrot(0, 0, false);
        assertEquals(12.0, parrot.getSpeed(), 0.0);
    }

    @Test
    void getSpeedNorwegianBlueParrot_nailed() {
        Parrot parrot = new NorwegianParrot(0, 1.5, true);
        assertEquals(0.0, parrot.getSpeed(), 0.0);
    }

    @Test
    void getSpeedNorwegianBlueParrot_not_nailed() {
        Parrot parrot = new NorwegianParrot(0, 1.5, false);
        assertEquals(18.0, parrot.getSpeed(), 0.0);
    }

    @Test
    void getSpeedNorwegianBlueParrot_not_nailed_high_voltage() {
        Parrot parrot = new NorwegianParrot(0, 4, false);
        assertEquals(24.0, parrot.getSpeed(), 0.0);
    }

    @Test
    void getCryOfEuropeanParrot() {
        Parrot parrot = new EuropeanParrot(0, 0, false);
        assertEquals("Sqoork!", parrot.getCry());
    }

    @Test
    void getCryOfAfricanParrot() {
        Parrot parrot = new AfricanParrot(1, 0, false);
        assertEquals("Sqaark!", parrot.getCry());
    }

    @Test
    void getCryOfNorwegianBlueHighVoltage() {
        Parrot parrot = new NorwegianParrot(0, 4, false);
        assertEquals("Bzzzzzz", parrot.getCry());
    }

    @Test
    void getCryOfNorwegianBlueNoVoltage() {
        Parrot parrot = new NorwegianParrot(0, 0, false);
        assertEquals("...", parrot.getCry());
    }
}
