#include <stdio.h>

int suma(int n,int *v)
{
    int i,s=0;
    for(i=0;i<n;i++)
    {
        s+=v[i];
    }
    return s;
}

int main(){
    int n;
    scanf("%d",&n);
    int v[100],i;
    for (i=0;i<n;i++)
    {
        scanf("%d",&v[i]);
    }
    int s=0;
    s=suma(n,v);
    printf("%d\n",s);
}
