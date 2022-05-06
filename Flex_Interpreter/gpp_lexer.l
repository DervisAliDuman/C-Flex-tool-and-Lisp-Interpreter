%{
#include "y.tab.h"
%}

%%

deffun return KW_DEFFUN;
and return KW_AND;
or return KW_OR;
not return KW_NOT;
equal return KW_EQUAL;
less return KW_LESS;
nil return KW_NIL;
list return KW_LIST;
append return KW_APPEND;
concat return KW_CONCAT;
set return KW_SET;
for return KW_FOR;
if return KW_IF;
exit return KW_EXIT;
load return KW_LOAD;
disp return KW_DISP;
true return KW_TRUE;
false return KW_FALSE;
"+" return OP_PLUS;
"-" return OP_MINUS;
"/" return OP_DIV;
"*" return OP_MULT;
"(" return OP_OP; 
")" return OP_CP;
"**" return OP_DBMULT;
"“" return OP_OC;
"”" return OP_CC;
"," return OP_COMMA;
";;".* return COMMENT;
[%.&|\\$#'_£€₺!?\{\}\[\]~] return syntaxE;
[_a-zA-Z][-_a-zA-Z0-9]* return IDENTIFIER;
[0] {yylval.num = atoi(yytext); return VALUE;}
[0][0-9]* return syntaxE;
[0-9]* {yylval.num = atoi(yytext); return VALUE;}
[0-9]*[_a-zA-Z]* return syntaxE;
"\n\n" return exitP;
[ \t\n] ;

%%

int yywrap(){
    return 1;
}
