%{

%}

NUM [0-9]+
VAR [a-z]+

%%

{VAR} {
    yylval = *yytext - 'a';
    return (VAR);
}
{NUM} {
    yylval = atoi(yytext); 
    return (NUM);
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
"@" {
    return '@';
}
"\n" {
    return '\n';
}

%%