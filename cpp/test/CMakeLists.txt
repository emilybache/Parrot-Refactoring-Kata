set(TEST_NAME parrot_test)
include(FetchContent)
set(SOURCE_FILES main.cpp ParrotTest.cpp)

FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG        release-1.10.0)
FetchContent_MakeAvailable(googletest)

add_executable(${TEST_NAME})
target_sources(${TEST_NAME} PRIVATE ${SOURCE_FILES})
target_link_libraries(${TEST_NAME} model gtest)
set_property(TARGET ${TEST_NAME} PROPERTY CXX_STANDARD 11)
add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})
