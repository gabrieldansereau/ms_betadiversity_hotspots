# Methods

We performed Generalized Linear Models between the observed and predicted estimates and plotted the deviance residuals to examine their spatial distribution. We used a negative binomial regression with a log link function for the richness estimates as our values showed overdispersion [@Fletcher2018SpaEco]. We used a beta regression with a logit link function for the LCBD values as they vary between 0 and 1, similar to @Heino2017ExpSpe and @Yao2021EcoUni. We used the R packages  `MASS` [@Venables2002ModApp] and `betareg` [@Cribari-Neto2010BetReg] to perform the negative binomial and beta regressions, respectively. 

# Results

Regression residuals showed similar geographic distributions to their corresponding difference values ([@Fig:residuals-combined]).

![Comparison of the regression residuals between the observed and predicted estimates of species richness (a) and ecological uniqueness (b). The estimate from the predicted data set was used as the dependent variable and the estimate from the observed data set as the independent variable. A negative binomial regression with a log link function was used for species richness, and a beta regression with a logit link function was used for uniqueness. The deviance residuals for richness ranged between -3.677 and 4.839 (a). LCBD values were recalculated for the same set of sites with observations in both data sets. The deviance residuals for LCBD scores ranged between -4.976 and 2.798 (b).](figures/comparison-residuals.png){#fig:residuals-combined}