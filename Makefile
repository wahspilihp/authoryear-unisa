#uncomment your preferred engine - either work
#builder=pdflatex 
builder=xelatex --nonstopmode

#add your preferred pdf reader
viewer=open

default: harvard-demo-tabular.view

clean: harvard-demo-tabular.clean harvard-demo.clean

%.clean:
	-rm $*.bcf $*.blg $*.log $*.aux $*.run.xml $*.toc $*.out $*.bbl

distclean: clean
	-rm harvard-demo.pdf
	-rm harvard-demo-tabular.pdf

all: harvard-demo.pdf harvard-demo-tabular.pdf

%.pdf: %.bbl %.tex authoryear-unisa.cbx authoryear-unisa.bbx authoryear-unisa.lbx corp.dbx
	$(builder) $*.tex
	$(builder) $*.tex

%.bbl: %.bcf bibliography.bib authoryear-unisa.cbx authoryear-unisa.bbx authoryear-unisa.lbx corp.dbx
	biber -T $*

%.bcf: %.tex authoryear-unisa.cbx authoryear-unisa.bbx authoryear-unisa.lbx corp.dbx
	$(builder) $<

%.view: %.pdf
	$(viewer) $<

logs: harvard-demo-tabular.blg harvard-demo-tabular.bcf harvard-demo-tabular.bbl