// tbllinear1 --- table with linear array.
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "tbl.h"

#define MAXTBL 1000000
struct ent {
    char *key;
    char *name;
    int age;
};
struct ent tbl[MAXTBL];
int tblsize = 0;

void tbl_get(char *k) {
    int i;
    for (i = 0; i < tblsize; ++i) {
        if (strcmp(tbl[i].key, k) == 0) {
            printf("tbl[%s] name:%s age:%d\n", tbl[i].key, tbl[i].name, tbl[i].age);
            return;
        }
    }
    printf("not found\n");
    return;
}

void tbl_delete(char *k) {
    int i;
    for (i = 0; i < tblsize; ++i) {
        if (strcmp(tbl[i].key, k) == 0) {
            printf("delete tbl[%s] name:%s age:%d\n", tbl[i].key, tbl[i].name, tbl[i].age);
            // 削除したら、ポインターを前詰処理する
            for (i = i + 1; i < tblsize; ++i) {
                tbl[i - 1] = tbl[i];
            }
            --tblsize;
            return;
        }
    }
    printf("not found\n");
    return;
}

bool tbl_put(char *k, char *name, int age) {
    int i;
    // 更新はageだけにしておく
    for (i = 0; i < tblsize; ++i) {
        if (strcmp(tbl[i].key, k) == 0) {
            tbl[i].age = age;
            return true;
        }
    }
    if (tblsize + 1 >= MAXTBL) { return false; }
    char *s = (char *) malloc(strlen(k) + 1);
    char *t = (char *) malloc(strlen(k) + 1);
    if (s == NULL) { return false; }
    if (t == NULL) { return false; }
    strcpy(s, k);
    tbl[tblsize].key = s;
    strcpy(t, name);
    tbl[tblsize].name = t;
    tbl[tblsize].age = age;
    ++tblsize;
    return true;
}
