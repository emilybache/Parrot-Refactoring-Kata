#include <gtest/gtest.h>

using namespace std;

#include "Parrot.h"


TEST(ParrotTest, SpeedOfEuropeanParrot) {
    auto *parrot = new Parrot(EUROPEAN, 0, 0, false);
    EXPECT_NEAR(12.0, parrot->getSpeed(), 0.0);
    delete parrot;
}
TEST(ParrotTest, CryOfEuropeanParrot) {
    auto *parrot = new Parrot(EUROPEAN, 0, 0, false);
    EXPECT_EQ("Sqoork!", parrot->getCry());
    delete parrot;
}

TEST(ParrotTest, SpeedOfAfricanParrot_With_One_Coconut) {
    auto *parrot = new Parrot(AFRICAN, 1, 0, false);
    EXPECT_NEAR(3.0, parrot->getSpeed(), 0.0);
    delete parrot;
}

TEST(ParrotTest, CryOfAfricanParrot_With_One_Coconut) {
    auto *parrot = new Parrot(AFRICAN, 1, 0, false);
    EXPECT_EQ("Squaark!", parrot->getCry());
    delete parrot;
}

TEST(ParrotTest, SpeedOfAfricanParrot_With_Two_Coconuts) {
    auto *parrot = new Parrot(AFRICAN, 2, 0, false);
    EXPECT_NEAR(0.0, parrot->getSpeed(), 0.0);
    delete parrot;
}

TEST(ParrotTest, SpeedOfAfricanParrot_With_No_Coconuts) {
    auto *parrot = new Parrot(AFRICAN, 0, 0, false);
    EXPECT_NEAR(12.0, parrot->getSpeed(), 0.0);
    delete parrot;
}

TEST(ParrotTest, SpeedNorwegianBlueParrot_nailed) {
    auto *parrot = new Parrot(NORWEGIAN_BLUE, 0, 1.5, true);
    EXPECT_NEAR(0.0, parrot->getSpeed(), 0.0);
    delete parrot;
}

TEST(ParrotTest, CryNorwegianBlueParrot_no_voltage) {
    auto *parrot = new Parrot(NORWEGIAN_BLUE, 0, 0, true);
    EXPECT_EQ("...", parrot->getCry());
    delete parrot;
}
TEST(ParrotTest, CryNorwegianBlueParrot_high_voltage) {
    auto *parrot = new Parrot(NORWEGIAN_BLUE, 0, 24, true);
    EXPECT_EQ("Bzzzzzz", parrot->getCry());
    delete parrot;
}

TEST(ParrotTest, SpeedNorwegianBlueParrot_not_nailed) {
    auto *parrot = new Parrot(NORWEGIAN_BLUE, 0, 1.5, false);
    EXPECT_NEAR(18.0, parrot->getSpeed(), 0.0);
    delete parrot;
}

TEST(ParrotTest, SpeedNorwegianBlueParrot_not_nailed_high_voltage) {
    auto *parrot = new Parrot(NORWEGIAN_BLUE, 0, 4, false);
    EXPECT_NEAR(24.0, parrot->getSpeed(), 0.0);
    delete parrot;
}
