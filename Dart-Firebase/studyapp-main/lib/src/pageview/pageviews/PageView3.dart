import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview3 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """

# Declarations

\n\n\nIn C programming, a function declaration tells the compiler about the number of parameters a function takes, the data types of those parameters, and the return type of the function. It's a way of informing the compiler about the existence and signature of a function before it is actually used in the program.

## Syntax of Function Declaration:
\n\n\nThe general syntax for declaring a function in C is:

* `return_type function_name(parameter1_type parameter1, parameter2_type parameter2, ...);`


\n\n\nHere's a breakdown of each part:

* 'return_type': This is the data type of the value that the function returns. If the function does not return any value, the return type is 'void'.

* 'function_name': This is the name of the function, which you use to call the function in your code.

* 'parameter1_type', 'parameter2_type', ...: These are the data types of the parameters that the function takes. If the function does not take any parameters, the parentheses '()' are left empty.

* 'parameter1', 'parameter2', ...: These are the names of the parameters that the function takes. They are optional in the function declaration, but if included, they should match the names used in the function definition.

Examples:
\n\n\nHere are a few examples of function declarations:

1) Function with no parameters and no return value ('void'):

* `void sayHello(void);`

Example:

* `void sayHello(void) {`
   
    `printf("Hello, World!");`
   
   `}`

2) Function with parameters and no return value:

* `void printDetails(int id, char name[]);`

Example:

* `int addNumbers(int a, int b) {`
    
    `int sum = a + b;`
    
    `return sum;`

    `}`

3) Function with parameters and a return value:

* `int addNumbers(int a, int b);`

Example:

* `int addNumbers(int a, int b) {`
   
    `int sum = a + b;`
   
   `return sum;`

    `}`


# Using Function Declarations:
\n\n\nYou typically place function declarations at the beginning of your C program, before the main() function. This allows the compiler to know about the functions before they are called in main() or elsewhere in the program.

\n\n\nHere's an example of a complete C program using the above function declarations:

* `#include <stdio.h>`

    // Function declarations

    `void sayHello(void);`

    `void printDetails(int id, char name[]);`

    `int addNumbers(int a, int b);`

    `int main() {`

    `sayHello();`

    `printDetails(101, "Alice");`

    `int result = addNumbers(10, 20);`

    `printf("Sum: %d", result);`

    `return 0;`
 
   `}`

  // Function definitions

   `void sayHello(void) {`

    `printf("Hello, World!");`

   `}`

    `void printDetails(int id, char name[]) {`

    `printf("ID: %d", id);`

    `printf("Name: %s", name);`

   `}`

    `int addNumbers(int a, int b) {`

    `int sum = a + b;`

    `return sum;`
    
    `}`
    
    `}`


\n\n\nIn this example, the functions 'sayHello()', 'printDetails()', and 'addNumbers()' are declared at the top of the program before 'main()'. This allows 'main()' to call these functions without any issues.

\n\n\nFunction declarations are essential in C programming for modularity and code organization. They enable you to write code in a more readable and maintainable manner by separating the function interface (declaration) from its implementation (definition).
               """,
      },
    ],
    [
      {
        'text': """
# Prototype
\n\n\nIn C programming, a function prototype is a declaration of a function that tells the compiler about the function's name, return type, and the types of its parameters. It provides enough information to the compiler about the existence and signature of a function before its actual definition in the program.

## Syntax of Function Prototype:
\n\n\nThe general syntax for a function prototype in C is:

* return_type function_name(parameter1_type parameter1, parameter2_type parameter2, ...);

Here's a breakdown of each part:

* 'return_type': This is the data type of the value that the function returns. If the function does not return any value, the return type is void.

* 'function_name': This is the name of the function, which you use to call the function in your code.

* 'parameter1_type', 'parameter2_type', ...: These are the data types of the parameters that the function takes. If the function does not take any parameters, the parentheses () are left empty.

* 'parameter1', 'parameter2', ...: These are the names of the parameters that the function takes. They are optional in the function prototype, but if included, they should match the names used in the function definition.

Examples:
Here are a few examples of function prototypes:

1) Function with no parameters and no return value ('void'):

* void sayHello(void);

2) Function with parameters and no return value:

* void printDetails(int id, char name[]);
  
3) Function with parameters and a return value:

* int addNumbers(int a, int b);

## Using Function Prototypes:
\n\n\nYou typically place function prototypes at the beginning of your C program, before the 'main()' function. This allows the compiler to know about the functions before they are called in 'main()' or elsewhere in the program.

Here's an example of a complete C program using the above function prototypes:

* `#include <stdio.h>`

   // Function prototypes
  
   ```void sayHello(void);
 
   void printDetails(int id, char name[]);
  
   int addNumbers(int a, int b);

   int main() {
  
    sayHello();

    printDetails(101, "Alice");

    int result = addNumbers(10, 20);
  
    printf("Sum: %d\n", result);

    return 0;
  
   }

   // Function definitions
   
   void sayHello(void) {
  
    printf("Hello, World!\n");
    
    }

    
    void printDetails(int id, char name[]) {
    
    printf("ID: %d\n", id);
    
    printf("Name: %s\n", name);
    
    }

    
    int addNumbers(int a, int b) {
    
    int sum = a + b;
    
    return sum;
    
    }

\n\n\nIn this example, the function prototypes 'sayHello()', 'printDetails()', and 'addNumbers()' are declared at the top of the program before 'main()'. This allows 'main()' to call these functions without any issues.

\n\n\nFunction prototypes are essential in C programming for modularity and code organization. They enable you to separate the declaration (prototype) of a function from its definition, making your code more readable and easier to maintain. When you have multiple functions in a program, using prototypes helps the compiler to properly link the function calls with their definitions.

               """,
      },
    ],
    [
      {
        'text': """

# Definition

\n\n\nIn C programming, a function definition provides the actual implementation of the function. It contains the code that is executed when the function is called. When you define a function, you are writing the actual instructions that the function will perform.

## Syntax of Function Definition:
The general syntax for a function definition in C is:

* ```
  return_type function_name(parameter1_type parameter1, parameter2_type parameter2, ...) {
    
    // Function body with code to be executed
    
    // Return statement if the function has a return type
   
   }

Here's a breakdown of each part:

* 'return_type': This is the data type of the value that the function returns. If the function does not return any value, the return type is void.

* 'function_name': This is the name of the function, which you use to call the function in your code.

* 'parameter1_type', 'parameter2_type', ...: These are the data types of the parameters that the function takes. If the function does not take any parameters, the parentheses '()' are left empty.

* 'parameter1', 'parameter2', ...: These are the names of the parameters that the function takes. They are optional in the function definition, but if included, they should match the names used in the function prototype.

Examples:
Here are a few examples of function definitions corresponding to the function prototypes mentioned earlier:

1) Function with no parameters and no return value ('void'):

* ```
  void sayHello(void) {
   
  printf("Hello, World!");
   
   }

2) Function with parameters and no return value:
  
* ```
  void printDetails(int id, char name[]) {
   
    printf("ID: %d", id);
   
    printf("Name: %s", name);

    }

3) Function with parameters and a return value:

* `int addNumbers(int a, int b) `
    
    ```
    {
    
    int sum = a + b;
    
    return sum;
    
    }

## Using Function Definitions:
You typically place function definitions after the 'main()' function or at any point in your C program where you want to implement the functionality of the functions.

Here's an example of a complete C program using the function definitions:

* `#include <stdio.h>`

  // Function prototypes
  
  ```
  void sayHello(void);
 
  void printDetails(int id, char name[]);

  int addNumbers(int a, int b);

  int main() {
  
    sayHello();

    printDetails(101, "Alice");

    int result = addNumbers(10, 20);
  
    printf("Sum: %d\n", result);

    return 0;
   
   }

   
   // Function definitions
   
   void sayHello(void) {
   
    printf("Hello, World!\n");
   
   }

   
   void printDetails(int id, char name[]) {
   
    printf("ID: %d\n", id);
   
    printf("Name: %s\n", name);
    
    }

    
    int addNumbers(int a, int b) {
    
    int sum = a + b;
    
    return sum;
    
    }


\n\n\nIn this example, the functions 'sayHello()', 'printDetails()', and 'addNumbers()' are defined after the 'main()' function. The function definitions contain the actual code that is executed when these functions are called.

\n\n\nFunction definitions are the heart of your C program, as they contain the logic and operations that your program performs. When you call a function in your program, the function definition is executed, and the result is returned to the caller (if applicable).
          """,
      },
    ],
    [
      {
        'text': """

# Function call

\n\n\nIn C programming, a function call is the process of invoking a function to execute its code. When you call a function, you are instructing the program to jump to the function's definition, execute the code inside it, and then return back to the point in the program where the function was called.

## Syntax of Function Call:
The general syntax for calling a function in C is:

* function_name(argument1, argument2, ...);

Here's a breakdown of each part:

* 'function_name': This is the name of the function that you want to call.

* 'argument1', 'argument2', ...: These are the values (or expressions) that you pass to the function as arguments. The number and types of arguments must match the function's parameters.

Examples:
Let's use the function definitions from the previous examples and demonstrate how to call these functions:

1) Calling a function with no parameters and no return value ('void'):

* ```
  #include <stdio.h>

  // Function prototype
  
  void sayHello(void);

  int main() {
  
    // Calling the function
  
    sayHello();

    return 0;
   
   }

   
   // Function definition

   void sayHello(void) {
   
    printf("Hello, World!\n");
    
    }

In this example, 'sayHello()' is called from within the 'main()' function. When the program runs, it will print "Hello, World!" to the console.

2) Calling a function with parameters and no return value:

* ```
  #include <stdio.h>

  // Function prototype
  
  void printDetails(int id, char name[]);

   int main() {
   
    // Calling the function with arguments
   
    printDetails(101, "Alice");

    return 0;
    
    }

    
    // Function definition
    
    void printDetails(int id, char name[]) {
    
    printf("ID: %d\n", id);
    
    printf("Name: %s\n", name);
    
    }


Here, 'printDetails()' is called with two arguments: '101' for the 'id' and "Alice" for the name. When the program runs, it will print:

* ```
  ID: 101
  
  Name: Alice

3) Calling a function with parameters and a return value:

* ```
  #include <stdio.h>

  
   // Function prototype

   int addNumbers(int a, int b);

  
  int main() {
   
     int result;

    // Calling the function with arguments and storing the result
   
    result = addNumbers(10, 20);

    // Printing the result
   
    printf("Sum: %d", result);

    return 0;
    
    }

    // Function definition
    
    int addNumbers(int a, int b) {
    
    int sum = a + b;
    
    return sum;
    
    }


\n\n\nIn this example, 'addNumbers()' is called with arguments '10' and '20'. It returns the sum of these two numbers, which is then stored in the variable 'result'. The program then prints:

* `Sum: 30`

## Notes on Function Calls:
* When you call a function, the arguments you pass must match the parameters of the function in terms of number, order, and data type.

* If a function returns a value, you can directly use the function call within an expression or assign its return value to a variable.

* The program execution jumps to the function definition when the function is called, and it returns to the point where it was called after the function has finished executing.

\n\n\nFunction calls are fundamental to C programming as they allow you to organize your code into reusable modules. By defining functions with specific tasks, you can call those functions whenever needed to perform those tasks without having to rewrite the code each time.
            """,
      },
    ],
    [
      {
        'text': """

# Storage Class

In C programming, a storage class defines the scope (visibility) and lifetime of variables within a program. There are several storage classes in C, each with its own set of rules governing how variables declared with that storage class behave. The main storage classes in C are:

1) ## auto:

* The `auto` storage class is the default storage class for local variables within a function.
* Variables declared with `auto` are automatically initialized with garbage values.
* They have a local scope, meaning they can only be accessed within the block of code where they are defined.
* They are destroyed when the block in which they are defined exits.

Example:

* ```
  void function() {
   
    auto int x = 10;
   
    printf("Auto variable x: %d", x);
    
    }


2) ## register:

* The `register` storage class is used to define local variables that should be stored in CPU registers for faster access.
* It is a request to the compiler to store the variable in a CPU register if possible.
* The compiler may ignore the request if it cannot fulfill it.
* Variables declared as `register` cannot have their address taken (you cannot use the `&` operator on them).

Example:

* ```
   void function() {
    
    register int count = 0;
    
    printf("Register variable count: %d", count);
    
    }

3) ## static:

* The `static` storage class is used to declare variables that persist throughout the program's execution.
* Static variables retain their values between function calls.
* They are initialized only once, and their value persists until the end of the program.
* They have a local scope within the function where they are defined, but they are not destroyed when the function exits.

 Example:

* ```
  void function() {
    
    static int num = 0;
    
    num++;
    
    printf("Static variable num: %d\n", num);
    
    }


4) ## extern:

* The `extern` storage class is used to declare variables that are defined elsewhere in the program, usually in another source file.
* It is used when you want to use a global variable that is defined in another file.
* When you declare a variable as `extern`, you are telling the compiler that the variable is defined somewhere else in the program.
* Using extern with a global variable:

Assume extern int globalVar; is declared in another file.
 
  Example:

* ```
  extern int globalVar;

  void function() {
  
    printf("Global variable globalVar: %d", globalVar);
   
   }


\n\n\nStorage classes are important in C programming as they allow you to control the visibility, scope, and lifetime of variables, which helps in managing memory efficiently and organizing your code effectively. The choice of storage class depends on the requirements of your program and the behavior you want for your variables.
             """,
      },
    ],
    [
      {
        'text': """
# Lifetime Of Variables

Storage classes specify the scope, lifetime and binding of variables.

The lifetime of a variable defines the duration for which the computer allocates memory for it (the duration between allocation and deallocation of memory).

In C language, a variable can have automatic, static or dynamic lifetime.

* Automatic -  A variable with automatic lifetime are created. Every time, their declaration is encountered and destroyed. Also, their blocks are exited.
* Static - A variable is created when the declaration is executed for the first time. It is destroyed when the execution stops/terminates.
* Dynamic - The variables memory is allocated and de-allocated through memory management functions.

1) Storage Class	       : Automatic
  
   Storage Area	         : Memory
  
   Default initial value :Till control 
                        remains in block
  
   Lifetime	             :Till control
                        remains in block
  
   Scope	               : Local
  
   Keyword               : Auto

2) Storage Class	       :Register
 
   Storage Area	         :CPU register

 
   Default initial value :Garbage value
 
   Lifetime	             :Till control remains in block
 
   Scope	               :Local
 
   Keyword               :Register

3) Storage Class	       :Static
 
   Storage Area	         :Memory
 
   Default initial value :Zero
 
   Lifetime	             :Value in between function calls
 
   Scope	               :Local
 
   Keyword               :Static

4) Storage Class	       :External
 
   Storage Area	         :Memory
 
   Default initial value :Garbage value
 
   Lifetime	             :Throughout program execution
 
   Scope	               :Global
 
   Keyword               :Extern

              """,
      },
    ],
    [
      {
        'text': """
# Visibility Of Variables




* Visibility of a variable is defined as if a variable is accessible or not inside a particular region of code or the whole program.
* Scope of a variable is defined as the availability of a variable inside a program, scope is basically the region of code in which a variable is available to use.
              """
      }
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
