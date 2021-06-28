%{
# include "ejemplo2.tab.h"
 
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"^" { return POW; }
[0-9]+ {yylval = atoi(yytext); return NUMBER; }
\n { return EOL; }
[ \t] { /* ignore whitespace */ }
. { printf("Hay un caracter no identificado:  %c\n", *yytext); }
%%


