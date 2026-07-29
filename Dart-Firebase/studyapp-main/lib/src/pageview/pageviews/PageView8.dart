import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview8 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """

# Concept of pointers 
  A pointer is a variable that stores the memory address of another variable.
  A pointer variable points to a data type (like int) of the same type, and is created with the * (pointer) operator. The address of the variable can be obtained using & (reference) operator. Content in the pointer location can be accessed by using * (pointer) operator.
* operator has two roles in pointer operation.
  •	When used in declaration (int* ptr), it creates a pointer variable.
  •		In all other cases other than declaration, it act as a dereference (content of) operator.
  An integer pointer can be defined in three ways.

  •	`int* myNum;`
  
  •	`int *myNum;`
  
  •	`int* myNum;`

  Example:

  `int myAge = 23; int* ptr = &myAge;`
 `printf("%p", myAge); /* prints 23 */ printf("%d", *ptr); /* prints 23 */`
 
  Advantage of using pointer:

  1.	To manipulate the data in the computer's memory
  2.	It can reduce the code
  3.	It can improve the performance of a program
  
""",
      },
    ],
    [
      {
        'text': """

# pointer operations


\n\n\nFew operations are allowed to perform on Pointers in C language. The operations are slightly different from the ones that we generally use for mathematical calculations. The operations are:
  
  •	Addition to a pointer
  
  •	Subtraction to a pointer
 
1) Addition of a Pointer

    When a pointer is incremented, it actually increments by the number equal to the size of the data type for which it is a pointer.
  
    Example:

 If an integer pointer that stores address 1000 is incremented, then it will increment by 2(size of an int) and the new address it will points to 1002. While if a float type pointer is incremented then it will increment by 4(size of afloat) and the new address will be 1004.
  Pointer increment can be done in two ways :
 
  1.  ptr++  or ++ptr
 
  2.  ptr = ptr + I	or ptr +=I

2) Subtraction of a Pointer:

    When a pointer is decremented, it actually decrements by the number equal to the size of the data type for which it is a pointer.
  
  Example:
  
  If an integer pointer that stores address 1000 is decremented, then it will decrernent by 2(size of an int) and the new address it will points to 998. While if afloat type pointer is decremented then it will decrement by 4(size of afloat) and the new address will be 996.

  Pointer decrement can be done in two ways:

  1.	ptr--  or --ptr
  
  2.	ptr = ptr - 1	or ptr -=l


  Pointers can be outputted using %p, since, most of the computers store the address value in hexadecimal form using %p gives the value in that form. But for simplicity and understanding we can also use %u to get the value in Unsigned int form.


""",
      },
    ],
    [
      {
        'text': """
# C program to illustrate pointer arithmetic in an array

  ```
  #include <stdio.h> int main()
 
  {
 
  int *ptr, arr[S] = { 1, 2, 3, 4, 5 }; int* ptr;

  ptr =arr;/* array name represent the starting address of an array*/

  /* Traverse array using ptr * / for (inti= O; i < 5; i++)
 
  {
 
  printf("%d ", ptr[O]); ptr++;

  }

""",
      },
    ],
    [
      {
        'text': """

# passing pointers to functions
\n\n\nPassing a pointer to a function is known as function call by reference. The call by reference method of passing arguments to a function copies the address of an argument into the formal parameter. Inside the function, the address is used to access the actual argument. It means the changes made to the parameter affect the originally passed argument.
  In such a call, declare the function parameters as pointer types as in the following function swap(), which exchanges the values of the two integer variables pointed to, by their arguments.
  /* function definition to swap the values*/ 
  
  ```
  void swap(int *x, int *y)
  
  {

  
  int temp; temp= *x;
  
  *x = *y;
  
  *y = temp;
  
  }

  int main () {
  
  {
  
  /* local variable definition */ int a= 100;
  
  int b = 200;

  printf("Before swap, value of a : %d", a ); printf("Before swap, value of b : %d", b );
  
  /* calling a function to swap the values*/ swap(&a, &b);

  printf("After swap, value of a : %d", a ); printf("After swap, value of b : %d", b );
  
  }

""",
      },
    ],
    [
      {
        'text': """

# Arrays and Pointers

\n\n\nAn array name is a constant pointer to the first element of the array. Therefore, in the declaration -
  `int num[50];`
  num is a pointer to &num[O], which is the address of the first element of the array num. Thus, the following program fragment assigns p as the address of the first element of num -
 
  ```
  int *p;
 
  int num[l O]; p =num;
 
  *(num + 0) is accessing the data at num[O]
 
  *(num + 1) is accessing the data at num[1]


  *(num + 4) is accessing the data at num[4]
 
  Program demonstrates pointer & array
 
  #include <stdio.h> int main () {

  /* an array with 5 elements */
 
  double num[5] = {1000.0, 2.0, 3.4, 17.0, 50.0};
 
  double *p; inti;

  p = num;

  /* output each array element's value * / printf( "Array values using pointer");

  for ( i = O; i < 5; i++) { printf("%f", *(p + i) );
 
  }
 
  printf( "Array values using num as address"); for ( i = O; i < 5; i++) {
 
  printf("%f", *(num + i) );
 
  }
 
  }

""",
      },
    ],
    [
      {
        'text': """

# Program to copy a string using pointer arithmetic
 
  ```
  #include <stdio.h> void main()
 
  {
 
  char s1[20] = "GWPC Thrissur", c, *s2;
 
  s2 = (char* )malloc(20); /*allocate 20 bytes for character data to s2 */

  do {
 
  c=*sl;
 
  *s2 = c; sl++; s2++;
 
  } while (c!='\0');

  printf("%s",s2);
 
  }
```
# program to copy string using pointer and function
  
  ```
  #include <stdio.h> 
  
  #include <stdlib.h> 
  
  #include <string.h>

  /* Function to copy the string*/ char* copyString(char s[])
 
  {
 
  inti;
 
  char* s2; /*string pointer to copy parameter string*/ s2 = (char* )malloc(20); /*allocate 20 bytes to s2 * /

  for (i = 0; s[i] != '\0'; i++)
 
  {
 
  *(s2+i) = *(s+i);


  /* Return the pointer of copied string*/ return (char*)s2;


  void main()
 
  {
 
  char s1[20] = "GWPC Thrissur"; char* s2;

  /* Function Call */

 s2 = copyString(s1);
 
  puts(s2);

""",
      },
    ],
    [
      {
        'text': """

# Single & Multi-Dimensional Arrays using Pointers
  C program to add two matrix using pointers.
 
  ```
  #include <stdio.h> #define ROWS 3
 
  #define COLS 3

  /* Function declaration to input, add and print matrix*/ void matrixlnput(int mat[][COLS]);
 
  void matrixPrint(int mat[][COLS]);
 
  void matrixAdd(int matl[][COLS], int mat2[][COLS], int res[][COLS]);

  int main()
 
  {
 
  int matl[ROWS][COLS], mat2[ROWS][COLS], res[ROWS][COLS];

  /* Input elements in first matrix*/
 
  printf("Enter elements in first matrix of size %d x %d: ", ROWS, COLS); matrixl nput(matl);

  /* Input element in second matrix*/
 
  printf("Enter elemetns in second matrix of size %dx%d: ", ROWS, COLS); matrixl nput(mat2);

  /* Find sum of both matrices and print result*/ matrixAdd(matl, mat2, res);

  printf("Sum of first and second matrix: "); matrixPrint(res);

  return O;


  /** Function to read matrix from keyboard.*/ void matrixlnput(int mat[][COLS])
 
  {
 
  inti, j;

  for(i = O; i < ROWS; i++)
 
  {
 
  for (j = O; j < COLS; j++)
 
  {
 
  /*******	(*(mat+ i) + j) is equal to &mat[i][j]	******/ 
  
  scanf("%d", (*(mat+ i) + j));


  /*** Function to print elements of matrix on console.*/ void matrixPrint(int mat[][COLS])

  {

  inti, j;

  for(i = O; i < ROWS; i++)

  {

  for (j = O; j < COLS; j++)

  {

  printf("%d ",*(*(mat+ i) + j));

  }

  printf("");



  /** Function to add two matrices and store their result in given res matrix. */ 
  
  void matrixAdd(int matl[][COLS], int mat2[][COLS], int res[][COLS])

  {

  inti, j;

  for(i = O; i < ROWS; i++)
 
  {
 
  for (j = O; j < COLS; j++)
 
  {
 
  *(*(res+ i) + j) = *(*(matl + i) + j) + *(*(mat2 + i) + j);

""",
      },
    ],
    [
      {
        'text': """

# C program to sort string array using pointers.

  ```
  #include <stdio.h> 
  
  #include <stdlib.h> 
  
  #include <string.h>

  void sort(char ** s, int size)/*
  
  { 

    int i,j;
  
  char temp[l00];
  
  ** shows two dimensional array * /
  

  for(i=0; i<size; i++)
 
  {
 
  for(j=i+1 ; j<size ; j++)
 
  {
 
  if(strcmp(s[i],s[j])>0) /*string compare*/
 
  { 
    
    /*swap strings */ 
  
  strcpy(tem p,s[i]);
 
  strcpy(s[i],s[j]);
 
  strcpy(s[j],ternp);
 
 
  }
 
  }
 
  }
 
  }

  int main()
 
  {
 
  int i,j;

  char** s =(char**) malloc(S00); 
  
  for( i=0; i<S; i++)
 
  {
 
  s[i] = (char*) malloc(l00); /* allocate 100 bytes * / 
  
  scanf("%s", s[i]);
 
  }
 
  sort(s,5 ); for(i=0; i<S; i++)
 
  {
 
  printf("%s", s[i]); free(s[i]);
 
  }
 
  free(s); /*free allocated memory*/
 
  }
 
""",
      },
    ],
    [
      {
        'text': """

# C program to transpose a matrix using pointers.

  ```
  #include<stdio.h> 
  
  #include<stdlib.h> 
  
  int main()
  
  {
  
  int *transpose,i,j,r,c;
  
  printf(" How many rows and columns in the matrix:-"); 
  
  scanf(" %d %d",&r,&c);
  
  /*allocating memory by using dynamic memory allocation */ 
  
  transpose=(int*)calloc(r*c,sizeof(int)); /*allocate memory for matrix*/ 
  
  printf("Enter the elements:-");
  
  for(i=0;i<r;i++)
  
  {
  
  for(j=0;j<c;j++)
  
  {
  
  seanf("%d",transpose+(i *c+j) * sizeof(i nt));
  
  /*transpose (array name) is starting address*/
  
  }
  
  }
  
  printf(" The transpose of matrix is:- "); 
  
  for(i=0;i<c;i++)
  
  {
  
  for(j=0;j<r;j++)
  
  {
  
  printf("%5d", *(transpose+(j*c+i) *sizeof( int)));
  
  }
  
  /*transpose+(j*c+i) gives address of transpose element*/ 
  
  printf("");
  
  }
  
  return 0;
  
  }
  ```
## Output of above code:-
  
  How many rows and columns in the matrix: - 3 3 
  
  _Enter the elements:-_
  
  123
  
  456
  
  789
  
## The transpose of matrix is:-
  
  147
  
  258
  
  369
  
  
"""
      }
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
