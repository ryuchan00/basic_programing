#include <stdio.h>

int main(void) {
    char x[] = "abc";
    char y = 'a';
//    printf("x> ");
//    scanf("%d", &x);
    printf("%s\n", x + 1); // bc
    printf("%s\n", x); // abc
    printf("%c\n", y); // a
    return 0;
}
