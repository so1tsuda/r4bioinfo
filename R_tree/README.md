----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-05-26

----------

# Tree
[系統樹](https://ja.wikipedia.org/wiki/系統樹)

## Table of Contents
- [Jun Inoue](http://www.geocities.jp/ancientfishtree/index.html)
  - [R](http://www.geocities.jp/ancientfishtree/R_JI.html)
- [biopapyrus](#biopapyrus)
  - [2015-05-04](#2015-05-04) 系統樹 ape ade4 | Rで系統樹を作成する方法
- [JIN'S PAGE](#jins-page)
  - [Chap_42](#chap_42) Rと系統樹(1)
  - [Chap_43](#chap_43) Rと系統樹(2)

----------
## [Jun Inoue](http://www.geocities.jp/ancientfishtree/index.html)
### [R](http://www.geocities.jp/ancientfishtree/R_JI.html)

Package のインストール

	install.packages("ape")

ape: newick tree を描く

    system("curl -O http://www.geocities.jp/ancientfishtree/NewFiles/drawTree_fol.tar.gz
            tar xvzf drawTree_fol.tar.gz
            find drawTree_fol
            ")

    setwd(paste0(getwd(),"/drawTree_fol"))

	source('drawTree.R')

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

----------

