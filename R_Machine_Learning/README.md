----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-04-29

----------

# Machine Learning
[機械学習](https://ja.wikipedia.org/wiki/機械学習)

----------
## Execution environment

	> sessionInfo()
	R version 3.3.3 (2017-03-06)
	Platform: x86_64-apple-darwin13.4.0 (64-bit)
	Running under: OS X Mavericks 10.9.5

----------

## [JIN'S PAGE](http://mjin.doshisha.ac.jp/R/)

Chap_31
Rとカーネル法
Chap_32
Rと集団学習

### [Rとカーネル法・サポートベクターマシン](http://mjin.doshisha.ac.jp/R/Chap_31/31.html)

1．カーネル法とは

カーネル主成分分析 (KPCA; kernel principal component analysis)

    #install.packages("kernlab")
	library(kernlab)
	x<-as.matrix(iris[,1:4])
	iris.kpc1<-kpca(x,kernel="rbfdot", features=2,kpar=list(sigma=0.1))
    #iris.kpc1<-kpca(x, kernel = "polydot", features=2,kpar=list(degree =1))
	plot(pcv(iris.kpc1), col=as.integer(iris[,5]))

サポートベクターマシン (SVM: Support Vector Machine) 

4　その他

	attach(cars)
	plot(speed, dist)
	lines(ksmooth(speed, dist, "normal", bandwidth=1.3), col=2)
	lines(ksmooth(speed, dist, "normal", bandwidth=4), col=3,lty=2)
	detach("cars")

### [Rと集団学習](http://mjin.doshisha.ac.jp/R/Chap_32/32.html)

集団学習 (ensemble learning)  

バギング (bagging) bootstrap aggregating  

	library(kernlab);data(spam)
	set.seed(50)
    tr.num<-sample(nrow(spam),2500)
	spam.train<-spam[tr.num,]
	spam.test<-spam[-tr.num,]

	library(ipred)
	spam.bag<- bagging(type~.,data=spam.train, nbagg=40) 
	spam.bagp<- predict(spam.bag,spam.test[,-ncol(spam)],type= "class")
	(spam.bagt<- table(spam.test[,ncol(spam)], spam.bagp))
	sum(diag(spam.bagt)) / sum(spam.bagt) 

ブースティング (boosting)  

    #install.packages("ada")
	library(ada)
	spam.ada<-ada(type~.,data=spam.train, iter=20)
	spam.adap<-predict(spam.ada, spam.test[,-ncol(spam)], type="vector")
	(spam.adat<-table(spam.test[,ncol(spam)], spam.adap))
	sum(diag(spam.adat))/sum(spam.adat)
	plot(spam.ada,kappa=TRUE, spam.test[,-ncol(spam)],spam.test[,ncol(spam)])

ランダム森 (RF; random forest)  

	library(randomForest)
	spam.rf<-randomForest(type~., data=spam.train,na.action="na.omit")
	print(spam.rf)
	summary(spam.rf)
	spam.rf$type
	plot(spam.rf)
    head(spam.rf$err.rate) # OOB(out-of-bag)
	spam.rf$importance
	varImpPlot(spam.rf)

	spam.rfp<-predict(spam.rf, spam.test[,-ncol(spam)])
	(spam.rft<-table(spam.test[,ncol(spam)], spam.rfp))
	sum(diag(spam.rft))/sum(spam.rft)

----------
## Acknowledgements

----------
## References


https://matome.naver.jp/odai/2145718453057572201
R言語で機械学習　人工知能 - NAVER まとめ 

----------
