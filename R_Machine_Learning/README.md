----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-05-20

----------

# Machine Learning
[機械学習](https://ja.wikipedia.org/wiki/機械学習)

## Table of Contents
- [TJO](#tjo)
  - [2015-11-26](#2015-11-26) ヒトの直感的理解は単変量モデルまで、直感を超えたければ多変量モデルへ
- [JIN'S PAGE](#jins-page)
  - [Chap_31](#chap_31) Rとカーネル法
  - [Chap_32](#chap_32) Rと集団学習

## Execution environment

    > sessionInfo()
    R version 3.3.3 (2017-03-06)
    Platform: x86_64-apple-darwin13.4.0 (64-bit)
    Running under: OS X Mavericks 10.9.5

----------
## [TJO](https://twitter.com/tjo_datasci)

### 2015-11-26
http://tjo.hatenablog.com/entry/2015/11/26/190000
ヒトの直感的理解は単変量モデルまで、直感を超えたければ多変量モデルへ

https://twitter.com/TJO_datasci/status/865383819301404673
TJO on Twitter: "前にも書いたネタだけど「機械学習で取り組むならヒトの直感が及ばない多変量の世界に挑むべき」という。多変量は基本的にヒトは本質的に理解できない。単変量もしくは空間的・時間的相関のある情報だとまだまだヒトの方が分があると思う https://t.co/tvNHxnbPBV"

赤ワインのデータ

    curl -O https://raw.githubusercontent.com/ozt-ca/tjo.hatenablog.samples/master/r_samples/public_lib/jp/exp_uci_datasets/wine/winequality_red_blog.RData

    load("winequality_red_blog.RData")

定量的に科学するということ＝還元主義？

ヒトが直感的に理解できるのは単変量モデルまで（≒古典的還元主義）


多変量モデルはヒトの直感を超えるが、より正確な予測を与える上に非線形な効果も分かる



実は多変量モデルこそがヒトの暗黙知としての「学習」に対応するのかも？




----------

## [JIN'S PAGE](http://mjin.doshisha.ac.jp/R/)

### [Chap_31](http://mjin.doshisha.ac.jp/R/Chap_31/31.html)
Rとカーネル法

カーネル主成分分析 (KPCA; kernel principal component analysis)

    #install.packages("kernlab")
    #iris.kpc1<-kpca(x, kernel = "polydot", features=2,kpar=list(degree =1))

サポートベクターマシン (SVM: Support Vector Machine) 


### [Chap_32](http://mjin.doshisha.ac.jp/R/Chap_32/32.html)
Rと集団学習

集団学習 (ensemble learning)  

バギング (bagging) bootstrap aggregating  

    tr.num<-sample(nrow(spam),2500)


ブースティング (boosting)  

    #install.packages("ada")

ランダム森 (RF; random forest)  

    head(spam.rf$err.rate) # OOB(out-of-bag)


### [Chap_42](http://mjin.doshisha.ac.jp/R/Chap_42/42.html)
**Rと系統樹(1)**

1．系統樹
2．系統樹の推定 (距離法)
(1)　距離


### [Chap_43](http://mjin.doshisha.ac.jp/R/Chap_43/43.html)
**Rと系統樹(2)**

1．系統樹のデザインと操作
(1)　先端のデザイン


----------
## Acknowledgements

----------
## References

https://matome.naver.jp/odai/2145718453057572201
R言語で機械学習　人工知能 - NAVER まとめ
https://matome.naver.jp/odai/2145718453057572201?&page=3

----------

