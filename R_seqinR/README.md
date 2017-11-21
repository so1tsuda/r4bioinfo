Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-11-19

----------
# SeqinR
seqinr: Biological Sequences Retrieval and Analysis
生物配列の検索と解析

- [seqinr](http://seqinr.r-forge.r-project.org)
- [CRAN - Package seqinr](https://cran.r-project.org/web/packages/seqinr/index.html)

## Table of Contents
- [Installation](#installation)
- [Exercise 1](#exercise-1)
- [Exercise 2](#exercise-2)
- [2013-05-09](#2013-05-09) Using the R SeqinR package - Dave Tang's blog

----------
## Installation

[パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

`seqinr`パッケージのインストール:  

    # install the SeqinR package
    install.packages("seqinr")

`seqinr`パッケージの呼び出し:  

    # load the SeqinR package into R
    library(seqinr)

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
## 2013-05-09

https://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/
Using the R SeqinR package - Dave Tang's blog

### Download data
http://www.noncode.org/download.php

    wget -c http://www.noncode.org/datadownload/ncrna_NONCODE[v3.0].fasta.tar.gz

### Working with Data in R

    # Set Working Directory
    setwd("~/2013-05-09/")
    # Load the SeqinR package
    # Reading sequence data
    pirna_index <- grep("piRNA",annotation,ignore.case=T, useBytes = TRUE)
 	#count the number of human piRNAs
 	length(pirna_human_annotation)
 	pirna_human_sequence <- getSequence(pirna_human)
    table(mapply(function(x) return(x[10]), pirna_human_sequence))
    table(mapply(function(x) return(x[1]), pirna_human_sequence))

### References

http://apprize.info/data/bioinformatics/8.html
A Rapid Introduction to the R Language - Practice: Bioinformatics Data Skills - Bioinformatics Data Skills (2015)
mapply() is a multivariate version of sapply(): the function you pass to mapply() can take in and use multiple arguments. 

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
# Acknowledgements

I am grateful to Drs. Jean R. Lobry and Simon Penel for their advice on SeqinR.

----------
# References

http://www.rdocumentation.org/packages/seqinr
seqinr package | R Documentation

https://rstudio-pubs-static.s3.amazonaws.com/73927_60e9fb345d9d4175b8994b1ff1eff2e2.html
DNA Sequence Statistics using R: Team Project

http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html
(Rで)塩基配列解析
(last modified 2017/11/13, since 2010)
http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html#intro_general_translate_seqinr
イントロ | 一般 | 翻訳配列(translate)を取得(応用) | seqinr(Charif_2005)

https://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/
Using the R SeqinR package - Musings from an unlikely candidateMusings from an unlikely candidate

http://blog.biogem.org/2013/05/dotplot-for-protein-sequences-using-r.html
DotPlot for Protein Sequences using R ~ BioGem.Org

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

----------
