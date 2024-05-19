set(TEST_NAME sample_test_doctest)
include(FetchContent)
set(SOURCE_FILES main.cpp sample_doctest.cpp)

# Doctest
FetchContent_Declare(
        DocTest
        GIT_REPOSITORY https://github.com/doctest/doctest.git
        GIT_TAG        v2.4.9)
FetchContent_MakeAvailable(DocTest)

# approvals
FetchContent_Declare(
        ApprovalTests
        GIT_REPOSITORY https://github.com/approvals/ApprovalTests.cpp
        GIT_TAG        v.10.12.2)
FetchContent_MakeAvailable(ApprovalTests)

add_executable(${TEST_NAME})
target_sources(${TEST_NAME} PRIVATE ${SOURCE_FILES})
target_link_libraries(${TEST_NAME} src doctest ApprovalTests::ApprovalTests)
add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})
