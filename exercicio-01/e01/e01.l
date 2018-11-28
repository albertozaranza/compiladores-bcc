%{

%}

NUM [0-9]+
PALAVRA [a-zA-Z]+
SIMB [+*/]
SIMBM [-]

%%

{SIMB} {
    printf ("Caractere válido: %s", yytext);
}
{SIMBM} {
    printf ("Caractere válido: %s", yytext);
}
{NUM} {
    printf ("Caractere inválido: %s", yytext);
}
{PALAVRA}^"FIM" {
    printf ("Caracteres inválidos: %s", yytext);
}

"FIM" {printf ("FIM do programa\n");}

%%