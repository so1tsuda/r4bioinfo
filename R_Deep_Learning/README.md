----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-04-15

----------

# Deep Learning
[ディープラーニング](https://ja.wikipedia.org/wiki/ディープラーニング)

## Table of Contents
- [References](#references)
- [2017-02-06](#2017-02-06) Deep Learning in R | R-bloggers
- [2017-01-03](#2017-01-03) MXNetR で Autoencoder を作ってみる - Qiita
- [2016-08-14](#2016-08-14) Deep Learning in R | R Tutorial
- [](#)

----------
## mxnet

インストール
https://github.com/dmlc/mxnet/tree/master/R-package#installation

	install.packages("drat", repos="https://cran.rstudio.com")
	drat:::addRepo("dmlc")
	install.packages("mxnet")

----------
## 2017-02-06
https://www.r-bloggers.com/deep-learning-in-r-2/
Deep Learning in R | R-bloggers

----------
## 2017-01-03
http://qiita.com/mwmsnn/items/6ca48a3b8292211c1acd
MXNetR で Autoencoder を作ってみる - Qiita

	library(mxnet)
	mx.set.seed(0)

    system("curl -O https://raw.githubusercontent.com/nybbles/kaggle/master/train.csv")

	# KaggleからダウンロードしたMNISTデータを読み込む
	rawdata <- read.csv("train.csv", header = T)
	rawdata <- as.matrix(rawdata)


> # 訓練データとテストデータに分ける
> train.index <- sample(x = 1:nrow(rawdata), size = 30000)
Error in sample.int(length(x), size, replace, prob) : 
  cannot take a sample larger than the population when 'replace = FALSE'
> train <- rawdata[train.index, ]
Error: object 'train.index' not found
> test <- rawdata[-train.index, ]
Error: object 'train.index' not found

----------
## 2016-08-14
http://www.r-tutor.com/deep-learning/introduction
Deep Learning in R | R Tutorial

	library(rpud)

	> install.packages("rpud")
	Warning message:
	package ‘rpud’ is not available (for R version 3.3.3) 

----------
## 2016-03-31
http://keiku.hatenablog.jp/entry/2016/03/31/172456
Deep Learningライブラリ「MXNet」のR版をKaggle Otto Challengeで実践してみた - Think more, try less


----------
## 2015-10-14
https://gist.github.com/HirofumiYashima/99e00a36c79910aad616
http://qiita.com/HirofumiYashima/items/68d56cfbab2834c1febb
R言語 で Deep Learning と 従来型 機械学習 7 手法 分類問題 エラー率比較　～ H2O パッケージ編 - Qiita

	install.packages("h2o", repos=(c("http://s3.amazonaws.com/h2o-release/h2o/master/1542/R", getOption("repos"))))
	library(h2o)

----------
## 2014-05-03
http://d.hatena.ne.jp/dichika/20140503/p1
Rで一行でディープラーニング - 盆栽日記

	library(h2o)

	> localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = TRUE)

	Error in h2o.init(ip = "localhost", port = 54321, startH2O = TRUE) : 
	  H2O failed to start, stopping execution.

----------
## TJO
https://twitter.com/tjo_datasci
TJO (@TJO_datasci) | Twitter

## 2016-03-29
http://tjo.hatenablog.com/entry/2016/03/29/180000
Deep Learningライブラリ{mxnet}のR版でConvolutional Neural Networkをサクッと試してみた（追記3件あり） - 六本木で働くデータサイエンティストのブログ


## 2014-12-06
https://www.slideshare.net/takashijozaki1/japan-r2014-tjo
Deep Learningと他の分類器をRで比べてみよう in Japan.R 2014

## 2014-10-23
http://tjo.hatenablog.com/entry/2014/10/23/230847
H2OのRパッケージ{h2o}でお手軽にDeep Learningを実践してみる(1)：まずは決定境界を描く - 六本木で働くデータサイエンティストのブログ

    library("h2o")

まず、h2oをJava VM上で起動させます。当たり前ですが、Java VMが入ってないと動かないので入れてない人は事前にインストールしておきましょう*4。

	> 	localH2O <- h2o.init(ip = "localhost", port = 54321, startH2O = TRUE, nthreads=-1)

Error in h2o.init(ip = "localhost", port = 54321, startH2O = TRUE, nthreads = -1) : 
  H2O failed to start, stopping execution.


----------
## Execution environment

	> sessionInfo()
	R version 3.3.3 (2017-03-06)
	Platform: x86_64-apple-darwin13.4.0 (64-bit)
	Running under: OS X Mavericks 10.9.5

----------
## Acknowledgements

----------
## References

https://www.oreilly.com/ideas/deep-learning-meets-genome-biology
Deep learning meets genome biology - O'Reilly Media
By David Beyer April 27, 2016

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

https://www.ncbi.nlm.nih.gov/pubmed/26213851
Nat Biotechnol. 2015 Aug;33(8):831-8. doi: 10.1038/nbt.3300. Epub 2015 Jul 27.
Predicting the sequence specificities of DNA- and RNA-binding proteins by deep learning.
Alipanahi B1, Delong A2, Weirauch MT3, Frey BJ4.

https://www.oreilly.co.jp/books/9784873117584/
O'Reilly Japan - ゼロから作るDeep Learning

http://wiki.lifesciencedb.jp/mw/BH14.14/MachineLearning
ディープラーニング・機械学習などを活用した大量データ処理

https://kaken.nii.ac.jp/ja/grant/KAKENHI-PROJECT-26330328/
KAKEN — ディープラーニングを用いた大規模配列データからの階層的特徴抽出
研究期間 (年度)	2014-04-01 – 2017-03-31

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
