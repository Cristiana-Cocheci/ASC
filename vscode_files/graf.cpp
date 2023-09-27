#include <stdio.h>
#include <cstdlib>
void matrix_mult(int *m1, int *m2, int *mres, int n)
{
    int i,j,k;
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            int s=0;
            for(k=0;k<n;k++)
            {
                s += m1[i*n+k]* m2[k*n+j];
            }
            mres[n*i+j]=s;
        }
    }
}

void exponentiere (int *m, int n, int k, int *mres)
{
    int i,j,aux[10000];
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            mres[i*n+j]=0;
        }
        mres[i*n+i]=1;
    }
    while(k>=1)
    {
        if(k%2!=0)
        {
           matrix_mult(m,mres,aux,n); // m= m*minitial= mres
           for(i=0;i<n;i++)
            {
                for(j=0;j<n;j++)
                {                    
                    mres[i*n+j]=aux[i*n+j];
                }
            }
        } 
        matrix_mult(m,m,aux,n); // m=m*m=mres
        for(i=0;i<n;i++)
        {
            for(j=0;j<n;j++)
            {                    
                m[i*n+j]=aux[i*n+j];
            }
        }
        k/=2;
    }
    
}

void afisare_matrice(int *m, int n)
{
    int i,j;
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            printf("%d ",m[i*n+j]);
        }
        printf("\n");
    }
}

int main()
{
    int i,j,m[10000],n;
    //int mres[100][100];
    int *mres = (int*)malloc(n*n*sizeof(int));
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        for(j=0;j<n;j++)
        {
            scanf("%d",&m[i*n+j]);
        }
    }

    exponentiere(m,n,5,mres);
    afisare_matrice(mres,n);

 /*   int cerinta,n,i,j,k,m[100][100];
    scanf("%d",&cerinta);
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {
        for(j=0;j<=n;j++)
        {
            m[i][j]=0;
        }
    }

    int nrleg[n];
        for(j=0;j<n;j++)
        {
            scanf("%d",&nrleg[j]);
        }
        for(j=0;j<n;j++)
        {
            for(k=0;k<nrleg[j];k++)
            {
                int x;
                scanf("%d",&x);
                m[j][x]=1;
            }
        }
    
    if(cerinta==1)
    {
        afisare_matrice(m,n);
    }
    else
    {

    }*/
    return 0;

}