
run: compilar 
	./contador.exe teste.txt

compilar: limpar flex
	gcc lex.yy.c -lfl -o contador.exe

flex:
	flex padroes.lex

limpar:
	rm lex.yy.c *.exe

first: flex
	gcc lex.yy.c -lfl -o contador.exe
