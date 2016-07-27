----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-06-21  

----------

# R for Bioinformatics
R言語を用いたバイオインフォマティクス

    R_Avril_Coghlan/: Avril Coghlan () Welcome to a Little Book of R for Bioinformatics!
    R_msa/: an R package for multiple sequence alignment.
    R_Wim_Krijnen.md: Wim P. Krijnen (2009) Applied Statistics for Bioinformatics using R

----------

----------

# R packages

[パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

配列解析パッケージ [`seqinr`](https://cran.r-project.org/web/packages/seqinr/index.html) のインストール:  

    install.packages('seqinr')

ネットワーク分析パッケージ [igraph](http://igraph.org) のインストール:  

    install.packages('igraph')

- [R+igraph - Kazuhiro Takemoto](https://sites.google.com/site/kztakemoto/r-seminar-on-igraph---supplementary-information)

群集生態学パッケージ [`vegan`](https://cran.r-project.org/web/packages/vegan/index.html) のインストール:  

    install.packages('vegan')

Bioconductor パッケージ [`Biostrings`](http://bioconductor.org/packages/release/bioc/html/Biostrings.html) のインストール:  

    source('https://bioconductor.org/biocLite.R')
    biocLite('Biostrings')

パッケージの呼び出し:  

    library(seqinr)
    library(igraph)
    library(vegan)
    library(Biostrings)

Rのバージョンとパッケージを確認:  

    sessionInfo()

    # R version 3.3.0 (2016-05-03)

    # other attached packages:
    Biostrings_2.40.1    vegan_2.3-5    igraph_1.0.1    seqinr_3.1-3    ade4_1.7-4      

----------

## How to be a bioinformatician

![http://www.slideshare.net/ChristianFrech/how-to-be-a-bioinformatician](http://image.slidesharecdn.com/how-to-be-a-bioinformatician-public-140426130503-phpapp02/95/how-to-be-a-bioinformatician-2-638.jpg)

- [Bioinformatics Data Skills: Reproducible and Robust Research With Open Source Tools](https://www.safaribooksonline.com/library/view/bioinformatics-data-skills/9781449367480/ch01.html) "NEVER EVER TRUST YOUR TOOLS (OR DATA)"
- [So you want to be a computational biologist? ](http://www.nature.com/nbt/journal/v31/n11/full/nbt.2740.html) "Create tests, small datasets for which the answer is known, and check that the software or pipeline can reproduce that answer."
- [The five habits of bad bioinformaticians](http://www.opiniomics.org/the-five-habits-of-bad-bioinformaticians/) "Not writing tests"

テスト

    library("seqinr")  # Loading "seqinr" package
    x <- s2c("atgc")   # Create small data
    length(x)          # Length of a DNA sequence
    table(x)           # Base composition of a DNA sequence
    GC(x)              # GC Content of DNA
    count(x, word = 2) # Count oligomers

----------

