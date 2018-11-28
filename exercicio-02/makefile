all: ex.l
	flex ex.l
	gcc lex.yy.c -o comp -lfl
	clear
	./comp < programa.az