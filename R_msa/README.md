----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-06-21  

----------

- [シーケンスアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント)
- [多重整列](https://ja.wikipedia.org/wiki/多重整列) [Multiple sequence alignment](https://en.wikipedia.org/wiki/Multiple_sequence_alignment)
- [マルチプルアライメント](http://bio-info.biz/protein/method_msa.html)
- [Clustal](https://ja.wikipedia.org/wiki/Clustal)
- [ClustalWを使い倒す 2011 - 統合TV (togotv)(2011-02-16)](http://togotv.dbcls.jp/20110216.html)
- [井上 潤：MUSCLE](http://www.geocities.jp/ancientfishtree/MUSCLE.html)
- []()

----------

# msa
- [msa: an R package for multiple sequence alignment. Bioinformatics. 2015 Dec 15](http://www.ncbi.nlm.nih.gov/pubmed/26315911)  
- [Bioconductor - msa](https://bioconductor.org/packages/release/bioc/html/msa.html)
| [PDF](https://bioconductor.org/packages/release/bioc/vignettes/msa/inst/doc/msa.pdf) Version 1.4.2, May 2, 2016 | [R Script](https://bioconductor.org/packages/release/bioc/vignettes/msa/inst/doc/msa.R) | msa - An R Package for Multiple Sequence Alignment |
| [PDF](https://bioconductor.org/packages/release/bioc/manuals/msa/man/msa.pdf) | Reference Manual |

----------

## [An R Package for Multiple Sequence Alignment](http://bioconductor.org/packages/devel/bioc/vignettes/msa/inst/doc/msa.pdf)
Version 1.5.2, May 2, 2016  

### 2 Installation

Bioconductor パッケージ [`msa`](https://bioconductor.org/packages/release/bioc/html/msa.html) のインストールと呼び出し:  

	source("http://www.bioconductor.org/biocLite.R")
	biocLite("msa")

	library(msa)

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

### 6.2 Interfacing to Other Packages

`msaConvert()` converts multiple sequence alignment objects to other types/classes: `alignment` (used by `seqinr` package) and `align` (used by `bios2mds` package).

	# multiple alignment of Hemoglobin alpha example sequences
	hemoSeq <- readAAStringSet(system.file("examples/HemoglobinAA.fasta", package="msa"))
	hemoAln <- msa(hemoSeq)
	hemoAln
	# convert the result for later processing with the seqinr package:

	hemoAln2 <- msaConvert(hemoAln, type="seqinr::alignment")



> msaConvert
 エラー:  オブジェクト 'msaConvert' がありません 


### 4 Functions for Multiple Sequence Alignment in More Detail

	# call the function msa() with additional arguments
	# explicitly request ClustalW, ClustalOmega or MUSCLE:
	myClustalWAlignment <- msa(mySequences, "ClustalW")
	myClustalWAlignment

	myClustalOmegaAlignment <- msa(mySequences, "ClustalOmega")
	myClustalOmegaAlignment

	myMuscleAlignment <- msa(mySequences, "Muscle")
	myMuscleAlignment


----------

http://cns-guide.sfc.keio.ac.jp/2015/CNSguide2015.pdf
CNS サーバにリモートログインする
Mac からリモートログインする (Mac OS X)
「ssh [ CNS ログイン名 ]@ccx01.sfc.keio.ac.jp」と打って Return キーを押してください。


- [パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)
- http://qa.lifesciencedb.jp/questions/512/rでfastaファイルを読み込む際におすすめのパッケージはありますか


----------


