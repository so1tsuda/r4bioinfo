Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2018-01-27

----------

# R for Microbiology
Rによる微生物データ解析

## Table of Contents
- [Updates](#updates)
  - [2018-01](#2018-01)
- [Tools-Microbiome-Anlaysis](#tools-microbiome-anlaysis)
- [Microbiome Helper](microbiome_helper)
- [MicrobiomeWorkflow](#MicrobiomeWorkflow)
- [Metacoder](#metacoder)
- [microbiome](#microbiome)
- [MAGNAMWAR](#MAGNAMWAR)
- [theseus](#theseus)
- [DADA2](#DADA2)
- [phyloseq](#phyloseq)
- [matR](#matR)

----------
## Updates
### 2018
### 2017
### 2016
### 2015

----------

http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html#about_analysis_microbiome
(Rで)塩基配列解析
- 解析 | 菌叢解析 | について (last modified 2017/06/04)
- 解析 | 菌叢解析 | phyloseq(McMurdie_2012) (last modified 2014/05/29)

----------
## Tools-Microbiome-Anlaysis

https://microsud.github.io/Tools-Microbiome-Anlaysis/

https://github.com/microsud/Tools-Microbiome-Anlaysis
A list of R environment based tools for 16S rRNA gene data exploration, statistical analysis and visualization

----------
## Microbiome Helper

https://github.com/LangilleLab/microbiome_helper/wiki

https://www.ncbi.nlm.nih.gov/pubmed/28066818
mSystems. 2017 Jan 3;2(1). pii: e00127-16. doi: 10.1128/mSystems.00127-16. eCollection 2017 Jan-Feb.
Microbiome Helper: a Custom and Streamlined Workflow for Microbiome Research.
Comeau AM1, Douglas GM1, Langille MG1.

----------
## MicrobiomeWorkflow

https://github.com/spholmes/F1000_workflow

http://web.stanford.edu/class/bios221/MicrobiomeWorkflowII.html
https://bioconductor.org/help/course-materials/2017/BioC2017/Day1/Workshops/Microbiome/MicrobiomeWorkflowII.html
25 July 2017

https://www.ncbi.nlm.nih.gov/pubmed/27508062
Version 2. F1000Res. 2016 Jun 24 [revised 2016 Nov 2];5:1492. eCollection 2016.
Bioconductor Workflow for Microbiome Data Analysis: from raw reads to community analyses.
Callahan BJ1, Sankaran K1, Fukuyama JA1, McMurdie PJ2, Holmes SP1.

We provide examples of using the R packages dada2, phyloseq, DESeq2, ggplot2 and vegan

----------
## Metacoder

Jan 23, 2018
https://github.com/grunwaldlab/metacoder

8 Jan 2018
https://twitter.com/zacharyfoster19/status/950423225619554304
Zachary Foster on Twitter: "metacoder 0.2.0 is on CRAN. Lots of new features and refinements. Check out https://t.co/zdiFcEPGB0 for an introduction. * parsing and filtering moved to https://t.co/YS8tGOBijP * label overlap avoidance * new parsers and writers * heat tree matrix plotting * and more! #rstats… https://t.co/sFDqYgRoSu"

![](https://pbs.twimg.com/media/DTCTpgtV4AAKXV9.jpg)

https://www.ncbi.nlm.nih.gov/pubmed/28222096
PLoS Comput Biol. 2017 Feb 21;13(2):e1005404. doi: 10.1371/journal.pcbi.1005404. eCollection 2017 Feb.
Metacoder: An R package for visualization and manipulation of community taxonomic diversity data.
Foster ZS1, Sharpton TJ2,3,4, Grünwald NJ5.

----------
## microbiome

https://bioconductor.org/packages/release/bioc/html/microbiome.html
Bioconductor - microbiome

	source("https://bioconductor.org/biocLite.R")
	biocLite("microbiome")

Warning message:
package ‘microbiome’ is not available (for R version 3.3.3) 


https://www.bioconductor.org/packages/devel/bioc/vignettes/microbiome/inst/doc/vignette.html
Introduction to the microbiome R package
Leo Lahti, Sudarshan Shetty, et al.
2018-01-22


Jan 22, 2018
https://github.com/microbiome/microbiome
https://github.com/microbiome/microbiome/wiki/Installation

https://microbiome.github.io/microbiome/
Introduction to the microbiome R package

https://microbiome.github.io/microbiome/Tutorial.html
Tutorial on Microbiome Data Analysis

----------
## MAGNAMWAR

https://www.ncbi.nlm.nih.gov/pubmed/29342236
Bioinformatics. 2018 Jan 12. doi: 10.1093/bioinformatics/bty001. [Epub ahead of print]
MAGNAMWAR: An R package for genome-wide association studies of bacterial orthologs.
Sexton CE1, Smith HZ1,2, Newell PD3, Douglas AE4, Chaston JM5.

https://cran.r-project.org/web/packages/MAGNAMWAR/index.html
MAGNAMWAR: A Pipeline for Meta-Genome Wide Association

Chaston, J.M. et al. (2014) 
http://mbio.asm.org/content/5/5/e01631-14
Metagenome-Wide Association of Microbial Determinants of Host Phenotype in Drosophila melanogaster

https://github.com/cran/MAGNAMWAR/blob/master/vignettes/using_mag.Rmd

----------
## theseus

2017-12-20
https://cran.rstudio.com/web/packages/theseus/vignettes/general_usage.html
Using the theseus R package

library(theseus)
library(phyloseq)
library(ggplot2)

data('WWTP_Impact')

----------
## DADA2
https://benjjneb.github.io/dada2/index.html

https://benjjneb.github.io/dada2/tutorial.html
Nat Methods. 2016 Jul;13(7):581-3. doi: 10.1038/nmeth.3869. Epub 2016 May 23.
DADA2: High-resolution sample inference from Illumina amplicon data.
Callahan BJ1, McMurdie PJ2, Rosen MJ3, Han AW2, Johnson AJ2, Holmes SP1.

https://github.com/benjjneb/dada2

----------
## phyloseq

https://github.com/joey711/phyloseq

https://joey711.github.io/phyloseq/
phyloseq: Import, share, and analyze microbiome census data using R

http://joey711.github.io/phyloseq-demo/phyloseq-demo.html
Demo: phyloseq – An R package for microbiome census data

https://sites.google.com/site/noteofpaediatricsurgery/r/phyloseq
Phyloseq - Draft of Pediatric Surgery

----------

## matR
https://cran.r-project.org/web/packages/matR/index.html

https://mg-rast.github.io/matR/
Metagenomics Analysis Tools: the matR package

http://www.mcs.anl.gov/~braithwaite/library/matR/html/00Index.html

R: metagenomics analysis tools for R


http://www.mcs.anl.gov/~braithwaite/library/matR/doc/matR-user-manual.pdf

Short Tutorials for Metagenomic Analysis 

https://www.ncbi.nlm.nih.gov/pubmed/26791506
Methods Mol Biol. 2016;1399:207-33. doi: 10.1007/978-1-4939-3369-3_13.
MG-RAST, a Metagenomics Service for Analysis of Microbial Community Structure and Function.

----------
## phylogeo


http://zachcp.github.io/phylogeo/
phylogeo - Introduction

https://www.ncbi.nlm.nih.gov/pubmed/25913208
Bioinformatics. 2015 Sep 1;31(17):2909-11. doi: 10.1093/bioinformatics/btv269. Epub 2015 Apr 25.
phylogeo: an R package for geographic analysis and visualization of microbiome data.
Charlop-Powers Z1, Brady SF1.

----------
## micropan
https://cran.r-project.org/web/packages/micropan/index.html

https://www.ncbi.nlm.nih.gov/pubmed/25888166
BMC Bioinformatics. 2015 Mar 12;16:79. doi: 10.1186/s12859-015-0517-0.
micropan: an R-package for microbial pan-genomics.

Post-annotation analysis and visualization are also possible, directly through the web interface, or with tools like matR (metagenomic analysis tools for R, covered later in this chapter) that utilize the MG-RAST API ( http://api.metagenomics.anl.gov/api.html ) to easily download data from any stage in the MG-RAST processing pipeline. 

	git clone https://github.com/cran/micropan
	# micropan/inst/doc/casestudy.pdf
	# micropan/inst/doc/vignette.pdf

----------

R package, 
DiversitySeq

6:12 PM - 25 Nov 2017
https://twitter.com/j_flan/status/934560569192939520
Jessica_Flannery on Twitter: "Great visualizations for microbial diversity and explanation about why/how “diversity” can mean so many different things! https://t.co/Uqi4HEp2yZ"

10:44 AM - 24 Nov 2017
https://twitter.com/ProfWhelan/status/934085445847257088
Kevin Whelan on Twitter: "Gut #microbiome: confused about sequencing, reads, a-diversity and B-diversity? This great review will answer a lot of questions - my vote f… https://t.co/2EQRk2foNz"

6:12 AM - 21 Nov 2017
https://twitter.com/Francesca_Fin_/status/932929811776983040
Francesca Finotello on Twitter: "How to compute #diversity from #NGS data? #DiversitySeq: a package to estimate different diversity measures from NGS counts and to simulate… https://t.co/jdo57DbTFR"

https://www.ncbi.nlm.nih.gov/pubmed/28025179
Brief Bioinform. 2016 Dec 26. pii: bbw119. doi: 10.1093/bib/bbw119. [Epub ahead of print]
Measuring the diversity of the human microbiota with targeted next-generation sequencing.
Finotello F, Mastrorilli E, Di Camillo B.


----------
