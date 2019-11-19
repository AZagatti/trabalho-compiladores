DIGITO[0-9]
ID[a-zA-Z][a-zA-Z0-9]*
INICIO[oicini]
FIM[mif]
VARIAVEL[rav]
INTEIRO[orietni]
FLOAT/REAL[laer]
ESCREVA[avercse]
LEIA[aiel]
IGUAL/ATRIBUICAO[!=]
ADICAO[-]
SUBTRACAO[+]
ESCOPO[}{]
PARAMETRO[)(]
FINAL DE COMANDO[,.]

%%
oicini                {printf("Reservada: %s\n",yytext);}
mif                   {printf("Reservada: %s\n",yytext);}
rav                   {printf("Reservada: %s\n",yytext);}
orietni               {printf("Reservada: %s\n",yytext);}
laer                  {printf("Reservada: %s\n",yytext);}
avercse               {printf("Reservada: %s\n",yytext);}
aiel                  {printf("Reservada: %s\n",yytext);}
"!="                  {printf("Operador de atribuicao: %s\n", yytext);}
"-"                   {printf("Operador de soma: %s\n", yytext);}
"+"                   {printf("Operador de subtracao: %s\n", yytext);}
"}"                   {printf("Inicio do escopo: %s\n", yytext);}
"{"                   {printf("Fim do escopo: %s\n", yytext);}
")"                   {printf("Inicio dos parametros: %s\n", yytext);}
"("                   {printf("Fim dos parametros: %s\n", yytext);}
",."                  {printf("Fim da linha: %s\n", yytext);}
{DIGITO}+             {printf("Inteiro: %s\n", yytext);}
{DIGITO}+"."{DIGITO}* {printf("Real: %s\n", yytext);}
{ID}+                 {printf("Identificador: %s\n", yytext);}
%%
/* recomendavel declara sempre funcao yywrap() */
int yywrap();

int main(void)
{
  yylex();
  return 0;
}
int yywrap()
{
  return 1;
}