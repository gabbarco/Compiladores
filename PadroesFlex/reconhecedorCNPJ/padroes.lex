/* even more like Unix wc */
%option noyywrap
%{
    int cnpjs = 0;
%}

%%
[0-9]{2}\.[0-9]{3}\.[0-9]{3}\/[0-9]{4}-[0-9]{2} { cnpjs++; }
.                                             { /* outros caracteres */ }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
    }
    yylex();
    printf("Total de CNPJs encontrados: %d\n", cnpjs);
    return 0;
}
