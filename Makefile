# Rules for compiling the PDF from the LaTeX sources and displaying the output

### File Types (for dependencies)
AUX = information.tex
BIB = $(wildcard *.bib)
FIG = $(wildcard figures/*)
### Documents to build
TEX = $(filter-out $(AUX), $(wildcard *.tex))
PDF = $(TEX:.tex=.pdf)

all: $(PDF)

%.pdf: %.tex $(AUX) $(BIB) $(FIG)
	tectonic -X compile $<

show: $(PDF)
	for fname in $^ ; do xdg-open $$fname ; done

wordcount:
	detex proposal.tex | wc --words

clean:
	rm -f $(PDF) *.*end
