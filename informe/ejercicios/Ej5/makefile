COMPILER= iverilog
SOURCES= addern_tb.v andNbits_tb.v BCDfulladder_tb.v comparison_tb.v fulladder_tb.v isEqual_tb.v isGreater_tb.v orNbits_tb.v
all: $(SOURCES)
	$(COMPILER) -o addern_tb addern_tb.v
	$(COMPILER) -o andNbits_tb andNbits_tb.v
	$(COMPILER) -o BCDfulladder_tb BCDfulladder_tb.v
	$(COMPILER) -o comparison_tb comparison_tb.v
	$(COMPILER) -o fulladder_tb fulladder_tb.v
	$(COMPILER) -o isEqual_tb isEqual_tb.v
	$(COMPILER) -o isGreater_tb isGreater_tb.v
	$(COMPILER) -o orNbits_tb orNbits_tb.v
	
addern_tb: addern_tb.v
	$(COMPILER) -o addern_tb addern_tb.v
andNbits_tb: andNbits_tb.v
	$(COMPILER) -o andNbits_tb andNbits_tb.v
BCDfulladder_tb: BCDfulladder_tb.v 
	$(COMPILER) -o BCDfulladder_tb BCDfulladder_tb.v
comparison_tb: comparison_tb.v
	$(COMPILER) -o comparison_tb comparison_tb.v
fulladder_tb: fulladder_tb.v
	$(COMPILER) -o fulladder_tb fulladder_tb.v
isEqual_tb: isEqual_tb.v
	$(COMPILER) -o isEqual_tb isEqual_tb.v
isGreater_tb: isGreater_tb.v
	$(COMPILER) -o isGreater_tb isGreater_tb.v
orNbits_tb: orNbits_tb.v
	$(COMPILER) -o orNbits_tb orNbits_tb.v
