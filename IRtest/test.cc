#include <stdio.h>

void foo(int n) {
    int i;
    for (i = 0; i < n; i++) {
        int a = i * 2;
        printf("%d\n", a);
    }
}

int main() {
    foo(5);
    return 0;
}
