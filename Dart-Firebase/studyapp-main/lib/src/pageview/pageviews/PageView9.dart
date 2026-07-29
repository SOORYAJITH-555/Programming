import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview9 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """

# What is a structure?
  A structure is a key word that creates user defined data type in C. A structure creates a data type that can be used to group items of possibly different types into a single type. ie; A structure may contain elements of different data types   int, char, float, double, etc. It may also contain an array as its member.
  
## How to create a structure?
  
  `'struct'` keyword is used to create a structure. Following is an example.
  ```
  struct address
  
  {
  
  char name[SO]; 
  
  char street[lOO]; 
  
  char city[SO]; 
  
  char state[20]; 
  
  int pin;
  
  };


""",
      },
    ],
    [
      {
        'text': """

# How to declare structure variables?
  
  A structure variable can either be declared with structure declaration or as a separate declaration like basic types.
  
## Method 1 : A variable declaration with structure declaration.

  ```
  struct Point
 
  {
 
  intx, y;
 
  } 
  
  pl;/* The variable pl is declared with 'Point'*/
```

## Method 2: A variable declaration like basic data types

  ```
  struct Point
  
  {
  
  intx, y;
  
  };

  int main()
  
  {
  
  struct Point pl; /*The variable pl is declared like a normal variable*/
  
  }

""",
      },
    ],
    [
      {
        'text': """

# How to initialize structure members?

## Structure members cannot be initialized with declaration. For example the following C program fails in compilation.

```
struct Point

{

intx, y;

};

int main()

{

struct Point pl= {O, 1};

/* member x gets value O and y gets value 1. The order of declaration is followed.*/

}

""",
      },
    ],
    [
      {
        'text': """

# How to access structure elements?

## Structure members are accessed using dot(.) operator.

```
#include<stdio.h>

struct Point

{

intx, y;

};

int main()

{

struct Point pl= {0, 1};

/*Accessing members of point pl*/ pl.x = 20;

printf ("x = o/od, y = o/od", pl.x, pl.y);

return 0;

}


""",
      },
    ],
    [
      {
        'text': """

# Develop programs using structure

## Program to input and print structure data

```
#include <stdio.h> 

#include <string.h>

/* create struct with personl variable*/ 

struct Person {

char name[S0]; 

int citNo;

float salary;

} 

personl; 

void main() {

/* assign value to name of personl */ 

strcpy(personl.name, "George Orwell");

/* assign values to other personl variables */ 

personl.citNo = 1984;

personl. salary= 2500;

/* print struct variables */ 

printf("Name: o/os", personl.name );

printf("Citizenship No.: o/od", personl.citNo); 

printf("Salary: %.2f", person1.salary);

}


""",
      },
    ],
    [
      {
        'text': """

# Program to add two times using structure

```
#include <stdio.h> 

struct time{

int hour; 

int min;

};

int main()

{

struct time t1,t2,t3; 

printf("Enter First time:");

scanf("%d:%d",&tl.hour,&t1.min);  

printf("Enter second time:"); 

scanf("%d:%d",&t2.hour,&t2.min); 

t3.hour=t1.hour+t2.hour; 

t3.min=tl.min+t2.min; 

if(t3.min>59)

{

t3.hour++; 

t3.min=t3.min-60;

}

printf("%d:%d",t3.hour,t3.min);

}

""",
      },
    ],
    [
      {
        'text': """

# Program demonstrating nested structure

```
#include <stdio.h> 

struct complex { int imag;

float real;

};

struct number {

struct complex comp; 

int integer;

} 

numl;

void main() {

/* initialize complex variables */ 

numl.comp.imag = 11;

numl.comp.real = 5.25;

/* initialize number variable*/ 

numl.integer = 6;

/* print struct variables*/

printf("Imaginary Part: %d", numl.comp.imag); 

printf("Real Part: %.2f", numl.comp.real); 

printf("Integer: o/od", numl.integer);

}

""",
      },
    ],
    [
      {
        'text': """

# Array of structures

An array is a collection of data items of the same type. Each element of the array can be int, char, float, double, or even a structure. We have seen that a structure allows elements of different data types to be grouped together under a single name. This structure can then be thought of as a new data type in itself. So, an array can comprise elements of this new data type. An array of structures finds its applications in grouping the records together and provides for fast accessing. Below is the demonstration of an array of structures. The array holds the details of the students in a class. The details include the roll number, grade, and marks, which have been grouped under a structure (record). There exists one record for each student. This is how a collection of related variables can be assembled under a single entity for enhancing the clarity of code and increasing its efficiency.

## Program to print details of 5 students using array of structure

```
#include<stdio.h> 

#include <string.h> 

struct student{

int rollno;

char name[lO];

};

void main()

{ 

inti;

struct student st[S];

printf("Enter Records of 5 students"); 

for(i=O;i<S;i++)

{

printf("Enter Rollno:"); 

scanf("o/od",&st[i].rollno); 

printf("Enter Name:"); 

scanf("o/os",&st[i].name);

}

printf("Student Information List:"); 

for(i=O;i<S;i++)

{

printf("Rollno:o/od, Name:o/os",st[i].rollno,st[i].name);

}

}

""",
      },
    ],
    [
      {
        'text': """

#Passing structure as parameter to function

If you have a structure local to a function and you need to pass its values to another function, then it can be achieved in two ways :

*	by passing individual structure elements

*	by passing the entire structure

Both these ways can be achieved by call by value as well as call by reference method of passing variables

## Program demonstrating how a structure is passed to a function (by value)

```
#include<iostream.h> 

#include<conio.h>

struct distance

{

int feet; 

int inches;

};

void prnsum(distance 11, distance 12); /* function prototype */ 

void main()

{

clrscr();

distance length1, length2; /* two structures of type distance declared*/

/* Read values for lengthl */ 

cout<<"Enter length 1:";

cout<<"Feet: ";

cin>>lengthl.feet; 

cout<<"lnches: "; 

cin>>lengthl.inches;
 
/* Read values for length2 */ 

cout«"Enter length 2:"; 

cout<<"Feet: ";

cin> >length2.feet; 

cout<<"lnches: "; 

cin> >length2.inches;

prnsum(lengthl, length2);	/* print sum of lengthl and length2 */ 

getch();

}

void prnsum(distance 11, distance 12)

{

distance 13;

13.feet=l1.feet+12.feet+ (11.inches+12.inches)/12; /* 1 feet=l 2 inches */

13.inches= (11.inches+12.inches)%12; 

cout<<"Total Feet: "<<13.feet<<""; 

cout<<"Total Inches: "<<13.inches;

}

""",
      },
    ],
    [
      {
        'text': """

# Program demonstrating how a structure is passed to a function (by reference)

```
#include <stdio.h>

typedef struct complex /*define a new data type of structure */

{

float real; float imag;

}

void addNumbers(complex cl, complex c2, complex *result); 

void main()

{

complex cl, c2, result;

printf("For first number,");

printf("Enter real part: "); 
 
scanf("o/of', &cl.real); 
 
printf("Enter imaginary part: "); 
 
scanf("o/of', &cl.imag);

printf("For second number, ");
 
printf("Enter real part: ");
 
scanf("o/of', &c2.real);
  
printf("Enter imaginary part: ");
   
scanf("o/of', &c2.imag);

addNumbers(cl, c2, &result); 

printf("result.real = %.lf", 

result.real); 

printf("result.imag = %.lf", result.imag);

}

void addNumbers(complex cl, complex c2, complex *result)
 
{

result->real = cl.real + c2.real; result->imag = cl.imag + c2.imag;

}


               """,
      },
    ],
    [
      {
        'text': """


# Pointers to Structure
A structure pointer is defined as the pointer which points to the address of the memory block that stores a structure known as the structure pointer.

## C program to demonstrate structure pointer 

```
#include <stdio.h>

struct point {

int value;

};

int main()

{

struct points;

/* Initialization of the structure pointer */ 

struct point* ptr = &s;

}
```
# Accessing the Structure Member with the Help of Pointers

There are two ways to access the members of the structure with the help of a structure pointer:

1.	With the help of (*) asterisk or indirection operator and (.) dot operator.

2.	With the help of (->)Arrow operator.

## C Program to demonstrate Structure pointer - Method 1

```
#include <stdio.h>

#include <string.h>

struct Student {

int roll_no; 

char name[30];

char branch[40]; 

int batch;

};

int main()

{

struct Student sl;
 
struct Student* ptr = &sl;

sl.roll_no = 27;

strcpy(sl.name, "Kamlesh Joshi");

strcpy(sl.branch, "Computer Science And Engineering"); 

sl.batch = 2019;

printf("Roll Number: o/od", (*ptr).roll_no); 

printf("Name: o/os", (*ptr).name); 

printf("Branch: o/os", (*ptr).branch); 

printf("Batch: o/od", (*ptr).batch);

return O;

}
```
## C Program to demonstrate Structure pointer - Method 2  

```
#include <stdio.h>

#include <string.h>

/* Creating Structure Student*/ 

struct Student {

int roll_no; 

char name[30];

char branch[40]; 

int batch;

};

/* variable of structure with pointer defined */ 

struct Students, *ptr;

int main()

{

ptr = &s;

printf("Enter the Roll Number of Student"); 

scanf("o/od", &ptr->roll_no );

printf("Enter Name of Student"); 

scanf("o/os", &ptr->name); 

printf("Enter Branch of Student"); 

scanf("o/os", &ptr->branch); 

printf("Enter batch of Student"); 

scanf("o/od", &ptr->batch);

/* Displaying details of the student */ 

printf("Student details are: ");

printf("Roll No: o/od", ptr->roll_no); 

printf("Name: o/os", ptr->name); 

printf("Branch: o/os", ptr->branch); 

printf("Batch: o/od", ptr->batch);

return O;

}
 
               """,
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
