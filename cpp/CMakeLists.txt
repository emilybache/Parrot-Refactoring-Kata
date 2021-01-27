cmake_minimum_required(VERSION 3.16)
project(parrot-refactoring-kata)

# uncomment these lines to enable coverage measurements using gcov
#set(CMAKE_C_FLAGS "--coverage")
#set(CMAKE_CXX_FLAGS "--coverage")

enable_testing()
add_subdirectory(model)
add_subdirectory(test)

target_link_libraries(model)

