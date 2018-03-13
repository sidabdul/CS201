  /*

 Sid Abdullahi
 4/3/2016
 CS201 HW 1
 
 The purpose of this program is to construct a maze given from an input txt file into a dynamically allocated 2 dimentional array. 
 This assignments objective is to design and develop a maze solving application. This program we will use
 the Wall Follower algorithm. 

  The alogorthim used is :

  4.2 Wall Follower Algorithm

  The next step involves the implementation of the Wall Follower Algorithm. The algorithm is based on 4
  movement rules. Also, the algorithm requires you to keep track of the direction the person is facing. As
  this rules are always with respect to the direction the person is facing. The rules are as follow:
  
  1) If there is no Wall at the Right of the person: Turn Right and walk one block

  2) Else, If there is no wall forwards: Walk one block

  3) Else, if there is no Wall at the Left of the person: Turn Left and walk one block

  4) Else Turn 180 degrees and walk one block

 
  This algorithm assumes that all the walls of the maze are connected
  together or to the maze’s outer boundary, therefore, following the wall at some point will lead you to
  the exit.



*/


#include <stdio.h>
#include <stdlib.h>



#define FALSE 0

#define TRUE 1


char direction = 'N'; 


long int pos_x;
long int pos_y;


int find_path(long int x, long int y);
int traverse(long int x, long int y);







