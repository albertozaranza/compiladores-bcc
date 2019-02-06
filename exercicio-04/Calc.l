%{
#include<string.h>
%}

NUM [0-9]*\.?[0-9]+
VAR [a-z]+

%%

{VAR} {
    strcpy(yylval.str,yytext);
    return (VAR);
}
{NUM} {
    yylval.vfloat = atof(yytext); 
    return (NUM);
}
"VAR" {
    return DECLARACAO;
}
"=" {
    return '=';
}
"+" {
    return '+';
}
"-" {
    return '-';
}
"/" {
    return '/';
}
"*" {
    return '*';
}
")" {
    return ')';
}
"(" {
    return '(';
}
"^" {
    return '^';
}
"\n" {
    return '\n';
}

%%