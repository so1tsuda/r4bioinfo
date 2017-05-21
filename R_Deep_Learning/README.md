----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-04-15

----------

# Deep Learning
[ディープラーニング](https://ja.wikipedia.org/wiki/ディープラーニング)

## Table of Contents
- [References](#references)
- [2017-04](#2017-04) RでDeep Learning
- [2017-01-03](#2017-01-03) MXNetR で Autoencoder を作ってみる - Qiita
- [2016-08-14](#2016-08-14) Deep Learning in R | R Tutorial
- [2016-03-29](#2016-03-29) Deep Learningライブラリ{mxnet}のR版でConvolutional Neural Networkをサクッと試してみた
- [2014-10-23](#2014-10-23) H2OのRパッケージ{h2o}でお手軽にDeep Learningを実践してみる(1)：まずは決定境界を描く
- [2016-03-31](#2016-03-31) Deep Learningライブラリ「MXNet」のR版をKaggle Otto Challengeで実践してみた
- [](#)

----------
## Execution environment



----------

https://www.oreilly.co.jp/books/9784873117584/
O'Reilly Japan - ゼロから作るDeep Learning 

https://github.com/oreilly-japan/deep-learning-from-scratch
oreilly-japan/deep-learning-from-scratch: 『ゼロから作る Deep Learning』のリポジトリ


## 2017-04
http://touch-sp.hatenablog.com/archive/2017/4

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


データセットを読み込む

    system("curl -O https://raw.githubusercontent.com/sbussmann/kaggle-mnist/master/Data/train.csv")




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


http://www.r-tutor.com/gpu-computing/rpud-installation
Installing GPU Packages | R Tutorial


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




----------
## TJO
https://twitter.com/tjo_datasci
TJO (@TJO_datasci) | Twitter

## 2016-03-29
http://tjo.hatenablog.com/entry/2016/03/29/180000
Deep Learningライブラリ{mxnet}のR版でConvolutional Neural Networkをサクッと試してみた（追記3件あり） - 六本木で働くデータサイエンティストのブログ

インストール
https://github.com/dmlc/mxnet/tree/master/R-package#installation


データセットの準備


Deep Neural Network (DNN)で試してみる



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


    # http://labo.utsubo.tokyo/2016/07/28/rのh2oでエラー対応法/
    cfData<-h2o.importFile(path="conflict_sample.txt")
    head(cfData)

     res.dl <- h2o.deeplearning(x = 1:7, y = 8, training_frame = cf.train, activation = "Tanh",hidden=rep(20,2))


なお、svm{e1071}で同じことをやった結果がこちら。

    #install.packages("e1071")

なお、単一の試行でベタっと比べてconfusion matrix書いてみた結果が以下。


> 	d.dl.pred<-h2o.predict(object=d.dl,newdata=cfData[,-8])
Error in paste0("Predictions/models/", object@model_id, "/frames/", h2o.getId(newdata)) : 
  object 'd.dl' not found

    # object=d.dl -> object=res.dl に修正したが、これで正しい？
    d.dl.pred<-h2o.predict(object=res.dl,newdata=cfData[,-8])



途中

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
