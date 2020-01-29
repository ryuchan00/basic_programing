// str2.c --- string demonstration 2.
#include <stdio.h>
#include <stdbool.h>

bool getl(char s[], int lim) {
    int c, i = 0;
    for (c = getchar(); c != EOF && c != '\n';
    c = getchar()) {
        s[i++] = c;
        if (i + 1 >= lim) { break; }
    }
    s[i] = '\0';
    return c != EOF;
}

void printtriangle(char s[]) {
    int i = 0;
    while (s[i] != '\0') {
        printf("%s\n", s + i);
        ++i;
    }
}

int main(void) {
    char buf[100];
    printf("s> ");
    getl(buf, 100);
    printtriangle(buf);
    return 0;
}
