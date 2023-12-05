%option noyywrap
%{
#include "tp.tab.h"
int yyparse(void);
int yyerror(char *sp);
%}
%%
[0-9]+ {yylval.vale=atoi(yytext); return NBI;}
[0-9]+\.[0-9]+ {yylval.valf=atof(yytext); return NBF;}
"+" {return ADD;}
"-" {return SOUS;}
"cos" {return COS;}
"sin" {return SIN;}
"tan" {return TAN;}
"*" {return MULT;}
"/" {return DIV;}
"(" {return PO;}
")" {return PV;}
"%" {return MOD;}
"pow" {return POW;}
"sqrt" {return SQRT;}
"log" {return LOG;}
"," {return COMM;}
[ \t] ;
"\n" {return NL;}
. {yyerror("Unkonwn Char !!!");}

%%
int main(){
yyparse();
}
int yyerror(char *sp){
printf("%s", sp);
return 1;
}
