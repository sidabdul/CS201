#include<stdio.h>



long fibonacci(long n)
{
  if ( n == 0) 
     return 0;
  
  else if ( n == 1) 
    return 1;

  else 
    return (fibonacci(n-1) + fibonacci(n-2));
}

int main()
{
  
  
//  long cal = fibonacci(10);


//  printf("fibonacci of 5 is : %ld\n", cal);

  return 0;
}

