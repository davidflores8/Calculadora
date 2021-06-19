ejemplo2: ejemplo2.y ejemplo2.l
	bison -d ejemplo2.y
	flex ejemplo2.l
	cc -o $@ ejemplo2.tab.c lex.yy.c -lfl
