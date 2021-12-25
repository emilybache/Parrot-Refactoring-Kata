@echo get smoke "integration test framework for practically anything" from https://github.com/SamirTalwar/smoke/releases
@call smoke --command "bash bin/parrot.sh" test
@exit /B %ERRORLEVEL%
