%{

%}

NUM [0-9]+
CARACMIN [a-z]
CARACMAX [A-Z]
PALAVRA [a-zA-Z]+
SIMB [+*/]
SIMBM [-]
X [\ \t\n]

%%

{NUM} {
    printf ("Caractere inválido: %s", yytext);
}
{CARACMIN} {
    printf ("Caractere inválido: %s", yytext);
}
{CARACMAX} {
    printf ("Caractere válido: %s", yytext);
}
{PALAVRA}^"FIM" {
    printf ("Caractere inválido PALAVRA: %s", yytext);
}

"FIM" {printf ("FIM do programa\n");}

%%