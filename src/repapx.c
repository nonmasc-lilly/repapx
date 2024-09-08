#include "repapx.h"

uint32_t repapx_debug_write(const char *msg, uint32_t length) {
#ifdef _WIN32
    static HANDLE WIN_STDOUT = REPAPX_NULL;
    DWORD ret;
    if(!WIN_STDOUT)
        WIN_STDOUT = GetStdHandle(STD_OUTPUT_HANDLE);
    WriteFile(
        WIN_STDOUT,
        msg,
        length,
        &ret,
        NULL
    );
    return (uint32_t)ret;
#else
    #define UNIX_STDOUT 1
    return write(UNIX_STDOUT, msg, length);
#endif
}

uint32_t repapx_debug_print(const char *msg) {
    uint32_t length;
    for(length=0; msg[length]; length++);
    return repapx_debug_write(msg, length);
}

uint32_t repapx_debug_write_hex(uint64_t hex) {
    uint8_t i;
    char msg[17];
    for(i=0; hex != 0; i++) {
        msg[i] = ((hex & 0xF) < 0xA ? 0x30 : 0x40) & (hex & 0xF);
        msg[i+1] = 0;
        hex &= ~0xF;
        hex >>= 4;
    }
    return repapx_debug_print(msg);
}

void repapx_exit(REPAPX_ERROR_CODE exit_code) {
#ifdef _WIN32
    _Exit(exit_code);
#else
    _Exit(exit_code);
#endif
}

REPAPX_ERROR_CODE repapx_init(
        uint16_t width,
        uint16_t height,
        uint16_t resolutionx,
        uint16_t resolutiony,
        REFERENCE const char *name,
        RETURN REPAPX_DATA *ret) {
    int success;
    char infoLog[512];
    uint32_t vshader, fshader;
    glfwInit();
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
    ret->active      = REPAPX_TRUE;
    ret->resolutionx = resolutionx;
    ret->resolutiony = resolutiony;
    ret->window      = glfwCreateWindow(
        width,
        height,
        name,
        NULL,
        NULL
    );
    if(!ret->window)
        return REPAPX_ERROR_NO_GLFW_WINDOW;
    glfwMakeContextCurrent(ret->window);
    if(!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
        return REPAPX_ERROR_NO_GLAD_LOAD;
    glViewport(0, 0, width, height);
    glGenVertexArrays(1, &ret->VAO);
    glGenBuffers(1, &ret->VBO);
    glGenBuffers(1, &ret->EBO);
    glBindVertexArray(ret->VAO);
    glBindBuffer(GL_ARRAY_BUFFER, ret->VBO);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ret->EBO);
    glBufferData(
        GL_ARRAY_BUFFER,
        20 * sizeof(float),
        repapx_vertices,
        GL_STATIC_DRAW
    );
    glBufferData(
        GL_ELEMENT_ARRAY_BUFFER,
        6 * sizeof(unsigned int),
        repapx_indices,
        GL_STATIC_DRAW
    );
    glVertexAttribPointer(
        0,
        3,
        GL_FLOAT,
        GL_FALSE,
        5 * sizeof(float),
        (void*)0
    );
    glVertexAttribPointer(
        1,
        2,
        GL_FLOAT,
        GL_FALSE,
        5 * sizeof(float),
        (void*)(3 * sizeof(float))
    );
    glEnableVertexAttribArray(0);
    glEnableVertexAttribArray(1);
    ret->pixel_buffer = calloc(
        1,
        ret->resolutionx*ret->resolutiony*3
    );
    glGenTextures(1, &ret->TEXTURE);
    glBindTexture(GL_TEXTURE_2D, ret->TEXTURE);
    glTexParameteri(
        GL_TEXTURE_2D,
        GL_TEXTURE_MIN_FILTER,
        GL_NEAREST
    );
    glTexParameteri(
        GL_TEXTURE_2D,
        GL_TEXTURE_MAG_FILTER,
        GL_NEAREST
    );
    glTexParameteri(
        GL_TEXTURE_2D, 
        GL_TEXTURE_WRAP_S,
        GL_MIRRORED_REPEAT
    );
    glTexParameteri(
        GL_TEXTURE_2D,
        GL_TEXTURE_WRAP_T,
        GL_MIRRORED_REPEAT
    );
    glTexImage2D(
        GL_TEXTURE_2D,
        0,
        GL_RGB,
        ret->resolutionx,
        ret->resolutiony,
        0,
        GL_RGB,
        GL_UNSIGNED_BYTE,
        ret->pixel_buffer
    );
    vshader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(
        vshader,
        1,
        &repapx_vertex_shader,
        REPAPX_NULL
    );
    glCompileShader(vshader);
    glGetShaderiv(vshader, GL_COMPILE_STATUS, &success);
    if(!success) {
        glGetShaderInfoLog(vshader, 512, REPAPX_NULL, infoLog);
        repapx_debug_print("VERTEX SHADER ERROR::\n");
        repapx_debug_print(infoLog);
        repapx_debug_print("\n");
    }
    fshader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(
        fshader,
        1,
        &repapx_fragment_shader,
        REPAPX_NULL
    );
    glCompileShader(fshader);
    glGetShaderiv(fshader, GL_COMPILE_STATUS, &success);
    if(!success) {
        glGetShaderInfoLog(fshader, 512, REPAPX_NULL, infoLog);
        repapx_debug_print("VERTEX SHADER ERROR::\n");
        repapx_debug_print(infoLog);
        repapx_debug_print("\n");
    }
    ret->SHADER = glCreateProgram();
    glAttachShader(ret->SHADER, vshader);
    glAttachShader(ret->SHADER, fshader);
    glLinkProgram(ret->SHADER);
    glGetProgramiv(ret->SHADER, GL_LINK_STATUS, &success);
    if(!success) {
        glGetProgramInfoLog(
            ret->SHADER,
            512,
            REPAPX_NULL,
            infoLog
        );
        repapx_debug_print("VERTEX SHADER ERROR::\n");
        repapx_debug_print(infoLog);
        repapx_debug_print("\n");
    }
    glDeleteShader(vshader);
    glDeleteShader(fshader);
    glClearColor(0, 0, 0, 1);
}

