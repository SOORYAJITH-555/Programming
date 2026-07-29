import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview6 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """
# Arrays
\n\n\n## What is a single dimensional array?
\n\n\nAn array is a variable that can store multiple values. For example, if you want to store 100 integers, you can create an array for it.

\n\n\n## How to declare an array?

\n\n\n### Syntax:

    `Data type	arrayName[arraySize];`

\n\n\n### Example:

    `float mark[S];`
 
Here, we declared an array, mark, of floating-point type. And its size is 5. Meaning, it can hold 5 floating-point values.


\n\n\n## Access Array Elements


  \n\n\n You can access elements of an array by indices using the syntax ArrayName[index]
  Suppose you declared an array mark as above. The first element is mark[O], the second element is mark[l] and so on.
  Arrays have O as the first index, not 1. In this example, mark[O] is the first element. If the size of an array is n, to access the last element, the n-1 index is used. In this example, mark[4].

\n\n\n## How to initialize an array?


  \n\n\n It is possible to initialize an array during declaration. For example, `int mark[5] = {19, 10, 8, 17, 9};`
  You can also initialize an array like this. `int mark[] = {19, 10, 8, 17, 9};`
  Here, we haven't specified the size. However, the compiler knows its size is 5 as we are initializing it with 5 elements.

\n\n\n### Input and Output Array Elements


\n\n\n_/* Program to take 5 values from the user and store them in an array And Print the elements stored in the array */_


\n`#include <stdio.h>`
\n`void main()`
\n`{`
\n`int values[S];`
\n`printf("Enter 5 integers: ");`
\n_/* taking input and storing it in an array*/_
\n`for(int i = O; i < 5; ++i)`
\n`{`
\n`scanf("%d", &values[i]);`
\n`}`
\n_/* printing elements of an array*/_
\n`for(int i = O; i < S; ++i)`
\n`{`
\n`printf("%d\n", values[i]);`
\n`}`
\n`}`


\n# How to initialize an array?
\nIt is possible to initialize an array during declaration. For example, `int mark[5] = {19, 10, 8, 17, 9};`
You can also initialize an array like this. `int mark[] = {19, 10, 8, 17, 9};`
Here, we haven't specified the size. However, the compiler knows its size is 5 as we are initializing it with 5 elements.

""",
      },
    ],
    [
      {
        'text': """

# Multi-Dimensional Array
\n## What is a Multi-dimensional array?
\nIn C programming, you can create an array of arrays. An array with many number of rows and many number of columns is called multi-dimensional array.
\n_Syntax:_
\n`Data_type Array_name[rows][columns]`
\nEg: `float x[3][4];` _/* 3 rows and 4 columns*/_

""",
      },
    ],
    [
      {
        'text': """
# 2D & 3D Array

1) Initialization of a 2d array

    `int c[2][3] = {{1, 3, O}, {-1, 5, 9}};`

    `int c[][3] = {{1, 3, O}, {-1, 5, 9}};`

    `int c[2][3] = {1, 3, 0, -1, 5, 9};`

2) Initialization of a 3d array

    `int test[2][3][4] = {`

    `{{3, 4, 2, 3}, {O, -3, 9, 11}, {23, 12, 23, 2}},`

    `{{13, 4, 56, 3}, {5, 9, 3, 5}, {3, 1, 4, 9}}};`

    I* C program to store temperature of two cities of a week and display it. *I
    
    `#include <stdio.h>`

    `int main()`
    
    `{`
    
    `int mat[3][4];`

    /* Using nested loop to store values in a 2d array */ 
    
    `for (inti= 0; i < 3; ++i)`
    
    `{`
    
    `for (int j = O; j < 4; ++j)`
    
    `{`
    
    `scanf("%d", &mat[i] [j]);`
    
    `}`
    
    `}`

    `printf("\nDisplaying values: ");`

    /* Using nested loop to display values of a 2d array*/ 
    
    `for (inti= O; i < 3; ++i)`
    
   `{`
    
    `for (int j = O; j < 4; ++j)`
    
    `{`
    
    `printf(" %d \t", mat[i][j]);`
    
   `}`
    
    `printf("\n");`
    
    `}`
    
    `}`

""",
      }
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
