%{

%}

NUM [0-9]+
DEC [0-9]*\.[0-9]+
CARACMIN [a-z]
CARACMAX [A-Z]
PALAVRA [a-zA-Z]+
SUFIXO "i"
SIMB [+*/]
SIMBM [-]
X [\ \t\n]

%%

{PALAVRA}{SUFIXO} {
    printf ("Caractere válido: %s", yytext);
}
{NUM} {
    printf ("Caractere inválido: %s", yytext);
}
{DEC} {
    printf ("Caractere válido: %s", yytext);
}
{CARACMIN} {
    printf ("Caractere inválido: %s", yytext);
}
{CARACMAX} {
    printf ("Caractere inválido: %s", yytext);
}
{PALAVRA} {
    printf ("Caractere inválido: %s", yytext);
}
{PALAVRA}^"FIM" {
    printf ("Caractere inválido PALAVRA: %s", yytext);
}

"FIM" {printf ("FIM do programa\n");}

%%