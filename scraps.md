# Scraps

## Methods

#### Complete checklists introduction

Complete checklists allow to infer non-detection of a species in locations
where sampling events occurred, but the species was not recorded.

Complete checklists allow to infer non-detection of a species in locations
where sampling events occurred and other species were detected.

Complete checklists offers information on where sampling events occurred, but
a species was not recorded. Using them instead of regular checklists offers
large performance gains in species distribution models [@Johnston2019BesPra].

#### Complete checklists to presence-absence format

Given that we used complete checklists only, the absence of a species in a
site means that it was not detected, and discards the possibility that it was
simply not recorded by the user. 

The absence of a species in a complete checklist _is_ a non-detection event,
not an omission of record by the user.

#### BARTS

BARTs have a bayesian formulation: they iteratively generate sets of trees based
on a priors about tree structure and nodes, then build a posterior distribuion
of predicted classification probabilities [@Carlson2020EmbSpe]. 

BARTs are a bayesian sum-of-trees model where trees are constrained by priors
and inclusing an iterative Bayesian backfitting MCMC algorithm
[@Chipman2010BarBay]. 

## Results

## Distribution results

The species distribution models generated richness and uniqueness results that
matched those from observed data, comforting their potential to fill-in gaps in
poorly sampled regions. 

The species distribution models generated relevant community predictions in
terms of richness and uniqueness, which match the results from the
observed data.

At a broad and coarse scale, this should be similar to the distributions from
IUCN.

## Introduction

Ecological communities, in the LCBD framework, are essentially quantitative
assemblages of species, with variation either in species presence or absence, or
in species abundance among sites. This is a rather simplistic view, disregarding
the processes (such as selection, drift, speciation, and dispersion, following
Vellend (2010)), which are also at the core of community ecology studies. Yet,
viewing communities as assemblages of species, on a spatial point of view, opens
the perspective of reassembling communities from single species distributions,
and notably single species distribution _predictions_. The latter is the purpose
of the whole field of species distribution modelling (SDM), and the
corresponding species distribution models (SDMs), whose aim is to ... The view
of scaling up from single species to community, thus performing community
modelling, is not a novel idea (Ferrier, Ferrier & Guisan), even in the context
of SDMs. 

## Discussion

Our study is also the first to show the large scale distribution of LCBD values,
with either a high number of sites assembled from presence-absence citizen
science occurrence data, or with an even higher even number of sites assembled
from SDM predictions. Our results show that on such large scale, at a coarse
resolution, regional patterns are more visible than site ones.

Now an important question: can our method (predicting uniqueness on broad
continuous scales from SDMs) be used for conservation, and if so, hoooooow? Or
rather, how best given what we know?

This result highlights an important aspect regarding the LCBD measure: contrary
to previous findings, it does not simply decrease with species richness. In
fact, the relationship with richness is not constant -- it actually depends on
the general profile of the region on which it is applied and whether or not
this region is species-poor or species-rich. A parabolic relationship was
actually expected when the measure was introduced, as both extremes should
normally stand out. An explanation for the previously observed results could be
that extremely rich sites are just much less ecologically possible. It is
unlikely that all species could be found in a single site given their different
niche preferences, while poor sites are much more feasible. These sites will
almost always contribute more to the variance, as measured by LCBD values. 

Our results confirm that the relationship is generally decreasing, slightly
curvilinear [@Heino2017ExpSpe], but not constant; our results further show that
this variation depends on the region and the scale on which the measure is used.

Hence, our results has repercussions for the identification of beta diversity
hotspots or regions on large spatial scales with the LCBD methods with regards
to be selection of conservation targets.