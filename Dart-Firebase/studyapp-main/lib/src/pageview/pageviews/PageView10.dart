import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/CourseScreen.dart';

class Pageview10 extends StatelessWidget {
  // Define your page content here
  static const List<List<Map<String, dynamic>>> courseContent = [
    [
      {
        'text': """


# File as Data storage: input and output to programs

So far the operations using C program are done on a prompt/ terminal which is not stored anywhere. But in the software industry, most of the programs are written to store the information fetched from the program. One such way is to store the fetched information in a file. Different operations that can be performed on a file are:
Creation of a new file (fopen with attributes as "a" or "a+" or "w" or w+")

1.	Opening an existing file (fopen)

2.	Reading from file (fscanf, fgets, tread, fgetc)

3.	Writing to a file (fprintf, fputs, fwrite, fputc)

4.	Moving to a specific location in a file (fseek, rewind)

5.	Closing a file (fclose)


               """,
      },
    ],
    [
      {
        'text': """

# Opening or creating file

For opening a file, fopen function is used with the required access modes. Some of the commonly used file access modes are mentioned below.

File opening modes in C:

•		"r" - Searches file. If the file is opened successfully fopen( ) loads it into memory and sets up a pointer which points to the first character in it. If the file cannot be opened fopen() returns NULL.

•		"rb" - Open for reading in binary mode. If the file does not exist, fopen( ) returns NULL.

•		"w" - Searches file. If the file exists, its contents are overwritten. If the file doesn't exist, a new file is created. Returns NULL, if unable to open file.

•		"wb" - Open for writing in binary mode. If the file exists, its contents are overwritten. If the file does not exist, it will be created.

•		"a" - Searches file. If the file is opened successfully fopen( ) loads it into memory and sets up a pointer that points to the last character in it. If the file doesn't exist, a new file is created. Returns NULL, if unable to open file.

•	"ab" - Open for append in binary mode. Data is added to the end of the file. If the file does not exist, it will be created.

•		"r+" - Searches file. If is opened successfully fopen() loads it into memory and sets up a pointer which points to the first character in it. Returns NULL, if unable to open the file.

•		"rb+" - Open for both reading and writing in binary mode. If the file does not exist, fopen() returns NULL.

•	"w+" - Searches file. If the file exists, its contents are overwritten. If the file doesn't exist a new file is created. Returns NULL, if unable to open file.

•		"wb+" - Open for both reading and writing in binary mode. If the file exists, its contents are overwritten. If the file does not exist, it will be created.
 
•		"a+" - Searches file. If the file is opened successfully fopen( ) loads it into memory and sets up a pointer which points to the last character in it. If the file doesn't exist, a new file is created. Returns NULL, if unable to open file.

•		"ab+" - Open for both reading and appending in binary mode. If the file does not exist, it will be created.

As given above, if you want to perform operations on a binary file, then you have to append 'b' at the last. For example, instead of "w", you have to use "wb", instead of "a+" you have to use "a+b".


## File operations

For performing the operations on the file, a special pointer called File pointer is used. File pointer is declared as

FILE *fp;
               """,
      },
    ],
    [
      {
        'text': """


# Open a file

fopen() is used to open a file for various operations such as read, write,... This function gives a memory address to primary memory in which data to the file are stored temporarily.

Syntax:

`fopen("filename.extention", "mode of opening");`

If there is any error while opening the file, file pointer gets NULL value.

Example to open a file for writing:

```
fp = fopen("sample.txt", "w") 

if (fp==NULL)
{ printf("File opening error"); 

Exit(O);

}

               """,
      },
    ],
    [
      {
        'text': """

# Writing to a file

Data into the file buffer (primary memory area pointer by file pointer) can be written by using various functions.

1.	fputc(character,fp) -> to write a single character to file

2.	fputs(string,fp)	-> to write a string into file

3.	fprintf(fp,"control string", data list) -> write formatted data to file

               """,
      },
    ],
    [
      {
        'text': """


# Reading from a file

The file read operations can be performed using various functions. Data read from file is stored into file buffer pointed by file pointer.

1.	ch==fgetc(fp) -> to read a single character from file and store to ch
 
2.		fgets(string,size,fp) -> to read a string of given size from a file and store into string.

3.	fscanf(fp,"control string", variable list) -> read formatted data from file and store into the variable list.

## Eg:
```
FILE* fp;

fp = fopen("fileName.txt", "r");

fscanf(fp, "o/os o/os o/os o/od", strl, str2, str3, &year);
```
## Closing a file -

After every successful file operations, you must always close a file. For closing a file, you have to use fclose function.

Syntax :

`fclose (fp);`

Eg:

```
FILE *fp;

fp= fopen("fileName.txt", "w");

---------- Some file Operations	­

fclose(fp);

## End of File
When reading a file, end of file status is to obtained to stop reading process in the file. It can be done by feof() and EOF constant.

feof(} returns non-zero value only if end of file has reached, otherwise it returns 0.

fgetc() returns EOF when end of file is reached.

```
Example:

```
if (feof(fp))
printf("End of file reached."); else
printf("Something went wrong.");

               """,
      },
    ],
    [
      {
        'text': """



# C program to Write a File using fputs()

```
# include <stdio.h>

# include <string.h>

void main()

{

FILE *fp;

/* Get the data to be written in file*/
 
char datatofile[S0] = "GPTC Perumbavoor";

/* Open the existing file GfgTest.c using fopen() in write mode using "w" attribute */

fp = fopen("Mytest.c", "w") ;

/*Check if this filePointer is null

which maybe if the file does not exist */ if ( fp == NULL)

{
  
}

else

{

}
 
printf( "Mytest.c file failed to open." ) ;

printf("The file is now opened.") ;

/* Write the dataToBeWritten into the file */

/* writing in the file using fputs()*/

fputs(datatofile, fp) ;

fputs("", fp) ;

/* Closing the file using fclose()*/ 

fclose(fp);

printf("Data successfully written in file Mytest.c"); 

printf("The file is now closed.") ;
 
}
               """,
      },
    ],
    [
      {
        'text': """


# C program to Copy a file into another using fgetc()

```
#include <stdio.h> 

#include <stdlib.h>

void main()

{

FILE *fptrl, *fptr2; 

char c;

/ / Open one file for reading fptrl = fopen("Test.C", "r"); if(fptrl == NULL)

{

printf("Cannot open file "); 

exit(0);

}

/ / Open another file for writing fptr2 = fopen("Testcopy.C" "w"); 

if(fptr2 == NULL)

{

printf("Cannot open file "); 

exit(0);

}


/ / Read contents from file c = fgetc(fptrl);

while (c != EOF)

{

fputc(c, fptr2); c = fgetc(fptrl );

}

printf("File Copy success"); 

fclose(fptrl );

fclose(fptr2);

}


               """,
      },
    ],
    [
      {
        'text': """

# C Program to write a file using fprintf()

```
#include<stdio.h> void main()

{

inti, n=2; char str[SO];

/* open file sample.bet in write mode */ FILE *fptr = fopen("sample.txt", "w"); 

if (fptr == NULL)

{

printf("Could not open file"); 

return O;

}

for (i = O; i < n; i++)

{

puts("Enter a name"); gets(str); 

fprintf(fptr,"%d%s", i, str);

}

fclose(fptr);

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
