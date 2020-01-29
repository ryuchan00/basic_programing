#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

bool getl(char s[], int lim) {
    int c, i = 0;
    for (c = getchar(); c != EOF && c != '\n';
         c = getchar()) {
        s[i++] = c;
        if (s[0] == '0') {
            i--;
        }
        if (i + 1 >= lim) { break; }
    }
    s[i] = '\0';
    return c != EOF;
}

int main(void) {
    int i, n;
    char buf[100];
    printf("n> ");
    getl(buf, 100);
    n = atoi(buf);
    printf("%s\n", buf);
    return 0;
}
