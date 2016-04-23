#include <stdio.h>

extern void init(char *encrypt);
extern char *decrypt(char *encrypt, int shift);

void main(int argc, char *argv[]) {
    char *result;
    char encrypt[] = "GSRKVEXYPEXMSRW CSY LEZI JSYRH XLI WLMJX ZEPYI";
    int i;

    init(encrypt);

    for (i = 1; i < 5; i++) {
        result = decrypt(encrypt, i);
        printf("Possible decrypt with shift %d: %s\n", i, result);
    }
}
