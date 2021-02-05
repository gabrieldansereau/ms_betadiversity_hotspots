---
bibliography: [references.bib]
---

<div style="text-align: justify">

# Introduction

- LCBD as useful measure for ecological uniqueness
- Restriction to small scales & few sites, unlike BD itself
- Restriction to known composition
- Potential to fill-in gaps through SDMs
- Poses question of applicability on large, continuous scales
- Potential varying relationship between richness-LCBD, given dependence of BD
  on scale

Beta diversity is an essential measure to describe the organization of
biodiversity in space. The calculation of local contributions to beta diversity
(LCBD), specifically, allows for the identification of sites with exceptional
diversity within a region of interest. To this day, LCBD indices have mostly
been used on regional and smaller scales, with relatively few sites.
Furthermore, as beta diversity implies a comparison among the sites of a given
region, the use of LCBD indices is typically restricted to strictly sampled
sites with known species composition, hence to discontinuous spatial scales.
Here, we investigate the variation of LCBD indices on extended spatial scales
including both species-poor and species-rich regions, and investigate their
applicability for continuous scales and unsampled sites through the use of
species distribution models (SDMs). To this aim, we used Bayesian additive
regression trees (BARTs) to model species composition on continuous scales based
on observation data from the eBird database.

# Methods
 
- eBird & transformation to presence-absence
- WorldClim & Copernicus, variable selection
- BARTs with `embarcadero`
- Richness, LCBD with hellinger transformation, relationship
- Subareas (rich & poor)
- 3 scales

We focused our analyses on the Warblers family (_Parulidae_)in North America
(Canada, US, Mexico). We collected all occurrence data available in the eBird
database [@Sullivan2009EbiCit] in June 2019, which represented roughly 30
million observations. Global citizen-contributed databases often present
additional challenges compared to conventional datasets due to their lack of
structure, as well as spatial and taxonomic biases [@Johnston2019BesPra].
However, eBird offers two advantages over other large scale datasets
[@Johnston2019BesPra]\: 1) the data is structured as checklists and users can
explicitly specify their observations as "complete checklists" when all detected
species were reported, which allows inferring information on species absences,
and 2) the dataset is semi-structured, and checklists are associated with
metadata describing sampling effort, such as duration of search, distance
travelled and number of observers, which can be used as controls in the
analyses. Hence, model performance can be improved by inferring absences and
subsampling checklists, while spatial bias can be compensated by including
effort covariates in the model [@Johnston2019BesPra]. Therefore, we believe the
dataset can be appropriately used to achieve our objective of expanding measures
of exceptional biodiversity through space. 

We collected the data available in the WorldClim 2 database [@Fick2017Wor2N] for
North America, to which we decided to restrict our analyses. The WorldClim data
consists of spatially interpolated monthly climate data for global areas,
available for resolutions from 10 arc-minutes to 30 arc-seconds (around 18 km²
and 1 km² at the equator). Since the release of the first version of the
database in 2005 [@Hijmans2005VerHig], it became the most common source of
climate data for SDM studies [@Booth2014BioFir]. The variables we used were
different measures of temperature and precipitation, with very
high global cross-validation coefficients (> 0.99 and 0.86 respectively)
[@Fick2017Wor2N]. We chose to use the coarser 10 arc-minutes resolution in our
preliminary analyses, as we believed it was sufficient for proof of concept of
our method. We also collected land cover data from the Copernicus Global land
service [@Buchhorn2019CopGlo]. These data consisted of 10 variables for the main
land cover classes, each represented by their percentage of cover fraction. The
Copernicus data is available at a 100m spatial resolution, finer than for the
WorldClim data, hence we coarsened it to the same resolution by averaging the
cover fraction values.

## Results

- SDMs results are similar to raw observations for richness, LCBD, and
  relationship
- Relationship is different for species-rich & species-poor sites
- Relationship varies according to scale, being well defined at smaller scales
  and becoming increasingly vague on larger extents

![Comparison between a species-rich region (Northeast) and a species-poor one (Southwest) at a given scale, based on the SDM predictions](figures/subareas-combined.png){#fig:subareas}

The relationship between LCBD values and species richness displayed two
constrasting profiles in species-rich and species-poor regions (@fig:subareas).
In a species-rich region, such as the Northeastern region of our study extent
(North America), LCBD scores display a decreasing relationship with species
richness. Hence, the sites with the highest LCBD values, i.e. the unique ones in
terms of species composition, are the species-poor sites, while the species-rich
sites display lower LCBD scores. Therefore, our results show that the only way
for a site to stand out and "be exceptional" in such a region is to have few
species. Since most sites in the Northeastern region comprise between 20 to 30
warblers species, the richest ones with 40 species do not stand out and are not
as exceptional as the ones with 10 species or fewer. The Southwest subarea, on
the other hand, shows a different relationship. While the sites with the highest
LCBD values are once again the poorest ones in terms of species richness, the
decreasing relationship with richness is initially much sharper, and displays a
more important increase as richness reaches 20 species. Since most
sites only comprise around 10 species and few sites comprise more than 20, 
regions with 40 species stand out more and are more exceptional in such
species-poor regions than they would be in species-rich ones.

![Effect of scaling and full region extent size on the relationship between site richness and LCBD value. LCBD values are re-calculated at each scale based on the sites in this region only](figures/subareas-scaling.png)

## Extra figures

<p align="center">
    <img src="figures/richness-raw.png" width="49%" />
    <img src="figures/richness-bart.png" width="49%" />
</p>

Figure: Distribution of species richness in North America, defined as the number
of Warblers species per site (10 arc-minutes pixels). The raw occurrence
observations from eBird (left) and the SDM predictions from the single-species
BART models (right) were both transformed into presence-absence data per species
before calculating richness.

<p align="center">
    <img src="figures/lcbd-raw.png" width="49%" />
    <img src="figures/lcbd-bart.png" width="49%" />
</p>

Figure: Distribution of the LCBD values in North America, calculated from the
variance of the site-by-species community matrix Y and scaled to the maximum
value observed. Occurrence observations from eBird (left) and single-species SDM
predictions (right) were converted into presence-absence data per species, then
the Hellinger transformation was applied before computing the LCBD indices.

<p align="center">
    <img src="figures/relationship-raw.png" width="49%" />
    <img src="figures/relationship-bart.png" width="49%" />
</p>

Figure: Relationship between the species richness and the LCBD value of each
site based on the occurrence observations from eBird (left) and the SDM
predictions (right). LCBD values were scaled to the maximum value observed after
applying Hellinger transformation.

# Discussion

- Same results with SDMS mean they could reliably be used to fill-in for
  knowledge gaps, potentially for conservation too
- Difference between species-poor & species-rich sites: shows ways to be
  unique differ, to link with considerations beta diversity itself
- Scales difference: aggregating too many different sites possibly masks
  patterns of uniqueness?

This result higlights an important aspect regarding the LCBD measure: contrary
to previous findings, it does not simply decrease with species richness. In
fact, the relationship with richness is not constant -- it actually depends on
the general profile of the region on which it is applied, and whether or not
this region is species-poor or species-rich. A parabolic relationship was
actually expected when the measure was introduced, as both extremes should
normally stand out. An explanation for the previously observed results could be
that extremely rich sites are just much less ecologically possible. It is
unlikely that all species could be found in a single site given their different
niche preferences, while poor sites are much more feasible. These sites will
almost always contribute more to the variance, as measured by LCBD values.

# References
