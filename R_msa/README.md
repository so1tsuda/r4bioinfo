----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-07-11  

----------

- [シーケンスアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント)
 - [ペアワイズアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E3.83.9A.E3.82.A2.E3.83.AF.E3.82.A4.E3.82.BA.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88) pairwise alignment
 - [多重配列アライメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E5.A4.9A.E9.87.8D.E9.85.8D.E5.88.97.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.A1.E3.83.B3.E3.83.88) multiple alignment

【デモ】

	# 多重配列アライメント
	library(msa)
	example(msa)

	# 系統解析
	library(ape)
	example(plot.phylo)

# Multiple sequence alignment

![https://ja.wikipedia.org/wiki/多重整列](https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/RPLP0_90_ClustalW_aln.gif/575px-RPLP0_90_ClustalW_aln.gif)

- [Multiple sequence alignment](https://en.wikipedia.org/wiki/Multiple_sequence_alignment) [多重整列](https://ja.wikipedia.org/wiki/多重整列) [マルチプルアライメント](http://bio-info.biz/protein/method_msa.html)
- [ソフトウェア - 生物情報解析システム](http://www.nibb.ac.jp/cproom/wiki/index.php/ソフトウェア#.E3.83.9E.E3.83.AB.E3.83.81.E3.83.97.E3.83.AB.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.A1.E3.83.B3.E3.83.88)
  - [Bioinformatics Tools for Multiple Sequence Alignment < EMBL-EBI](http://www.ebi.ac.uk/Tools/msa/)
  - [Clustal](https://ja.wikipedia.org/wiki/Clustal)
  - [clustalwを利用した系統樹の作成方法 - バイオインフォマティクス初心者の日常](http://sy41211.hatenablog.com/entry/2015/12/15/040041)
  - [ClustalWを使い倒す 2011 - 統合TV (togotv)(2011-02-16)](http://togotv.dbcls.jp/20110216.html)
  - [MAFFT を使ってマルチプルアラインメントを行う - 統合TV (togotv)(2015-04-13)](http://togotv.dbcls.jp/20150413.html)
  - [井上 潤：MUSCLE](http://www.geocities.jp/ancientfishtree/MUSCLE.html)
  - [MAFFT - 井上 潤](http://www.geocities.jp/ancientfishtree/MAFFT.html)

----------

# msa
- [msa: an R package for multiple sequence alignment. Bioinformatics. 2015 Dec 15](http://www.ncbi.nlm.nih.gov/pubmed/26315911)  
- [Bioconductor - msa](https://bioconductor.org/packages/release/bioc/html/msa.html)

| Version | 1.4.2 ||
|:---------|:---------|:---------|
| [PDF](https://bioconductor.org/packages/release/bioc/vignettes/msa/inst/doc/msa.pdf) | [R Script](https://bioconductor.org/packages/release/bioc/vignettes/msa/inst/doc/msa.R) | msa - An R Package for Multiple Sequence Alignment |
| [PDF](https://bioconductor.org/packages/release/bioc/manuals/msa/man/msa.pdf) |  | Reference Manual |

## [An R Package for Multiple Sequence Alignment](http://bioconductor.org/packages/devel/bioc/vignettes/msa/inst/doc/msa.pdf)
Version 1.5.2, May 2, 2016  

### 2 Installation

Bioconductor パッケージ [`msa`](https://bioconductor.org/packages/release/bioc/html/msa.html) のインストールと呼び出し:  

	source("http://www.bioconductor.org/biocLite.R")
	biocLite("msa")

	library(msa)

    example(msa)

### 3 msa for the Impatient

	# load amino acid sequences from one of the example files that are supplied with the msa package:
	mySequenceFile <- system.file("examples", "exampleAA.fasta", package="msa")
	mySequences <- readAAStringSet(mySequenceFile)
	mySequences

	# run the msa() function which, by default, runs ClustalW with default parameters:
	myFirstAlignment <- msa(mySequences)
	myFirstAlignment

	# print() provides some ways for customizing the output,
	# showing the entire alignment split over multiple blocks of sub-sequences:
	print(myFirstAlignment, show="complete")

	# msaPrettyPrint() allows for pretty-printing multiple alignments
	# creates a PDF file myfirstAlignment.pdf (Figure 1):
	msaPrettyPrint(myFirstAlignment, output="pdf", showNames="none", showLogo="none", askForOverwrite=FALSE, verbose=FALSE)

### 4 Functions for Multiple Sequence Alignment in More Detail

	# call the function msa() with additional arguments
	# explicitly request ClustalW, ClustalOmega or MUSCLE:
	myClustalWAlignment <- msa(mySequences, "ClustalW")
	myClustalWAlignment

	myClustalOmegaAlignment <- msa(mySequences, "ClustalOmega")
	myClustalOmegaAlignment

	myMuscleAlignment <- msa(mySequences, "Muscle")
	myMuscleAlignment

### 6 Processing Multiple Alignments
#### 6.1 Methods Inherited From Biostrings
#### 6.2 Interfacing to Other Packages

`msaConvert()` converts multiple sequence alignment objects to other types/classes: `alignment` (used by `seqinr` package) and `align` (used by `bios2mds` package).

	# multiple alignment of Hemoglobin alpha example sequences
	hemoSeq <- readAAStringSet(system.file("examples/HemoglobinAA.fasta", package="msa"))
	hemoAln <- msa(hemoSeq)
	hemoAln

	# convert the result for later processing with the seqinr package:

	#hemoAln2 <- msaConvert(hemoAln, type="seqinr::alignment")
	エラー:  オブジェクト 'msaConvert' がありません 

    解決策

    # write Multiple Sequence Alignments to a file
    writeXStringSet(unmasked(hemoAln), file="hemoAln.fasta")

    library(seqinr)
    hemoAln2 <- read.alignment("hemoAln.fasta", format="fasta", forceToLower=FALSE)

	# compute a distance matrix using the dist.alignment() function from the seqinr package:
	d <- dist.alignment(hemoAln2, "identity")
	as.matrix(d)[3:4, 3:4]

	# construct a draft phylogenetic tree using the hclust() function from the stats package:
	hemoTree <- hclust(d)
	plot(hemoTree, main="Phylogenetic Tree of Hemoglobin Alpha Sequences", xlab="", sub="")

### 7 Pretty-Printing Multiple Sequence Alignments
#### 7.1 Consensus Sequence and Sequence Logo

	# consensus sequence — sequence logos
    msaPrettyPrint(myFirstAlignment, output="pdf", y=c(164, 213),
               subset=c(1:6), showNames="none", showLogo="top",
               logoColors="rasmol", shadingMode="similar",
               showLegend=FALSE, askForOverwrite=FALSE)

- [新しい系統樹では細菌が圧倒的に優勢](http://www.natureasia.com/ja-jp/life-sci/research/10626) [A new view of the tree of life : Nature Microbiology](http://www.nature.com/articles/nmicrobiol201648)
- [archief voor stambomen 系統樹ハンターの狩猟記録](http://leeswijzer.hatenablog.com)
- [棒の手紙](https://ja.wikipedia.org/wiki/チェーンメール#.E6.A3.92.E3.81.AE.E6.89.8B.E7.B4.99)
  - [これが「棒の手紙」だ！](http://homepage3.nifty.com/hirorin/bonotegami.htm)

----------

# Phylogenetics

- [系統樹](https://ja.wikipedia.org/wiki/系統樹) [Phylogenetic tree](https://en.wikipedia.org/wiki/Phylogenetic_tree)
- [系統学](https://ja.wikipedia.org/wiki/系統学) [Phylogenetics](https://en.wikipedia.org/wiki/Phylogenetics)
- [分子系統学](https://ja.wikipedia.org/wiki/分子系統学) [Molecular phylogenetics](https://en.wikipedia.org/wiki/Molecular_phylogenetics)

![https://ja.wikipedia.org/wiki/系統樹](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Tree_of_life_ja.svg/350px-Tree_of_life_ja.svg.png)

【デモ】

    #install.packages("ape")
    library(ape)
    example(plot.phylo) # Plot Phylogenies

【例題】[ヘモグロビン](https://ja.wikipedia.org/wiki/ヘモグロビン)αサブユニットのタンパク質配列の系統解析

	library(msa)

	# multiple alignment of Hemoglobin alpha example sequences
	hemoSeq <- readAAStringSet(system.file("examples/HemoglobinAA.fasta", package="msa"))
	hemoAln <- msa(hemoSeq)
	hemoAln

    # write Multiple Sequence Alignments to a file
    writeXStringSet(unmasked(hemoAln), file="hemoAln.fasta")

    #install.packages("phangorn")
    library(phangorn) # read.aa # dist.ml
    # Read Amino Acid Sequences in a File
    aln <- read.aa(file = "hemoAln.fasta", format = "fasta")
    # Pairwise Distances from Sequences
    d <- dist.ml(aln, model="WAG")

    # 非加重結合法 UPGMA (Unweighted Pair Group Method with Arithmetic mean)
    plot(as.phylo(hclust(d, "average")))

    # 近隣結合法 NJ (Neighbor-Joining)
    plot(nj(d))

- [非加重結合法 UPGMA (Unweighted Pair Group Method with Arithmetic mean)](https://ja.wikipedia.org/wiki/非加重結合法)
- [近隣結合法 NJ (Neighbor-Joining)](https://ja.wikipedia.org/wiki/近隣結合法)

- [平成21年度ゲノムリテラシー講座 分子系統解析 講義資料 (PDF)](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_4_3.pdf)

- [微生物の系統樹,どう描くの?(続・生物工学基礎講座-バイオよもやま話-) 飯野 隆夫*・伊藤  隆](https://www.sbj.or.jp/wp-content/uploads/file/sbj/9110/9110_yomoyama.pdf)
- [SeaView 使用法](http://www2.tba.t-com.ne.jp/nakada/takashi/phylogeny/seaview2.html)
- [FigTree - 井上潤](http://www.geocities.jp/ancientfishtree/FigTree.html)
- Rによる系統解析
  - [R - 井上 潤](http://www.geocities.jp/ancientfishtree/R_JI.html)
  - [系統樹 ape ade4 | Rで系統樹を作成する方法](http://stat.biopapyrus.net/graph/r-phylogenetic-tree.html)
  - [Rと系統樹(1)](https://www1.doshisha.ac.jp/~mjin/R/42/42.html)
  - [Rと系統樹(2)](https://www1.doshisha.ac.jp/~mjin/R/43/43.html)
- [Lab 1: Biostrings in R](https://web.stanford.edu/class/bios221/labs/biostrings/lab_1_biostrings.html)
- 2016/06/23 [(Rで)塩基配列解析](http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html)
- 2016/05/25 [(Rで)マイクロアレイデータ解析](http://www.iu.a.u-tokyo.ac.jp/~kadota/r.html)
- http://qa.lifesciencedb.jp/questions/512/rでfastaファイルを読み込む際におすすめのパッケージはありますか
- readDNAStringSet
  - [wakuteka/writeXStringset.R](https://gist.github.com/wakuteka/8050846)
  - [R/Bioconductorでmultifasta形式をsinglefasta形式に変換する - 僕らはRを愛しすぎてる](http://wakuteka.hatenablog.jp/entry/2013/12/20/153421)
  - Feb 13, 2013 [Biostrings::readDNAStringSetで読み込んだmultifastaファイルの塩基配列部分を抽出する](http://qiita.com/wakuteka/items/5bef7c5e1dfd92c247f2)
  - [Bioconductor: Genomicデータ解析ツール群 - Watal M. Iwasaki](https://heavywatal.github.io/rstats/bioconductor.html)


[Special Story：ゲノムから進化を探る研究-BRH - JT生命誌研究館](https://www.brh.co.jp/seimeishi/journal/029/ss_3.html)

Gタンパク質族の分子系統樹。

![](https://www.brh.co.jp/seimeishi/journal/029/img/03-3_1.gif)

![](https://www.brh.co.jp/seimeishi/journal/029/img/03-3_2.gif)


----------

    ls("package:msa")

# ape
ape: Analyses of Phylogenetics and Evolution
- [CRAN - Package ape](https://cran.r-project.org/web/packages/ape/index.html) | Reference manual: [ape.pdf](https://cran.r-project.org/web/packages/ape/ape.pdf)

# phangorn
phangorn: Phylogenetic Analysis in R
- [CRAN - Package phangorn](https://cran.r-project.org/web/packages/phangorn/index.html)

----------

# Acknowledgements
I am grateful to Dr. Ulrich Bodenhofer for his technical advice on msa: an R package for multiple sequence alignment.

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

# [SeqinR](https://cran.r-project.org/web/packages/seqinr/index.html)

配列解析

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

2016-06-01  

[分子生物学](https://ja.wikibooks.org/wiki/分子生物学)  

![https://ja.wikibooks.org/wiki/分子生物学](https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Difference_DNA_RNA-EN.svg/400px-Difference_DNA_RNA-EN.svg.png)

RNAとDNA、それぞれの核酸塩基

![https://ja.wikibooks.org/wiki/分子生物学](https://upload.wikimedia.org/wikipedia/commons/6/68/Central_Dogma_of_Molecular_Biochemistry_with_Enzymes.jpg)

DNAの複製 (replication)   
転写 (transcription)：DNAからRNAへ  
翻訳 (translation)：RNAからタンパク質へ  

![http://www.tokresource.org/tok_classes/biobiobio/biomenu/transcription_translation/](http://www.tokresource.org/tok_classes/biobiobio/biomenu/transcription_translation/rna-transcription.jpg)

![http://www.jalview.org/help/html/misc/aaproperties.html](http://www.jalview.org/help/html/misc/properties.gif)

[アミノ酸の性質](http://www.jalview.org/help/html/misc/aaproperties.html)

![https://www.nig.ac.jp/labs/EvoGen/research/yeast.html](https://www.nig.ac.jp/labs/EvoGen/img/aa_usage_90c.jpg)

[アミノ酸使用と転写量の相関](https://www.nig.ac.jp/labs/EvoGen/research/yeast.html)

----------


