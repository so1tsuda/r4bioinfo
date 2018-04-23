# http://cse.fra.affrc.go.jp/okamura/program/vegan/
# Rパッケージveganを利用した類似度の計算

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
