PDFDIR = PDFs
IMGDIR = img
PDFS := $(patsubst %.md,$(PDFDIR)/%.pdf,$(wildcard *.md))

all: $(PDFS) all_notes.pdf

$(PDFDIR)/%.pdf: %.md $(IMGDIR)/*
	mkdir -p $(PDFDIR)
	pandoc $< -o $@

all_notes.pdf: *.md $(IMGDIR)/*
	pandoc *.md --toc --toc-depth=2 -o $(PDFDIR)/all_notes.pdf

