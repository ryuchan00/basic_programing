基礎プログラミングおよび演習レポート ＃14
学籍番号:1920031
氏名:山川竜太郎
ペア学籍番号・氏名(または「個人作業」):個人作業
提出日付:2020/2/9

[課題の再掲]
演習
3 上の例題をそのまま打ち込んで動かしなさい。動いたら次の変更をしてみなさい。
a. 登録できる値を整数1個から変更しなさい(整数2個とか文字列とか)。
b. 今は表は追加と書き換えしかできないが、削除機能をつけてみなさい。

[実施したこととその結果]

tbl.h

ヘッダーファイル

```c
bool tbl_put(char *k, char *name, int age);

void tbl_delete(char *k);

void tbl_get(char *k);
```

tbllinear1.c

テーブルの操作を行うメソッドを用意するファイル

```c
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
```

tbltest1.c

mainおよび入力処理を行うファイル

```c
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
```

例題より追加したメソッドは、テーブルの削除処理を行うtbl_deleteである。

実行例は以下の通りである。

```
$ ./tbl1
key printf(empty for quit)> a
age (-1 for search,-2 for delete)> 1
name> b
key printf(empty for quit)> c
age (-1 for search,-2 for delete)> 2
name> d
key printf(empty for quit)> a
age (-1 for search,-2 for delete)> -2
delete tbl[a] name:b age:1
key printf(empty for quit)> a
age (-1 for search,-2 for delete)> -1
not found
key printf(empty for quit)> c
age (-1 for search,-2 for delete)> -1
tbl[c] name:d age:2
```

[考察]

実際にはCに配列は存在しないが、ここでは便宜上Cの配列と言う。Cの配列は、Rubyの配列操作と異なり、Array#deleteなどきーや要素を指定して削除するメソッドがないため削除の定義を決めてあげる必要があった。検討したのは、削除対象の要素を除いた配列を新たに作成し直す、または、削除対象の要素よりも後ろの要素のポインターを一つ前に詰めることである。新たに配列を作成し直すのは、わざわざ要素を一つ削除するだけなのに大げさだと思い、今回は削除対象の要素よりも後ろの要素のポインターを一つ削除するようにした。そうすることによって、最悪の計算量でもテーブルサイズになるので速いという副次的な効果もでた。

テーブルに対して新たにnameという文字列を追加したが、C言語はstructを戻り値にうまくできなかったので、tbl_getの中でテーブルの中を標準出力する形に変更した。今後の課題として、戻り値を構造体にすることはどのように行うのか調べる必要がある。

[アンケート]
Q1. 構造体を使ったプログラムが書けるようになりましたか。
少しできました。

Q2. 表と検索とはどういうことか理解しましたか。
少しわかりました。

Q3. リフレクション(今回の課題で分かったこと)・感想・要望をどうぞ。
他のテストと日程が被って、演習に費やす時間がかなり少なかった。
