##-*- makefile -*-############################################################

default:
	tclsh ../../pantcl/pantcl.tcl citer.tcl citer.html --css mini.css --no-pandoc
	htmlark -o citer-out.html citer.html 
	mv citer-out.html citer.html
test:
	tclsh citer.tcl --test