REPAPX_BOOLEAN repapx_is_closed(REPAPX_DATA ret) {
    if(!ret.active) return REPAPX_ERROR_UNINITIALIZED_DATA;
    return glfwWindowShouldClose(ret.window);
}

REPAPX_ERROR_CODE repapx_update(STATE REPAPX_DATA *ret) {
    glfwSwapBuffers(ret->window);
    glfwPollEvents();
    glClear(GL_COLOR_BUFFER_BIT);
    glBindTexture(GL_TEXTURE_2D, ret->TEXTURE);
    if(ret->changed) {
        glTexSubImage2D(
            GL_TEXTURE_2D,
            0,
            0,
            0,
            ret->resolutionx,
            ret->resolutiony,
            GL_RGB,
            GL_UNSIGNED_BYTE,
            ret->pixel_buffer
        );
    }
    glUseProgram(ret->SHADER);
    glBindVertexArray(ret->VAO);
    glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
}

void repapx_put(uint16_t x, uint16_t y, uint32_t color,
        STATE REPAPX_DATA *pap) {
    if(x > pap->resolutionx) return;
    if(y > pap->resolutiony) return;
    pap->pixel_buffer[(x+pap->resolutionx*y)*3+0] =
        (color>>0x10)&0xFF;
    pap->pixel_buffer[(x+pap->resolutionx*y)*3+1] =
        (color>>0x08)&0xFF;
    pap->pixel_buffer[(x+pap->resolutionx*y)*3+2] =
        (color)&0xFF;
    pap->changed = REPAPX_TRUE;
}

void repapx_putarr(
        uint16_t x,
        uint16_t y,
        uint16_t width,
        uint16_t height,
        REFERENCE uint32_t *array,
        STATE REPAPX_DATA *pap) {
    uint16_t i, j;
    for(i=0; i < width; i++) {
        for(j=0; j < height; j++) {
            repapx_put(i+x, j+y, array[i+j*width], pap);
        }
    }
}

void repapx_terminate(
        REPAPX_ERROR_CODE exit_code,
        REPAPX_DATA *repap) {
    repap->active = REPAPX_FALSE;
    free(repap->pixel_buffer);
    glfwTerminate();
    repapx_exit(exit_code);
}
