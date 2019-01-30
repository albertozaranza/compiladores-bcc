//Analizador Sintático
%{
#include<stdio.h>    
#include<math.h>
int sym[26];
int yylex();
void yyerror(char *s){
   printf("%s\n", s);
}	
%}

%token NUM
%token VAR

%left '+' '-'
%left '*' '/'
%left '(' ')'
%left '='

%right '^'
%right NEG

%%

program:
   program statement '\n' | ;

statement: 
   exp {printf("\nResultado: %d\n", $1);} |
   VAR '=' exp {sym[$1] = $3;};

exp:
   exp '+' exp {$$ = $1 + $3;} |
   exp '-' exp {$$ = $1 - $3;} | 
   exp '/' exp {$$ = $1 / $3;} | 
   exp '*' exp {$$ = $1 * $3;} |
   exp '^' exp {$$ = pow($1, $3);} |
   '(' exp ')'  {$$ = $2;} |
   '-' exp  %prec NEG {$$ = -$2;} |
   VAR {$$ = sym[$1];} |
   NUM ;

%%

#include "lex.yy.c"
int main(){
   yyparse();
   return 0;
}
