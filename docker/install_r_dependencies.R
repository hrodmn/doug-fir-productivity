# List of ST R packrstanarmages we want in sequoia
install.packages('devtools', repos="http://cran.cnr.berkeley.edu")
library(devtools)

# install tidyverse since the packages in this set are common dependencies
# in subsequent packages
install.packages("tidyverse")

# install spatial packages
spatialPackages <- c(
  "rgdal",
  "sf",
  "rgrass7",
  "RSAGA",
  "leaflet"
)
install.packages(spatialPackages)

# get set for jupyter
jupyter_deps <- c(
  'repr',
  'IRdisplay',
  'evaluate',
  'crayon',
  'pbdZMQ',
  'uuid',
  'digest'
)
install.packages(jupyter_deps)
devtools::install_github("IRkernel/IRkernel")
IRkernel::installspec(user = FALSE)

# install fun color palletes
install.packages("wesanderson")

# ensure we fail loudly if one of the R packages failed
allPackages <- c(
  "devtools",
  "tidyverse",
  spatialPackages,
  jupyter_deps,
  "IRkernel"
)
for(package in allPackages) {
  stopifnot(package %in% installed.packages()[,'Package'])
}
