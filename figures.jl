mspath = abspath(".")
codepath = abspath("../betadiversity-hotspots")
cd(codepath)

outcome = "raw"
include(joinpath(codepath, "src", "04_analysis.jl"))

raw = (Y = Y,
       richness = richness,
       richness_plot = richness_plot,
       lcbd = lcbd,
       beta_total = beta_total,
       lcbd_plot = lcbdtr_plot,
       rel_plot = rel2d_plot
       )
plotSDM2(raw.richness)

outcome = "bart"
include(joinpath(codepath, "src", "04_analysis.jl"))

sdm = (Y = Y,
       richness = richness,
       richness_plot = richness_plot,
       lcbd = lcbd,
       beta_total = beta_total,
       lcbd_plot = lcbdtr_plot,
       rel_plot = rel2d_plot
       )


# Plots
lims_richness = extrema(mapreduce(collect, vcat, [raw.richness, sdm.richness]))
lims_lcbd = extrema(mapreduce(collect, vcat, [raw.lcbd, sdm.lcbd]))

plot(raw.richness_plot, sdm.richness_plot,
     raw.lcbd_plot, sdm.lcbd_plot,
     clim = [lims_richness lims_richness lims_lcbd lims_lcbd],
     title = ["a" "b" "c" "d"],
     titleloc = :left,
     size = (850, 600), 
     dpi = 200)

savefig(joinpath(mspath, "figures", "combined-maps.png"))