set(TEST_NAME sample_test_gtest)
include(FetchContent)
set(SOURCE_FILES main.cpp sample_gtest.cpp)

# approvals
FetchContent_Declare(
        ApprovalTests
        GIT_REPOSITORY https://github.com/approvals/ApprovalTests.cpp
        GIT_TAG        v.10.12.2)
FetchContent_MakeAvailable(ApprovalTests)

# GoogleTest
FetchContent_Declare(
        googletest
        GIT_REPOSITORY https://github.com/google/googletest.git
        GIT_TAG v1.13.0
)
FetchContent_MakeAvailable(googletest)

add_executable(${TEST_NAME})
target_sources(${TEST_NAME} PRIVATE ${SOURCE_FILES})
target_link_libraries(${TEST_NAME} src gtest gmock ApprovalTests::ApprovalTests)
add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})
