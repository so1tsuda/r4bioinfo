Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-11-19

----------
# [Applied Statistics for Bioinformatics using R](https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)
Wim P. Krijnen  
November 10, 2009  

## Contents
**目次**
- [7. Cluster Analysis and Trees](#chapter-7-cluster-analysis-and-trees) クラスター分析
- [9. Analyzing Sequences](#chapter-9-analyzing-sequences) 配列解析
- [A. Answers to exercises](#) 

----------


## Chapter 7. Cluster Analysis and Trees
クラスター分析


### 7.1 Distance
距離 

Example 3. Euclidian distance
[ユークリッド距離](https://ja.wikipedia.org/wiki/ユークリッド距離)

	a <- c(1,1); b <- c(4,5)
	sqrt(sum((a-b)^2))

### 7.2 Two types of Cluster Analysis
#### 7.2.1 Single Linkage
#### 7.2.2 k-means

## Chapter 9. Analyzing Sequences
配列解析

### 9.1 Using a query language

	library(seqinr)
	choosebank()
	choosebank("genbank")
	query("ccnd","k=ccnd",virtual=TRUE)$nelem
	query("ccnd3hs","sp=homo sapiens AND k=ccnd3",virtual=TRUE)$nelem

### 9.2 Getting information on downloaded sequences

**Example 1.**
Let’s download sequences related to the species homo sapiens and a gene name like ”CCND3”.

	# download sequences related to the species homo sapiens and a gene name like ”CCND3”.
	choosebank("genbank")
    ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")
	ccnd3hs$nelem
	# @ acts as a wildcard

`@`はワイルドカード。  
`sapply()`は、リストの各要素に関数を適用する。タンパク質配列の長さ（アミノ酸残基数）を求める:  

    # Apply a Function over a List
	# extracting the NCBI accession numbers
	sapply(ccnd3hs$req, getName)
	# The length of the sequences 
	sapply(ccnd3hs$req, getLength)
	# obtain the first sequence and print its first fifteen nucleotides
	getSequence(ccnd3hs$req[[1]])[1:15]
	# Its translation into amino acids
	getTrans(ccnd3hs$req[[1]])[1:15]
	# its annotation from the corresponding web page:
	getAnnot(ccnd3hs$req[[1]])

### 9.3 Computations on sequences

**Example 1.**
Frequencies of (di)nucleotides.  
(2)連続塩基の度数

	table(getSequence(ccnd3hs$req[[1]]))
	count(getSequence(ccnd3hs$req[[1]]),2)

**Example 2.**
G + C percentage.  
配列全体とコドン1,2,3文字目の[GC含量](https://ja.wikipedia.org/wiki/GC含量)

	GC(getSequence(ccnd3hs$req[[1]]))
	GC1(getSequence(ccnd3hs$req[[1]]))
	GC2(getSequence(ccnd3hs$req[[1]]))
	GC3(getSequence(ccnd3hs$req[[1]]))

	# G + C fraction in a window of length 50 nt
	GCperc <- double()
    ccnd3 <- sapply(ccnd3hs$req, getSequence)
	n <- length(ccnd3[[1]])
	for (i in 1:(n - 50)) GCperc[i] <-  GC(ccnd3[[1]][i:(i+50)])
	plot(GCperc,type="l")

Figure 9.1: G + C fraction of sequence ”AF517525.CCND3” along a window of length 50 nt.

**Example 3.**
Rho and z-scores.


	round(rho(getSequence(ccnd3hs$req[[1]])),2)
	round(zscore(getSequence(ccnd3hs$req[[1]]),modele='base'),2)

**Example 4.**
Comparing Amino acid frequencies.  
アミノ酸の度数

	tab <- table(getTrans(ccnd3hs$req[[1]]))
	taborder <- tab[order(tab)]
	names(taborder) <- aaa(names(taborder))
	dotchart(taborder,pch=19,xlab="Stop and amino-acid-counts")
	abline(v=1,lty=2)

Figure 9.2: Frequency plot of amino acids from accession number AF517525.CCND3.

#Figure 9.3: Frequency plot of amino acids from accession number AL160163.CCND3.

**Example 5.**
Isoelectric point.  
[等電点](https://ja.wikipedia.org/wiki/等電点)

	computePI(getTrans(ccnd3hs$req[[1]]))

protein molecular weight  
タンパク質の[分子量](https://ja.wikipedia.org/wiki/分子量)

	pmw(getTrans(getSequence(ccnd3hs$req[[1]])))

**Example 6.**
Hydropathy score  
[疎水親水度](https://kotobank.jp/word/ハイドロパシー-169088)

	ccnd3 <- sapply(ccnd3hs$req, getSequence)
	ccnd3transl <- sapply(ccnd3, getTrans)
	data(EXP)
	names(EXP$KD) <- sapply(words(), function(x) translate(s2c(x)))
	kdc <- EXP$KD[unique(names(EXP$KD))]
	kdc <- -kdc[order(names(kdc))]

	linform <- function(data, coef) {   #data are sequences
	f <- function(x) {
		freq <- table(factor(x, levels = names(coef)))/length(x)
		return(coef %*% freq) }
	res <- sapply(data, f)
	names(res) <- NULL
	return(res)
	}
	kdath <- linform(ccnd3transl, kdc)
	print(kdath,digits=3)

List of 544 physicochemical and biological properties for the 20 amino-acids

    data(aaindex)
    aaindex

### 9.4 Matching patterns

**Example 1.**
Pattern match.  
パターンマッチ

	library(seqinr)
	choosebank("genbank")
    ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")
	ccnd3 <- sapply(ccnd3hs$req, getSequence)
    # conversion of a vector of chars into a string
	ccnd3nr1 <- c2s(ccnd3[[1]])
	ccnd3nr1
	subseq <- "cccggg"

    library(Biostrings)
    countPattern(subseq, ccnd3nr1, max.mismatch = 0)
    matchPattern(subseq, ccnd3nr1, max.mismatch = 0)
    matchPattern(subseq, ccnd3nr1, max.mismatch = 1)

### 9.5 Pairwise alignments
[ペアワイズアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E3.83.9A.E3.82.A2.E3.83.AF.E3.82.A4.E3.82.BA.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88)

**Example 1.**
Basic recursion.  
再帰

	x<-double();x[1]<-1
	for (i in 2:10) {x[i]<- 2*x[i-1]-10}
	x[10]

**Example 2.**
Dynamic programming of DNA sequences.  
DNA配列の動的計画法  
DNA配列 GAATTC と GATTA (Durbin et. al., 1998, p.18) 間のアラインメントのスコア

	library(seqinr)
	x <- s2c("GAATTC"); y <- s2c("GATTA"); d <- 2
	s <- matrix(data=NA,nrow=length(y),ncol=length(x))
	for (i in 1:(nrow(s))) for (j in 1:(ncol(s)))
		{if (y[i]==x[j]) s[i,j]<- 2 else s[i,j]<- -1 }
	rownames(s) <- c(y); colnames(s) <- c(x)
	s


	F <- matrix(data=NA,nrow=(length(y)+1),ncol=(length(x)+1))
	rownames(F) <- c("",y); colnames(F) <- c("",x)
	F[,1] <- -seq(0,length(y)*d,d); F[1,] <- -seq(0,length(x)*d,d)
	for (i in 2:(nrow(F)))
		for (j in 2:(ncol(F)))
		{F[i,j] <- max(c(F[i-1,j-1]+s[i-1,j-1],F[i-1,j]-d,F[i,j-1]-d))}
	F


[Needleman–Wunsch | グローバルアライメントを求めるアルゴリズム](https://bi.biopapyrus.jp/seq/alignment/needleman–wunsch.html)

**Example 3.**
Programming Needleman-Wunsch.  
タンパク質配列 "PAWHEAE" と "HEAGAWGHEE" (Durbin et. al., 1998, p.21) 間の最適なグローバルアライメントを見つける。
アミノ酸置換行列 [BLOSUM (BLOcks SUbstitution Matrix)](https://en.wikipedia.org/wiki/BLOSUM) を用いる。

	file <- "ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM50"
	BLOSUM50 <- as.matrix(read.table(file, check.names=FALSE))

	library(seqinr);library(Biostrings);data(BLOSUM50)
	x <- s2c("HEAGAWGHEE"); y <- s2c("PAWHEAE"); s <- BLOSUM50[y,x]; d <- 8
	F <- matrix(data=NA,nrow=(length(y)+1),ncol=(length(x)+1))
	F[1,] <- -seq(0,80,8); F[,1] <- -seq(0,56,8)
	rownames(F) <- c("",y); colnames(F) <- c("",x)
	for (i in 2:(nrow(F)))
		for (j in 2:(ncol(F)))
		{F[i,j] <- max(c(F[i-1,j-1]+s[i-1,j-1],F[i-1,j]-d,F[i,j-1]-d))}
	F

**Example 4.**
Needleman-Wunsch.
Biostringsパッケージの`pairwiseAlignment()`関数を用いて、
タンパク質配列 "PAWHEAE" と "HEAGAWGHEE" (Durbin et. al., 1998, p.21) 間の最適なグローバルアライメントを見つける。

	library(Biostrings);data(BLOSUM50)
	pairwiseAlignment(AAString("PAWHEAE"), AAString("HEAGAWGHEE"),
	  substitutionMatrix = "BLOSUM50",gapOpening = 0, gapExtension = -8,
	  scoreOnly = FALSE)

**Example 5.**
Comparing with random sequences.  
ランダムな配列との比較

	set.seed(0)
	library(seqinr);library(Biostrings);data(BLOSUM50)
	randallscore <- double()
	for (i in 1:1000) {
	 x <- c2s(sample(rownames(BLOSUM50),7, replace=TRUE))
	 y <- c2s(sample(rownames(BLOSUM50),10, replace=TRUE))
	 randallscore[i] <- pairwiseAlignment(AAString(x), AAString(y),
	 substitutionMatrix = "BLOSUM50",gapOpening = 0, gapExtension = -8,
	 scoreOnly = TRUE)
	}
	sum(randallscore>1)/1000

**Example 6.**
Sliding window on Needleman-Wunsch scores.  
グローバルアライメント・スコアの移動解析

    library(seqinr); choosebank("genbank")
    ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")
	ccnd3 <- sapply(ccnd3hs$req, getSequence)
	ccnd3transl <- sapply(ccnd3, getTrans)
	x <- c2s(ccnd3transl[[1]])
	y <- c2s(ccnd3transl[[1]][50:70])
	nwscore <- double() ; n <- length(ccnd3transl[[1]])

    library(Biostrings)
	for (i in 1:(n-21))
	  nwscore[i] <-
	  pairwiseAlignment(AAString(c2s(ccnd3transl[[1]][i:(i+20)])),
	  AAString(y),substitutionMatrix = "BLOSUM50",gapOpening = 0,
	  gapExtension = -8, scoreOnly = TRUE)

	pairwiseAlignment(AAString(y), AAString(y),
	   substitutionMatrix = "BLOSUM50", gapOpening = 0, gapExtension = -8,
	   scoreOnly = TRUE)

	max(nwscore)
	which.max(nwscore)

### 9.6 Overview and concluding remarks

### 9.7 Exercises

----------

## Appendix A
Answers to exercises


Page 249  

Answers to exercises of Chapter 9: Analyzing Sequences

1. Writing to a FASTA file.
FASTA形式ファイルに書き出す

    library(seqinr); choosebank("genbank")
    ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")
	ccnd3 <- sapply(ccnd3hs$req, getSequence)
    library(Biostrings)
	x1 <- DNAStringSet(c2s(ccnd3[[1]]))

    writeXStringSet(x1, file="ccnd3.fa", format="fasta", width=80)
	ccnd3c2sn <- sapply(ccnd3, c2s)
	x1 <- DNAStringSet(ccnd3c2sn)
    writeXStringSet(x1, file="ccnd3n.fa", format="fasta", width=80)

ヘルプ

    library(help = Biostrings)
    # XStringSet-io           Read/write an XStringSet object from/to a file
    help("XStringSet-io")


2. Dotplot of sequences.

Page 250

3. Local alignment.

4. Probability of more extreme alignment score.

5. Prochlorococcus marinus.

6. Sequence equality.

7. Conserved region.

Page 253

8. Plot of CG proportion from Celegans.

9. Plot of codon usage.  
コドン使用

	data(ec999)
    ec999.uco <- sapply(ec999, uco, index="eff")
    total <- rowSums(ec999.uco)
    dotchart.uco(total, main = "Codon usage in 999 coding sequences from E. coli")

----------



