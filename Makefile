BARTPATH=../betadiversity-hotspots/fig/bart

## Basic rule
# target: dependency
# 	action

## Shortcuts
# .PHONY means that the target doesn't correspond to a file
# VARIABLE= creates a variable
# $(VARIABLE) uses the variable
# $@ means the target of the rule
# $< means the first dependency
# $^ means all the dependencies
# % is the wildcard for targets & dependencies
# $* is the wildcard in the action

.PHONY: all
all: figures

FIGFILES=combined-maps.png subareas-combined.png subareas-medians.png subareas-3scales.png comparison-richness.png comparison-lcbd.png residuals_richness-negbinomial.png residuals_lcbd-betareg.png rare-species_ascending_plots.png
FIGPATHS=$(patsubst %.png, figures/%.png, $(FIGFILES))
.PHONY: figures
figures: $(FIGPATHS)
	
figures/subareas-combined.png: $(BARTPATH)/05-1_bart_subareas_combined.png
	cp $< $@
	
figures/subareas-medians.png: $(BARTPATH)/05-4_bart_subareas_medians.png
	cp $< $@
	
figures/subareas-3scales.png: $(BARTPATH)/05-2_bart_subareas_3scales.png
	cp $< $@

figures/combined-maps.png: $(BARTPATH)/07_bart_combined-maps.png
	cp $< $@

figures/comparison-%.png: $(BARTPATH)/07_bart_comparison-%.png
	cp $< $@

figures/residuals_%.png: $(BARTPATH)/07_bart_residuals_%.png
	cp $< $@

figures/rare-species_%.png: $(BARTPATH)/08_bart_rare-species_%.png
	cp $< $@

.PHONY: clean
clean:
	rm figures/*