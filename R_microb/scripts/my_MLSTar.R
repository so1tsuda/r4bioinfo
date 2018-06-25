# https://github.com/iferres/MLSTar

#citation()

# Installation
#devtools::install_github('iferres/MLSTar')

# Standard workflow
library(MLSTar)

# Print R version and packages
sessionInfo()

listPubmlst_orgs()[1:50]
lst <- listPubmlst_orgs() 
lst[47]
listPubmlst_schemes(org = lst[47])

#First we list the atteched tar.gz file
tgz <- system.file('extdata', 'example.tar.gz', package = 'MLSTar')
genomes <- untar(tarfile = tgz, list = T)
#Decompress them
untar(tarfile = tgz,exdir = tempdir())
genomes <- list.files(path = tempdir(), 
                      pattern = paste0(genomes, collapse = '|'), 
                      full.names = TRUE)
genomes

## determine the MLST for the scheme 1.
x <- doMLST(
  infiles = genomes, # The fasta files
  org = lst[47], # The organism, in this case is "leptospira"
  scheme = 1, # Scheme id number
  write = "none", # Don't write fasta files for alleles found
  ddir = paste0(tempdir(),'pubmlst_lep_sch1', collapse = '/') # Write downloaded sequences and profiles here.
  )   

x

# Attributes
attributes(x)

# Result
x$result

# Profile (leptospira, scheme 1)
head(x$profile)

# ---------------------
# Minimum Spanning Tree
# ---------------------

set.seed(4)
plot(x)

set.seed(4)
g <- plot(x, plot = FALSE)
g

# choose to plot just your isolates:
plot(x, what = 'result')

# -----------
# Binary Tree
# -----------

layout(cbind(1,2))
plot(x, type = 'phylo')
plot(x, type = 'phylo', 
     plot.phylo.args = list(type = 'fan'), 
     tiplabels.args = list(offset = 0.1))
