Parrot Refactoring Kata C99 version
===================================

This is a C99 port of the *Parrot Refactoring Kata*.

The project uses [cmocka](https://cmocka.org/).

To compile and run the test:

    gcc -g -Wall -Wextra -pedantic -std=c99 Parrot.c ParrotTest.c -l cmocka -o ParrotTest
    ./ParrotTest
