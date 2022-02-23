---
geometry: "left=2.54cm,right=2.54cm,top=2.54cm,bottom=2.54cm"
fontfamily: times
fontsize: 12pt
output: pdf_document
header-includes:
        - \usepackage{times}
        - \usepackage{tcolorbox}
        - \renewtcolorbox{quote}{}
---

# OIK-09063 Author comments on proofs

Here is a response to all the queries in the proofs. Suggested changes with page and line numbers follow. I also highlighted and repeated the changes as notes directly in the text in the hope of making them easier to track.

## Answer to queries

> Q1 Please check that all author names are correctly spelled and confirm that all author affiliations are correctly listed. Note that affiliations should reflect those at the time during which the work was undertaken. Please check that the ORCID addresses are accurate and listed for all authors who wish to add it.

Author names, affiliations, and ORCID addresses are correct.

> Q2 Confirm that the email address for the corresponding author is accurate.

Email address for the corresponding author is accurate.

> Q3 AQ: Please give all geographic referenses in degrees, minutes and seconds

See suggested modifications in the next section.

> Q4 Ensure that all the figures, tables and captions are correct, and all figures are of the highest quality/resolution. Please note that figures and tables must be cited sequentially.

Are the figures in the proofs the full resolution figures which will be used in the final version in the manuscript or downgraded ones for proof review? The resolution is lower than in the .pdf and .docx version of our manuscript (originally 600 dpi PNG files). We would appreciate it if the resolution could be higher on some figures, especially Fig. 1. We can quickly provide full resolution files if needed (PNG or TIFF; as PDF versions are too large given the high number of coloured pixels).

> Q5 Please confirm that the CRediT taxonomy of contributor roles (author contributions) is correct and that all author names are spelled correctly.

Author contributions and names are correct.

> Q6, Q7 Please confirm that the Data availability statement is accurate and, if necessary, update the link to the data repository. Note that the data supporting your paper must be publicly accessible. If your data was private during the peer review process, please ensure that they are now publicly available.

As stated in our data availability statement, the data used in our manuscript comes from publicly accessible data sets (which we do not own). We archived the processed data files (not the raw ones) on Zenodo alongside the scripts. The processed data files can be used to reproduce the main analyses and include presence-absence raster TIFF files assembled from the original eBird data and coarsened land cover TIFF files. Given this, here is our updated data availability statement including the link to the Zenodo archive. 

"All data used in this work come from publicly accessible data sets. The WorldClim climate data are available at https://www.worldclim.org/data/worldclim21.html. The Copernicus land cover data are archived on Zenodo (https://doi.org/10.5281/zenodo.3243509). The eBird Basic Dataset is available for download from eBird after completing a data request form at https://ebird.org/science/use-ebird-data/download-ebird-data-products. Pre-processed data ready for analysis are available alongside the scripts on Zenodo (https://doi.org/10.5281/zenodo.6024392)."

If possible, we would like to review the proofs one more time to make sure we agree with the final statement. We will provide a quick response within 24 hours.

> Q8 Please update the reference ‘Johnston et al. 2020’.

Updated reference:

Johnston, A. et al. 2021. Analytical guidelines to increase the value of community science data: an example using eBird data to estimate species distributions. - Diversity and Distributions 27: 1265–1277.

## Suggested changes with page and line numbers

- P3 L47,55,110: Johnston et al. 2020 is now Johnston et al. 2021 (following requested update)

- P3 L67-68: As requested regarding the geographic references, replace by "... extent comprised between latitudes 20°N to 75°N and between longitudes 145°W to 50°W." (Note: order was changed to respect the convention of giving latitude first, then longitude)

- P3 L71: Could "bioclim" be changed to "BIOCLIM"? We wrote it in capital letters specifically at the request of one of the original authors of the BIOCLIM variables.

- P3 L77: Change "18 km^2^" to "18 km" (this was a mistake on our part)

- P4 L24,27,42,54,59: The $\hat{Y}$ symbol does not display properly. It should be a capital Y with a circumflex accent in an inline mathematical notation, similar to $Y$ mentioned right beside it.

- P4, L85-86: "(latitude 40°N to 50°N, longitude 80°W to 60°W)"

- P4, L91-92: "(latitude  30°N to 40°N, longitude 120°W to 100°W)"

- P5, L43: The Zenodo URL is correct but there seems to be invisible characters in it. Hence it does not work when copy-pasted into a browser.

- P5 L60: Replace "rockies" by "Rocky Mountains"

- P6 L60: Replace "(shown in 4)" by "(shown in Fig. 4)"

- P12 L77: Remove this reference (if the data availability statement we suggest is acceptable)
