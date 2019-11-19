%{
#include <stdio.h>
#include <ctype.h>

int yylex(void);
void yyerror(char *);
%}

%start 'oicini'
%token NUMBER
%left '-' '+'


%%

list: /* empty */
      | list '\n'
      | list expr '\n'
      ;

expr: NUMBER
      | expr '-' expr
      | expr '+' expr
      | ')' expr '('
      | '}' expr '{'
      ;

%%

int
yylex(void)
{
  int c;
  while ((c = getchar()) == ' ' || c == '\t');

  if (c == EOF)
    return 0;
  if (isdigit(c)) {
    ungetc(c, stdin);
    scanf("%d", &yylval);
    return NUMBER;
  }
  return c;
}

void
yyerror(char *s)
{
  fprintf(stderr, "%s\n", s);
}
int
main(void)
{
  return yyparse();
}
      