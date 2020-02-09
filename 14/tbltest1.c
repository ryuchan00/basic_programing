// tbltest1 --- test table functions
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include "tbl.h"

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

int main(void) {
    char b1[100], b2[100], b3[100];
    int age;
    while (true) {
        // key
        printf("key printf(empty for quit)> ");
        if (!getl(b1, 100) || strlen(b1) == 0) { return 0; }
        // age
        printf("age (-1 for search,-2 for delete)> ");
        getl(b2, 100);
        age = atoi(b2);
        switch (age) {
            case -1:
                tbl_get(b1);
                break;
            case -2:
                tbl_delete(b1);
                break;
            default:
                // name
                printf("name> ");
                getl(b3, 100);
                tbl_put(b1, b3, age);
                break;
        }
    }
}
