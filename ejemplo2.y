%{
#include <stdio.h>
%}
/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS POW
%token EOL
%%
calcu: 
 | calcu exp EOL { printf("El resultado es = %d\n", $2);}
 ;
exp: factor 
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;
factor: term 
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;
 term:term POW factor {int x = $1;
                          for(int i=1;i<$3;i++)
                          {
                              x=x*$1;
                              $$ = x;
                          }
                        }

term: NUMBER 
 | ABS term { $$ = $2 >= 0? $2 : - $2; }
;
%%
int main(int argc, char **argv)
{
    printf("Ingrese una operacion por, favor: \n");
    yyparse();  
}
int yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}