#include <stdio.h>

int functie(char *v,int x)
{
    return v[x];
}

int main()
{
    int x=1;
    char v[100];
    scanf("%s",v);
    char a=functie(v,x);
    printf("%c\n",a);
    return 0;
}