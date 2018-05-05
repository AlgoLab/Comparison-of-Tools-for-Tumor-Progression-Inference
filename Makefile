TARGETS = survey-tumor-progression-tools.pdf
LATEXMK = latexmk -recorder -use-make -interaction=nonstopmode -f

pdf: $(TARGETS)

%.pdf : %.tex $(figstex) $(bibs) figs
	$(LATEXMK) -pdf $<

clean :
	rm -f ./*.pdf && latexmk -c

bibs=$(wildcard *.bib)
figstex=$(wildcard img/*.tex)
sources=$(wildcard img/*.ipe)
svgfigs=$(wildcard img/*.svg)
svgfigspdf=$(svgfigs:.svg=.pdf)

figs: $(pdfs) $(svgfigspdf) $(wildcard img/*.png)

%.pdf : %.svg
	inkscape $< --export-pdf=$@
