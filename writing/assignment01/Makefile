NAME = assignment01
BIB = references.bib

ALLTEX = *.tex
SRC = $(NAME).tex

TARG = $(SRC:.tex=.pdf)

all: $(TARG)

$(TARG): $(SRC) $(BIB) $(ALLTEX)
	pdflatex $(NAME)
	bibtex $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)

clean:
	rm -f *~ *log *lof *lot *nav *aux $(TARG) *.out *.blg *.brf *.bbl \
  *.bak *.dvi *.toc *.spl *.tar

tar: 
	tar cvf ready-to-submit.tar *.tex Makefile
