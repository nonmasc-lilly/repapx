#ifndef X__REPAPX_H__X
#define X__REPAPX_H__X
#include "glad/glad.h"
#include <GLFW/glfw3.h>
#include <stdint.h>
#include <stdlib.h>
#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#else
#include <unistd.h>
#endif

#define REPAPX_NULL (void*)0
#define REPAPX_TRUE  1
#define REPAPX_FALSE 0
#define REPAPX_BOOLEAN uint8_t
#define REFERENCE   /* pointer will only be read from           */
#define STATE       /* pointer will be read from or written to  */
#define ALLOCATED   /* function assumes pointer is allocated    */
#define UNALLCOATED /* function assumes pointer is unallocated  */
#define EMPTY       /* function assumes pointer is empty so that\
                       it may be allocated */
#define RETURN      /* function writes new data to the pointer so\
                       that the old data is lost */
#define REPAPX_ERROR_CODE uint16_t
#define REPAPX_COORDS_XY(X, Y) \
    ((((uint32_t)X) << 16) | ((uint32_t)Y))

static const float repapx_vertices[] = {
  /* positions    texture coords */
     1,  1, 0,          1, 1,
     1, -1, 0,          1, 0,
    -1, -1, 0,          0, 0,
    -1,  1, 0,          0, 1
};
static const unsigned int repapx_indices[] = {
    0, 1, 3,
    1, 2, 3
};
static const char *repapx_vertex_shader =
    "#version 330 core\n"
    "layout (location = 0) in vec3 position;\n"
    "layout (location = 1) in vec2 texture_coords;\n"
    "out vec2 texture_coords_frag;\n"
    "out vec2 vert_coords;\n"
    "void main() {\n"
    "\tgl_Position = vec4(position, 1.0);\n"
    "\ttexture_coords_frag = texture_coords;\n"
    "\tvert_coords = vec2(position.x, position.y);\n"
    "}\0";
static const char *repapx_fragment_shader =
    "#version 330 core\n"
    "out vec4 fragment_color;\n"
    "in vec2 texture_coords_frag;\n"
    "in vec2 vert_coords;\n"
    "uniform sampler2D unitexture;\n"
    "void main() {\n"
    "\tfragment_color = texture(\n"
    "\t\tunitexture,\n"
    "\t\ttexture_coords_frag\n"
    "\t);\n"
    "}\0";

uint32_t repapx_debug_write_hex(uint64_t hex);
uint32_t repapx_debug_write(
    REFERENCE const char *msg,
    uint32_t length
);
uint32_t repapx_debug_print(REFERENCE const char *msg);
void     repapx_error(REPAPX_ERROR_CODE exit_code);

enum repapx_error_codes {
    REPAPX_ERROR_SUCCESS            =   0x0000,
    REPAPX_ERROR_NO_GLFW_WINDOW     =   0x0001,
    REPAPX_ERROR_NO_GLAD_LOAD       =   0x0002,
    REPAPX_ERROR_UNINITIALIZED_DATA =   0x0003
};

typedef struct {
    REPAPX_BOOLEAN active, changed;
    uint16_t resolutionx, resolutiony;
    uint32_t VAO, VBO, EBO, SHADER, TEXTURE;
    ALLOCATED uint8_t *pixel_buffer;
    GLFWwindow *window;
} REPAPX_DATA;

REPAPX_ERROR_CODE repapx_init(
    uint16_t width,
    uint16_t height,
    uint16_t resolutionx,
    uint16_t resolutiony,
    REFERENCE const char *name,
    RETURN REPAPX_DATA *ret
);

REPAPX_BOOLEAN      repapx_is_closed(REPAPX_DATA ret);
REPAPX_ERROR_CODE   repapx_update(STATE REPAPX_DATA *ret);

void repapx_put(uint16_t x, uint16_t y, uint32_t color,
    STATE REPAPX_DATA *pap);
void repapx_putarr(uint16_t x, uint16_t y, uint16_t width,
    uint16_t height, REFERENCE uint32_t *array,
    STATE REPAPX_DATA *ret);

void repapx_terminate(REPAPX_ERROR_CODE exit_code);
#endif
