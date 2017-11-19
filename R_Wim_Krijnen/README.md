Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-11-19

----------
# [Applied Statistics for Bioinformatics using R](https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)  
Wim P. Krijnen  

November 10, 2009  

## Contents
**目次**
- [7. Cluster Analysis and Trees](#pairwise-sequence-alignment) クラスター分析
- [9. Analyzing Sequences](#multiple-alignment-and-phylogenetic-trees) 配列解析
- [Notes]()
- [Errata]() 誤植

----------

## Chapter 7. Cluster Analysis and Trees
クラスター分析


### 7.1 Distance
距離 

Example 3. Euclidian distance

	a <- c(1,1); b <- c(4,5)
	sqrt(sum((a-b)^2))

## Chapter 9. Analyzing Sequences
配列解析

### 9.1 Using a query language

	library(seqinr)
	choosebank()
	choosebank("genbank")
	query("ccnd","k=ccnd",virtual=TRUE)$nelem # 2
	query("ccnd3hs","sp=homo sapiens AND k=ccnd3",virtual=TRUE)$nelem # 6

### 9.2 Getting information on downloaded sequences

Example 1.  

	choosebank("genbank")
	ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")
	ccnd3hs$nelem

`@`はワイルドカード。関数`getName, getLength, getSequence, getTrans, getAnnot`。リストに関数`sapply`。

	sapply(ccnd3hs$req, getName)
	sapply(ccnd3hs$req, getLength)
	getSequence(ccnd3hs$req[[1]])[1:15]
	getTrans(ccnd3hs$req[[1]])[1:15]
	getAnnot(ccnd3hs$req[[1]])

### 9.3 Computations on sequences

Example 1. Frequencies of (di)nucleotides.  

	table(getSequence(ccnd3hs$req[[1]]))
	count(getSequence(ccnd3hs$req[[1]]),2)

Example 2. G + C percentage.  

	GC(getSequence(ccnd3hs$req[[1]]))
	GC1(getSequence(ccnd3hs$req[[1]]))
	GC2(getSequence(ccnd3hs$req[[1]]))
	GC3(getSequence(ccnd3hs$req[[1]]))

	GCperc <- double()
	ccnd3 <- sapply(ccnd3hs$req, getSequence)
	n <- length(ccnd3[[1]])
	for (i in 1:(n - 50)) GCperc[i] <-  GC(ccnd3[[1]][i:(i+50)])
	plot(GCperc,type="l")

Example 3. Rho and z-scores.  

	round(rho(getSequence(ccnd3hs$req[[1]])),2)
	round(zscore(getSequence(ccnd3hs$req[[1]]),modele='base'),2)

Example 4. Comparing Amino acid frequencies.  

	tab <- table(getTrans(ccnd3hs$req[[1]]))
	taborder <- tab[order(tab)]
	names(taborder) <- aaa(names(taborder))
	dotchart(taborder,pch=19,xlab="Stop and amino-acid-counts")
	abline(v=1,lty=2)

Example 5. Isoelectric point.
[等電点](https://ja.wikipedia.org/wiki/等電点)

	computePI(getTrans(ccnd3hs$req[[1]]))

protein molecular weight
タンパク質の[分子量](https://ja.wikipedia.org/wiki/分子量)

	pmw(getTrans(getSequence(ccnd3hs$req[[1]])))

Example 6. Hydropathy score
疎水度

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

	data(aaindex)
	aaindex

### 9.4 Matching patterns

Example 1. Pattern match.
パターンマッチ

	library(seqinr)
	choosebank("genbank")
	ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")
	ccnd3 <- sapply(ccnd3hs$req, getSequence)
	ccnd3nr1 <- c2s(ccnd3[[1]]) # conversion of a vector of chars into a string
	ccnd3nr1
	subseq <- "cccggg"

    countPattern(subseq, ccnd3nr1, max.mismatch = 0)
    matchPattern(subseq, ccnd3nr1, max.mismatch = 0)
    matchPattern(subseq, ccnd3nr1, max.mismatch = 1)

### 9.5 Pairwise alignments

Example 1. Basic recursion. 
再帰

	x<-double();x[1]<-1
	for (i in 2:10) {x[i]<- 2*x[i-1]-10}
	x[10]

Example 2. Dynamic programming of DNA sequences. 
動的計画法

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

- [Needleman–Wunsch | グローバルアライメントを求めるアルゴリズム](http://bi.biopapyrus.net/seq/needleman–wunsch.html)

Example 3. Programming Needleman-Wunsch. 

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

Example 4. Needleman-Wunsch. `pairwiseAlignment`関数

	library(Biostrings);data(BLOSUM50)
	pairwiseAlignment(AAString("PAWHEAE"), AAString("HEAGAWGHEE"),
	substitutionMatrix = "BLOSUM50",gapOpening = 0, gapExtension = -8,
	scoreOnly = FALSE)

Example 5. Comparing with random sequences. 

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

Example 6. Sliding window on Needleman-Wunsch scores. 

        library(seqinr); choosebank("genbank")
	ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")
	ccnd3 <- sapply(ccnd3hs$req, getSequence)
	ccnd3transl <- sapply(ccnd3, getTrans)
	x <- c2s(ccnd3transl[[1]])
	y <- c2s(ccnd3transl[[1]][50:70])
	nwscore <- double() ; n <- length(ccnd3transl[[1]])
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

Page 249  
Answers to exercises of Chapter 9: Analyzing Sequences

Page 254  

- 9. Plot of codon usage.  

	data(ec999)
    ec999.uco <- sapply(ec999, uco, index="eff")
    total <- rowSums(ec999.uco)
    dotchart.uco(total, main = "Codon usage in 999 coding sequences from E. coli")

----------

## Notes

    help.search("matchPattern")
    ??"matchPattern"

    help.search("pairwiseAlignment")
    ??"pairwiseAlignment"

----------

## Errata
誤植

- Page ***

        ****

should be:

        ****


- Page 174

        query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")

should be:

        ccnd3hs <- query("ccnd3hs","sp=homo sapiens AND k=ccnd3@")

- Page 177

        ccnd3 <- sapply(ccnd3hs$req, getSequence)

should be typed before:

        n <- length(ccnd3[[1]])

- Page 181

        countPattern(subseq, ccnd3nr1, mismatch = 0)
        matchPattern(subseq, ccnd3nr1, mismatch = 0)
        matchPattern(subseq, ccnd3nr1, mismatch = 1)

should be:

        library(Biostrings)
        countPattern(subseq, ccnd3nr1, max.mismatch = 0)
        matchPattern(subseq, ccnd3nr1, max.mismatch = 0)
        matchPattern(subseq, ccnd3nr1, max.mismatch = 1)

- Page 188

        choosebank("genbank"); library(seqinr)

should be:

        library(seqinr); choosebank("genbank")

- Page 188

	library(Biostrings)

should be typed before:

        pairwiseAlignment()

- Page 189

	read.fasta {seqinr}

----------

Wim P. Krijnen
Hanze University
Institute for Life Science and Technology Zernikeplein 11
9747 AS Groningen
The Netherlands w.p.krijnen@pl.hanze.nl

----------


https://www.hanze.nl/nld/onderzoek/kenniscentra/hanzehogeschool-centre-of-expertise-healthy-ageing/lectoraten/lectoraten/lahc/organisatie/researchers/wim-p-krijnen
Wim P. Krijnen

Krijnen, W.P. (2010). Applied Statistics for Bioinformatics using R. http://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf

----------

https://research.hanze.nl/en/persons/wim-krijnen
Wim Krijnen — Hanze University of Applied Sciences

Wim Krijnen
Statistical Techniques for Applied Research
Centre of Expertise Healthy Ageing
E-mail
w.p.krijnen@pl.hanze.nl


----------

