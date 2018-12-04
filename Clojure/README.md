Parrot Refactoring Kata Clojure version
=======================================

Parrot Refactoring Kata.

This is a [Leiningen](https://leiningen.org/) project.

The project uses [Midje](https://github.com/marick/Midje/).

To run the test:

    lein midje

`lein midje namespace.*` will run only tests beginning with "namespace.".

`lein midje :autotest` will run all the tests indefinitely. It sets up a
watcher on the code files. If they change, only the relevant tests will be
run again.
