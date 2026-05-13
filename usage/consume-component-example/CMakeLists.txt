cmake_minimum_required(VERSION 4.1..4.2)

project(consume-component-example VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

enable_testing()

find_package(learning-vcpkg REQUIRED COMPONENTS example)


add_executable(${PROJECT_NAME}-app)

target_sources(${PROJECT_NAME}-app
        PRIVATE
        main.cpp
)

target_link_libraries(${PROJECT_NAME}-app
        PRIVATE
        learning-vcpkg::example
)

add_test(NAME "${PROJECT_NAME}.can-start" COMMAND ${PROJECT_NAME}-app)
