#!/bin/bash
echo get smoke "integration test framework for practically anything" from https://github.com/SamirTalwar/smoke/releases
smoke --command "./bin/parrot.sh" test
exit $?
