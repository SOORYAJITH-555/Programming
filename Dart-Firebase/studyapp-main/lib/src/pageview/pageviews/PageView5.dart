import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview5 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """

# Recursive Functions

\n\n\n## Definition
\n\n\n A function that calls itself is known as a recursive function. And, this technique is known as recursion.

The recursion continues until some condition is met to prevent it.
To prevent infinite recursion, if...else statement (or similar approach) can be used where one branch makes the recursive call, and other doesn't.

              """,
      },
    ],
    [
      {
        'text': """
# In the following example, recursion is used to find fibonacci series
```c
#include<stdio.h>
int fibonacci(int);
void main ()
{ int n,f;
printf("Enter the value of n?");
scanf("%d",&n);
f = fibonacci(n);
printf("%d",f);
}
int fibonacci (int n)
{
if (n==0)
{
return 0;
}
else if (n == 1)
{
return 1;
}
else
{
return fibonacci(n-1)+fibonacci(n-2);
}
}
```
### Output
Enter the value of n?12
144

"""
      }
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
