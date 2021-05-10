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

.PHONY: all figures rm
all: figures

# FETCH FIGURES 
FIGFILES=combined-maps.png subareas-combined.png subareas-medians.png subareas-3scales.png comparison-combined.png residuals-combined.png rare-species_ascending_plots.png
FIGPATHS=$(patsubst %.png, figures/%.png, $(FIGFILES))
BARTPATH=../betadiversity-hotspots/fig/bart

figures: $(FIGPATHS)
	
figures/subareas-combined.png: $(BARTPATH)/05-1_bart_subareas_combined.png
	cp $< $@
	
figures/subareas-medians.png: $(BARTPATH)/05-4_bart_subareas_medians.png
	cp $< $@
	
figures/subareas-3scales.png: $(BARTPATH)/05-2_bart_subareas_3scales.png
	cp $< $@

figures/%.png: $(BARTPATH)/07_bart_%.png
	cp $< $@

figures/rare-species_%.png: $(BARTPATH)/08_bart_rare-species_%.png
	cp $< $@

rm:
	rm figures/*