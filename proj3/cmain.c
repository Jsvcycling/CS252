#include <stdlib.h>
#include <stdio.h>

extern char * jstring(char *buf1, char *buf2);

int main(int argc, char *argv[]) {
    char buffer1[] = "First part of the string";
    char buffer2[] = " join this to buffer1\n";
    char *result;
    
    result = jstring(buffer1, buffer2);
    printf("Concatenated strings: %s\n", result);
    exit(0);
}