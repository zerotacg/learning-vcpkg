add_library(${PROJECT_NAME}-example)
add_library(${PROJECT_NAME}::example ALIAS ${PROJECT_NAME}-example)

target_sources(${PROJECT_NAME}-example
        PUBLIC
        FILE_SET HEADERS
        FILES
        learning-vcpkg/example/example.hpp
        PRIVATE
        learning-vcpkg/example/example.cpp
)

target_precompile_headers(${PROJECT_NAME}-hello-world
        PUBLIC
        learning-vcpkg/example/example.hpp
)

target_link_libraries(${PROJECT_NAME}-example
        PRIVATE fmt::fmt
)


set_target_properties(${PROJECT_NAME}-example
        PROPERTIES
            EXPORT_NAME example
            OUTPUT_NAME "${PROJECT_NAME}-example"
)

set(targets_export_name "")

install(TARGETS learning-vcpkg-example
        COMPONENT "${PROJECT_NAME}"
        EXPORT "${PROJECT_NAME}-example-targets"
        FILE_SET HEADERS
)

install(EXPORT "${PROJECT_NAME}-example-targets"
        COMPONENT "${PROJECT_NAME}"
        NAMESPACE "${PROJECT_NAME}::"
        DESTINATION "${config_install_dir}"
)

list(APPEND package_components "example")
set(package_components ${package_components} PARENT_SCOPE)
