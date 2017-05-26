----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-05-26

----------

# Tree
[系統樹](https://ja.wikipedia.org/wiki/系統樹)

## Table of Contents
- [Comparative Phylogenetics in R](#r-phylo)
  - [HowTo/DataTreeManipulation](#DataTreeManipulation)
- [Jun Inoue](http://www.geocities.jp/ancientfishtree/index.html)
  - [R](http://www.geocities.jp/ancientfishtree/R_JI.html)
- [biopapyrus](#biopapyrus)
  - [2015-05-04](#2015-05-04) 系統樹 ape ade4 | Rで系統樹を作成する方法
- [JIN'S PAGE](#jins-page)
  - [Chap_42](#chap_42) Rと系統樹(1)
  - [Chap_43](#chap_43) Rと系統樹(2)

----------

## [r-phylo](https://www.r-phylo.org)
### [DataTreeManipulation](http://www.r-phylo.org/wiki/HowTo/DataTreeManipulation)


    geotree <- read.nexus("http://www.r-phylo.org/w/images/0/02/Geospiza.nex")
    geodata <- read.table("http://www.r-phylo.org/w/images/5/5c/Geospiza.txt")

How do I designate a specific taxon to be the root of my phylogeny?

    plot.phylo(geotree)
    plot.phylo(root(geotree, "fusca"))
    plot.phylo(ladderize(root(geotree, "fusca"), right = TRUE))
    plot.phylo(ladderize(root(geotree, "fusca"), right = FALSE))



----------
## [Jun Inoue](http://www.geocities.jp/ancientfishtree/index.html)
### [R](http://www.geocities.jp/ancientfishtree/R_JI.html)

Package のインストール


ape: newick tree を描く

    system("curl -O http://www.geocities.jp/ancientfishtree/NewFiles/drawTree_fol.tar.gz
            tar xvzf drawTree_fol.tar.gz
            find drawTree_fol
            ")

    setwd(paste0(getwd(),"/drawTree_fol"))


![](http://www.geocities.jp/ancientfishtree/NewFiles/drawTreeR.jpg)

ape: node number を確認する

----------
## [biopapyrus](https://biopapyrus.jp)
### 2015-05-04
[系統樹 ape ade4 | Rで系統樹を作成する方法](https://stat.biopapyrus.net/graph/r-phylogenetic-tree.html)

**系統樹データの読み込み**


    packageVersion("ape")

    library(help=ape)
    library(help=ade4)

    library(ape)
    ls("package:ape")
    library(ade4)
    ls("package:ade4")





**ape を利用した系統樹作成**

    plot(tree)

![](https://stat.biopapyrus.net/media/r/ape-plot-basis.png)

    help(edgelabels)
    ?edgelabels
    example(edgelabels)

    edgelabels(text = tree$edge.length)


![](https://stat.biopapyrus.net/media/r/ape-plot-edgelabel.png)

    nodelabels()




![](https://stat.biopapyrus.net/media/r/ape-plot-sortscale.png)


**ade4 を利用した系統樹作成**

    plot(tree)

    help(plot.phylog)
    ?plot.phylog
    example(plot.phylog)


----------
## [JIN'S PAGE](http://mjin.doshisha.ac.jp/R/)

### [Chap_42](http://mjin.doshisha.ac.jp/R/Chap_42/42.html)
**Rと系統樹(1)**

1．系統樹
2．系統樹の推定 (距離法)
(1)　距離


### [Chap_43](http://mjin.doshisha.ac.jp/R/Chap_43/43.html)
**Rと系統樹(2)**

1．系統樹のデザインと操作
(1)　先端のデザイン


----------
## Execution environment

    > sessionInfo()
    R version 3.3.3 (2017-03-06)
    Platform: x86_64-apple-darwin13.4.0 (64-bit)
    Running under: OS X Mavericks 10.9.5

----------
## Acknowledgements

----------
## References

https://www.r-phylo.org
Comparative Phylogenetics in R

http://www.r-phylo.org/wiki/HowTo/DataTreeManipulation
HowTo/DataTreeManipulation - Comparative Phylogenetics in R

  library(ape)
  library(geiger)




----------

