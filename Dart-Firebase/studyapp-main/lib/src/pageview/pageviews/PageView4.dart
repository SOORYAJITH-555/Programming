import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview4 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """

# Concept of Pre processing


Preprocessors are programs which process the input data and produces an output which is taken as input for another program. In simpler words, it is another program that processes our program and sends it to the compiler.
It is used to include header files, line control, macro expansions and conditional compilation. In C programming it is mostly used by the compiler at the beginning of the code to include certain functionalities that come with the header files.

The features offered by the C preprocessor are also known as 'Preprocessor Directives'. These directives are preceded by a'#' symbol. Here we have the following Preprocessor Directives:

*	Macro Expansion
*	File Inclusion
*	Conditional Compilation


               """,
      },
    ],
    [
      {
        'text': """
# Macro Expansion

As we already know Preprocessor are the programs which are used before compilation. As a part of the C Preprocessor, macro serves the same purpose. It is a block of statements used as a Preprocessor Directive. A macro is also known as a macro definition. Let's have a look at an example to have a clear picture of a macro definition:

`#include <stdio.h>`
\n`#define NUM 10 /*macro */`
\n`int main()`
\n`{`
\n`int square;`
\n`square = NUM * NUM;`
\n`printf("The square is o/od", square); return 0;`
\n`}`

"""
      },
    ],
    [
      {
        'text': """

# File Inclusion

This feature of C Preprocessor allows a programmer to include other files in the C code. #include is the command used to include another file or header into the program.

## Why File inclusion

*	In the case of a complex program, the different parts of a program can be written in different files and then included in the main program. This reduces the possibility of errors in the code.
*	It helps make our code modular. We write several programs which use a common file or functions or macro definitions then the same file can be included in the program without manually writing the whole function again and again which reduces errors in the code and possible inconvenience.
*	In case we create library functions and make it accessible to others we need to create a filename with a .h extension which can be included in the program with minimal efforts.
*	To include certain inbuilt header files we need this feature of C Preprocessor.

"""
      }
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
