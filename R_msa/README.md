----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-06-23  

----------
# Multiple sequence alignment

![https://ja.wikipedia.org/wiki/多重整列](https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/RPLP0_90_ClustalW_aln.gif/575px-RPLP0_90_ClustalW_aln.gif)

- [多重整列](https://ja.wikipedia.org/wiki/多重整列) [Multiple sequence alignment](https://en.wikipedia.org/wiki/Multiple_sequence_alignment)
- [マルチプルアライメント](http://bio-info.biz/protein/method_msa.html)
- [ソフトウェア](http://www.nibb.ac.jp/cproom/wiki/index.php/ソフトウェア#.E3.83.9E.E3.83.AB.E3.83.81.E3.83.97.E3.83.AB.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.A1.E3.83.B3.E3.83.88)
  - [Bioinformatics Tools for Multiple Sequence Alignment < EMBL-EBI](http://www.ebi.ac.uk/Tools/msa/)
  - [Clustal](https://ja.wikipedia.org/wiki/Clustal)
  - [ClustalWを使い倒す 2011 - 統合TV (togotv)(2011-02-16)](http://togotv.dbcls.jp/20110216.html)
  - [clustalwを利用した系統樹の作成方法 - バイオインフォマティクス初心者の日常](http://sy41211.hatenablog.com/entry/2015/12/15/040041)
  - [井上 潤：MUSCLE](http://www.geocities.jp/ancientfishtree/MUSCLE.html)

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

    ls("package:msa")

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

	hemoAln2 <- msaConvert(hemoAln, type="seqinr::alignment")

	> msaConvert
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

----------

# Phylogenetics

![https://ja.wikipedia.org/wiki/系統樹](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Tree_of_life_ja.svg/350px-Tree_of_life_ja.svg.png)

- [系統樹](https://ja.wikipedia.org/wiki/系統樹) [Phylogenetic tree](https://en.wikipedia.org/wiki/Phylogenetic_tree)
- [分子系統学](https://ja.wikipedia.org/wiki/分子系統学) [Phylogenetics](https://en.wikipedia.org/wiki/Phylogenetics)
- [新しい系統樹では細菌が圧倒的に優勢](http://www.natureasia.com/ja-jp/life-sci/research/10626) [A new view of the tree of life : Nature Microbiology](http://www.nature.com/articles/nmicrobiol201648)

	library(msa)

	# multiple alignment of Hemoglobin alpha example sequences
	hemoSeq <- readAAStringSet(system.file("examples/HemoglobinAA.fasta", package="msa"))
	hemoAln <- msa(hemoSeq)
	hemoAln

    # write Multiple Sequence Alignments to a file
    writeXStringSet(unmasked(hemoAln), file="hemoAln.fasta")

    #install.packages('phangorn')
    library(phangorn)
    ls("package:ape")
    aln <- read.aa(file = "hemoAln.fasta", format = "fasta")
    d <- dist.ml(aln, model="WAG")

    # UPGMA (Unweighted Pair Group Method with Arithmetic mean)
    hc <- hclust(d, "average")
    plot(as.phylo(hc))

    # 近隣結合法 NJ (Neighbor-Joining)
    plot(nj(d))

    # Plot Phylogenies
    example(plot.phylo)

- [微生物の系統樹,どう描くの?(続・生物工学基礎講座-バイオよもやま話-) 飯野 隆夫*・伊藤  隆](https://www.sbj.or.jp/wp-content/uploads/file/sbj/9110/9110_yomoyama.pdf)
- Rによる系統解析
  - [R - 井上 潤](http://www.geocities.jp/ancientfishtree/R_JI.html)
  - [系統樹 ape ade4 | Rで系統樹を作成する方法](http://stat.biopapyrus.net/graph/r-phylogenetic-tree.html)
  - [Rと系統樹(1)](https://www1.doshisha.ac.jp/~mjin/R/42/42.html)
  - [Rと系統樹(2)](https://www1.doshisha.ac.jp/~mjin/R/43/43.html)
- 2016/06/23 [(Rで)塩基配列解析](http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html)
- 2016/05/25 [(Rで)マイクロアレイデータ解析](http://www.iu.a.u-tokyo.ac.jp/~kadota/r.html)
- http://qa.lifesciencedb.jp/questions/512/rでfastaファイルを読み込む際におすすめのパッケージはありますか
- readDNAStringSet
  - [wakuteka/writeXStringset.R](https://gist.github.com/wakuteka/8050846)
  - [R/Bioconductorでmultifasta形式をsinglefasta形式に変換する - 僕らはRを愛しすぎてる](http://wakuteka.hatenablog.jp/entry/2013/12/20/153421)
  - Feb 13, 2013 [Biostrings::readDNAStringSetで読み込んだmultifastaファイルの塩基配列部分を抽出する](http://qiita.com/wakuteka/items/5bef7c5e1dfd92c247f2)
  - [Bioconductor: Genomicデータ解析ツール群 - Watal M. Iwasaki](https://heavywatal.github.io/rstats/bioconductor.html)

----------

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


