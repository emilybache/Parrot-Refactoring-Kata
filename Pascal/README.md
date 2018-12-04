Parrot Refactoring Kata Pascal version
======================================

This is a (Turbo) Pascal port of the *Parrot Refactoring Kata*.

## Unit Test

`TPUNIT.PAS` is a minimalist implementation of xUnit in Pascal style.
There are several assertions available, e.g. `AssertEquals`, `AssertEqualsStr`, `AssertTrue` etc.
It needs _Far Calls_ enabled in compiler options.

* First compile the unit `TPUNIT.PAS`.
* Then compile (test) application `PARROT_T.PAS`.
* Run `PARROT_T` to run the tests.
