all: Calc.l Calc.y
	clear
	flex Calc.l
	bison Calc.y
	gcc Calc.tab.c -o Calculadora.c -lfl -lm
	./Calculadora.c < entrada.txt