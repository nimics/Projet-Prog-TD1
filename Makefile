
all: test_my_list rapport.pdf

test_my_list: test_my_list.ml test_my_list.mli
	ocamlc -o test_my_list test_my_list.ml

rapport.pdf: rapport.tex
	tex rapport.tex
	

clean:
	rm -rf test_list *.cmi *.cmo *~
