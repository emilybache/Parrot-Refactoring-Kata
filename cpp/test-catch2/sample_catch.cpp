#include "ApprovalTests.hpp"
#include "catch2/catch.hpp"


using namespace Catch::Generators::pf;

#include <memory>

#include "Parrot.h"

TEST_CASE("Parrot") {
    
    SECTION("SpeedOfEuropeanParrot")
    {
        std::unique_ptr<Parrot> parrot = make_unique<Parrot>(EUROPEAN, 0, 0, false);
        CHECK(parrot->getSpeed() == Approx(12.0));
        CHECK(parrot->getCry() == "Sqoork!");
    }

    SECTION("SpeedOfAfricanParrot_With_One_Coconut")
    {
        auto parrot = make_unique<Parrot>(AFRICAN, 1, 0, false);
        CHECK(parrot->getSpeed() == Approx(3.0));
        CHECK(parrot->getCry() == "Squaark!");
    }

    SECTION("SpeedOfAfricanParrot_With_Two_Coconuts")
    {
        auto parrot = make_unique<Parrot>(AFRICAN, 2, 0, false);
        REQUIRE(parrot->getSpeed() == Approx(0.0));
    }

    SECTION("SpeedOfAfricanParrot_With_No_Coconuts")
    {
        auto parrot = make_unique<Parrot>(AFRICAN, 0, 0, false);
        REQUIRE(parrot->getSpeed() == Approx(12.0));
    }

    SECTION("SpeedNorwegianBlueParrot_nailed")
    {
        auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 0, true);
        CHECK(parrot->getSpeed() == Approx(0.0));
        CHECK(parrot->getCry() == "...");
    }

    SECTION("SpeedNorwegianBlueParrot_not_nailed")
    {
        auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 1.5, false);
        REQUIRE(parrot->getSpeed() == Approx(18.0));
    }

    SECTION("SpeedNorwegianBlueParrot_not_nailed_high_voltage")
    {
        auto parrot = make_unique<Parrot>(NORWEGIAN_BLUE, 0, 4, false);
        CHECK(parrot->getSpeed() == Approx(24.0));
        CHECK(parrot->getCry() == "Bzzzzzz");
    }
}



