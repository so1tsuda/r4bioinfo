----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-04-15

----------

# Deep Learning
[ディープラーニング](https://ja.wikipedia.org/wiki/ディープラーニング)

## Table of Contents
- [References](#references)
- [2017-01-03](#2017-01-03) MXNetR で Autoencoder を作ってみる - Qiita
- [2016-08-14](#2016-08-14) Deep Learning in R | R Tutorial
- [2016-03-29](#2016-03-29) Deep Learningライブラリ{mxnet}のR版でConvolutional Neural Networkをサクッと試してみた
- [2014-10-23](#2014-10-23) H2OのRパッケージ{h2o}でお手軽にDeep Learningを実践してみる(1)：まずは決定境界を描く
- [2016-03-31](#2016-03-31) Deep Learningライブラリ「MXNet」のR版をKaggle Otto Challengeで実践してみた
- [](#)


https://www.oreilly.co.jp/books/9784873117584/
O'Reilly Japan - ゼロから作るDeep Learning 

https://github.com/oreilly-japan/deep-learning-from-scratch
oreilly-japan/deep-learning-from-scratch: 『ゼロから作る Deep Learning』のリポジトリ


----------
## Execution environment

	> sessionInfo()
	R version 3.3.3 (2017-03-06)
	Platform: x86_64-apple-darwin13.4.0 (64-bit)
	Running under: OS X Mavericks 10.9.5

	$java -version
	java version "1.8.0_121"
	Java(TM) SE Runtime Environment (build 1.8.0_121-b13)
	Java HotSpot(TM) 64-Bit Server VM (build 25.121-b13, mixed mode)

----------

## 2017-04
http://touch-sp.hatenablog.com/archive/2017/4
2017-04-01から1ヶ月間の記事一覧 - パソコン関連もろもろ

	git clone https://github.com/oreilly-japan/deep-learning-from-scratch

## 2017-04-17
http://touch-sp.hatenablog.com/entry/2017/04/17/115423
RでDeep Learning（１）

    library(magrittr); ?'%>%'

## 2017-04-18
http://touch-sp.hatenablog.com/entry/2017/04/18/005737
RでDeep Learning（２）

  cannot open file 'network_W1.csv': No such file or directory

pp73 [O'Reilly Japan - ゼロから作るDeep Learning](https://www.oreilly.co.jp/books/9784873117584/)

https://github.com/oreilly-japan/deep-learning-from-scratch/blob/master/dataset/mnist.py


----------
## 2017-01-03
http://qiita.com/mwmsnn/items/6ca48a3b8292211c1acd
MXNetR で Autoencoder を作ってみる - Qiita

パッケージの読み込みとシード固定

	library(mxnet)
	mx.set.seed(0)

データセットを読み込む

    system("curl -O https://raw.githubusercontent.com/sbussmann/kaggle-mnist/master/Data/train.csv")

	# KaggleからダウンロードしたMNISTデータを読み込む
	rawdata <- read.csv("train.csv", header = T)
	rawdata <- as.matrix(rawdata)

	# 訓練データとテストデータに分ける
	# http://qiita.com/7of9/items/da049f2a32d53c2e381e
	# http://yukiyanai.github.io/jp/classes/rm1/contents/R/uncertainty.html
	train.index <- sample(x = 1:nrow(rawdata), size = 30000, replace = TRUE)
	train <- rawdata[train.index, ]
	test <- rawdata[-train.index, ]

	# データとラベルに分ける。転置しているのは、colmajor形式にするため
	train.x <- t(train[, -1]/ 255)
	train.y <- train[,  1]
	test.x <- t(test[, -1]/ 255)
	test.y <- test[,  1]

Autoencoder を作る
エンコードする
各層の学習を行う
10クラス分類器を定義する
Fine-tuning を行う
予測結果を確認する

Done.

----------
## 2016-08-14
http://www.r-tutor.com/deep-learning/introduction
Deep Learning in R | R Tutorial



http://www.r-tutor.com/content/download
Download | R Tutorial

	curl -O http://www.r-tutor.com/sites/default/files/rpud/rpux_0.6.1_mac.tgz

http://www.r-tutor.com/gpu-computing/rpud-installation
Installing GPU Packages | R Tutorial

	# Mac OS X
	tar xf rpux_0.6.1_mac.tgz 
	cd rpux_0.6.1_mac
	R CMD INSTALL rpud_0.6.1.tgz 
	R CMD INSTALL rpudplus_0.6.1.tgz
	R CMD INSTALL rpud_0.6.1_src.tgz

configure: error: "cannot find nvcc; check CUDA install"
ERROR: configuration failed for package ‘rpud’

----------
## 2016-03-31
http://keiku.hatenablog.jp/entry/2016/03/31/172456
Deep Learningライブラリ「MXNet」のR版をKaggle Otto Challengeで実践してみた - Think more, try less



----------
## 2017-04-02
http://qiita.com/HirofumiYashima/items/91c7d5d42cba7084966f
【 Deep neural network の 代替モデル を 標榜 】DeepForestモデル の python & R言語 実装コード事例 - Qiita

## 2015-10-14
https://gist.github.com/HirofumiYashima/99e00a36c79910aad616
http://qiita.com/HirofumiYashima/items/68d56cfbab2834c1febb
R言語 で Deep Learning と 従来型 機械学習 7 手法 分類問題 エラー率比較　～ H2O パッケージ編 - Qiita

	install.packages("h2o", repos=(c("http://s3.amazonaws.com/h2o-release/h2o/master/1542/R", getOption("repos"))))
	library(h2o)

----------
## 2015-07-22
http://shinya131-note.hatenablog.jp/entry/2015/07/22/220657
RでH2O failed to start, stopping execution.が発生した - 機略戦記

http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
jdk-8u121-macosx-x64.dmg
インストールして問題解決

----------
## 2014-05-03
http://d.hatena.ne.jp/dichika/20140503/p1
Rで一行でディープラーニング - 盆栽日記

	library(h2o)

	> localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE)




----------
## TJO
https://twitter.com/tjo_datasci
TJO (@TJO_datasci) | Twitter

## 2016-03-29
http://tjo.hatenablog.com/entry/2016/03/29/180000
Deep Learningライブラリ{mxnet}のR版でConvolutional Neural Networkをサクッと試してみた（追記3件あり） - 六本木で働くデータサイエンティストのブログ

インストール
https://github.com/dmlc/mxnet/tree/master/R-package#installation

	# Installation
	install.packages("drat", repos="https://cran.rstudio.com")
	drat:::addRepo("dmlc")
	install.packages("mxnet")
	library(mxnet)

データセットの準備

	# Data preparation
	train<-read.csv('https://github.com/ozt-ca/tjo.hatenablog.samples/raw/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_train.csv')
	test<-read.csv('https://github.com/ozt-ca/tjo.hatenablog.samples/raw/master/r_samples/public_lib/jp/mnist_reproduced/short_prac_test.csv')
	train<-data.matrix(train)
	test<-data.matrix(test)
	train.x<-train[,-1]
	train.y<-train[,1]
	train.x<-t(train.x/255)
	test_org<-test
	test<-test[,-1]
	test<-t(test/255)
	table(train.y)

Deep Neural Network (DNN)で試してみる

	# Deep NN
	data <- mx.symbol.Variable("data")
	fc1 <- mx.symbol.FullyConnected(data, name="fc1", num_hidden=128)
	act1 <- mx.symbol.Activation(fc1, name="relu1", act_type="relu")
	fc2 <- mx.symbol.FullyConnected(act1, name="fc2", num_hidden=64)
	act2 <- mx.symbol.Activation(fc2, name="relu2", act_type="relu")
	fc3 <- mx.symbol.FullyConnected(act2, name="fc3", num_hidden=10)
	softmax <- mx.symbol.SoftmaxOutput(fc3, name="sm")
	devices <- mx.cpu()
	mx.set.seed(0)
	model <- mx.model.FeedForward.create(softmax, X=train.x, y=train.y,
	 ctx=devices, num.round=10, array.batch.size=100,
	 learning.rate=0.07, momentum=0.9,  eval.metric=mx.metric.accuracy,
	 initializer=mx.init.uniform(0.07),
	 epoch.end.callback=mx.callback.log.train.metric(100))

	preds <- predict(model, test, ctx=devices)
	dim(preds)
	pred.label <- max.col(t(preds)) - 1
	table(pred.label)
	head(pred.label)
	table(test_org[,1],pred.label)
	sum(diag(table(test_org[,1],pred.label)))/1000

Convolutional Neural Network (CNN)で試してみる

途中

## 2014-12-06
https://www.slideshare.net/takashijozaki1/japan-r2014-tjo
Deep Learningと他の分類器をRで比べてみよう in Japan.R 2014

## 2014-10-23
http://tjo.hatenablog.com/entry/2014/10/23/230847
H2OのRパッケージ{h2o}でお手軽にDeep Learningを実践してみる(1)：まずは決定境界を描く - 六本木で働くデータサイエンティストのブログ

    system("curl -O https://raw.githubusercontent.com/ozt-ca/tjo.hatenablog.samples/master/r_samples/public_lib/jp/conflict_sample.txt")

    library(h2o)

いつもの多変量データで手っ取り早くh2o.deeplearningを試してみる

	localH2O <- h2o.init(ip = "localhost", port = 54321, startH2O = TRUE, nthreads=-1)

    # http://labo.utsubo.tokyo/2016/07/28/rのh2oでエラー対応法/
    cfData<-h2o.importFile(path="conflict_sample.txt")
    head(cfData)

	res.err.dl<-rep(0,100)
	numlist<-sample(3000,100,replace=F)
	for(i in 1:100){
	 cf.train <- cfData[-numlist[i],]
	 cf.test <- cfData[numlist[i],]
	 # http://labo.utsubo.tokyo/2016/07/28/rのh2oでエラー対応法/
     res.dl <- h2o.deeplearning(x = 1:7, y = 8, training_frame = cf.train, activation = "Tanh",hidden=rep(20,2))
	 pred.dl <- h2o.predict(object=res.dl,newdata=cf.test[,-8])
	 
	 pred.dl.df <- as.data.frame(pred.dl)
	 test.dl.df <- as.data.frame(cf.test)
	 
	 res.err.dl[i] <- ifelse(as.character(pred.dl.df[1,1])==as.character(test.dl.df[1,8]),0,1)
	 }

	sum(res.err.dl)

なお、svm{e1071}で同じことをやった結果がこちら。

    #install.packages("e1071")
	library(e1071)
	d<-read.table("conflict_sample.txt", header=TRUE, quote="\"")
	res.err.svm<-rep(0,100)
	numlist<-sample(3000,100,replace=F)
	for(i in 1:100){
	 cf.train <- d[-numlist[i],]
	 cf.test <- d[numlist[i],]
	 res.svm <- svm(cv~.,cf.train)
	 pred.svm <- predict(res.svm,newdata=cf.test[,-8])
	 res.err.svm[i] <- ifelse(pred.svm==cf.test[,8], 0, 1)
	}
	sum(res.err.svm)

なお、単一の試行でベタっと比べてconfusion matrix書いてみた結果が以下。

	d.dl.pred<-h2o.predict(object=d.dl,newdata=cfData[,-8])

> 	d.dl.pred<-h2o.predict(object=d.dl,newdata=cfData[,-8])
Error in paste0("Predictions/models/", object@model_id, "/frames/", h2o.getId(newdata)) : 
  object 'd.dl' not found

    # object=d.dl -> object=res.dl に修正したが、これで正しい？
    d.dl.pred<-h2o.predict(object=res.dl,newdata=cfData[,-8])

	d.dl.pred.df<-as.data.frame(d.dl.pred)
	table(d$cv,as.character(d.dl.pred.df[,1]))

	d.svm<-svm(cv~.,d)
	d.svm.pred<-predict(d.svm,newdata=d[,-8])
	table(d$cv,d.svm.pred)

途中。一応、動いている

----------

----------
## Acknowledgements

----------
## References

Author:	Riccardo Rizzo

First Online: 31 July 2016
http://link.springer.com/chapter/10.1007/978-3-319-44332-4_10
A Deep Learning Approach to DNA Sequence Classification | SpringerLink

June 23 - 24, 2016 
http://dl.acm.org/citation.cfm?id=2983489
Classification Experiments of DNA Sequences by Using a Deep Neural Network and Chaos Game Representation





2017-03-07
http://www.rblog.uni-freiburg.de/2017/02/07/deep-learning-in-r/
Deep Learning in R – R Blog

2017-02-06
https://www.r-bloggers.com/deep-learning-in-r-2/
Deep Learning in R | R-bloggers

http://blog.revolutionanalytics.com/2017/02/deep-learning-in-r.html
A comparison of deep learning packages for R
February 13, 2017

https://www.oreilly.com/ideas/deep-learning-meets-genome-biology
Deep learning meets genome biology - O'Reilly Media
By David Beyer April 27, 2016

Written Apr 10, 2016
https://www.quora.com/What-are-the-best-packages-for-deep-learning-in-R
What are the best packages for deep learning in R? - Quora


Review
https://www.ncbi.nlm.nih.gov/pubmed/27474269
Mol Syst Biol. 2016 Jul 29;12(7):878. doi: 10.15252/msb.20156651.
Deep learning for computational biology.
Angermueller C1, Pärnamaa T2, Parts L3, Stegle O4.

![](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4965871/bin/MSB-12-878-g001.jpg)

https://www.ncbi.nlm.nih.gov/pubmed/27473064
Brief Bioinform. 2016 Jul 29. pii: bbw068. [Epub ahead of print]
Deep learning in bioinformatics.
Min S, Lee B, Yoon S.

![](https://oup.silverchair-cdn.com/oup/backfile/Content_public/Journal/bib/PAP/10.1093_bib_bbw068/2/m_bbw068f2p.jpeg?Expires=1492322095&Signature=LOpu6w596BlzZDCGwFWgdvjrxhuxHH85riIE89loM93Yu2cQY5NRtJlOlbE-7Kckm5uEm8U7GBWNHOnrDaR4PpfjWfEuEU1pXJ~7HreLn1p6kfJOPD1QFV8TmrtWuBM0Or88Fo8r7CPtZxNBJcJMHURozGWPhb-anDAvNgPP7TATnkNQ8LPeDxWeyqWbEaj9xTHkIOZd4YM2nONdyAhhtglrbcp4BdeRcAan2uxj9A9MOmRj~okxDwGeBcxwXKj9J0SLmQUmtds46D-HQpStpB7JEqChBKj0zpx7jDLNydXfa4XeUk2Ua0a5Dz3166~s54hr6tuOfDchNHtCvw7f6Q__&Key-Pair-Id=APKAIUCZBIA4LVPAVW3Q)

https://www.ncbi.nlm.nih.gov/pubmed/27018908
PLoS Comput Biol. 2016 Mar 28;12(3):e1004845. doi: 10.1371/journal.pcbi.1004845. eCollection 2016.
Deep Learning for Population Genetic Inference.
Sheehan S1,2, Song YS2,3,4,5,6.

https://followthedata.wordpress.com/tag/deep-learning/
List of deep learning implementations in biology
2015-12-21

https://www.ncbi.nlm.nih.gov/pubmed/26213851
Nat Biotechnol. 2015 Aug;33(8):831-8. doi: 10.1038/nbt.3300. Epub 2015 Jul 27.
Predicting the sequence specificities of DNA- and RNA-binding proteins by deep learning.
Alipanahi B1, Delong A2, Weirauch MT3, Frey BJ4.

https://www.oreilly.co.jp/books/9784873117584/
O'Reilly Japan - ゼロから作るDeep Learning

http://wiki.lifesciencedb.jp/mw/BH14.14/MachineLearning
ディープラーニング・機械学習などを活用した大量データ処理

佐藤 賢二
https://kaken.nii.ac.jp/ja/grant/KAKENHI-PROJECT-26330328/
KAKEN — ディープラーニングを用いた大規模配列データからの階層的特徴抽出
研究期間 (年度)	2014-04-01 – 2017-03-31

https://www.scirp.org/journal/PaperInformation.aspx?PaperID=65923
JBiSE> Vol.9 No.5, April 2016
DNA Sequence Classification by Convolutional Neural Network

http://miyake.bpe.es.osaka-u.ac.jp/ban_da_ji_chu_gong_san_zhai_yan_jiu_shi/yan_jiu_nei_ronggenomuinfomatikkusu.html
深層学習（ディープラーニング）
ゲノムインフォマティックスへの応用 　

http://www.johokiko.co.jp/seminar_chemical/ai_deeplearning.php
機械学習・ディープラーニング・人工知能：関連セミナー、書籍

http://sssslide.com/speakerdeck.com/ktnyt/nekodemowakarushen-ceng-xue-xi-ru-men
ねこでもわかる深層学習入門byktnyt (2017/02/04)

----------

https://github.com/haruosuz/plasmids

https://github.com/haruosuz/DS4GD
生命動態のデータサイエンス
DATA SCIENCE FOR GENOME DYNAMICS [DS2] GENOME INFORMATICS
https://github.com/haruosuz/DS4GD/tree/master/2017

メタゲノムのコドン使用
https://www.ncbi.nlm.nih.gov/pubmed/27115650
Methods Mol Biol. 2016;1415:509-31. doi: 10.1007/978-1-4939-3572-7_26.
Big Data, Evolution, and Metagenomes: Predicting Disease from Gut Microbiota Codon Usage Profiles.
Fabijanić M1, Vlahoviček K2.


----------
