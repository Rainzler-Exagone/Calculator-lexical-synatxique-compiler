# Calculator-lexical-synatxique-compiler
you should have both Bison and Flex installed on your machine to execute those files
//to execute the files in the shell run the following commands :
$ cd <file-path>
$ Flex tp.l
$ bison -d tp.y
$ gcc tp.tab.c lex.yy.c -o tp.exe
$ ./tp.exe
