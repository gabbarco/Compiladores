/* even more like Unix wc */
%option noyywrap
%{
    int cpfs = 0;
%}

%%
[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2} { cpfs++; }
.                                     { /* outros caracteres */ }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
    }
    yylex();
    printf("Total de CPFs encontrados: %d\n", cpfs);
    return 0;
}
