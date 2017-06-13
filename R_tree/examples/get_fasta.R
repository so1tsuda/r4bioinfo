cat("\n# This R script retrieves sequence data using SeqinR")
#cat("\n#  Usage: Rscript --vanilla get_fasta.R ./Accession_List.txt \n\n")

# Extract Command Line Arguments
#clas <- commandArgs(TRUE); Accession_List <- clas[1]

# Set Working Directory
#setwd("~/projects/r4bioinfo/R_tree/examples")
Accession_List <- "Accession_List.txt"

# Loading Data into R
ACCESSIONs <- read.table(Accession_List, stringsAsFactors=FALSE)[,1]

# Load SeqinR package
#install.packages("seqinr")
library(seqinr)

# Print R version and packages
sessionInfo()

# Retrieving sequence data using SeqinR
eutils.ncbi.fasta <- function(ACCESSION) read.fasta(file = paste0("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=",ACCESSION,"&rettype=fasta&retmode=text"), strip.desc = TRUE)[[1]]
ld <- lapply(ACCESSIONs, eutils.ncbi.fasta)

# Writing sequence data out as a FASTA file
write.fasta(sequences=ld, names=paste(sprintf("%02d", 1:length(ld)), sub("([^ ]+) ([^ ]+) ([^ ]+) (.+)", "\\2_\\3_\\1", getAnnot(ld)), sep="_"), file.out=paste0("seq_",format(Sys.time(), "%Y%m%d"),".fasta") )

# Check Directory
getwd()
dir()

cat("\n# Done. \n")
