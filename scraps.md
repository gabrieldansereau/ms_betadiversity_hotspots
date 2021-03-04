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