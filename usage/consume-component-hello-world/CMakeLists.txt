cmake_minimum_required(VERSION 4.1..4.2)

project(consume-component-hello-world VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

enable_testing()

find_package(learning-vcpkg REQUIRED COMPONENTS hello-world)


add_test(NAME "${PROJECT_NAME} can run learning-vcpkg::hello world" COMMAND learning-vcpkg::hello-world)
