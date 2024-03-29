# NON-TARGET FILES
.PHONY: all rm figures build draft

# DEFAULT RULE
all: figures

# CUSTOM BUILD RULES
# -----------------------------------------------------------------------------
# - '$@' is a variable holding the name of the target
# - '$<' is a variable holding the (first) dependency of a rule.
# - '%' is a placeholder for matching patterns (for targets and dependencies)

# FETCH FIGURES 
FIGFILES=comparison-combined.png subareas-combined.png subareas-extents.png comparison-difference.png comparison-residuals.png rare-species.png
FIGPATHS=$(patsubst %.png, figures/%.png, $(FIGFILES))
BARTPATH=../betadiversity-hotspots/fig/bart

figures: $(FIGPATHS)
	
figures/subareas-combined.png: $(BARTPATH)/05_bart_subareas.png
	cp $< $@
	
figures/subareas-extents.png: $(BARTPATH)/05_bart_extents.png
	cp $< $@

figures/rare-species.png: $(BARTPATH)/06_bart_rare-species.png
	cp $< $@

figures/comparison-combined.png: $(BARTPATH)/09_bart_combined.png
	cp $< $@

figures/comparison-difference.png: $(BARTPATH)/09_bart_difference.png
	cp $< $@

figures/comparison-residuals.png: $(BARTPATH)/09_bart_residuals.png
	cp $< $@

# REMOVE FIGURES
rm:
	rm figures/*

# BUILD worklow files locally
build:
	# Convert the bib file to json
	export LANG=en_US.UTF-8
	pandoc references.bib -t csljson -o references.json
	# Cleanup the bibliography
	python .assets/scripts/bibliography.py
	# Cleanup the affiliations
	python .assets/scripts/affiliations.py
	# Prepare the output
	mkdir -p dist
	cp -r figures dist/
	cp references.json dist/
	cp .assets/logo.png dist/
	# Build the website
	pandoc manuscript.md -o dist/index.html -F pandoc-crossref --citeproc --bibliography=references.json --metadata-file=metadata.json --metadata-file=affiliations.json --template=.assets/templates/index.html
	# Build the tex files
	pandoc manuscript.md -s -o dist/draft.tex -F pandoc-crossref --citeproc --bibliography=references.json --metadata-file=metadata.json --metadata-file=affiliations.json --template=.assets/templates/draft.tex
	pandoc manuscript.md -s -o dist/preprint.tex -F pandoc-crossref --citeproc --bibliography=references.json --metadata-file=metadata.json --metadata-file=affiliations.json --template=.assets/templates/preprint.tex

# Build a Word doc
word: build
	pandoc dist/index.html -s -o dist/draft.docx

# Build the PDF files
draft: build
	pandoc manuscript.md -s -o dist/draft.pdf -F pandoc-crossref --citeproc --bibliography=references.json --metadata-file=metadata.json --metadata-file=affiliations.json --template=.assets/templates/draft.tex
	
# Not working because of the logo
# preprint: build
# 	pandoc manuscript.md -s -o dist/preprint.pdf
	