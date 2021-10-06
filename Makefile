# NON-TARGET FILES
.PHONY: all rm figures

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