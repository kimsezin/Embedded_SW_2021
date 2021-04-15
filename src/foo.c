#include <stdio.h>
#include "funcs.h"

int foo(int flag)
{
    if (flag)
    {
        printf("hello foo world\n");
        flag=0;
    }
    else
    { 
        printf("good bye~\n");
        flag=1;
    }
    return 0;    
}
