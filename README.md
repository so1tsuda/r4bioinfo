----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-04-01

----------

# R for Bioinformatics
R言語を用いたバイオインフォマティクス

- [Avril Coghlan - Welcome to a Little Book of R for Bioinformatics!](https://github.com/haruosuz/r4bioinfo/tree/master/R_Avril_Coghlan)
- [R for Deep Learning](https://github.com/haruosuz/r4bioinfo/tree/master/R_Deep_Learning)
- [R for Machine Learning](https://github.com/haruosuz/r4bioinfo/tree/master/R_Machine_Learning)
- [msa: an R package for multiple sequence alignment.](https://github.com/haruosuz/r4bioinfo/tree/master/R_msa)
- [phangorn: Phylogenetic Analysis in R](https://github.com/haruosuz/r4bioinfo/tree/master/R_phangorn)
- [phytools: Phylogenetic Tools for Comparative Biology (and Other Things)](https://github.com/haruosuz/r4bioinfo/tree/master/R_phytools)
- [vegan: Community Ecology Package](https://github.com/haruosuz/r4bioinfo/tree/master/R_vegan)
- R_Wim_Krijnen.md: Wim P. Krijnen (2009) Applied Statistics for Bioinformatics using R

----------

## R packages

[パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

配列解析パッケージ [`seqinr`](https://cran.r-project.org/web/packages/seqinr/index.html) のインストール:  

    install.packages('seqinr')

進化系統解析パッケージ [`ape`](https://cran.r-project.org/web/packages/ape/index.html), [`phangorn`](https://cran.r-project.org/web/packages/phangorn/index.html) をインストールする:  

    install.packages('ape')
    install.packages('phangorn')

ネットワーク分析パッケージ [igraph](http://igraph.org) のインストール:  

    install.packages('igraph')

- [R+igraph - Kazuhiro Takemoto](https://sites.google.com/site/kztakemoto/r-seminar-on-igraph---supplementary-information)

群集生態学パッケージ [`vegan`](https://cran.r-project.org/web/packages/vegan/index.html) のインストール:  

    install.packages('vegan')

Bioconductor パッケージ [`Biostrings`](http://bioconductor.org/packages/release/bioc/html/Biostrings.html), [`msa`](https://bioconductor.org/packages/release/bioc/html/msa.html)のインストール:  

    source('https://bioconductor.org/biocLite.R')
    biocLite('Biostrings')
    biocLite('msa')

パッケージの呼び出し:  

    library(seqinr)
    library(ape)
    library(phangorn)
    library(igraph)
    library(vegan)
    library(Biostrings)
    library(msa)

Rのバージョンとパッケージを確認:  

    sessionInfo()

    # R version 3.3.0 (2016-05-03)
    # other attached packages:
    seqinr_3.1-3
    ade4_1.7-4
    ape_3.5
    phangorn_2.0.4
    igraph_1.0.1
    vegan_2.3-5
    msa_1.4.2
    Biostrings_2.40.1

----------
# References
## 日本語
http://www.iu.a.u-tokyo.ac.jp/~kadota/r.html
(Rで)マイクロアレイデータ解析

http://www.trifields.jp/r-cran-task-view-statistical-genetics-733
R言語 CRAN Task View：統計遺伝学 | トライフィールズ
Version:	2017-03-22

http://www.geocities.jp/ancientfishtree/R_JI.html
R - 井上 潤
2015 年 6 月 8 日　改訂

http://qa.lifesciencedb.jp/questions/512/rでfastaファイルを読み込む際におすすめのパッケージはありますか

### 驚異のアニヲタ社会復帰への道
http://d.hatena.ne.jp/MikuHatsune/20131214/1387003786
Rの初心者向けコード(生物系)
2013-12-14

http://d.hatena.ne.jp/MikuHatsune/20130621/1371803603
Ka/Ks (dN/dS) の計算
2013-06-21

http://d.hatena.ne.jp/MikuHatsune/20130404/1365068708
塩基配列上での変異とアミノ酸置換
2013-04-04

### A springtail's sigh/ウェブリブログ
http://tullbergia.at.webry.info/201108/article_1.html
phred互換の配列のクオリティファイルをR上で扱う： read.qual
2011/08/29

http://tullbergia.at.webry.info/201007/article_4.html
fastaファイルを一つにまとめる in R
2010/07/29

## 英語
https://www.biostars.org/p/539/
Recommend Your Favorite Introductory "R In Bioinformatics" Books And Resources

http://pop-gen.eu/wordpress/statistics-in-bioinformatics-using-r
Statistics in Bioinformatics using R | Population Genetics and Bioinformatics

http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html
Welcome to a Little Book of R for Bioinformatics! — Bioinformatics 0.1 documentation

http://faculty.washington.edu/kenrice/bigr/
R for large data & bioinformatics
28 November 2013 to 29 November 2013
Instructors: Thomas Lumley and Ken Rice

https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf
Applied Statistics for Bioinformatics using RWim P. Krijnen
November 10, 2009

----------