int main(int argc, char * argv[])
{

  //Get row and columns infromation from the maze text file, store into these varibles to dymanically allocate the array..
  int maze_rows = 0;
  int maze_columns = 0; 


  FILE * file = fopen(argv[1], "r");  

  char coors[20];
  char enter[20];
  char exit[20];
  char buffer[1500];


  printf ("\n");

  //Get the size of the maze from the text file here..
  fgets(coors,sizeof coors,file);
  printf ("Fgets above for the first line is column row pair.. ");
  printf("%s", coors);


  //Get the starting position of the maze from the text file here..
  printf ("\n");
  fgets(enter,sizeof enter,file);
  printf ("Fgets above for the enter coordinates.. ");
  printf("%s", enter);


  //Get the exit position of the maze from the text file here..
  printf ("\n");
  fgets(exit,sizeof exit,file);
  printf ("Fgets above for the exit coordinates.. ");
  printf("%s", exit);




  //Convert char maze text file size parameters into a long int through the use of strtol..
  char * endptr;
  long int  num_cols, num_rows;
  num_cols = strtol (coors,&endptr,10);
  num_rows = strtol (++endptr,&endptr,10);

  printf ("\n");
  
 

  //Convert char maze text file maze starting location parameters into a long int through the use of strtol..
  char * endptr2;
  long int  start_col, start_row;
  start_col = strtol (enter,&endptr2,10);
  start_row = strtol (++endptr2,&endptr2,10);

  printf ("\n");


  //Convert char maze text file maze exit location parameters into a long int through the use of strtol..
  char * endptr3;
  long int  end_col, end_row;
  end_col = strtol (exit,&endptr3,10);
  end_row = strtol (++endptr3,&endptr3,10);

  printf ("\n");

  
 

  printf ("\n");



  printf ("The first number for columns is : %ld\n", num_cols);

  printf ("The second number for rows is : %ld\n", num_rows);
  
  printf ("\n");
  printf("Maze Columns : %ld\nMaze Rows : %ld\n ", num_cols, num_rows);




  printf ("\n");



  printf ("The first number for starting columns is : %ld\n", start_col);

  printf ("The second number for starting rows is : %ld\n", start_row);

  printf ("\n");





  printf ("The first number for exit columns is : %ld\n", end_col);

  printf ("The second number for exit rows is : %ld\n", end_row);

  printf ("\n");






  //Dynamically allocated two dimenstionasl array is defined here..
  char ** maze;

  int i;
  
  maze = (char**) malloc(sizeof(char*) * num_rows);
  
  for(i=0; i < num_rows; i++)
  {
     maze[i] = (char*) malloc(sizeof(char) * num_cols + 2);
  }



  for(i=0; i < num_rows; i++)
  {
    fgets(maze[i], num_cols+2, file);
  }



  printf ("\n");
   printf("Here Is The MAZE!:\n");

  printf ("\n");
   for ( i = 0; i < num_rows; i++ )

        printf("%.*s", num_cols + 2, maze[i]);

    printf("\n");



  //maze[0][5] = 's';
  // printf("Here Is The MAZE[0][5]: %.*c\n", 1 ,maze[0][5]);






int find_path(long int x, long int y)
{


    // If x,y is outside maze, return false.

    if ( x < 0 || x > num_rows - 1 || y < 0 || y > num_cols - 1 ) 
    {
    
    printf("First Case outside of maze");
    return FALSE;
    }
 

    // If x,y is the goal, return true.
	//	!(A & B)
	//	!A || !B
//    if ( x == end_row && y == end_col ) return TRUE; 

 

    // If x,y is not open, return false.

   // if ( maze[y][x] != '.' && maze[y][x] != 'S' )return FALSE;


    if ( maze[x][y] != '0' && x != end_row && y != end_col) // maze[x][y] != maze[start_row][start_col] )
    {

      printf("\nSecond Case not open and not starting position\n");
    

      printf ("The first number for starting columns is : %ld\n", start_col);

      printf ("The second number for starting rows is : %ld\n", start_row);


      printf("Here Is The MAZE[0][5]: %.*c\n", 1 ,maze[0][5]);

  
      maze[x][y] = '+';

      return FALSE;
    }
 
   
    // Mark x,y part of solution path.

  //  maze[x][y] = '+';

 

    // If find_path North of x,y is true, return true.

    if ( find_path(x + 1, y) == TRUE ) return TRUE;

 

    // If find_path East of x,y is true, return true.

    if ( find_path(x, y +1) == TRUE ) return TRUE;

 

    // If find_path South of x,y is true, return true.

    if ( find_path(x - 1, y) == TRUE ) return TRUE;

 

    // If find_path West of x,y is true, return true.

    if ( find_path(x, y - 1) == TRUE ) return TRUE;

 

    // Unmark x,y as part of solution path.

    maze[x][y] = 'x';

 
    return FALSE;

}


int traverse(long int x, long int y)
{

      printf("\ntraverse function executed!\n");
  
printf("Here Is The MAZE!:\n");

  printf ("\n");
   for ( i = 0; i < num_rows; i++ )

        printf("%.*s", num_cols + 2, maze[i]);

    printf("\n");



  if(x == end_row && y == end_col)
  {
   maze[x][y] = 'W'; 
   return;
  }
  

     //right.. 
    
  if(direction == 'N') 
  {
    if(maze[x][y -1] != 'W' && maze[x][y -1] != 'X')
    {
       direction = 'E';
       maze[x][y] = maze[x][y - 1];
       maze[x][y] = 'W';
       return traverse(x, y -1);


    }

  }
  
  if(direction == 'S')
  {
    if(maze[x][y + 1] != 'W' && maze[x][y +1] != 'X')
    {
       direction = 'W';
       maze[x][y] = maze[x][y +1];
       maze[x][y] = 'W';
       return traverse(x, y +1);


    }

  }

  if(direction == 'E')
  {
    if(maze[x - 1][y] != 'W' && maze[x - 1][y] != 'X')
    {
       direction = 'S';
       maze[x][y] = maze[x -1][y];
       maze[x][y] = 'W';
       return traverse(x - 1, y);


    }

  }


  if(direction == 'W')
  {
    if(maze[x + 1][y] != 'W' && maze[x + 1][y] != 'X')
    {
       direction = 'N';
       maze[x][y] = maze[x +1][y];
       maze[x][y] = 'W';
       return traverse(x + 1, y);


    }

  }



  else if(direction == 'N')
  {
    if(maze[x][y -1] != 'W' && maze[x][y -1] != 'X')
    {

      maze[x][y] = maze[x][y - 1];
      return traverse(x, y -1);

    }

  }


   else if(direction == 'S')
  {
    if(maze[x - 1][y] != 'W' && maze[x - 1][y] != 'X')
    {

      maze[x][y] = maze[x - 1][y];
      return traverse(x - 1, y);

    }

  }



  else if(direction == 'E')
  {
    if(maze[x][y - 1] != 'W' && maze[x][y -1] != 'X')
    {

      maze[x][y] = maze[x][y - 1];
      return traverse(x, y - 1);

    }

  }

  
   else if(direction == 'W')
  {
    if(maze[x][y + 1] != 'W' && maze[x][y +1] != 'X')
    {

      maze[x][y] = maze[x][y + 1];
      return traverse(x, y + 1);

    }

  }






//step 3



    else if(direction == 'N')
  {
    if(maze[x][y +1] != 'W' && maze[x][y +1] != 'X')
    {
       direction = 'W';
       maze[x][y] = maze[x][y + 1];
       maze[x][y] = 'W';
       return traverse(x, y +1);


    }

  }

  else if(direction == 'S')
  {
    if(maze[x][y - 1] != 'W' && maze[x][y -1] != 'X')
    {
       direction = 'E';
       maze[x][y] = maze[x][y -1];
       maze[x][y] = 'W';
       return traverse(x, y -1);


    }

  }

  else if(direction == 'E')
  {
    if(maze[x + 1][y] != 'W' && maze[x + 1][y] != 'X')
    {
       direction = 'N';
       maze[x][y] = maze[x +1][y];
       maze[x][y] = 'W';
       return traverse(x + 1, y);


    }

  }


  else if(direction == 'W')
  {
    if(maze[x - 1][y] != 'W' && maze[x - 1][y] != 'X')
    {
       direction = 'S';
       maze[x][y] = maze[x - 1][y];
       maze[x][y] = 'W';
       return traverse(x - 1, y);


    }

  }




  else

  if(direction == 'N')
  {
    
       direction = 'S';
       maze[x][y] = maze[x -1 ][y];
       return traverse(x - 1, y);


    }

  

  else if(direction == 'S')
  {
    
       direction = 'N';
       maze[x][y] = maze[x +1][y];
       return traverse(x +1, y);


    

  }

  else if(direction == 'E')
  {
       direction = 'W';
       maze[x][y] = maze[x][y +1];
       return traverse(x, y +1);


  }

  


  else if(direction == 'W')
  {
    
       direction = 'E';
       maze[x][y] = maze[x][y - 1];
       return traverse(x, y - 1);


    

  }



}

find_path(start_row, start_col);


//traverse(start_row, start_col);


/*

char walk_one_block(long int x, long int y)
{

 if(direction == 'N')
      if(maze[x + 1][y] != 'X')
          pos_x = x - 1;
          pos_y = y;
          maze[x + 1][y] = '|';  

  if(direction == 'S')
      if(maze[x - 1][y] != 'X')
          pos_x = x+1;
          pos_y = y;
          maze[x - 1][y] = '|';


  if(direction == 'E')
   if(maze[x][y -1] != 'X')
          pos_x = x;
          pos_y = y - 1;
          maze[x][y - 1] = '|';
      



  if(direction == 'W')
      if(maze[x][y + 1] != 'X')
          pos_x = x;
          pos_y = y + 1;
          maze[x][y + 1] = '|';


}



char turn_right()
{

  if(direction == 'N')
      return 'E';   
 
  if(direction == 'S')
      return 'W';   

  if(direction == 'E')
      return 'S';
  if(direction == 'W')
      return 'N';
}


char turn_left()
{

  if(direction == 'N')
      return 'W';   
 
  if(direction == 'S')
      return 'E';   

  if(direction == 'E')
      return 'N';
  if(direction == 'W')
      return 'S';
}

char turn_180()
{

  if(direction == 'N')
      return 'S';

  if(direction == 'N')
      return 'E';

  if(direction == 'E')
      return 'W';
  if(direction == 'W')
      return 'E';
}



  while( start_row != end_row && start_col != end_col )
  {

    turn_right();
    walk_one_block(start_row, start_col);
    walk_one_block(start_row, start_col);
    turn_left();
    walk_one_block(start_row, start_col);
    turn_180();
  }


*/





printf ("\n");
   printf("Here Is The MAZE AFTER THE TRAVERSAL!:\n");

  printf ("\n");
   for ( i = 0; i < num_rows; i++ )

        printf("%.*s", num_cols + 2, maze[i]);

    printf("\n");







   //Deallocate the dymanic memory!
  for(i=0; i < num_rows; i++)
  {
     free( maze[i] );
  }


  //Delete the maze array!
  free( maze );



}










