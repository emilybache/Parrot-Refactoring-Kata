Parrot Refactoring Kata Scheme version
======================================

This is a (Gambit) R5RS Scheme port of the *Parrot Refactoring Kata*.

## Unit Test

`assert.scm` is a minimalist implementation of xUnit in Scheme style.
There are two assertions available, `(assert=)` for numbers and `(assert-raise)`.

To run the test:

    gsi parrot-test.scm
