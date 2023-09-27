#include <stdio.h>

int f(char a, char b,short c,short *v){
    if(a>b){
        int d=a-b;
        return d;
    }
    int d=b-a;
    d=d%c;
    return v[d];
}

int main()
{
    short v[5]={0,1,2,3,4};
    printf("%d",f('a','b',5,v));
}