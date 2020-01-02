#include <stdio.h>

extern const char* g_hello;

void func()
{
    printf("hello  %s\n", g_hello);
}
