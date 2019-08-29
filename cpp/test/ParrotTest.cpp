
#include "gtest/gtest.h"

#include "../model/Parrot.h"

TEST(ParrotTest, SpeedOfEuropeanParrot) {
    auto parrot = new Parrot(European, 0, 0, false);
    EXPECT_NEAR(12.0, parrot->getSpeed(), 0.0);
}