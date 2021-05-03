BARTPATH=../betadiversity-hotspots/fig/bart

all: figures

figures: figures/combined-maps.png figures/subareas-combined.png figures/subareas-medians.png figures/subareas-3scales.png
	
figures/combined-maps.png:
	cp $(BARTPATH)/07_bart_combined-maps.png figures/combined-maps.png
	
figures/subareas-combined.png:
	cp $(BARTPATH)/05-1_bart_subareas_combined.png figures/subareas-combined.png
	
figures/subareas-medians.png:
	cp $(BARTPATH)/05-4_bart_subareas_medians.png figures/subareas-medians.png
	
figures/subareas-3scales.png:
	cp $(BARTPATH)/05-2_bart_subareas_3scales.png figures/subareas-3scales.png

clean:
	rm figures/*