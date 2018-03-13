#include<stdio.h>
#include<stdlib.h>

#define MAXX 3
#define MAXY 4
#define MAXZ 5

int main()
{

  int ***p,i,j;

  p=(int ***) malloc(MAXX * sizeof(int **));

  for(i=0;i < MAXX;i++)
  {

    p[i]=(int **)malloc(MAXY * sizeof(int *));

    for(j=0;j < MAXY;j++)
    {
      p[i][j]=(int *)malloc(MAXZ * sizeof(int));
    }
  }






   int ii,jj;

    for(ii=0; ii < MAXX ;ii++)
    {
        for(jj=0 ;jj < MAXY ;jj++)
        {
                free(p[i][j]);
        }
        free(p[i]);
    }
    free(p);









}
