----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-05-30

----------

# Tree
[系統樹](https://ja.wikipedia.org/wiki/系統樹)

----------

## Table of Contents
- [2017-05-30](#2017-05-30)
- [Comparative Phylogenetics in R](#r-phylo)
  - [HowTo/DataTreeManipulation](#DataTreeManipulation)
- [Jun Inoue](#jun-inoue)
  - [R_JI](#r_ji)
- [biopapyrus](#biopapyrus)
  - [2015-05-04](#2015-05-04) 系統樹 ape ade4 | Rで系統樹を作成する方法
- [JIN'S PAGE](#jins-page)
  - [Chap_42](#chap_42) Rと系統樹(1)
  - [Chap_43](#chap_43) Rと系統樹(2)

----------
## 2017-05-30

### [Analysis of Phylogenetics and Evolution with R](https://github.com/haruosuz/books/tree/master/aper)

![](https://static-content.springer.com/cover/book/978-1-4614-1743-9.jpg)

### Running R

[R の起動と終了](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html)  

![http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/image/Mac.gif)

Rを終了:  

    quit()
    q()

## R packages

[パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

パッケージのインストール:  

    install.packages("seqinr")
    install.packages("ape")

パッケージの呼び出し:  

    library(seqinr)
    library(ape)

[ヘルプ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/07.html)

    help(plot.phylo)
    ?plot.phylo

    example(plot.phylo)
    example(nodelabels)

### Retrieving sequence data using R

http://www2.tba.t-com.ne.jp/nakada/takashi/phylogeny/hajikeju2.html
はじけじゅ

カモノハシ（AJ311679）、ネズミ （X00686）、 ヒト（M10098）、 ニワトリ（AF173612）
の配列をFASTA形式ファイルで取得:

    ACCESSIONs <- c("AJ311679", "X00686", "M10098", "AF173612")

    #install.packages("seqinr")
    library("seqinr") # Load the SeqinR package.

    # Retrieving sequence data using SeqinR
    eutils.ncbi.fasta <- function(ACCESSION) read.fasta(file = paste0("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=",ACCESSION,"&rettype=fasta&retmode=text"), strip.desc = TRUE)[[1]]
    ld <- lapply(ACCESSIONs, eutils.ncbi.fasta)

    # Writing sequence data out as a FASTA file
    write.fasta(sequences=ld, names=paste(sprintf("%02d", 1:length(ld)), sub("([^ ]+) ([^ ]+) (.+)", "\\2_\\1", getAnnot(ld)), sep="_"), file.out=paste0("hs_",format(Sys.time(), "%Y-%m-%d"),".fasta") )

http://www.ncbi.nlm.nih.gov/books/NBK25501/?term=Entrez%20Programming%20Utilities
Entrez Programming Utilities - Books - NCBI 

https://www.ncbi.nlm.nih.gov/books/NBK25499/ 
The E-utilities In-Depth: Parameters, Syntax and More - Entrez Programming Utilities Help - NCBI Bookshelf

https://www.ncbi.nlm.nih.gov/books/NBK25499/table/chapter4.T._valid_values_of__retmode_and/?report=objectonly
Table 1 – Valid values of &retmode and &rettype for EFetch (null = empty string)

| Record Type | &rettype | &retmode |
|:-----------:|:--------:|:--------:|
| FASTA | fasta | text | 
| GenBank flat file with full sequence (contigs) | gbwithparts | text |
| CDS protein FASTA | fasta_cds_aa | text |

    db = nuccore
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=$ACCESSION&rettype=fasta&retmode=text"
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=$ACCESSION&rettype=gbwithparts&retmode=text"
    "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=$ACCESSION&rettype=fasta_cds_aa&retmode=text"

----------

## [r-phylo](https://www.r-phylo.org)
Comparative Phylogenetics in R

http://www.r-phylo.org/wiki/HowTo/Table_of_Contents

### [GettingStarted](http://www.r-phylo.org/wiki/HowTo/GettingStarted)
http://www.r-phylo.org/wiki/HowTo/GettingStarted

	install.packages("ape")
	install.packages("geiger")

	update.packages()

### [DataTreeManipulation](http://www.r-phylo.org/wiki/HowTo/DataTreeManipulation)

	library(ape)
	library(geiger)

    geotree <- read.nexus("http://www.r-phylo.org/w/images/0/02/Geospiza.nex")
    geodata <- read.table("http://www.r-phylo.org/w/images/5/5c/Geospiza.txt")

How can I see a plot of my phylogeny?  
系統樹の作図

	plot.phylo(geotree)
	help(plot.phylo)
    example(plot.phylo)

How do I designate a specific taxon to be the root of my phylogeny?  
外群(outgroup)を指定して系統樹に根(root)をつける

    par(mfrow=c(2,2))
    plot.phylo(geotree)
    plot.phylo(root(geotree, "fusca"))
    plot.phylo(ladderize(root(geotree, "fusca"), right = TRUE))
    plot.phylo(ladderize(root(geotree, "fusca"), right = FALSE))

How can I resolve polytomies in my phylogeny?

    ?multi2di

How can I collapse very short branches into polytomies?  
非常に短い枝を多分岐(polytomy)にする

	collapsedgeotree <- di2multi(geotree, 0.03)

    par(mfrow=c(1,2))
    plot.phylo(geotree)
    plot.phylo(collapsedgeotree)

How can I see the length of the branches in my phylogeny?  
系統樹の枝長

	geotree$edge.length

How can I change the lengths of the branches in my phylogeny?  
系統樹の枝長を変える

    compute.brlen(geotree, method="Grafen")$edge.length
    compute.brlen(geotree, 1)$edge.length
    compute.brlen(geotree, c(1, 2))$edge.length

How can I see the list of taxa represented in my phylogeny?  
系統樹の生物群を表示

	 geotree$tip.label

How can I verify that the taxa listed in my data table match those at the tips of my phylogeny?  
系統樹とデータ表に含まれる生物群が一致することを確認

	library(geiger)

	name.check(geotree, geodata)
	geotree <- drop.tip(geotree, "olivacea")
    name.check(geotree, geodata)

Is there a shorthand way to refer to a specific list of taxa (for example, all members of a particular clade)?  
生物群のリスト（例えば、特定のクレードの全メンバー）を参照する

	cladeA = c("pauper", "psittacula", "parvulus")
    cladeA <- tips(geotree, 26)
	mrca(geotree)["pauper", "psittacula"]
    cladeA <- tips(geotree, mrca(geotree)["pauper", "psittacula"])

How can I remove taxa from my phylogeny?  
系統樹から生物群を除去

    par(mfrow=c(1,2))
    plot.phylo(geotree)
    plot.phylo(drop.tip(geotree, cladeA))

How can I identify all the branches belonging to a particular subclade?  
あるクレードに属する全ての枝を特定する

	geotree$edge

    geotree$edge[which.edge(geotree, cladeA), ]

How can I identify the node representing the most recent common ancestor of a pair of taxa?

	mrca(geotree)["pauper", "parvulus"]

	geotree$node.label<-((length(geotree$tip)+1):((length(geotree$tip)*2)-1))
    plot(geotree, show.node.label=TRUE)

How do I calculate the patristic distance between two taxa?  
2つの生物群間の距離を計算

	cophenetic(geotree)["pallida", "conirostris"]
	cophenetic(geotree)

How do I calculate the patristic distance between two internal nodes or an internal node and a tip?

	dist.nodes(geotree)
	dist.nodes(geotree)[15, 20]
    geotree$tip.label
	dist.nodes(geotree)[1, 15]

How do I calculate the distance from an internal node to the tips of an ultrametric phylogeny?

	branching.times(geotree)
    geotree$node.label

----------
## [Jun Inoue](http://www.geocities.jp/ancientfishtree/index.html)
### [R_JI](http://www.geocities.jp/ancientfishtree/R_JI.html)
**R - 井上 潤**

Package のインストール

	install.packages("ape")

ape: newick tree を描く

    system("
            curl -O http://www.geocities.jp/ancientfishtree/NewFiles/drawTree_fol.tar.gz
            tar xvzf drawTree_fol.tar.gz
            find drawTree_fol
            ")

    setwd(paste0(getwd(),"/drawTree_fol"))

	source('drawTree.R')

![](http://www.geocities.jp/ancientfishtree/NewFiles/drawTreeR.jpg)

ape: node number を確認する

----------
## [biopapyrus](https://biopapyrus.jp)
### 2015-05-04
[系統樹 ape ade4 | Rで系統樹を作成する方法](https://stat.biopapyrus.net/graph/r-phylogenetic-tree.html)

**系統樹データの読み込み**

	#install.packages("ape", dependencies = TRUE)
	#install.packages("ade4", dependencies = TRUE)

    packageVersion("ape")

    library(help=ape)
    library(help=ade4)

    library(ape)
    ls("package:ape")
    library(ade4)
    ls("package:ade4")

	# ape パッケージを利用して読み込む
	library(ape)

	# newick フォーマットの読み込み
	nw <- read.tree("https://stat.biopapyrus.net/data/newick-format.txt")	
	# nexus フォーマットの読み込み
	nx <- read.nexus("https://stat.biopapyrus.net/data/nexus-format.txt")

	# データの読み込み
	tree <- read.tree("https://stat.biopapyrus.net/data/newick-format.txt")
	# データの書き込み
	write.tree(tree, file="new.tre")    # newick フォーマット
	write.nexus(tree, file="new.nex")   # nexus フォーマット

	# ade4 パッケージを利用して読み込む
	library(ade4)
	# ファイルを 1 行ずつ読んで、 newick2phylog で変換
	fh <- file("https://stat.biopapyrus.net/data/newick-format.txt", "r")
	tree <- newick2phylog(readLines(fh, 1))

**ape を利用した系統樹作成**

	library(ape)
	tree <- read.tree("https://stat.biopapyrus.net/data/newick-format.txt")
    plot(tree)

![](https://stat.biopapyrus.net/media/r/ape-plot-basis.png)

    help(edgelabels)
    ?edgelabels
    example(edgelabels)

	# Sample 1
	plot(tree, main = "Sample 1")
    edgelabels(text = tree$edge.length)

	# Sample 2
	# 最後の枝のみに距離情報をつける場合
	plot(tree, main = "Sample 2")
	
	# 葉を持つ枝を特定して距離情報を代入する
	lastEdgeLabel <- tree$edge.length * as.numeric(tree$edge[,1] > tree$edge[,2])
	lastEdgeLabel <- ifelse(lastEdgeLabel == 0, NA, lastEdgeLabel)
	lastEdgeLabel[1] <- tree$edge.length[1]
	edgelabels(lastEdgeLabel, frame="none", bg="none")

![](https://stat.biopapyrus.net/media/r/ape-plot-edgelabel.png)

	plot(tree)
    nodelabels()

	# ノードが右上がりになるようにソート（逆はright = FALSEを指定）
	tree.sort <- ladderize(tree, right = TRUE)

	plot(tree.sort, type = "phylogram")

	# 横軸の追加
	axisPhylo()
	
	# スケールバーの追加
	add.scale.bar(length=0.05)

![](https://stat.biopapyrus.net/media/r/ape-plot-sortscale.png)

	plot(tree, y.lim = c(-0.5, tree$Nnode + 1))
	add.scale.bar(x=0, y = 0, length = 0.05)

**ade4 を利用した系統樹作成**

	# ade4パッケージの利用
	library(ade4)
	fh <- file("https://stat.biopapyrus.net/data/newick-format.txt", "r")
	tree <- newick2phylog(readLines(fh, 1))
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

	library(ape)
	data(woodmouse)
	str(woodmouse)
	base.freq(woodmouse)

### [Chap_43](http://mjin.doshisha.ac.jp/R/Chap_43/43.html)
**Rと系統樹(2)**

1．系統樹のデザインと操作
(1)　先端のデザイン

	library(ape);data(woodmouse);
	wood.dist<-dist.dna(woodmouse)
	wood.tr<-nj(wood.dist)
	lab<-c(rep(10,3),rep(11,2),rep(12,3), rep(13,7))　#印の番号を作成する
	plot(wood.tr, "c", FALSE, font = 1, label.offset = 2,x.lim = 20, no.margin = TRUE)
	tiplabels(pch =lab,col =lab, adj = 1.5, cex = 2)

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


http://www.cis.doshisha.ac.jp/mjin/R/42/42.html
Rと系統樹(1)

http://www.cis.doshisha.ac.jp/mjin/R/43/43.html
Rと系統樹(2)

### ape
https://sites.google.com/site/adversariaoftekijima/r/ape
ape - 日々草(TEKの備忘録)
takayuki kijima, 2015/04/25 16:23

http://lecture.ecc.u-tokyo.ac.jp/~aiwata/biostat_basic/2013/text4lec4_2.pdf
バイオスタティスティクス基礎論 第4回 講義テキスト
岩田洋佳
パッケージ ape 

### patristic distance
http://dendropy.readthedocs.io/en/latest/tutorial/treestats.html#patristic-distances
3.3. Tree Statistics, Metrics, and Calculations — DendroPy Phylogenetic Computing Library v3.12.1

### Grafen
https://www.fifthdimension.jp/wiki.cgi?page=FrontPage&file=20100522BiometricsJapanPreprint%2Epdf&action=ATTACH
田辺晶史, 2010, "ベイジアンMCMCによる生物間系統関係の推定法"
生物学における系統樹の必要性
系統関係=サンプル間の非依存性を考慮して統計解析を行うことでこのような問題を解決しようとする手法があり、系統的独立比較法などと呼ばれている (Felsenstein, 1985; Grafen, 1989)。
系統樹上での生物間のパスの長さの和=系統的多様性で置き換えることで解決しようという研究が徐々に増えてきている (Faith, 1992; Forest et al., 2007)。

### polytomy
http://nesseiken.info/Chiba_lab/index.php?cmd=read&page=授業%2FH18%2F進化生物学I%2F系統推定の基本用語
第２-４回授業：系統推定の基本用語 †
系統樹は通常、二分岐で表現される。多分岐（またはポリトミー polytomyと呼ぶ）の系統関係が意味するものは、

https://ww1.fukuoka-edu.ac.jp/~fukuhara/keitai/9-1.html
9-1. 被子植物の系統樹と分類
- 系統樹では、分岐点を「節」[node]、節と節とを結ぶ線を「枝」[branch]という。節ではふたまたに分岐する(二分岐)する場合も、3つ以上に分岐(多分岐[polytomy])することもある。

http://www.trifields.jp/r-cran-task-view-phylogenetics-especially-comparative-methods-845
R言語 CRAN Task View：系統学、特に比較方法 | トライフィールズ
- apeは、ランダムに、polytomiesを解決し、ブランチの長さを作成し、ツリーのサイズやその他のプロパティに関する情報を取得するための、より多くの機能を備えています。
- geigerは、分類群の重複セットに木やデータを整理することができます。

----------

