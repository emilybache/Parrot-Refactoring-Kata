#include "ApprovalTests.hpp"
#include "catch2/catch.hpp"

extern "C"
{
#include "Parrot.h"
}


TEST_CASE ("Parrot") {
    Parrot parrot;

    SECTION("European Parrot") {
        init_parrot(&parrot, EUROPEAN, 0, 0, false);
        REQUIRE_THAT(get_speed(&parrot), Catch::Matchers::WithinAbs(12.0, 0.001));
    }
    SECTION("African Parrot one coconut") {
        init_parrot(&parrot, AFRICAN, 1, 0, false);
        REQUIRE_THAT(get_speed(&parrot), Catch::Matchers::WithinAbs(3.0, 0.001));
    }
    SECTION("African Parrot two coconut") {
        init_parrot(&parrot, AFRICAN, 2, 0, false);
        REQUIRE_THAT(get_speed(&parrot), Catch::Matchers::WithinAbs(0.0, 0.001));
    }
    SECTION("African Parrot no coconut") {
        init_parrot(&parrot, AFRICAN, 0, 0, false);
        REQUIRE_THAT(get_speed(&parrot), Catch::Matchers::WithinAbs(12.0, 0.001));
    }
    SECTION("Norwegian Blue Nailed") {
        init_parrot(&parrot, NORWEGIAN_BLUE, 0, 1.5, true);
        REQUIRE_THAT(get_speed(&parrot), Catch::Matchers::WithinAbs(0.0, 0.001));
    }
    SECTION("Norwegian Blue Not Nailed") {
        init_parrot(&parrot, NORWEGIAN_BLUE, 0, 1.5, false);
        REQUIRE_THAT(get_speed(&parrot), Catch::Matchers::WithinAbs(18.0, 0.001));
    }
    SECTION("Norwegian Blue Not Nailed High Voltage") {
        init_parrot(&parrot, NORWEGIAN_BLUE, 0, 4, false);
        REQUIRE_THAT(get_speed(&parrot), Catch::Matchers::WithinAbs(24.0, 0.001));
    }
}


