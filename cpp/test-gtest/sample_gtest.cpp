#include <gtest/gtest.h>

using namespace std;

#include "Parrot.h"


TEST(ParrotTest, SpeedOfEuropeanParrot) {
    auto parrot = make_unique<Parrot>(EUROPEAN, 0, 0, false);
    EXPECT_NEAR(12.0, parrot->getSpeed(), 0.0);
}

TEST(ParrotTest, CryOfEuropeanParrot) {
    auto parrot = make_unique<Parrot>(EUROPEAN, 0, 0, false);
    EXPECT_EQ("Sqoork!", parrot->getCry());
}

TEST(ParrotTest, SpeedOfAfricanParrot_With_One_Coconut) {
    auto parrot = make_unique<Parrot>(AFRICAN, 1, 0, false);
    EXPECT_NEAR(3.0, parrot->getSpeed(), 0.0);
}

TEST(ParrotTest, CryOfAfricanParrot_With_One_Coconut) {
    auto parrot = make_unique<Parrot>(AFRICAN, 1, 0, false);
    EXPECT_EQ("Squaark!", parrot->getCry());
}

TEST(ParrotTest, SpeedOfAfricanParrot_With_Two_Coconuts) {
    auto parrot = make_unique<Parrot>(AFRICAN, 2, 0, false);
    EXPECT_NEAR(0.0, parrot->getSpeed(), 0.0);
}

TEST(ParrotTest, SpeedOfAfricanParrot_With_No_Coconuts) {
    auto parrot = make_unique<Parrot>(AFRICAN, 0, 0, false);
    EXPECT_NEAR(12.0, parrot->getSpeed(), 0.0);
}

TEST(ParrotTest, SpeedNorwegianBlueParrot_nailed) {
    auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 1.5, true);
    EXPECT_NEAR(0.0, parrot->getSpeed(), 0.0);
}

TEST(ParrotTest, CryNorwegianBlueParrot_no_voltage) {
    auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 0, true);
    EXPECT_EQ("...", parrot->getCry());
}

TEST(ParrotTest, CryNorwegianBlueParrot_high_voltage) {
    auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 24, true);
    EXPECT_EQ("Bzzzzzz", parrot->getCry());
}

TEST(ParrotTest, SpeedNorwegianBlueParrot_not_nailed) {
    auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 1.5, false);
    EXPECT_NEAR(18.0, parrot->getSpeed(), 0.0);
}

TEST(ParrotTest, SpeedNorwegianBlueParrot_not_nailed_high_voltage) {
    auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 4, false);
    EXPECT_NEAR(24.0, parrot->getSpeed(), 0.0);
}
