---
bibliography: [references.bib]
---

<div style="text-align: justify">

# Introduction

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

We measured how compositional uniqueness varies on extended continuous scales.
We first predicted species composition on continuous scales using extended
occurrence data from eBird and species distribution models. We then quantified
compositional uniqueness for both predicted and observed data, and compared the
relationship between uniqueness and richness for different regions and scales.
We used _Julia v1.5.3_ [@Bezanson2017JulFre] for most of the project, as well as
_R v4.0.2_ [@RCoreTeam2020RLan] for some specific steps. All the scripts used
for the analyses are available at
https://github.com/gabrieldansereau/betadiversity-hotspots.

## Occurrence data

We used occurrence data from eBird [@Sullivan2009EbiCit] downloaded through the
eBird Basic Dataset from June 2019 [@eBirdBasicDataset2019VerEbd]. We restricted
our analyses to the Warblers family (_Parulidae_) in North America (Canada,
United States, Mexico) using the _R_ package `auk` [@Strimas-Mackey2018AukEbi].
eBird is a semi-structured citizen science data set, meaning that observations
are reported as checklists of species detected in an observation run
[@Johnston2020AnaGui]. Observers can explicitly specify that their checklist
contains all species they could detect and identify during a sampling event, in
which case it is labelled as a "complete checklist". Using complete checklists
instead of regular checklists allows to infer non-detections in locations where
detection efforts did occur, which offers large performance gains in species
distribution models [@Johnston2020AnaGui]. We therefore selected the data from
the complete checklists only. Our final data set comprised 62 Warblers species
and nearly 23 million observations from 9 million checklists.

We then converted the occurrence data to a presence-absence format compatible
with community analyses. We considered every pixel from our 10 arc-minutes
environmental layers as a site. We then verified, for each species, if there was
a single observation in every sites. We recorded the outcome as a binary value:
present (1) if a species was ever recorded in a site, and absent (0) if it
was not. Complete checklists ensure that these are non-detections, rather than
the species not being recorded, hence we considered them as true absences,
similar to @Johnston2020AnaGui.

## Environmental data

Our environmental data consisted of climatic data from WorldClim 2.1
[@Fick2017Wor2N] and land cover data from the Copernicus Global Land Service
[@Buchhorn2019CopGlo]. The WorldClim data consists of spatially interpolated
monthly climate data for global land areas. We downloaded the data at a
resolution of 10 arc-minutes (around 18 km² at the equator), the coarsest
resolution available, using the _Julia_ package `SimpleSDMLayers.jl`
[@Dansereau2021SimJl]. The coarse resolution should mitigate potential
imprecisions in the eBird data regarding the extent of the sampled areas in each
observation checklist. We selected 8 of the 19 standard _bioClim_ variables
representing annual trends, ranges, and extremes of temperature and
precipitation: bio1, bio2, bio5, bio6, bio12, bio13, bio14, bio15. The
Copernicus data is a set of variables representing 10 land cover classes (e.g.
crops, tree, urban area) and measured as a percentage of land cover fraction.
The data is only available at a finer resolution of 100m, which we downloaded
directly from the website. We coarsened it to the same 10 arc-minutes resolution
as the WorldClim data by averaging the cover fraction values of the pixels with
`GDAL` [@GDAL/OGRcontributors2021GdaOgr]. We first selected the 10 land cover
variables, but later removed two of them (moss and snow) from our predictive
models as their cover fraction was 0% on all sites with Warblers observations,
hence they did not provide any predictive value to our SDM models.

## Species distribution models

We predicted species distribution on continuous scales from our presence-absence
data using Bayesian Additive Regression Trees (BARTs) [@Chipman2010BarBay], a
classification and regression trees method recently suggested for species
distribution modelling [@Carlson2020EmbSpe]. BARTs are sum-of-trees models,
conceptually similar to Boosted Regression Trees and Random Forest, but
following a Bayesian paradigm: trees are constrained as weak learners by priors
regarding structure and nodes, then fitting and inference is done through an
iterative Bayesian backfitting MCMC algorithm generating a posterior
distribution of predicted classification probabilities [@Chipman2010BarBay;
@Carlson2020EmbSpe]. We used the package `embarcadero` [@Carlson2020EmbSpe] in
_R_ to perform the BART models. We performed BARTs separately for all species
and estimated the probability of occurrence for all the sites in our region of
interest, then converted the results to a binary outcome given a threshold that
maximises the True Skill Statistic (TSS), as suggested by @Carlson2020EmbSpe. 

## Quantification of ecological uniqueness

We used the method from @Legendre2013BetDiv to quantify compositional uniqueness
from overall beta diversity for both observed and predicted data. First, we
assembled species presence-absence data by site to form two site-by-species
community matrices $Y$, one from observed data and one from predicted data. We
measured species richness per site as the sum of each row, or the number species
present. We removed the sites without any species from the predicted community
matrix (this was not necessary for the observed community matrix, as it was, by
design, only composed of sites with at least one species present), and applied
the Hellinger transformation to our $Y$ matrices, as recommended by
@Legendre2013BetDiv for presence-absence data. We then measured the local
contributions to beta diversity (LCBD), which quantify how much a specific site
(a row in matrix $Y$) contributes to the overall variance in the community
[@Legendre2013BetDiv]. High LCBD values indicate a unique community composition,
while low values indicate a more common set of species. We note that our LCBD
values, which add up to 1 by definition, were very low given the high number of
sites in both our observed and predicted data sets. However, the relative
difference between the scores matters more than the absolute value to
differentiate their uniqueness. Therefore, we decided to report the LCBD values
as relative to the maximum value from each matrix Y, meaning that the new
maximum value was 1, and all other values represented fractions of it.

## Investigation of regional and scaling variation

To investigate possible regional and scaling effects, we recalculated LCBD
values on various subregions at different locations and at different scales.
First, we selected two subregions of equivalent size (20 longitude degrees by 10
latitude degres) with two contrasting richness profiles to verify if the
relationship between species richness and LCBD values was similar. We selected a
Northeast subregion, mostly species-rich, and a Southwest subregion, mostly
species-poor (for both observed and predicted data). The coordinates of both
subregions are shown on @fig:subareas. Second, we recalculated the LCBD indices
at three different scales, starting with a focus on the Northeast subregion and
progressively extending the extent to encompass the Southwest subregion
(@fig:scaling). We did these two verifications with both the observed and
predicted data, but only illustrate the results with the predicted data as both
were qualitatively similar.

# Results

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

![Comparison between a species-rich region (Northeast) and a species-poor one (Southwest) at a given scale, based on the SDM predictions](figures/subareas-combined.png){#fig:subareas}

The LCBD-richness relationship shows some important variation when scaling up
and changing the full extent of the region under study (@fig:scaling). On
smaller scales, starting with a species-rich region, the relationship is
well-defined, decreasing and curvilinear. However, as the scale increases and
progressively reaches species-poor regions, the relationship broadens, displays
more variance, and loses its clear definition, while remaining generally
decreasing. The minimum relatiave LCBD values also increases, going from near
zero to 0.3, showing a higher contribution of the less exceptional sites to the
overall diversity on extended scales.

![Effect of scaling and full region extent size on the relationship between site richness and LCBD value. LCBD values are re-calculated at each scale based on the sites in this region only](figures/subareas-scaling.png){#fig:scaling}

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
