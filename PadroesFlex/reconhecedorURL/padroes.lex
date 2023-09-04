/* even more like Unix wc */
%option noyywrap
%{
    int urls = 0;
%}

%%
https:\/\/[A-Za-z0-9.-]+\.[A-Za-z]{2,}\/?[A-Za-z0-9.-\/]* { urls++; }
.                                                        { /* outros caracteres */ }
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
    }
    yylex();
    printf("Total de URLs encontradas: %d\n", urls);
    return 0;
}
