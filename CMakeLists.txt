cmake_minimum_required(VERSION 3.28)
project(
    repapx
    VERSION 1.0
    DESCRIPTION "The remade opengl pixel mapper" 
    LANGUAGES C
)
find_package(glfw3 3.4 REQUIRED)
add_library(repapx SHARED src/repapx.c src/glad/glad.c)
set_property(TARGET repapx PROPERTY C_STANDARD 90)
target_link_libraries(repapx glfw)
