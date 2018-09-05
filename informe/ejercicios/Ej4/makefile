COMPILER= iverilog
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.gz *.out *.thm *.ps *.idx *.ilg *.ind *.log *.fdb_latexmk *.fls
.PHONY: clean
.PHONY: all
all: 
	$(COMPILER) -o ej4_tb ej4.v
ej4:
	$(COMPILER) -o ej4_tb ej4.v
clean:	
	rm -rf $(OTHER)
