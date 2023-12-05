%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex();
int yyerror(const char *s);
%}
%union{
int vale;
float valf;
}
%token<vale> NBI
%token<valf> NBF
%token NL 
%token ADD
%token SOUS
%token MULT
%token DIV
%token MOD
%token POW
%token LOG
%token SQRT
%token COS
%token SIN
%token TAN
%token COMM
%token PO
%token PV
%left ADD SOUS DIV MOD COMM
%right MULT POW SQRT COS SIN TAN LOG 
%type<vale> expressionE
%type<valf> expressionF
%start calcul
%%
calcul : 
       |calcul exp
       ;
exp : NL
    |expressionE NL {printf("Result %i \n ",$1);}
    |expressionF NL {printf("Result %f \n ",$1);}
    ;
expressionE : NBI {$$=$1;}
           | expressionE ADD expressionE {$$=$1+$3;}
	   | expressionE SOUS expressionE {$$=$1-$3;}
           | expressionE MULT expressionE {$$=$1*$3;}
	   | expressionE DIV  expressionE {if($3==0){
				printf("impossible operation");exit(1);}else{$$=$1/$3;}}
           | expressionE POW  expressionE {$$=pow($1,$3);}
	   | ADD expressionE COMM expressionE {$$=$2+$4;}
	   | MULT  expressionE COMM expressionE {$$=$2*$4;}
	   | PO expressionE PV {$$=$2;}
           ;
expressionF : NBF {$$=$1;}
            | expressionF ADD expressionF {$$=$1+$3;}
            | expressionE ADD expressionF {$$=$1+$3;}
            | expressionF ADD expressionE {$$=$1+$3;}
	    | expressionF SOUS expressionF {$$=$1-$3;}
	    | expressionF SOUS expressionE {$$=$1-$3;} 
	    | expressionE SOUS expressionF {$$=$1-$3;}
            | expressionF MULT expressionF {$$=$1*$3;}
	    | expressionF MULT expressionE {$$=$1*$3;}
	    | expressionE MULT expressionF {$$=$1*$3;}
	    | COS expressionE {$$=cos($2);}
	    | COS expressionF {$$=cos($2);}
	    | SIN expressionE {$$=sin($2);}
	    | SIN expressionF {$$=sin($2);}
	    | TAN expressionE {$$=tan($2);}
	    | TAN expressionF {$$=tan($2);}
	    | LOG expressionE {$$=log($2);}
	    | expressionF DIV  expressionE {$$=$1/$3;}
            | expressionE DIV  expressionF {$$=$1/$3;}
	    | expressionF DIV  expressionF {$$=$1/$3;}
	    | SQRT expressionE {$$=sqrt($2);}
	    | SQRT expressionF {$$=sqrt($2);}
            ; 
%%
