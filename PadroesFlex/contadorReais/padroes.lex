/* even more like Unix wc */
%option noyywrap
%{
    int reais = 0;
%}

%%
[-]?[0-9]+(\.[0-9]+)? { reais++; }
.                     { /* Descartar todos os outros caracteres */ }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
    }
    yylex();
    printf("Total de números reais encontrados: %d\n", reais);
    return 0;
}
