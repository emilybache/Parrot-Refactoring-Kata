#include "ApprovalTests.hpp"
#include "catch2/catch.hpp"

extern "C"
{
#include "Parrot.h"
}


TEST_CASE("European Parrot") {
    Parrot parrot;
    init_parrot(&parrot, EUROPEAN, 0, 0, false);
    float speed = get_speed(&parrot);
    REQUIRE_THAT(speed, Catch::Matchers::WithinAbs(12.0, 0.001));
}

TEST_CASE("African Parrot one coconut") {
    Parrot parrot;
    init_parrot(&parrot, AFRICAN, 1, 0, false);
    float speed = get_speed(&parrot);
    REQUIRE_THAT(speed, Catch::Matchers::WithinAbs(3.0, 0.001));
}

TEST_CASE("African Parrot two coconut") {
    Parrot parrot;
    init_parrot(&parrot, AFRICAN, 2, 0, false);
    float speed = get_speed(&parrot);
    REQUIRE_THAT(speed, Catch::Matchers::WithinAbs(0.0, 0.001));
}

TEST_CASE("African Parrot no coconut") {
    Parrot parrot;
    init_parrot(&parrot, AFRICAN, 0, 0, false);
    float speed = get_speed(&parrot);
    REQUIRE_THAT(speed, Catch::Matchers::WithinAbs(12.0, 0.001));
}

TEST_CASE("Norwegian Blue Nailed") {
    Parrot parrot;
    init_parrot(&parrot, NORWEGIAN_BLUE, 0, 1.5, true);
    float speed = get_speed(&parrot);
    REQUIRE_THAT(speed, Catch::Matchers::WithinAbs(0.0, 0.001));
}

TEST_CASE("Norwegian Blue Not Nailed") {
    Parrot parrot;
    init_parrot(&parrot, NORWEGIAN_BLUE, 0, 1.5, false);
    float speed = get_speed(&parrot);
    REQUIRE_THAT(speed, Catch::Matchers::WithinAbs(18.0, 0.001));
}

TEST_CASE("Norwegian Blue Not Nailed High Voltage") {
    Parrot parrot;
    init_parrot(&parrot, NORWEGIAN_BLUE, 0, 4, false);
    float speed = get_speed(&parrot);
    REQUIRE_THAT(speed, Catch::Matchers::WithinAbs(24.0, 0.001));
}



