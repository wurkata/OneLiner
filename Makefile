all:
	alex Tokens.x
	happy Grammar.y
	ghc --make myinterpreter -o myinterpreter
clean:
	rm -f *.o *.hi Tokens.hs Grammar.hs myinterpreter
