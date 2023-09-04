/* even more like Unix wc */
%option noyywrap
%{
    int integers = 0;
%}

%%
[0-9]+ { integers++; }
.      { /* outros caracteres */ }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
    }
    yylex();
    printf("Total de inteiros encontrados: %d\n", integers);
    return 0;
}
