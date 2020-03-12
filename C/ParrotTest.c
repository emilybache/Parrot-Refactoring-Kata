#include <setjmp.h>
#include <stdarg.h>
#include <stdlib.h>

#include <cmocka.h>

#include "Parrot.h"

static void get_speed_of_european_parrot(void** state)
{
    (void)state; /* unused */
    Parrot parrot;
    init_parrot(&parrot, EUROPEAN, 0, 0, false);
    assert_float_equal(12.0, get_speed(&parrot), 0.0);
}

static void get_speed_of_african_parrot_with_one_coconut(void** state)
{
    (void)state; /* unused */
    Parrot parrot;
    init_parrot(&parrot, AFRICAN, 1, 0, false);
    assert_float_equal(3.0, get_speed(&parrot), 0.0);
}

static void get_speed_of_african_parrot_with_two_coconuts(void** state)
{
    (void)state; /* unused */
    Parrot parrot;
    init_parrot(&parrot, AFRICAN, 2, 0, false);
    assert_float_equal(0.0, get_speed(&parrot), 0.0);
}

static void get_speed_of_african_parrot_with_no_coconuts(void** state)
{
    (void)state; /* unused */
    Parrot parrot;
    init_parrot(&parrot, AFRICAN, 0, 0, false);
    assert_float_equal(12.0, get_speed(&parrot), 0.0);
}

static void get_speed_of_norwegian_blue_parrot_nailed(void** state)
{
    (void)state; /* unused */
    Parrot parrot;
    init_parrot(&parrot, NORWEGIAN_BLUE, 0, 1.5, true);
    assert_float_equal(0.0, get_speed(&parrot), 0.0);
}

static void get_speed_of_norwegian_blue_parrot_not_nailed(void** state)
{
    (void)state; /* unused */
    Parrot parrot;
    init_parrot(&parrot, NORWEGIAN_BLUE, 0, 1.5, false);
    assert_float_equal(18.0, get_speed(&parrot), 0.0);
}

static void get_speed_of_norwegian_blue_parrot_not_nailed_high_voltage(void** state)
{
    (void)state; /* unused */
    Parrot parrot;
    init_parrot(&parrot, NORWEGIAN_BLUE, 0, 4, false);
    assert_float_equal(24.0, get_speed(&parrot), 0.0);
}

int main(void)
{
    const struct CMUnitTest test_suite[] = {
        cmocka_unit_test(get_speed_of_european_parrot),                  /* */
        cmocka_unit_test(get_speed_of_african_parrot_with_one_coconut),  /* */
        cmocka_unit_test(get_speed_of_african_parrot_with_two_coconuts), /* */
        cmocka_unit_test(get_speed_of_african_parrot_with_no_coconuts),  /* */
        cmocka_unit_test(get_speed_of_norwegian_blue_parrot_nailed),     /* */
        cmocka_unit_test(get_speed_of_norwegian_blue_parrot_not_nailed), /* */
        cmocka_unit_test(get_speed_of_norwegian_blue_parrot_not_nailed_high_voltage), /* */
    };

    return cmocka_run_group_tests(test_suite, NULL, NULL);
}
