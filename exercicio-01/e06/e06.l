%{

%}

NUM [0-9]+
DEC [0-9]*\.[0-9]+
CARACMIN [a-z]
CARACMAX [A-Z]
PREFIXOAMIN "a"
PREFIXOAMAX "A"
PALAVRA [a-zA-Z]+
SIMB [+*/]
SIMBM [-]
X [\ \t\n]

%%

{PREFIXOAMIN}{PALAVRA} {
    printf ("Caractere válido: %s", yytext);
}
{PREFIXOAMAX}{PALAVRA} {
    printf ("Caractere válido: %s", yytext);
}
{NUM} {
    printf ("Caractere inválido: %s", yytext);
}
{DEC} {
    printf ("Caractere inválido: %s", yytext);
}
{CARACMIN} {
    printf ("Caractere inválido: %s", yytext);
}
{CARACMAX} {
    printf ("Caractere inválido: %s", yytext);
}
{PALAVRA}^"FIM" {
    printf ("Caractere inválido PALAVRA: %s", yytext);
}

"FIM" {printf ("FIM do programa\n");}

%%