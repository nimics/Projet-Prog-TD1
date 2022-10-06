
all: test_my_list rapport.pdf

test_my_list: test_my_list.mli its_my_list.ml test_my_list.ml
	ocamlc -c test_my_list.mli
	ocamlc -c its_my_list.ml
	ocamlc -o test_my_list test_my_list.mli

rapport.pdf: rapport.tex
	tex rapport.tex
	

clean:
	rm -rf test_list *.cmi *.cmo *~

propper:
	rm -rf test_my_list rapport.pdf *.cmi *.cmo *~