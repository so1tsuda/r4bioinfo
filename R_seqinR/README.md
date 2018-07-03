Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2018-05-12

----------
# SeqinR
生物配列の検索と解析
- [Welcome to SeqinR: Biological Sequences in R project!](http://seqinr.r-forge.r-project.org)
- [CRAN - Package seqinr](https://cran.r-project.org/web/packages/seqinr/index.html): Biological Sequences Retrieval and Analysis
  - 2017-08-01 Reference manual: [seqinr.pdf](https://cran.r-project.org/web/packages/seqinr/seqinr.pdf)

## Table of Contents
- [Installation](#installation)
- [Exercise 1](#exercise-1)
- [Exercise 2](#exercise-2)
- [2017-08-03](#2017-08-03) Introduction to seqinR
- [2013-05-09](#2013-05-09) SeqinR for NONCODE
- [Acknowledgements](#acknowledgements)
- [References](#references)

----------
## Installation

`seqinr`パッケージのインストール:  

    # install the SeqinR package
    install.packages("seqinr")

`seqinr`パッケージの呼び出し:  

    # load the SeqinR package into R
    library(seqinr)

- [パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

----------
## Exercise 1

    library("seqinr")  # Loading "seqinr" package
    x <- s2c("atgc")   # Create small data
    x
    length(x)          # Length of a DNA sequence
    table(x)           # Base composition of a DNA sequence
    GC(x)              # GC Content of DNA
    count(x, word = 2) # Count oligomers

----------
## Exercise 2


    # Loading seqinr package
    library(seqinr)
    # list the data sets in the "seqinr" package
    data(package = "seqinr")
    # A toy example of amino-acid counts in three proteins
    data(toyaa)
    # A toy example of codon counts in three coding sequences
    data(toycodon)
    # Fragment of the E. coli chromosome
    example(m16j)
    # 999 coding sequences from E. coli
    data(ec999)
    # to plot genetic code as in textbooks
    tablecode()
    # to translate coding sequences into proteins
    getTrans(ec999)
    # utility data for seqinr
    SEQINR.UTIL
    # To Get Some Protein Statistics
    example(AAstat)
    # Dot Plot Comparison of two sequences
    example(dotPlot)

----------
## 2017-08-03
[Introduction to seqinR](http://seqinr.r-forge.r-project.org/src/mainmatter/introduction.pdf)
Pr. Jean R. Lobry

----------
## 2013-05-09

https://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/
Using the R SeqinR package - Dave Tang's blog

Download data from http://www.noncode.org/download.php

    wget -c http://www.noncode.org/datadownload/ncrna_NONCODE[v3.0].fasta.tar.gz

Now with the R analysis.

    pirna_index <- grep("piRNA",annotation,ignore.case=T, useBytes = TRUE)
    pirna_human_sequence <- getSequence(pirna_human)
    write.fasta(pirna_human_sequence, pirna_human_annotation, 'human_pirna.fa')
    table(mapply(function(x) return(x[10]), pirna_human_sequence))
    table(mapply(function(x) return(x[1]), pirna_human_sequence))

#### NONCODE
http://www.noncode.org

https://www.ncbi.nlm.nih.gov/pubmed/26586799
Nucleic Acids Res. 2016 Jan 4;44(D1):D203-8. doi: 10.1093/nar/gkv1252. Epub 2015 Nov 19.
NONCODE 2016: an informative and valuable data source of long non-coding RNAs.

https://integbio.jp/dbcatalog/record/nbdc00303
NONCODE - Integbio データベースカタログ
info 説明: 	あらゆる種類の非コードRNA（noncoding RNAs）のデータベース（tRNAとrRNAは除く）です。
2016-03-14

http://cell-innovation.nig.ac.jp/surfers/reference_data.html
リファレンスデータ
non-coding RNA

http://cell-innovation.nig.ac.jp/surfers/long_non_coding_RNA_flow.html
long non coding RNA解析フロー

----------
## Acknowledgements

I am grateful to Drs. Jean R. Lobry and Simon Penel for their advice on SeqinR.

----------
## References

http://www.rdocumentation.org/packages/seqinr
seqinr package | R Documentation

https://rstudio-pubs-static.s3.amazonaws.com/73927_60e9fb345d9d4175b8994b1ff1eff2e2.html
DNA Sequence Statistics using R: Team Project

http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html
(Rで)塩基配列解析
イントロ | 一般 | 翻訳配列(translate)を取得(応用) | seqinr(Charif_2005)

https://sites.google.com/site/rhandout/seqinr-package
Seqinr package - rhandout

http://slideplayer.com/slide/10596928/
1 Introduction to R A Language and Environment for Statistical Computing, Graphics & Bioinformatics Introduction to R Lecture 4 - ppt download
Published byAnnice Bell
Modified about 1 year ago

http://www.rpubs.com/vuongyenxuan/project
RPubs - Genetic distance calculation and phylogenetic tree using R Studio
Using R to Caculate Genetic Distance and Generate Phylogenetic tree
Suzanne
November 19, 2015

https://stackoverflow.com/questions/26834908/seqinr-dotplot-change-axis
r - seqinr dotplot - change axis - Stack Overflow
3 years ago

http://www.biob.in/2013/05/dotplot-for-protein-sequences-using-r.html
DotPlot for Protein Sequences using R ~ BioGem Blog

May 29, 2012
https://www.slideshare.net/pau_corral/seqinr-biological-data-handling
SeqinR - biological data handling

June 10, 2011
http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/index.html
Welcome to a Little Book of R for Bioinformatics! — Bioinformatics 0.1 documentation
https://media.readthedocs.org/pdf/a-little-book-of-r-for-bioinformatics/latest/a-little-book-of-r-for-bioinformatics.pdf

https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf
Applied Statistics for Bioinformatics using R
Wim P. Krijnen
November 10, 2009

https://sites.google.com/site/adversariaoftekijima/r/seqinr
seqinr - 日々草(TEKの備忘録)

https://www.ncbi.nlm.nih.gov/pubmed/15374859
Bioinformatics. 2005 Feb 15;21(4):545-7. Epub 2004 Sep 16.
Online synonymous codon usage analyses with the ade4 and seqinR packages.
Charif D1, Thioulouse J, Lobry JR, Perrière G.

http://pbil.univ-lyon1.fr/datasets/charif04/
Online Synonymous Codon Usage Analyses with the ade4 and seqinR packages

http://pbil.univ-lyon1.fr/members/lobry/repro/jme95/
Lobry (1995) JME 40:326

----------
