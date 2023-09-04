/* even more like Unix wc */
%option noyywrap
%{
    int emails = 0;
%}

%%
[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,} { emails++; }
.                                              { /* outros caracteres */ }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
    }
    yylex();
    printf("Total de e-mails encontrados: %d\n", emails);
    return 0;
}
