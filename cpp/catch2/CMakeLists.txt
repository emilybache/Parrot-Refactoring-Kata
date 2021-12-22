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

set(TEST_NAME sample_test_catch2)
include(FetchContent)
set(SOURCE_FILES main.cpp parrot_catch.cpp)

# catch2
FetchContent_Declare(
        Catch2
        GIT_REPOSITORY https://github.com/catchorg/Catch2.git
        GIT_TAG        v2.13.1
        GIT_SHALLOW    1
)
FetchContent_MakeAvailable(Catch2)

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

add_executable(${TEST_NAME})
target_sources(${TEST_NAME} PRIVATE ${SOURCE_FILES})
target_link_libraries(${TEST_NAME} ${SRC_LIB_NAME} Catch2::Catch2 ApprovalTests::ApprovalTests)
set_property(TARGET ${TEST_NAME} PROPERTY CXX_STANDARD 11)
add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})
