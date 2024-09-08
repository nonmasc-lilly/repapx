#include <repapx.h>

static uint32_t args[] = {
    0xFF0000, 0x00FF00, 0x0000FF, 0xFF0000, 0x00FF00, 0x0000FF,
    0xFF0000, 0x00FF00, 0x0000FF, 0xFF0000, 0x00FF00, 0x0000FF,
    0xFF0000, 0x00FF00, 0x0000FF, 0xFF0000, 0x00FF00, 0x0000FF,
    0xFF0000, 0x00FF00, 0x0000FF, 0xFF0000, 0x00FF00, 0x0000FF,
    0xFF0000, 0x00FF00, 0x0000FF, 0xFF0000, 0x00FF00, 0x0000FF,
    0xFF0000, 0x00FF00, 0x0000FF, 0xFF0000, 0x00FF00, 0x0000FF,
};

int main(int argc, char **argv) {
    REPAPX_DATA repapx_instance;
    repapx_init(500, 500, 100, 100, "window", &repapx_instance);
    int i, j;
    for(i=0; i<100; i++) {
    for(j=0; j<100; j++) {
        repapx_put(
            i,
            j,
            0x12331F,
            &repapx_instance
        );
    }
    }
    repapx_putarr(25, 20, 6, 6, args, &repapx_instance);
    while(!repapx_is_closed(repapx_instance)) {
        repapx_update(&repapx_instance);
    }
    repapx_terminate(REPAPX_ERROR_SUCCESS);
}
