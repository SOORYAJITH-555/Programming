import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview2 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """
# C Program Structure

1) In C programming, the structure is a user-defined data type that allows you to combine different data types under a single name. It is particularly useful when you want to group related data together. The basic syntax to define a structure in C is as follows:
 
 * ```
   struct structure_name {
  
   // Member variables or fields 

   data_type1 member1;

   data_type2 member2;
   
   // ...
   
   data_typen membern;
   
   };`

2) Here's a breakdown of each part:

* `struct`: This keyword is used to define a structure in C.
* `structure_name`: This is the name you give to the structure. It's good practice to use a meaningful name that describes the kind of data the structure represents.

   Within the curly braces `{ }`, you define the members of the structure. Each member has a data type and a name. For example, you could define a 'Person' structure with members for 'name', 'age', and 'salary':

*  ```c
  struct Person {
   
    char name[50];
   
    int age;
    
    float salary;
   
    };

3) Here, 'Person' is the name of the structure, and it has three members: 'name', 'age', and 'salary'. 'name' is an array of characters (a string), 'age' is an integer, and 'salary' is a floating-point number.
\n\n\nOnce you've defined a structure, you can declare variables of that structure type in your program. Here's how you can create variables of the 'Person' structure: 

* `struct Person person1,person2;`

4) You can then access the members of a structure variable using the dot `.` operator:

* ```
  strcpy(person1.name, "John");

  person1.age = 30;

  person1.salary = 50000.0;

5) Here, we are assigning values to the members of 'person1'. You can do the same for 'person2'.
\n\n\nStructures are often used to organize related pieces of data together. They can also be nested within other structures to create more complex data structures.
\n\n\nHere's a simple example that demonstrates the use of a structure:

* ```
  #include <stdio.h>

  #include <string.h>

  struct Person {
    
    char name[50];
    
    int age;
    
    float salary;
  
  };


  int main() {
   
    struct Person person1;

    // Assign values to members of person1 
   
    strcpy(person1.name, "Alice");
   
    person1.age = 25;
   
    person1.salary = 60000.0;

    // Print information 
   
    printf("Name: %s", person1.name);
   
    printf("Age: %d", person1.age);
   
    printf("Salary: %.2f", person1.salary);

   
    return 0;
   
  }

6) When you compile and run this program, it will output:

* ```
  Name: Alice
  
  Age: 25
  
  Salary: 60000.00




\n\n\nThis is a basic overview of C program structure. Structures are fundamental in C programming, especially for organizing and manipulating complex data.

              """,
      },
    ],
    [
      {
        'text': """
# Selection Structure

\n\n\nIn C programming, selection structures allow you to control the flow of your program based on certain conditions. The two main types of selection structures are the `if-else` statement and the `switch` statement.

1) ## if-else Statement

\n\n\nThe if-else statement allows you to execute a block of code if a specified condition is true, and another block of code if the condition is false.

Syntax:

* ```
 if (condition) {
   
    // Code to be executed if the condition is true
  
  } else {
 
    // Code to be executed if the condition is false

  }


 For Example:

 * ```
   #include <stdio.h>

   int main() {
   
    int number = 10;

    if (number > 0) {
   
        printf("Number is positive");
    
    } else {
   
        printf("Number is not positive");
   
    }

    return 0;
    
    }

\n\n\nIn this example, if 'number' is greater than '0', it will print "Number is positive". Otherwise, it will print "Number is not positive".
\n\n\nYou can also have multiple 'if-else' statements to check different conditions:

*  ```
   #include <stdio.h>

    int main() {
    
    int number = 10;

    if (number > 0) {
    
        printf("Number is positive");
    
    } else if (number < 0) {
    
        printf("Number is negative");
    
    } else {
    
        printf("Number is zero");
    
    }

    return 0;
    
    }


2) ## switch Statement

\n\n\nThe switch statement allows you to select one of many blocks of code to be executed.

Syntax:

* ```
  switch (expression) {
   
    case constant1:
   
        // Code to be executed if expression == constant1
   
        break;
   
    case constant2:
   
        // Code to be executed if expression == constant2
   
        break;
   
    // Add more cases as needed
   
    default:
   
        // Code to be executed if expression doesn't match any case

    }


  For Example:

* ```
  #include <stdio.h>

  int main() {
  
    int choice = 2;

    switch (choice) {
  
        case 1:
  
            printf("You chose option 1");
  
            break;
  
        case 2:
  
            printf("You chose option 2");
  
            break;
  
        case 3:
  
            printf("You chose option 3");
  
            break;
  
        default:
  
            printf("Invalid choice");
  
    }

    return 0;
    
    }

\n\n\nIn this example, if 'choice' is '2', it will print "You chose option 2". The 'break' statement is used to exit the 'switch' block after executing the corresponding case. The 'default' case is optional and will be executed if none of the 'case' constants match the 'expression'.
\n\n\nSelection structures are essential for writing programs that make decisions based on different conditions. They allow your program to execute specific code blocks based on the values of variables or expressions, making your programs more flexible and capable of handling various situations.
         """,
      },
    ],
    [
      {
        'text': """
# Repetition Structures

\n\n\nIn C programming, repetition structures (also known as loops) allow you to execute a block of code multiple times. There are three main types of loops in C: `for` loop, `while` loop, and `do-while` loop.

1) ## for Loop
\n\n\nThe for loop is used when you know the number of times you want to execute a block of code.

Syntax:

* ```
  for (initialization; condition; update) {
   
    // Code to be executed repeatedly
    
  }

* `initialization`: This part is executed once at the beginning of the loop. It is used to initialize the loop control variable.
* `condition`: This is the condition that is checked before each iteration of the loop. If it evaluates to true, the loop continues; if false, the loop terminates.
* `update`: This part is executed after each iteration of the loop. It is typically used to update the loop control variable.

Example:

* ```
   #include <stdio.h>

  int main() {
  
    int i;

    for (i = 1; i <= 5; i++) {
  
        printf("%d", i);
  
    }

    return 0;
    }

\n\n\nThis `for` loop will print numbers from 1 to 5.

2) ## while Loop
\n\n\nThe while loop is used when you do not know the number of times you want to execute a block of code, but you know the condition under which the loop should continue.

Syntax:

* ```
  while (condition) {
   
    // Code to be executed repeatedly
  
  }

Example:

* ```
 #include <stdio.h>

  int main() {
  
    int i = 1;

    while (i <= 5) {
  
        printf("%d", i);
  
        i++;
  
    }

    return 0;
    
    }

\n\n\nThis `while` loop will also print numbers from 1 to 5.

3) ## do-while Loop
\n\n\nThe `do-while` loop is similar to the `while` loop, but the condition is checked after the block of code is executed, so the block of code will always execute at least once.

Syntax:

* ```
  do {
   
    // Code to be executed repeatedly

  } while (condition);

 Example:

* ```
  #include <stdio.h>

  int main() {
  
    int i = 1;

    do {
  
        printf("%d\n", i);
  
        i++;
  
    } while (i <= 5);

    return 0;
    
    }

\n\n\nThis `do-while` loop will also print numbers from 1 to 5.


# Loop Control Statements
\n\n\nWithin loops, you can use 'break' to exit the loop prematurely and 'continue' to skip the rest of the loop and 'continue' with the next iteration.

\n\n\n'break': It terminates the loop and transfers control to the statement immediately following the loop.
\n\n\n'continue': It skips the rest of the code inside the loop for the current iteration and goes to the next iteration.
\n\n\nHere is an example of using 'break' and 'continue':

* ```
  #include <stdio.h>

  int main() {
  
    int i;

    for (i = 1; i <= 10; i++) {
  
        if (i == 5) {
  
            continue;  // Skip printing 5
        }
  
        if (i == 8) {
  
            break;  // Terminate the loop at 8
  
        }
  
        printf("%d", i);
    }

    return 0;

    }

\n\n\nThis `for` loop will print numbers from 1 to 4, then skip printing 5, and finally terminate at 8.
\n\n\nThese repetition structures provide the necessary tools to execute code repeatedly in C programming, allowing you to perform tasks efficiently and handle scenarios where multiple iterations are required.
               """
      }
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
