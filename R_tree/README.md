Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2018-01-21

----------

# Tree
[系統樹](https://ja.wikipedia.org/wiki/系統樹)

----------

## Table of Contents
- [2017-05-30](#2017-05-30)
- [Comparative Phylogenetics in R](#r-phylo)
  - [GettingStarted](#gettingstarted)
  - [Basics](#basics)
  - []()
  - [DataTreeManipulation](#DataTreeManipulation)
- [Jun Inoue](#jun-inoue)
  - [R_JI](#r_ji) R - 井上 潤
- [biopapyrus](#biopapyrus)
  - [2017-12-29](#2017-12-29) 系統樹 ape ade4 | Rで系統樹を作成する方法
- [JIN'S PAGE](#jins-page)
  - [Chap_42](#chap_42) Rと系統樹(1)
  - [Chap_43](#chap_43) Rと系統樹(2)

----------

## 2017-05-30

### [Analysis of Phylogenetics and Evolution with R](https://github.com/haruosuz/books/tree/master/aper)

![](https://static-content.springer.com/cover/book/978-1-4614-1743-9.jpg)

### Running R
- [R言語入門 (全13回) - プログラミングならドットインストール](http://dotinstall.com/lessons/basic_r)

[R の起動と終了](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html)  

![](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/image/windows.gif)

![http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/image/Mac.gif)

Rを終了:  

    quit()

- [Rの初歩](https://oku.edu.mie-u.ac.jp/~okumura/stat/first.html)
終了のしかた
`.RData`
`.Rhistory`

## R packages

[パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

パッケージのインストール:  

    install.packages("ape")

    install.packages("seqinr")

パッケージの呼び出し:  

    library(ape)

    library(seqinr)

[ヘルプ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/07.html)

    help(plot.phylo)

    example(plot.phylo)
    example(nodelabels)

### Retrieving sequence data using R
[はじけじゅ](http://www2.tba.t-com.ne.jp/nakada/takashi/phylogeny/hajikeju2.html)の例：
カモノハシ（AJ311679）、ネズミ （X00686）、 ヒト（M10098）、 ニワトリ（AF173612）
の配列をFASTA形式ファイルとして保存する。（ファイル名の例:
[seq_20170531.fasta](https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_tree/examples/seq_20170531.fasta), 
[seq_20170613.fasta](https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_tree/examples/seq_20170613.fasta)）


作業ディレクトリにファイル
[get_fasta.R](https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_tree/examples/get_fasta.R)
と
[Accession_List.txt](https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_tree/examples/Accession_List.txt)
を保存する。

[作業ディレクトリ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/06.html)の変更と確認:  

    # Set Working Directory
    setwd("~/Desktop/R_Lessons/")

    # Get Working Directory
    getwd()

    # List the Files in a Directory
    dir()

以下の(1)と(2)の何れかを実行する。

(1) Rコンソールで[`source()`](http://www.yukun.info/blog/2008/09/r-read-source-file.html)を実行する:  

    source("get_fasta.R")

(2) ターミナルで[`Rscript`](https://stat.biopapyrus.net/dev/commandline.html)
を実行する:  

    Rscript --vanilla get_fasta.R

----------

## [r-phylo](https://www.r-phylo.org)
Phylogenetic comparative methods
系統比較法

### [HowTo/Table of Contents](https://www.r-phylo.org/wiki/HowTo/Table_of_Contents)
3 December 2012

### [GettingStarted](http://www.r-phylo.org/wiki/HowTo/GettingStarted)
13 March 2008

	# Installing R and Packages
	install.packages("ape")
	install.packages("geiger")
	update.packages()

### [Basics](https://www.r-phylo.org/wiki/HowTo/Basics)

	# Loading packages
	library(ape)
	# Accessing help
	library(help=ape)
	?pic
	help.search("phylogenetic")

### 

https://www.r-phylo.org/wiki/HowTo/InputtingTrees

https://www.r-phylo.org/wiki/HowTo/InputtingData

### [DataTreeManipulation](https://www.r-phylo.org/wiki/HowTo/DataTreeManipulation)
14 March 2008

![https://ja.wikipedia.org/wiki/ガラパゴスフィンチ属](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Geospiza_fuliginosa_976.jpg/250px-Geospiza_fuliginosa_976.jpg)

パッケージ`ape`をロードし、
[ガラパゴスフィンチ属](https://ja.wikipedia.org/wiki/ガラパゴスフィンチ属)の系統樹([Geospiza.nex](https://www.r-phylo.org/w/images/0/02/Geospiza.nex))とデータ表([Geospiza.txt](http://www.r-phylo.org/w/images/5/5c/Geospiza.txt))を読み込む:  

	library(ape)

    geotree <- read.nexus("http://www.r-phylo.org/w/images/0/02/Geospiza.nex")
    geodata <- read.table("http://www.r-phylo.org/w/images/5/5c/Geospiza.txt")

    str(geotree)

How can I see a plot of my phylogeny?  
系統樹を図示

	plot.phylo(geotree)
	help(plot.phylo)

How can I see the list of taxa represented in my phylogeny?  
系統樹の生物群を表示

	 geotree$tip.label

How do I designate a specific taxon to be the root of my phylogeny?  
外群(outgroup)を指定して系統樹に根(root)をつける

    par(mfrow=c(2,2))
    plot.phylo(geotree)
    plot.phylo(root(geotree, "fusca"))
    plot.phylo(ladderize(root(geotree, "fusca"), right = TRUE))
    plot.phylo(ladderize(root(geotree, "fusca"), right = FALSE))

How can I see the length of the branches in my phylogeny?  
系統樹の枝長を表示

	geotree$edge.length

How can I change the lengths of the branches in my phylogeny?  
系統樹の枝長を変更

    # ultrametricize
    compute.brlen(geotree, method="Grafen")$edge.length
    compute.brlen(geotree, method = 1)$edge.length
    compute.brlen(geotree, method = c(1, 2))$edge.length

How can I collapse very short branches into polytomies?  
非常に短い枝を多分岐(polytomy)に変更

    collapsedgeotree <- di2multi(geotree, tol = 0.03) # tolerance

    par(mfrow=c(1,2))
    plot.phylo(geotree)
    plot.phylo(collapsedgeotree)

How can I resolve polytomies in my phylogeny?

    ?multi2di

How can I verify that the taxa listed in my data table match those at the tips of my phylogeny?  
系統樹([Geospiza.nex](https://www.r-phylo.org/w/images/0/02/Geospiza.nex))とデータ・テーブル([Geospiza.txt](http://www.r-phylo.org/w/images/5/5c/Geospiza.txt))に含まれる生物群が一致するか確認

	library(geiger)

	name.check(geotree, geodata)
	geotree <- drop.tip(geotree, "olivacea")
    name.check(geotree, geodata)

Is there a shorthand way to refer to a specific list of taxa (for example, all members of a particular clade)?  
生物群のリスト（例えば、特定のクレードの全メンバー）を参照

    plot.phylo(geotree)
    nodelabels()

	cladeA = c("pauper", "psittacula", "parvulus")
    # ‘node.leaves’ is being deprecated: use ‘tips’ instead
    tips(geotree, 24)
    cladeA <- tips(geotree, mrca(geotree)["pauper", "psittacula"])

How can I remove taxa from my phylogeny?  
系統樹から生物群を除去

    par(mfrow=c(1,2))
    plot.phylo(geotree)
    plot.phylo(drop.tip(geotree, cladeA))

How can I identify all the branches belonging to a particular subclade?  
特定のクレードに属する全ての枝 (branch, edge) を特定

	geotree$edge

    geotree$edge[which.edge(geotree, cladeA), ]

How can I identify the node representing the most recent common ancestor of a pair of taxa?  
生物群の[最近共通祖先 (MRCA) ](https://ja.wikipedia.org/wiki/最も近い共通祖先)を表す節 (分岐点, node) を特定

	mrca(geotree)["pauper", "parvulus"]

	geotree$node.label<-((length(geotree$tip)+1):((length(geotree$tip)*2)-1))
    plot(geotree, show.node.label=TRUE)

How do I calculate the patristic distance between two taxa?  
2つの生物群間の[系統経路距離 (patristic distance) ](http://leeswijzer.org/diary2003-09.html#22)を計算

	cophenetic(geotree)["pallida", "conirostris"]
	cophenetic(geotree)

How do I calculate the patristic distance between two internal nodes or an internal node and a tip?  
2つの内部節 (internal node) または 内部節と末端節 (OTU) の間の距離を計算

	dist.nodes(geotree)
	dist.nodes(geotree)[15, 20]
    geotree$tip.label
	dist.nodes(geotree)[1, 15]

How do I calculate the distance from an internal node to the tips of an ultrametric phylogeny?  
超距離 (ultrametric) 系統樹の内部節から末端節 (OTU) までの距離を計算

	branching.times(geotree)

----------
## [Jun Inoue](http://www.geocities.jp/ancientfishtree/index.html)
### [R_JI](http://www.geocities.jp/ancientfishtree/R_JI.html)
**R - 井上 潤**
2015 年 6 月 8 日　改訂

#### ape: newick tree を描く

    system("curl -O http://www.geocities.jp/ancientfishtree/NewFiles/drawTree_fol.tar.gz
            tar xvzf drawTree_fol.tar.gz
            find drawTree_fol")

    setwd("./drawTree_fol")

	source('drawTree.R')



	# 系統樹を書いたときに，上にルートが来るようにする
	MyTree <- ladderize(MyTree)
	# 系統樹を書いたときに，下にルートが来るようにする
	MyTree <- ladderize(MyTree,FALSE)


#### ape: node number を確認する

http://www.r-phylo.org/wiki/HowTo/DataTreeManipulation#How_can_I_identify_the_node_representing_the_most_recent_common_ancestor_of_a_pair_of_taxa.3F

----------
## [biopapyrus](https://biopapyrus.jp)
### 2017-12-29
[系統樹 ape ade4 | R を利用した系統樹の描き方](https://stats.biopapyrus.jp/r/graph/phylogenetic-tree.html)

#### ade4

	library(ade4)
    tree <- newick2phylog("((A:0.3,B:0.2):0.4,C:0.6,D:0.8);")
	plot(tree, cleaves = 2, cnodes = 2)

#### ape

	library(ape)
	tree <- read.tree("https://stats.biopapyrus.jp/data/species_tree.txt")
    plot(tree)

**エッジラベル**

	# Sample 1
	plot(tree, main = "Sample 1")
    edgelabels(text = tree$edge.length)
	
	# Sample 2

Error in text.default(XX, YY, text, adj = adj, col = col, ...) : 
  zero-length 'labels' specified

**ノードラベル**

	plot(tree)
    nodelabels()

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

    b.f <- sapply(woodmouse,base.freq)
    barplot(b.f, las=2, legend.text = rownames(b.f))

![](http://mjin.doshisha.ac.jp/R/Chap_42/image2.jpg)

	dist.dna(woodmouse[1:5,])
	dist.dna(woodmouse[1:5,],model="GG95")

    ?dist.gene

(2)　UPGMA系統樹

	wm.d<-dist.dna(woodmouse)
	wm.hc<-hclust(wm.d,"average")
	wm.phy<-as.phylo(wm.hc)
	plot(wm.phy)

(3)　関数 plot.phylo

    par(mfrow=c(2,2))
	plot(wm.phy,type="c")	　#図(a)
	plot(wm.phy,type="c",use.edge.length = FALSE) 　#図(b)
	plot(wm.phy,type="r")	　#図(c)
	plot(wm.phy,type="u",use.edge.length = FALSE,lab4ut="axial")	　#図(d)

(4)　近隣結合法 (NJ: Neighbor-Joining)

	wm.d<-dist.dna(woodmouse)
	wm.nj<-nj(wm.d)
	plot(wm.nj)
	plot(wm.nj,type="u",use.edge.length = FALSE,lab4ut="axial")

距離マトリックスを基に最小スパニング樹 (spanning tree) を作成する

    example(mst)

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

### eutils.ncbi

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

### polytomy
http://nesseiken.info/Chiba_lab/index.php?cmd=read&page=授業%2FH18%2F進化生物学I%2F系統推定の基本用語
第２-４回授業：系統推定の基本用語 †
- 分類群 (taxon, 複数形はtaxa)　名称の与えられた、生物群。
- 末端節 (ターミナルノード、terminal node; 外部節 external nodeともいう）はそれに続く枝を持たない節。末端節はOTUs(オーティーユー、操作的分類単位 Operational Taxonomic Units）を示す。
- 内部節（インターナルノード、internal node) は末端でない節。HTUs (エイチティーユー、仮想的分類単位 Hypothetical taxonomic units）を示す。
- 系統樹は通常、二分岐で表現される。多分岐（またはポリトミー polytomyと呼ぶ）の系統関係が意味するものは、

https://ww1.fukuoka-edu.ac.jp/~fukuhara/keitai/9-1.html
9-1. 被子植物の系統樹と分類
- 系統樹では、分岐点を「節」[node]、節と節とを結ぶ線を「枝」[branch]という。節ではふたまたに分岐する(二分岐)する場合も、3つ以上に分岐(多分岐[polytomy])することもある。

http://www.trifields.jp/r-cran-task-view-phylogenetics-especially-comparative-methods-845
R言語 CRAN Task View：系統学、特に比較方法 | トライフィールズ
- apeは、ランダムに、polytomiesを解決し、ブランチの長さを作成し、ツリーのサイズやその他のプロパティに関する情報を取得するための、より多くの機能を備えています。
- geigerは、分類群の重複セットに木やデータを整理することができます。

### ultrametric
https://en.wikipedia.org/wiki/Distance_matrices_in_phylogeny
- it assumes an ultrametric tree in which the distances from the root to every branch tip are equal.
- UPGMA assumes an ultrametric tree (a tree where all the path-lengths from the root to the tips are equal). 

https://ja.wikipedia.org/wiki/超距離空間
ultra­metric space
超距離はまた、UPGMAやWPGMAを使った系統樹の構成や分類学において利用されている[6]。

http://www.alife.cs.is.nagoya-u.ac.jp/~ari/stuff/papers/ipsjz08-meme.pdf
Ultrametric(Additive Metric のうち,進化􏰀度一定の場合に生成される距離空間)

http://cse.naro.affrc.go.jp/minaka/files/phylogenetics.html
第７章では，距離行列からの系統推定を中心に，超計量（ultrametric）やスプリット分割が論じられる．

https://www.mail-archive.com/r-sig-phylo@r-project.org/msg00850.html
Re: [R-sig-phylo] Ultrametricize?

https://www.ncbi.nlm.nih.gov/pubmed/2575770
Philos Trans R Soc Lond B Biol Sci. 1989 Dec 21;326(1233):119-57.
The phylogenetic regression.
Grafen A1.

https://www.fifthdimension.jp/wiki.cgi?page=FrontPage&file=20100522BiometricsJapanPreprint%2Epdf&action=ATTACH
田辺晶史, 2010, "ベイジアンMCMCによる生物間系統関係の推定法"
生物学における系統樹の必要性
系統関係=サンプル間の非依存性を考慮して統計解析を行うことでこのような問題を解決しようとする手法があり、系統的独立比較法などと呼ばれている (Felsenstein, 1985; Grafen, 1989)。

### patristic distance
http://dendropy.readthedocs.io/en/latest/tutorial/treestats.html#patristic-distances

http://leeswijzer.org/diary2003-09.html
〈patristic distance〉の訳語は【系図的距離】でキマリです．
経路距離〈path-length distance〉あるいは樹距離〈tree distance〉という，より通りのよい名称で知られている概念と一致するように思われる．
グラフとしての樹の上で定義される距離が patristic distance ということ． 

http://leeswijzer.tumblr.com
系統経路距離（patristic distance）

http://leeswijzer.org/diary2014-04.html
Patristic distance は事前に推定した言語系統樹に沿って計算した． 

http://cse.naro.affrc.go.jp/minaka/files/KawakitaHandout.pdf
経路距離
Patristic distance

http://feynmanino.watson.jp/4500_model-organisms.html
「patristic distance」は、２つの種の「（教父的な（？））系統経路距離」というテクニカルタームだそうです。何故「教父」なのか？、といえば、「系図」は父系の「lexicon」だから、なのだそうです。

http://bioinf.mind.meiji.ac.jp/lab/index.php?itemid=12
patristic distance 推定距離 

----------

