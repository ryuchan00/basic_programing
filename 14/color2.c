// color2.c --- handle color struct with pointer.
#include <stdio.h>

struct color {
    unsigned int r, g, b;
};

void showcolor(struct color c) {
//    16進2桁ずつで表示します。
    printf("%02x%02x%02x\n", c.r, c.g, c.b);
}

struct color readcolor(void) {
    int r, g, b;
    printf("r(0-255)> ");
    scanf("%d", &r);
    printf("g(0-255)> ");
    scanf("%d", &g);
    printf("b(0-255)> ");
    scanf("%d", &b);
    struct color ret = {r, g, b};
    return ret;
}

void makedarker(struct color *p) {
    // rgbの値を2で割れば、必然的に暗くなる
    p->r = p->r / 2;
    p->g = p->g / 2;
    p->b = p->b / 2;
}

void makebrighter(struct color *p) {
    // rgbの値を2をかければ明るくなる
    p->r = p->r * 2;
    if (255 < p->r) { p->r = 255; }
    p->g = p->g * 2;
    if (255 < p->g) { p->g = 255; }
    p->b = p->b * 2;
    if (255 < p->b) { p->b = 255; }
}

int main(void) {
    struct color c1 = readcolor();
//    showcolor(c1);
//    makedarker(&c1);
    makebrighter(&c1);
    showcolor(c1);
    return 0;
}
