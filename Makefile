#uncomment your preferred engine - either work
#builder=pdflatex 
builder=xelatex 

#add your preferred pdf reader
viewer=open

default: view

clean:
	rm harvard-demo.bcf harvard-demo.blg harvard-demo.log harvard-demo.aux harvard-demo.run.xml harvard-demo.toc harvard-demo.out harvard-demo.bbl

all: harvard-demo.pdf

harvard-demo.pdf: harvard-demo.bbl harvard-demo.tex
	$(builder) harvard-demo.tex

harvard-demo.bbl: harvard-demo.bcf bibliography.bib
	biber harvard-demo

harvard-demo.bcf: harvard-demo.tex
	$(builder) harvard-demo.tex

view: harvard-demo.pdf
	$(viewer) harvard-demo.pdf