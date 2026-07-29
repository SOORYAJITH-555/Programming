import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview1 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """
# Getting Started With C



Welcome to this interactive tutorial on C programming.
\n\n\nThis course covers all the fundamentals of C programming, step by step. By the end, you will be comfortable programming in C.
\n\n\nBefore we start, we have an important tip for you. The only way you can get better at programming is by writing code.
\n\n\nTo make the learning experience more effective and enjoyable, try to learn by doing while using the app that make C programming more easy and fun.""",
      },
    ],
    //______________________________________
    [
      {
        'text': """
## Basic programming concepts 
* C program structure
* Selection structure 
* Repetition structures.
## Function 
* Declarations
* Prototype 
* Definition
* Function call
* Storage class
* Lifetime of variables
* Visibility of variables.
## Preprocessor
* File inclusion 
* Macro substitution
## Recursion 
* Recursive definition of a problem
* Implementation of programs using recursion.





"""
      }
      // Add more content here
    ],
    [
      {
        'text': """
## Arrays 
* Definition, initialization and processing of arrays 
### Searching algorithms 
* Linearsearch, Binary Search, 
### Sorting algorithms 
* Selection sort, Quick sort,Passing arrays to
* Functions 

## Strings 
* Representation of strings in C 
* String input and output -
* String processing 
* copy, concentrate, length,comparison, pattern searching etc 
* Builtin String
* Implementation of string functions.


"""
      },
    ],
    [
      {
        'text': """
## Pointers 
* Declaration, Initialization, accessing of pointer
variables -Pointer arithmetic – Passing pointers to Functions – dynamic memory allocation
Arrays and Pointers - Strings and Pointers – Array of Pointers. 

## Structure
* Definition and initialization of structure variables, Accessing ofstructure elements
* Array of structure
* Structure and Pointer
* Structure and Function
* Union 
* Enumerations

## File
* Defining, opening, closing a file
* input and output operations on sequential files
* Command Line arguments
    

""",
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
