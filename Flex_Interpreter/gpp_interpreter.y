%{ 
#include <stdio.h>    
#include <stdlib.h>    
#include <string.h>    
#include <math.h>

int yylex(void);
void yyerror (const char* s);
void yyrestart (FILE* input_file);
extern FILE *yyin;

void print(int* buffer);
int isbuffer(int boolean, int* buffer);

%}

%union {int num; char id[100]; int *arrayay;}
%start START
%token COMMENT KW_LIST KW_DEFFUN KW_AND KW_OR KW_NOT KW_EQUAL 
KW_LESS KW_NIL KW_APPEND KW_CONCAT KW_SET KW_FOR KW_IF KW_EXIT 
KW_LOAD KW_DISP KW_TRUE KW_FALSE OP_OP OP_CP OP_PLUS OP_MINUS 
OP_DIV OP_MULT OP_DBMULT OP_OC OP_CC OP_COMMA exitP syntaxE;
%left OP_PLUS OP_MINUS OP_MULT OP_DIV
%right KW_NOT
%token <num> VALUE <id> IDENTIFIER
%type <num> TYPE1 <num> TYPE2 <arrayay> NUMBERS <arrayay> EXP_LIST ;

%%

START: COMMENT {}
    | START COMMENT {} | OP_OP KW_EXIT OP_CP { 
        exit(1);
    }
    | START OP_OP KW_EXIT OP_CP { 
        exit(1);
    }
    | TYPE1 { 
        printf("%d\n", $1); 
    }
    | START TYPE1 { 
        printf("%d\n", $2); 
    }
    | TYPE2 { 
        if($1 == 1){
            printf("true\n");
        } else{
            printf("false\n");
        } 
    }
    | START TYPE2 { 
        if($2 == 1){
            printf("true\n");
        } else{
            printf("false\n");
        } 
    }
    | EXP_LIST { 
        print($1); 
    }
    | START EXP_LIST { 
        print($2); 
    };

NUMBERS: TYPE1 { 
    int *array = (int *) malloc(2*sizeof(int));
    array[0] = 1;
    array[1] = $1;
    $$ = array; 
}
| NUMBERS TYPE1 {
    int *d = (int *) malloc((2+$1[0])*sizeof(int));
    d[0] = $1[0] + 1;
    int i = 1;
    while(i < d[0]){
        d[i] = $1[i];
        i++;
    }
    d[i] = $2; 
    $$ = d; 
};

TYPE1: VALUE { $$ = $1; }
    | IDENTIFIER { }
    | OP_OP OP_PLUS NUMBERS OP_CP { 
        int ans = 0;
        int i = 1;
        while(i <= $3[0]){
            ans += $3[i];
            i++;
        }
        $$ = ans; 
    }
    | OP_OP OP_MINUS NUMBERS OP_CP { 
        int ans = $3[1];
        int i = 2;
        while(i <= $3[0]){
            ans -= $3[i];
            i++;
        }
        $$ = ans; 
    }
    | OP_OP OP_MULT NUMBERS OP_CP { 
        int ans = $3[1];
        int i = 2;
        while(i <= $3[0]){
            ans *= $3[i];
            i++;
        }
        $$ = ans; 
    }
    | OP_OP OP_DIV NUMBERS OP_CP {
        int ans = $3[1];
        int i = 2;
        while(i <= $3[0]){
            ans /= $3[i];
            i++;
        } 
        $$ = ans; 
    }
    | OP_OP OP_DBMULT NUMBERS OP_CP { 
        $$ = pow($3[1],$3[2]); 
    }
    | OP_OP KW_SET IDENTIFIER NUMBERS OP_CP {}
    | OP_OP KW_IF TYPE2 EXP_LIST EXP_LIST OP_CP { 
        if($3 == 1){
            print($4);
        } else{
            print($5);
        }
        $$ = 0; 
    }
    | OP_OP KW_IF TYPE2 EXP_LIST OP_CP {$$ = isbuffer($3, $4); }
    | OP_OP KW_IF TYPE2 NUMBERS OP_CP { $$ = isbuffer($3, $4); }
    | OP_OP KW_FOR TYPE2 NUMBERS OP_CP { $$ = isbuffer($3, $4); }
    | OP_OP KW_FOR OP_OP IDENTIFIER TYPE1 TYPE1 OP_CP EXP_LIST OP_CP { 
        int i = $5;
        if($6 >= $8[0]){
            printf("Error: Unexpected bounds(for) : %d %d\n",$5,$6);
            exit(-1);
        }
        for(i;i<$6;i++){
            printf("%d\n",$8[i+1]);
        }

        $$ = $8[$6+1]; 
    }
    | OP_OP KW_DISP NUMBERS OP_CP { $$ = $3[1]; }
    | OP_OP KW_DEFFUN IDENTIFIER EXP_LIST OP_CP { print($4); }
    | OP_OP KW_DEFFUN IDENTIFIER OP_OP IDENTIFIER OP_CP EXP_LIST OP_CP { print($7); }
    | OP_OP KW_DEFFUN IDENTIFIER OP_OP IDENTIFIER IDENTIFIER OP_CP EXP_LIST OP_CP { print($8); };

TYPE2: KW_TRUE { $$ = 1; }
    | KW_FALSE { $$ = 0; }
    | OP_OP KW_EQUAL NUMBERS OP_CP { $$ = ($3[1] == $3[2]); }
    | OP_OP KW_LESS NUMBERS OP_CP { $$ = ($3[1] < $3[2]); }
    | OP_OP KW_AND TYPE2 TYPE2 OP_CP { $$ = $3 && $4; }
    | OP_OP KW_OR TYPE2 TYPE2 OP_CP { $$ = $3 || $4; }
    | OP_OP KW_NOT TYPE2 OP_CP { $$ = !$3; }
    | OP_OP KW_EQUAL TYPE2 TYPE2 OP_CP { $$ = $3 == $4; }
    | OP_OP KW_DISP TYPE2 OP_CP { $$ = $3; };

EXP_LIST: OP_OP KW_LIST OP_CP { $$ = NULL; }
        | KW_NIL { $$ = NULL; }
        | OP_OP KW_LIST NUMBERS OP_CP { $$ = $3; }
        | OP_OP KW_APPEND NUMBERS EXP_LIST OP_CP { 
            int *array = (int *) malloc(($4[0]+1)*sizeof(int));
            array[0] = $4[0] + 1;
            array[1] = $3[1];

            int i = 2;
            while(i <= $4[0]+1){
                array[i] = $4[i-1];
                i++;
            }
            $$ = array; 
        }
        | OP_OP KW_CONCAT EXP_LIST EXP_LIST OP_CP { 
            int *array = (int *) malloc(($3[0]+$4[0]+1)*sizeof(int));
            array[0] = $3[0] + $4[0];

            int i = 1;
            while(i <= $3[0]+1){
                array[i] = $3[i];
                i++;
            }

            i = 1;
            while(i <= $4[0]+1){
                array[i+$3[0]] = $4[i];
                i++;
            }
            
            $$ = array; 
        }
        | OP_OP KW_DISP EXP_LIST OP_CP { $$ = $3; };


%%

int main(int argc, char** argv){
    if(argc > 1) {
        yyin = fopen(argv[1], "r");
        if(yyparse()) {
            fclose(yyin);
        }
        return 0;
    }
    yyin = stdin;
    yyrestart(yyin);
    return yyparse();
}

void yyerror(const char *str){
    char *array = ". Expression not recognized.";
    char *result = malloc(strlen(str) + strlen(array) + 1);

    strcpy(result, str);
    strcat(result, array);
    
    fprintf(stderr, "%s\n", result);
}