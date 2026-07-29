import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview7 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """
# Representation of Strings
  String in C programming is a sequence of characters terminated with a null character '\O'. Strings are defined as an array of characters. The difference between a character array and a string is the string is terminated with a unique character '\ O'.

  Initializing a String
  A string can be initialized in different ways. We will explain this with the help of an example. Below are the examples to declare a string with the name str and initialize it with "Computer".
  
  |  c  |  s  |  t  |  r  |  i  |  n  |  g  |  \0  |

""",
      },
    ],
    [
      {
        'text': """

# Ways to Initialize a String in C

1) Assigning a string literal without size: String literals can be assigned without size. Here, the name of the string str acts as a pointer because it is an array.

    `char str[] = "Computer";`

2) Assigning a string literal with a predefined size: String literals can be assigned with a predefined size. But we should always account for one extra space which will be assigned to the null character. If we want to store a string of size n then we should always declare a string with a size equal to or greater than n+1.

    `char str[SO] = " Computer";`

3) Assigning character by character with size: We can also assign a string character by character. But we should remember to set the end character as '\O' which is a null character.
   
    `char st r[9] = { 'C", o", m", p", u",t" , e", r',,'\O'};`

4) Assigning character by character without size: We can assign character by character without size with the NULL character at the end. The size of the string is determined by the compiler automatically.

 ```
    char str[] = { 'C',,,o,
    
    , ,m,
    
    , pI ,I u, ,'t',,eI,, rI ,,'\O'};

""",
      },
    ],
    [
      {
        'text': """

# String Programs
    Copy string into another

    ```
    #include <stdio.h> int main() {
    
    char s1[100], s2[100], i; printf("Enter string sl: "); gets(sl); /*inpit a string*/
    
    for (i = 0; sl[i] != '\0'; ++i)
    
    {
    
    s2[i] = sl[i];
    
    }

    s2[i] = '\0';
    
    printf("String s2: o/os", s2); return 0;
    
    }
    
    /* Count the number of vowels in a string using C */
    
    #include <stdio.h> #include <math.h> #include <string.h> void main()
    
    {
    
    unsigned short count= 0, vowels = 0; char str[l00], c;
    
    printf("Enter a string in which you want to find number of vowels:"); gets( str);
    
    while(str[count] != '\0')
    
    {
    
    c = str[count];
    

    
    if(c == 'a'   c == 'o' vowels++;

    }
    
    count++;
    
    c == 'A'
    
    c == 'O'
    
    c == 'e'
    
    c == 'u'
    
    c == 'E'   c == 'i'   c == 'I' c == 'U') {
    
    }
    
    printf(" ");
    
    printf("NUMBER OF VOWELS In Given string Are: o/ohu ", vowels);
    
    }
    
    /* String palindrome check */
    
    #include <stdio.h> #include <string.h> int main(){
    
    char str[l000]; int l,n,comp=0;

    printf("Enter the string to check: "); gets(str);
    
    n=strlen(str); for(l=0;l<n/2;1++)
    
    {
    
    if(str[l]==str[n-1-1]) comp++;
    
    }
    
    if(comp==l)
    
    printf("The entered string is a palindrome"); else
    
    printf("The entered string is not a palindrome"); return 0;
    
    }
    
    /* Reverse a String */

    #include <stdio.h> #include <conio.h> #include <string.h> void main()

    {

    char string[20],temp; int i,length; printf("Enter String: "); scanf("%s",string); length=strlen(string)-1;

    fori=0;i<strlen(string)/2;i++)

    {

    temp=string[i];  string[i] =string[length]; string[length--]=temp;

    }

    printf("Reverse string :%s",string); getch();

    }
    
"""
      }
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return CourseScreen(courseContent: courseContent);
  }
}
