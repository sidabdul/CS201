#include <stdio.h>
#include <stdlib.h> //required to use 'rand()' and 'srand()'
#include <sys/time.h>
#include <time.h> //required to use 'gettimeofday()'
#include <string.h>

int rand_num(int total)
{

   int num;
   num = rand()%total; //generate a number between 0 and the total 
   return num;
}


int main()
{

  int nums[9] = {0,1,2,3,4,5,6,7,8};



  int total = 8;

  int index = 0;

  int max = 0;


  while (total > 0)  //randomize the array of integers by swapping the last for a random number within the array, this is repeated for all the numbers.
   {
      index = rand_num(total);
    
      max = nums[total];
      nums[total] = nums[index];  //shuffle the two numbers
      nums[index] = max;
      --total; //decriment the total to leave the numbers that have been shuffled alone.
   }


  for(int i = 0 ; i < 9; ++i)
  {
    printf(" %d ",nums[i]); 

  }


    printf(" \n "); 
}
      
