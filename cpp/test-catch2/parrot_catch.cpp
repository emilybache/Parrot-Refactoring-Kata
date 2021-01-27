#include "ApprovalTests.hpp"
#include "catch2/catch.hpp"

using namespace std;

#include "Parrot.h"

TEST_CASE("Parrot") {
    Parrot *parrot;

    SECTION("SpeedOfEuropeanParrot")
    {
        parrot = new Parrot(EUROPEAN, 0, 0, false);
        REQUIRE(parrot->getSpeed() == Approx(12.0));

    }

    SECTION("SpeedOfAfricanParrot_With_One_Coconut")
    {
        parrot = new Parrot(AFRICAN, 1, 0, false);
        REQUIRE(parrot->getSpeed() == Approx(3.0));
    }

    SECTION("SpeedOfAfricanParrot_With_Two_Coconuts")
    {
        parrot = new Parrot(AFRICAN, 2, 0, false);
        REQUIRE(parrot->getSpeed() == Approx(0.0));
    }

    SECTION("SpeedOfAfricanParrot_With_No_Coconuts")
    {
        parrot = new Parrot(AFRICAN, 0, 0, false);
        REQUIRE(parrot->getSpeed() == Approx(12.0));
    }

    SECTION("SpeedNorwegianBlueParrot_nailed")
    {
        parrot = new Parrot(NORWEGIAN_BLUE, 0, 1.5, true);
        REQUIRE(parrot->getSpeed() == Approx(0.0));
    }

    SECTION("SpeedNorwegianBlueParrot_not_nailed")
    {
        parrot = new Parrot(NORWEGIAN_BLUE, 0, 1.5, false);
        REQUIRE(parrot->getSpeed() == Approx(18.0));
    }

    SECTION("SpeedNorwegianBlueParrot_not_nailed_high_voltage")
    {
        parrot = new Parrot(NORWEGIAN_BLUE, 0, 4, false);
        REQUIRE(parrot->getSpeed() == Approx(24.0));
    }
    delete parrot;
}

