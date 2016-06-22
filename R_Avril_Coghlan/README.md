
# [Welcome to a Little Book of R for Bioinformatics!](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)  
By Avril Coghlan  

## Chapters in this Book
- [DNA Sequence Statistics (1)](#dna-sequence-statistics-1)
- [DNA Sequence Statistics (2)](#dna-sequence-statistics-2)
- [Pairwise Sequence Alignment](#pairwise-sequence-alignment)

----------

## [DNA Sequence Statistics (1)](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter1.html)

![https://ja.wikipedia.org/wiki/GC含量](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/AT-GC.jpg/400px-AT-GC.jpg)

細菌のGC含量とゲノムサイズ

![https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer](https://upload.wikimedia.org/wikipedia/en/thumb/f/f5/Inferring_horizontal_gene_transfer_average_GC_content.svg/400px-Inferring_horizontal_gene_transfer_average_GC_content.svg.png)

[GC含量や系統樹に基づく水平遺伝子伝播 Horizontal Gene Transfer (HGT) の予測](https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer)

![https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer](https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Inferring_horizontal_gene_transfer_conceptual_overview.svg/632px-Inferring_horizontal_gene_transfer_conceptual_overview.svg.png)

### Using R for Bioinformatics
### R packages for bioinformatics: Bioconductor and SeqinR
[パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

SeqinRパッケージのインストールと呼び出し:  

    #install.packages('seqinr')

	library("seqinr")

### FASTA format
[FASTA](http://quma.cdb.riken.jp/help/fastaHelp_j.html)形式

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P1_image5.png)

### The NCBI sequence database

### Retrieving genome sequence data via the NCBI website

![https://ja.wikipedia.org/wiki/デング熱](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Dengue.jpg/250px-Dengue.jpg)

DEN-1デング熱ウイルスのゲノム配列
[Dengue virus 1, complete genome](http://www.ncbi.nlm.nih.gov/nuccore/NC_001477)

### Retrieving genome sequence data using SeqinR
SeqinRでゲノム配列データを取得

    #choosebank("refseqViruses")
    #query2 <- query("query2","AC=NC_001477")
    #dengueseq <- getSequence(query2$req[[1]])

### Writing sequence data out as a FASTA file
配列データを[FASTA](http://quma.cdb.riken.jp/help/fastaHelp_j.html)形式ファイルとして書き出す

    library("seqinr")
    dengue <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/den1.fasta")
    dengueseq <- dengue[[1]]

	write.fasta(names="DEN-1", sequences=dengueseq, file.out="den1.fasta")

### Reading sequence data into R
配列データをRに読み込む

`read.fasta()`関数でFASTA形式ファイル（den1.fasta）を読み込む:  

	library("seqinr")
	dengue <- read.fasta(file = "den1.fasta")
	dengueseq <- dengue[[1]]

変数`dengue`は[リスト](http://stat.biopapyrus.net/vector/list.html)。リストの1番目の要素を代入した
変数`dengueseq`は塩基配列を含む[ベクトル](http://stat.biopapyrus.net/vector/vector.html)

### Length of a DNA sequence
DNA配列の長さ

	length(dengueseq)

### Base composition of a DNA sequence
DNA配列の塩基組成

	table(dengueseq)

![https://ja.wikipedia.org/wiki/GC含量](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/AT-GC.jpg/400px-AT-GC.jpg)

### GC Content of DNA
[GC含量](https://ja.wikipedia.org/wiki/GC含量)
(G+C)/(A+T+G+C)

    (2240+2770)/(3426+2240+2770+2299)

	GC(dengueseq)

細菌のGC含量とゲノムサイズ

![https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer](https://upload.wikimedia.org/wikipedia/en/thumb/f/f5/Inferring_horizontal_gene_transfer_average_GC_content.svg/400px-Inferring_horizontal_gene_transfer_average_GC_content.svg.png)

GC含量と他の因子（ゲノムサイズ、環境、酸素要求性、窒素利用能、温度）の相関 ([Hildebrand F et al., 2010](http://www.ncbi.nlm.nih.gov/pubmed/20838593))

### DNA words
連続塩基

    words(length = 2)  #  dinucleotides 2連続塩基 
    words(length = 3)  # trinucleotides 3連続塩基

    # Count oligomers (monomer/dimer/trimer/etc)
	count(dengueseq, 1)
	count(dengueseq, 2)

	denguetable <- count(dengueseq,1)
	denguetable[[3]]
	denguetable[["g"]]

----------

## [DNA Sequence Statistics (2)](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter2.html)

### A little more introduction to R

### Reading sequence data with SeqinR
SeqinRで配列データを読み込み

DEN-1デング熱ウイルスのゲノム配列を取得する。

	library("seqinr")                           # Load the SeqinR package.
    # dengue <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/den1.fasta")

	dengue <- read.fasta(file = "den1.fasta")   # Read in the file "den1.fasta".
	dengueseq <- dengue[[1]]                    # Put the sequence in a vector called "dengueseq".

	dengueseq[452:535]

### Local variation in GC content

	# GC content of the sequence
	GC(dengueseq)

GC含量の局所変動は、突然変異バイアスや[水平伝播](https://ja.wikipedia.org/wiki/遺伝子の水平伝播)を示唆する。

[Inferring Horizontal Gene Transfer (HGT)](https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer)

![https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer](https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Inferring_horizontal_gene_transfer_conceptual_overview.svg/632px-Inferring_horizontal_gene_transfer_conceptual_overview.svg.png)

non-overlapping windows / overlapping windows

### A sliding window analysis of GC content
GC含量の移動解析

	GC(dengueseq[1:2000])      # 塩基配列の 1-2000 番目のGC含量
	GC(dengueseq[2001:4000])   # 塩基配列の 2001-4000 番目のGC含量
	GC(dengueseq[4001:6000])   # 塩基配列の 4001-6000 番目のGC含量
	GC(dengueseq[6001:8000])   # 塩基配列の 6001-8000 番目のGC含量
	GC(dengueseq[8001:10000])  # 塩基配列の 8001-10000 番目のGC含量
	GC(dengueseq[10001:10735]) # 塩基配列の 10001-10735 番目のGC含量

### A sliding window plot of GC content
GC含量の移動プロット

`for`ループを使う。異なる範囲（windowsize: 2000, 3000, 300 塩基）のプロットを作成する。

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P2_image3.png)

[ウェブサイト](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter2.html)から
`slidingwindowplot`関数をコピペして、以下の通り実行:  

	slidingwindowplot(3000, dengueseq)

	slidingwindowplot(300, dengueseq)

`zoo`パッケージを使う:  

    # install.packages('zoo')
    library(zoo)
    windowsize <- 300
    x <- seq(from = 1, to = length(dengueseq)-windowsize, by = windowsize)
    y <- rollapply(data = dengueseq, width = windowsize, by = windowsize, FUN = GC)
    plot(x, y, type="b", xlab="Position (bp)", ylab="GC content")

- [ベクトルの一定範囲に関数を適用しながら逐次計算していく（ローリング処理）](http://d.hatena.ne.jp/teramonagi/20100831/1283261344)
- [Mean of a sliding window in R - Cross Validated ](http://stats.stackexchange.com/questions/3051/mean-of-a-sliding-window-in-r)

### Over-represented and under-represented DNA words
連続塩基組成 [Genomic signature](https://en.wikipedia.org/wiki/Genomic_signature) / [k-mer](https://en.wikipedia.org/wiki/K-mer)

![https://en.wikipedia.org/wiki/K-mer](https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/K-mer-example.png/440px-K-mer-example.png)

2連続塩基組成（観測値/期待値）を計算する:  

    ( af1 <- count(dengueseq, 1) ) # absolute frequencies of 1-mer
    ( rf1 <- af1 / sum(af1) )      # relative frequencies of 1-mer
    ( af2 <- count(dengueseq, 2) ) # absolute frequencies of 2-mer
    ( rf2 <- af2 / sum(af2) )      # relative frequencies of 2-mer
    ( oe.2 <- rf2 / apply(expand.grid(rf1, rf1), 1, prod) ) # observed / expected

`rho`関数を使う:  

    rho(dengueseq, wordsize = 2)

    # Create tests
    x <- s2c("atgc"); rho(x, wordsize = 2)

[イネの遺伝子の発現に係わるCpGアイランド様ゲノム領域](http://www.naro.affrc.go.jp/project/results/laboratory/nics/2005/nics05-10.html)

![http://www.naro.affrc.go.jp/project/results/laboratory/nics/2005/nics05-10.html](http://www.naro.affrc.go.jp/project/results/nic05010-z1.gif)

[CpG アイランド](https://ja.wikipedia.org/wiki/CpG_アイランド)([CpG site](https://en.wikipedia.org/wiki/CpG_site))のCpG配列は遺伝子発現中は[メチル化](https://ja.wikipedia.org/wiki/メチル化)されていない。

![https://en.wikipedia.org/wiki/CpG_site](https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Cytosine_becomes_thymine.png/400px-Cytosine_becomes_thymine.png)

[微生物群集（メタゲノム配列）の解析](http://bioinfo.ie.niigata-u.ac.jp/?PEMS)

![http://bioinfo.ie.niigata-u.ac.jp/?PEMS](http://bioinfo.ie.niigata-u.ac.jp/?plugin=ref&page=PEMS&src=Fig2.png)

----------

## [Pairwise Sequence Alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter4.html)
[シーケンスアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント)

2つのタンパク質配列アラインメント

![https://ja.wikipedia.org/wiki/シーケンスアラインメント](https://upload.wikimedia.org/wikipedia/commons/8/86/Zinc-finger-seq-alignment2.png)

塩基の置換(Substitution)、挿入(Insertion)、欠失(Deletion)

![http://www.bbc.co.uk/education/guides/zc499j6/revision/2](http://a.files.bbci.co.uk/bam/live/content/zdjy4wx/large)

### Retrieving a UniProt protein sequence via the UniProt website
UniProtのウェブサイトからタンパク質配列を取得

- [Using the UniProt basket | Train online](https://www.ebi.ac.uk/training/online/course/uniprot-exploring-protein-sequence-and-functional/exploring-uniprotkb-results-page/using-unip)
![](http://www.ebi.ac.uk/training/online/sites/ebi.ac.uk.training.online/files/user/4057/documents/screen_shot_2014-11-06_at_15.44.16.png)
'Add to basket'ボタンを押す。右上の'Basket'ボタンを押し、'Download'ボタンを押す。
![](http://www.ebi.ac.uk/training/online/sites/ebi.ac.uk.training.online/files/user/4057/documents/screen_shot_2014-11-06_at_15.44.29.png)

[Mycobacterium leprae（らい菌）](https://ja.wikipedia.org/wiki/らい菌)と[Mycobacterium ulcerans](http://www.nih.go.jp/niid/ja/diseases/ha/buruli-ulcer/1366-idsc/iasr-topic/1793-dj3863.html)
の[コリスミ酸リアーゼ](https://ja.wikipedia.org/wiki/コリスミ酸リアーゼ)タンパク質配列（UniProt登録番号は[Q9CD83](http://www.uniprot.org/uniprot/Q9CD83)と[A0PQ23](http://www.uniprot.org/uniprot/A0PQ23)）をFASTA形式（ファイル名"Q9CD83.fasta"と"A0PQ23.fasta"）で保存。

`read.fasta()`関数で、FASTAファイルをRに読み込む:  

	library("seqinr")
    leprae <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/Q9CD83.fasta")
    ulcerans <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/A0PQ23.fasta")
	#leprae <- read.fasta(file = "Q9CD83.fasta")
	#ulcerans <- read.fasta(file = "A0PQ23.fasta")
	lepraeseq <- leprae[[1]]
	ulceransseq <- ulcerans[[1]]
	lepraeseq # Display the contents of the vector "lepraeseq"

### Retrieving a UniProt protein sequence using SeqinR
SeqinRでUniProtのタンパク質配列を取得

	library("seqinr")
	choosebank("swissprot")
    leprae <- query("leprae", "AC=Q9CD83")
	lepraeseq <- getSequence(leprae$req[[1]])
    ulcerans <- query("ulcerans", "AC=A0PQ23")
	ulceransseq <- getSequence(ulcerans$req[[1]])
	closebank()
	lepraeseq # Display the contents of "lepraeseq"

### Comparing two sequences using a dotplot
[ドットプロット](https://ja.wikipedia.org/wiki/ドットプロット_%28バイオインフォマティクス%29)で2つの配列を比較

M.lepraeとM.ulceransのコリスミ酸リアーゼのタンパク質配列のドットプロットを作成する:  

	dotPlot(lepraeseq, ulceransseq)

    # Create tests
    x <- s2c("atgc"); par(mfrow=c(2,2)); dotPlot(x,x); dotPlot(x,rev(x)); dotPlot(rep(x,2),rep(x,2))

![http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P4_image5.png)

- [アラインメント | 核酸あるいはアミノ酸配列を複数並べ類縁度を可視化](http://bi.biopapyrus.net/seq/alignment.html)

### [Pairwise global alignment of DNA sequences using the Needleman-Wunsch algorithm](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#pairwise-global-alignment-of-dna-sequences-using-the-needleman-wunsch-algorithm)
2つのDNA配列間のグローバル・アライメント

[グローバルアラインメントとローカルアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E3.82.B0.E3.83.AD.E3.83.BC.E3.83.90.E3.83.AB.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88.E3.81.A8.E3.83.AD.E3.83.BC.E3.82.AB.E3.83.AB.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88)

![](https://upload.wikimedia.org/wikipedia/commons/4/4b/Global-local-alignment.png)

例えば、塩基の一致(match)に+2のスコア、不一致(mismatch)に-1のペナルティ、ギャップ(gap)に-2のペナルティを与える。

以下のアラインメントのスコアは、2 + 2 + (-1) + 2 + (-2) + (-1) = 2

    GAATTC
    GATT-A

以下のアラインメントのスコアは？

    GAATTC
    GA-TTA

*scoring matrix* (a.k.a. *substitution matrix*)

Biostringsパッケージの`nucleotideSubstitutionMatrix()`関数で[スコアマトリックス(置換行列)](http://bi.biopapyrus.net/seq/score-matrix.html)を作る:  

	library(Biostrings)
	sigma <- nucleotideSubstitutionMatrix(match = 2, mismatch = -1, baseOnly = TRUE)
	sigma # Print out the matrix

ギャップの最初の位置には、ギャップ開始ペナルティ(*gap opening penalty*)とギャップ伸長ペナルティ(*gap extension penalty*)を与える。隣接するギャップは一回の挿入・欠失で生じたと考える。

[Gap penalty](https://en.wikipedia.org/wiki/Gap_penalty)

![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Sequence_gaps.JPG/339px-Sequence_gaps.JPG)

`pairwiseAlignment()`関数で、DNA配列("GAATTC"と"GATTA")間の最適なグローバルアライメントを見つける:  

	s1 <- "GAATTC"
	s2 <- "GATTA"
	globalAligns1s2 <- pairwiseAlignment(s1, s2, substitutionMatrix = sigma, 
			gapOpening = -2, gapExtension = -8, scoreOnly = FALSE)
	globalAligns1s2 # Print out the optimal alignment and its score

結果は以下の通り:  

	Global PairwiseAlignmentsSingleSubject (1 of 1)
	pattern: [1] GAATTC 
	subject: [1] GA-TTA 
	score: -3 

このアライメントは、4個の一致(match)、1個の不一致(mismatch)、長さ1の1個のギャップ(gap)が含まれているので、スコアは (4\*2)+(1\*-1)+(1\*-10) = -3 となる。  
【注意】gapOpening = -2, gapExtension = -8 は、ギャップの最初の位置は (-2-8=)-10 のスコアが割り当てられ、ギャップの後続の位置は -8 のスコアが与えられることを意味する。

- [Aritalab:Lecture/Bioinformatics/Alignment - Metabolomics.JP](http://metabolomics.jp/wiki/Aritalab:Lecture/Bioinformatics/Alignment)
- [2-1. 配列解析基礎 Basic Sequence Analysis 坊農 秀雅](http://www.iu.a.u-tokyo.ac.jp/~kadota/bioinfo_ngs_sokushu_2014/20140905_2-1_bono.pdf)
- [置換行列 | スコアマトリックスの作り方](http://bi.biopapyrus.net/seq/score-matrix.html)
- [Needleman–Wunsch | グローバルアライメントを求めるアルゴリズム](http://bi.biopapyrus.net/seq/needleman–wunsch.html)

![http://bi.biopapyrus.net/seq/needleman–wunsch.html](http://bi.biopapyrus.net/media/nw-005.png)

### Pairwise global alignment of protein sequences using the Needleman-Wunsch algorithm
2つのタンパク質配列間のグローバル・アライメント

置換行列 [BLOSUM (BLOcks SUbstitution Matrix)](https://en.wikipedia.org/wiki/BLOSUM)

![https://en.wikipedia.org/wiki/BLOSUM](https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/BLOSUM62.gif/400px-BLOSUM62.gif)

	data(BLOSUM50)
	BLOSUM50

	data(package="Biostrings")

タンパク質配列("PAWHEAE"と"HEAGAWGHEE")間の最適なグローバルアライメントを見つける:  

	data(BLOSUM50)
	s3 <- "PAWHEAE"
	s4 <- "HEAGAWGHEE"
	globalAligns3s4 <- pairwiseAlignment(s3, s4, substitutionMatrix = "BLOSUM50", 
				gapOpening = -2, gapExtension = -8, scoreOnly = FALSE)
	globalAligns3s4

結果は以下の通り:  

	Global PairwiseAlignmentsSingleSubject (1 of 1)
	pattern: [1] P---AWHEAE 
	subject: [1] HEAGAWGHEE 
	score: -5 

ギャップ(`---`)は -10-8-8 = -26 のスコアが与えられる。

- [バイオインフォマティクス (第3回) 榊原康文](http://www.dna.bio.keio.ac.jp/lecture/bioinfo/bioinformatics-3.pdf)
- 2009.9.12 [バイオインフォマティクス基礎講座 配列解析 川端 猛](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_3_1.pdf)
- [バイオインフォマティクス-ゲノム配列から機能解析へ-第3章3.4節配列アラインメントにおけるスコア行列とギャップペナルティの使用方法](http://qiita.com/kino-tohoku/items/d4e0441e7ed6222106fa)
- [Bioinformaticsのお勉強: BLASTの置換行列を取ってきた☆](http://kappa-bioinformatics.blogspot.jp/2011/02/blast.html)

### Aligning UniProt sequences
UniProt配列のアライメント

	library("seqinr")
    leprae <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/Q9CD83.fasta")
    ulcerans <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/A0PQ23.fasta")
	lepraeseq <- leprae[[1]]
	ulceransseq <- ulcerans[[1]]

    # convert vectors of characters into strings 文字ベクトルを文字列に変換
	lepraeseqstring <- c2s(lepraeseq)     # Make a string that contains the sequence in "lepraeseq"
	ulceransseqstring <- c2s(ulceransseq) # Make a string that contains the sequence in "ulceransseq"

    # convert strings to uppercase 大文字に変換  
	lepraeseqstring <- toupper(lepraeseqstring)
	ulceransseqstring <- toupper(ulceransseqstring)
	lepraeseqstring # Print out the content of "lepraeseqstring"

    # pairwiseAlignment
	globalAlignLepraeUlcerans <- pairwiseAlignment(lepraeseqstring, ulceransseqstring,
		substitutionMatrix = BLOSUM50, gapOpening = -2, gapExtension = -8, scoreOnly = FALSE)
	globalAlignLepraeUlcerans # Print out the optimal global alignment and its score

結果は以下の通り:  

	Global PairwiseAlignmentsSingleSubject (1 of 1)
	pattern: [1] MT-----NR--T---LSREEIRKLDRDLRILVATN...FQDTPREELDRCQYSNDIDTRSGDRFVLHGRVFKN 
	subject: [1] MLAVLPEKREMTECHLSDEEIRKLNRDLRILIATN...FEDNSREEPIRHQRS--VGT-SA-R---SGRSICT 
	score: 627 

### Viewing a long pairwise alignment
2つの配列間のアライメントの表示と出力

    writePairwiseAlignments(globalAlignLepraeUlcerans)
    writePairwiseAlignments(globalAlignLepraeUlcerans, file="~/Desktop/aln.txt")

[ウェブサイト](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter4.html)から
`printPairwiseAlignment`関数をコピペして、以下の通り実行:  

	printPairwiseAlignment(globalAlignLepraeUlcerans, 60)

### Pairwise local alignment of protein sequences using the Smith-Waterman algorithm
2つのタンパク質配列間のローカル・アライメント

	localAlignLepraeUlcerans <- pairwiseAlignment(lepraeseqstring, ulceransseqstring,
	substitutionMatrix = BLOSUM50, gapOpening = -2, gapExtension = -8, scoreOnly = FALSE, type="local")
	localAlignLepraeUlcerans # Print out the optimal local alignment and its score

    writePairwiseAlignments(localAlignLepraeUlcerans)

- [Smith-Waterman | ローカルアラインメントを求めるアルゴリズム](http://bi.biopapyrus.net/seq/smith-waterman.html)

### [Calculating the statistical significance of a pairwise global alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#calculating-the-statistical-significance-of-a-pairwise-global-alignment)

----------
