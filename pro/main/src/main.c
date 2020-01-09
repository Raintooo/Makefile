#include <string.h>
#include <stdio.h>
#include "func3.h"
#include "func.h"
#include "my_malloc.h"

extern void func3();


int main()
{
    func3();
	func();
	
	char* p = (char*)my_malloc(10);
	
	strcpy(p, "aaa");
	printf("%s\n", p);
	
	my_free(p);
	
    return 0;
}
