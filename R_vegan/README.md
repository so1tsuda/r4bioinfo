----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2016-07-27  

----------

# vegan

群集生態学パッケージ `vegan` のインストール、呼び出し、デモ:  

    install.packages('vegan')

    library(vegan)

    example(vegan)

- 2016-06-15 [CRAN - Package vegan](https://cran.r-project.org/web/packages/vegan/index.html)
  - Reference manual: [vegan.pdf](https://cran.r-project.org/web/packages/vegan/vegan.pdf)
  - Vignettes:
    - [Design decisions and implementation](https://cran.r-project.org/web/packages/vegan/vignettes/decision-vegan.pdf)
    - [Diversity analysis](https://cran.r-project.org/web/packages/vegan/vignettes/diversity-vegan.pdf)
    - [Introduction to ordination](https://cran.r-project.org/web/packages/vegan/vignettes/intro-vegan.pdf)
    - [Partition of Variation](https://cran.r-project.org/web/packages/vegan/vignettes/partitioning.pdf)
- 2015-06-10 [Multivariate Analysis of Ecological Communities in R: vegan tutorial](http://cc.oulu.fi/~jarioksa/opetus/metodi/vegantutor.pdf)
- 2013-01-04 <http://vegan.r-forge.r-project.org>

----------

# [Similarity indices, ordination, and community analysis tests using the software R](http://ci.nii.ac.jp/naid/110008607838/en)
土居 秀幸・岡村 寛 (2011) 生物群集解析のための類似度とその応用 : Rを使った類似度の算出、グラフ化、検定

[Rパッケージveganを利用した類似度の計算](http://cse.fra.affrc.go.jp/okamura/program/vegan/)

	# 必要なパッケージの呼び出し
	library(MASS)
	library(vegan)

	# 類似度の計算

	# 例データをtestdataに入力
	#testdata <- matrix(c(100,150,0,10,80,100,0,8,60,50,0,6,40,0,50,4,20,0,100,2,0,0,150,0),nrow=4,ncol=6)
    testdata <- matrix(c(100,150,0,10,90,100,0,9,80,50,0,8,20,0,50,2,10,0,100,1,0,0,150,0),nrow=4,ncol=6)
    testdata
	rownames(testdata) <- c("A","B","C","D")
	colnames(testdata) <- paste("S",1:6,sep="")

    write.table(testdata, file="~/testdata.txt", sep = "\t", quote=F, row.names=TRUE, col.names=TRUE)

	# Bray-Curtis指数
	vegdist(testdata, method="bray")

	# Morisita指数
	vegdist(testdata, method="morisita")

	# Horn指数
	vegdist(testdata, method="horn")

	# Jaccard指数
	testdata2 <- decostand(testdata,"pa")
    testdata2
	vegdist(testdata2,method="jaccard")
	vegdist(testdata,method="jaccard",binary=T)

	# Sorensen指数
	designdist(testdata, method="(A+B-2*J)/(A+B)", terms="binary")

	# 個体数データのためのJaccard・Sorensen指数

	jac.abund <- function(x, method="jaccard"){
	 nI <- nrow(x)

	 N <- rowSums(x)
	 y <- x/N

	 res <- matrix(0,nrow=nI,ncol=nI)

	 for (i in 1:(nI-1)){
	  for (j in (i+1):nI){
	    U <- sum((y[i,]*y[j,]>0)*y[i,])
	    V <- sum((y[i,]*y[j,]>0)*y[j,])
	    if (method=="jaccard") res[j,i] <- 1-ifelse(U*V>0, U*V/(U+V-U*V), 0)
	    if (method=="sorensen") res[j,i] <- 1-ifelse(U*V>0, 2*U*V/(U+V), 0)
	 }
	}

	 rownames(res) <- colnames(res) <- rownames(x)
	 as.dist(res)
	}

	jac.abund(testdata,method="jaccard")
	jac.abund(testdata,method="sorensen")

	# Chao指数
	vegdist(testdata,method="chao")

	# 多次元尺度法(MDS, NMDS)

	# Morisita指数によるMDS
	moridist <- vegdist(testdata, "morisita")
	morimds <- cmdscale(moridist, k = 2)
	plot(morimds, type="n", xlab=" ", ylab=" ")
	text(morimds,dimnames(testdata)[[1]])

	# Bray-Curtis指数によるNMDS
	bcdist <- vegdist(testdata, "bray")
	bcmds <- isoMDS(bcdist, k = 2) 
	plot(bcmds$points, type="n", xlab=" ", ylab=" ")
	text(bcmds$points,dimnames(testdata)[[1]])

	# Chao指数によるNMDS (類似度0を小さな正数で置き換えている)
	chmds <- metaMDS(testdata, dist="chao", k = 2, zerodist="add") 
	plot(chmds$points, type="n", xlab=" ", ylab=" ") 
	text(chmds$points,dimnames(testdata)[[1]])


	# 類似度指数の検定

	# データをenv1に入力
	env1 <- matrix(c(0,0.15,0.86,0.05,0.15,0,0.97,0.02,0.86,0.97,0,0.94,0.05,0.02,0.94,0),nrow=4,ncol=4) 
	env2 <- env1[c(3,2,4,1),c(3,2,4,1)]

	# Mantel test
	env1 <- as.dist(env1)
	env2 <- as.dist(env2)
	chao1 <- vegdist(testdata,method="chao")
	cor(as.numeric(chao1),as.numeric(env1))
	cor(as.numeric(chao1),as.numeric(env2))
	mantel(chao1,env1)
	mantel(chao1,env2)

	# ANOSIM
	anosim(chao1,c(1,1,2,2))

	# NPMANOVA (PERMANOVA)
	X1 <- c(1,1,2,2)
	X2 <- c(1,2,2,3)
	adonis(testdata~X1,method="chao")
	adonis(testdata~X1+X2,method="chao")


----------


# References

- 日本語
  - vegan
    - 2012-12-05 [random dispersal: Rいろは・第二部：R基本操作編](http://nhkuma.blogspot.jp/2012/12/rr.html)
    - 2014-05-17 [MDSとその愉快な仲間たち - 統計で迷子になる方法](http://d.hatena.ne.jp/fronori/20140517) 微生物生態学でPCAではなくPCoAを使うのはなぜ？ 
    - 2010-01-12 [嫌われ者？ Rで多様度](http://sususuuu.blog83.fc2.com/blog-entry-127.html)
    - 2007-08-22 [多様度指数と類似度｜ぎょうむ日誌](http://ameblo.jp/green-mercenary/entry-10044262910.html)
  - 2011年02月 [環境科学と生態学のためのR統計 | 共立出版](http://www.kyoritsu-pub.co.jp/bookdetail/9784320057128)
  - 大垣俊一 [Argonauta 15: 10-22 (2008) 多様度と類似度、分類学的新指標](http://www.mus-nh.city.osaka.jp/iso/argo/nl15/nl15-10-22.pdf)
  - 大垣俊一 [Argonauta 1: 15-26 (1999) 群集組成の多変量解析](http://www.mus-nh.city.osaka.jp/iso/argo/nl01/nl01-15-26.html)
  - [夏原由博 (1996) チョウ群集調査データの解析法](http://www.info.human.nagoya-u.ac.jp/~natu/epub/cho.PDF )
  - 2008.02.18 [生物多様性について１：シャノン＝ウィーバー指標（Shannon-Wiener) | 地中海ブログ](http://blog.archiphoto.info/?eid=569433 )
  - [論文の紹介： 生物多様性を進化系統学的な尺度で測る (情報：農業と環境 No.83 2007.3)](http://www.niaes.affrc.go.jp/magazine/083/mgzn08304.html)

- https://ja.wikipedia.org/wiki/遺伝的多様性
- https://ja.wikipedia.org/wiki/バイオアッセイ
- https://ja.wikipedia.org/wiki/保全生態学


----------
