# REPAPX

Repapx is a library which aims to replace my previous projects,
repap and opap. It allows the user to create a pixel and push
scaled pixels to the screen. Here is an example to fill the
background with white:

```C
#include <repapx.h>

int main(int argc, char **argv) {
    REPAPX_DATA repapx_instance;
    repapx_init(
        500,
        500,
        1,
        1,
        "Window",
        &repapx_instance
    );
    repapx_put(0, 0, 0xFFFFFF, &repapx_instance);
    while(!repapx_is_closed(repapx_instance)) {
        repapx_update(&repapx_instance);
    }
    repapx_terminate(REPAP_ERROR_SUCCESS);
}
```

Repapx has the following types:

```C
#define REPAPX_BOOLEAN uint8_t
#define REPAPX_ERROR_CODE uint16_t
typedef struct {
    REPAPX_BOOLEAN active, // has the instance been freed
        changed; // has the pixel map changed
    uint16_t resolutionx, /* how many pixels of width does the
                             pixel map have */
        resolutiony; /* how many pixels of height does the
                        pixel map have */
    uint32 VAO, VBO, EBO, SHADER, TEXTURE; /* opengl objects */
    ALLOCATED uint8_t *pixel_buffer; /* the rgb array of pixels */
} REPAPX_DATA
```

Here is the `repapx_error_codes` enumeration:

```C
enum repapx_error_codes {
    REPAPX_ERROR_SUCCESS            = 0x0000,
    REPAPX_ERROR_NO_GLFW_WINDOW     = 0x0001,
    REPAPX_ERROR_NO_GLAD_LOAD       = 0x0002,
    REPAPX_ERROR_UNINITIALIZED_DATA = 0x0003,
};
```

We also have the variables:

- `repapx_vertices` the opengl vertices for the window
- `repapx_indices` the opengl indices for the window
- `repapx_vertex_shader` the vertex shader source for opengl
- `repapx_fragment_shader` the fragment shader source for opengl

We also have the following functions:

```C
// writes a string to the terminal
uint32_t repapx_debug_write(
    REFERENCE const char *msg, // string to write
    uint32_t length            // length of string
);
// write a hexadecimal number to the terminal
uint32_t repapx_debug_write_hex(
    uint64_t hex // number
);
// write a null terminated string to the terminal
uint32_t repapx_debug_print(
    REFERENCE const char *msg // string to write
);
// exit the program with an error code
void repapx_error(
    REPAPX_ERROR_CODE exit_code
);
// initiate the repapx instance
REPAPX_ERROR_CODE repapx_init(
    uint16_t width,             // window pixel width
    uint16_t height,            // window pixel height
    uint16_t resolutionx,       // buffer pixel width
    uint16_t resolutiony,       // buffer pixel height
    REFERENCE const char *name, // window name
    RETURN REPAPX_DATA *ret     // return instance
);
// return a boolean of whether or not the window is closed
REPAPX_BOOLEAN repapx_is_closed(
    REPAPX_DATA pap // repap instance
);
// update the screen every
REPAPX_ERROR_CODE repapx_updare(
    STATE REPAPX_DATA *pap // repap instance
);
// put a pixel to the screen
REPAPX_ERROR_CODE repapx_put(
    uint16_t x,
    uint16_t y,
    uint32_t color,         // color of pixel
    STATE REPAPX_DATA *pap  // repap instance
);
// put an array of pixels to the screen
REPAPX_ERROR_CODE repapx_putarr(
    uint16_t x,
    uint16_t y,
    uint16_t width,
    uint16_t height,
    REFERENCE uint32_t *array,
    STATE REPAPX_DATA *ret
);
// terminate the instance and program
void repapx_terminate(
    REPAPX_ERROR_CODE exit_code
);
```

Colors are 24 bit and are of the following form: `0xRRGGBB`

Another important concept is resolution vs size. The resolution
is the number of "virtual pixels" that exist. The size of a
specific pixel is the ratio of the window size divided by the
resolution.
