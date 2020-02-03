// color1.c --- handle color struct.
#include <stdio.h>

struct color {
    unsigned char r, g, b;
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

struct color mixcolor(struct color c, struct color d) {
    struct color ret = {(c.r + d.r) / 2, (c.g + d.g) / 2, (c.b + d.b) / 2};
    return ret;
}

int main(void) {
    struct color white = {255, 255, 255};
    struct color c1 = {10, 100, 120};
    showcolor(c1);
    showcolor(mixcolor(white, c1));
    struct color c2 = readcolor();
    showcolor(c2);
    return 0;
}
