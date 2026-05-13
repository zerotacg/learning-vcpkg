add_executable(${PROJECT_NAME}-hello-world)
add_executable(${PROJECT_NAME}::hello-world ALIAS ${PROJECT_NAME}-hello-world)

target_sources(${PROJECT_NAME}-hello-world
        PRIVATE
        learning-vcpkg/hello-world/main.cpp
)

target_link_libraries(${PROJECT_NAME}-hello-world
        PRIVATE
        learning-vcpkg::example
        fmt::fmt
)

add_test(NAME "${PROJECT_NAME}.can-start" COMMAND ${PROJECT_NAME}-hello-world)


set_target_properties(learning-vcpkg-hello-world PROPERTIES EXPORT_NAME hello-world)
set_target_properties(learning-vcpkg-hello-world PROPERTIES OUTPUT_NAME "${PROJECT_NAME}-hello-world")


install(TARGETS "${PROJECT_NAME}-hello-world"
        COMPONENT "${PROJECT_NAME}"
        EXPORT "${PROJECT_NAME}-hello-world-targets"
        FILE_SET HEADERS
)

install(EXPORT "${PROJECT_NAME}-hello-world-targets"
        COMPONENT "${PROJECT_NAME}"
        NAMESPACE "${PROJECT_NAME}::"
        DESTINATION "${config_install_dir}"
)

list(APPEND package_components "hello-world")
set(package_components ${package_components} PARENT_SCOPE)
