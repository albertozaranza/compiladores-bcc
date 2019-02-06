//Analizador Sintático
%{
#include<stdio.h>    
#include<math.h>
#include<string.h>
int yylex();
void yyerror(char *s){
   printf("%s\n", s);
}
typedef struct vars{
   char nome[50];
   float valor;
} VARS;

VARS todas[50];
int qntd, i;

int erro = 0;
%}

%union{
   float vfloat;
   char str[50];
}

%token <vfloat> NUM
%token <str> VAR
%token <str> DECLARACAO

%type <vfloat> exp
%type <vfloat> statement

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
   exp {
      if(erro == 0) {
         printf("\nResultado: %.2f\n", $1);
      } else {
         printf("\nVariável não declarada\n");
      }
   } |
   DECLARACAO VAR	{
      strcpy(todas[qntd].nome,$2);
      qntd++;
   } |
   VAR '=' exp	{
      for(i=0;i<qntd;i++){
         if(strcmp(todas[i].nome,$1)==0){
            todas[i].valor = $3;
            $$ = $3;
            break;
         }
      }
   };

exp:
   exp '+' exp {$$ = $1 + $3;} |
   exp '-' exp {$$ = $1 - $3;} | 
   exp '/' exp {$$ = $1 / $3;} | 
   exp '*' exp {$$ = $1 * $3;} |
   exp '^' exp {$$ = pow($1, $3);} |
   '(' exp ')'  {$$ = $2;} |
   '-' exp  %prec NEG {$$ = -$2;} |
   NUM | 
   VAR {
      int encontrou = 0;
      for(i=0;i<qntd;i++){
         if(strcmp(todas[i].nome,$1)==0){
            $$ = todas[i].valor;
            encontrou = 1;
            break;
         }
      }
      if(encontrou == 0){
         erro = 1;
      }
   };

%%

#include "lex.yy.c"
int main(){
   yyparse();
   return 0;
}
