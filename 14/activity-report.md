活動内容報告 ＃14
学籍番号:1920031
氏名:山川竜太郎
ペア学籍番号・氏名(または「個人作業」):個人
提出日付:2020/2/3

[作成したプログラム]

演習2
a. 色を明るく変化させる関数void makebrighter(struct color *p)。

```
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

```

[簡単な説明]

演習2
a. 色を明るく変化させる関数void makebrighter(struct color *p)。

教科書ではcolorのr, g, bはchar型であるが、数値を操作するのでint型にした。

[アンケート]
Q1. C言語の構造体機能についてどのように思いましたか。
難しいです

Q2. C言語でファイルを複数に分ける方法が分かりましたか。
すこしだけわかりました

Q3. リフレクション(今回の課題で分かったこと)・感想・要望をどうぞ。
むずかしいです
