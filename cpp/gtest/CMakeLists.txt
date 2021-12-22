cmake_minimum_required(VERSION 3.16)
set(CMAKE_VERBOSE_MAKEFILE ON)
project(Parrot VERSION 1.0
        DESCRIPTION "Practice Conditional to Pol(l)ymorphism."
        LANGUAGES CXX)

# uncomment these lines to enable coverage measurements using gcov
#set(CMAKE_CXX_FLAGS "--coverage")

enable_testing()

set(SRC_LIB_NAME .)
set(SOURCES Parrot.cpp)
add_library(${SRC_LIB_NAME} ${SOURCES})
target_sources(${SRC_LIB_NAME} PRIVATE ${SOURCES})
target_include_directories(${SRC_LIB_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

set(TEST_NAME sample_test_gtest)
include(FetchContent)
set(SOURCE_FILES main.cpp parrot_gtest.cpp)

# approvals
FetchContent_Declare(
        ApprovalTests
        GIT_REPOSITORY https://github.com/approvals/ApprovalTests.cpp
        GIT_TAG        v.10.5.1
        GIT_SHALLOW    1
)
FetchContent_MakeAvailable(ApprovalTests)
# uncomment these lines to build ApprovalTests using GCC Mingw Windows
#target_compile_options(ApprovalTests PRIVATE -Wno-attributes)

# GoogleTest
FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG        release-1.10.0
        GIT_SHALLOW    1
)
FetchContent_MakeAvailable(googletest)
include(GoogleTest)

add_executable(${TEST_NAME})
target_sources(${TEST_NAME} PRIVATE ${SOURCE_FILES})
target_link_libraries(${TEST_NAME} ${SRC_LIB_NAME} gtest ApprovalTests::ApprovalTests)
set_property(TARGET ${TEST_NAME} PROPERTY CXX_STANDARD 11)
gtest_discover_tests(${TEST_NAME})
