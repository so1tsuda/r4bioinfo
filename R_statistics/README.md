Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-12-02

----------

# Statistics
**統計学**

## Table of Contents
- [Updates](#updates)
  - [2017-11](#2017-11)
  - [2017-09](#2017-09)
- [DoE](#doe)
- [ROC](#roc)
- [MIC](#mic) Maximal information coefficient
- [violinplot](#violinplot)
- [Fixed or Random Effects](#fixed-or-random-effects)
- [References](#references)
  - [biopapyrus](#biopapyrus)

----------
## Updates
### 2017-12
### 2017-11
### 2017-11-16

https://twitter.com/kohske/status/930869204911194112
kohske on Twitter: "思い出した、シンプソンのパラドックスだ。 https://t.co/jxIo1Ipngx https://t.co/W7R7mDc1eI"

https://twitter.com/h_okumura/status/930651352052715521
Haruhiko Okumura on Twitter: "労働時間と知的好奇心には，国レベルでは非常に強い負の相関があるが，個人レベルでは逆に正の相関がある https://t.co/N8Z00ljFfB"

https://oku.edu.mie-u.ac.jp/~okumura/stat/piaac.html
奥村 晴彦
Last modified: 2017-11-15 13:15:29





    # wh                0.001243   0.000180   6.904 5.08e-12 ***


### 2017-09

2017年09月16日 | 統計学
http://blog.goo.ne.jp/r-de-r/e/019d0afc8e702b044768dd8eeaed3dcf
wilcox.test と wilcox_test 前者だったら残念ですね！ - 裏 RjpWiki
どんな場合でも，coin ライブラリの wilcox_test を使おうということだ。
wilcox.test は使わない。

----------
## DoE
Design of experiments

https://ja.wikipedia.org/wiki/実験計画法
品種・施肥量・圃場の3因子につき各3水準を設定するとしよう。一般には全部で 3 x 3 x 3 = 27 通りの実験が必要である。しかし、交互作用が無視できる場合には表2 に示すように9通りに減らすことができ、

![](https://ja.wikipedia.org/wiki/ファイル:実験計画2.gif)

2017-02-05
https://www.placeon.jp/blog/words/words_monozukuri/experimental_design/
試験回数を減らそう（実験計画法）

2017-10-12
https://www.trifields.jp/r-cran-task-view-design-of-experiments-analysis-of-experimental-data-723
R言語 CRAN Task View：実験計画法（DoE）および実験データの分析の設計 | トライフィールズ

2016-09-18
http://nakhirot.hatenablog.com/entry/20160918/1474166690
R 実験計画法を利用した要因分析 - DSL_statblog

2. 直交表によるパターン数の削減

Rのconjointパッケージに含まれるcaFactorialDesign関数を用いると直交表を作成した上でパターン数を削減することができる。

    install.packages("conjoint", dependencies=TRUE)
    library(conjoint)

Error : .onLoad failed in loadNamespace() for 'rgl', details:

2016/06/08
https://fisproject.jp/2016/06/design-of-experiment/
【R】実験計画法と分散分析【DoE.base】 | FiS Project

直交計画
Rでは {DoE.base} で直交表を生成できる。上記例だと, L9-3-4の直交表となる。


分散分析

Sep 12, 2012
https://www.slideshare.net/itoyan110/r-14261638
Rで実験計画法 後編

Sep 5, 2011
https://www.slideshare.net/itoyan110/r-9139125
Rで実験計画法 前編

2011
https://www.jstage.jst.go.jp/article/weed/56/1/56_1_24/_article/-char/ja/
実験計画の立て方とRを用いた分散分析: 実験計画法に応じた分散分析の実行

2016年08月20日
https://www.asakura.co.jp/books/isbn/978-4-254-12216-9/
朝倉書店｜Rで学ぶ 実験計画法

2010/12/1
http://www.juse-p.co.jp/cgi-bin/html.pl5?i=ISBN978-4-8171-9371-1
ＲとＲコマンダーではじめる実験計画法
http://www.ec.kansai-u.ac.jp/user/arakit/RDOE.html
RDOE

----------
## [ROC](https://ja.wikipedia.org/wiki/受信者操作特性)

2017-05-27
https://qiita.com/kenmatsu4/items/550b38f4fa31e9af6f4f
【統計学】ROC曲線とは何か、アニメーションで理解する。

2016-02-21
https://oku.edu.mie-u.ac.jp/~okumura/stat/ROC.html
ROC曲線

----------
## MIC
https://en.wikipedia.org/wiki/Maximal_information_coefficient
Maximal information coefficient

2 years, 5 months ago
https://stats.stackexchange.com/questions/157143/maximal-information-coefficient-mic
correlation - maximal information coefficient - MIC - Cross Validated

the coefficient is between 0 and 1, 

0 implies statistically independent variables and 1 perfect (noiseless) functional relationship, up to the approximation determined by the parameter α

September 17, 2014
http://menugget.blogspot.jp/2014/09/maximal-information-coefficient-part-ii.html
me nugget: Maximal Information Coefficient (Part II)

December 19, 2011
https://menugget.blogspot.jp/2011/12/maximal-information-coefficient-mic.html
me nugget: Maximal Information Coefficient (MIC)

Aug 30, 2013
https://www.slideshare.net/motivic/tokyo-r-lt-25759212
21世紀の手法対決 (MIC vs HSIC)

    #install.packages("minerva")

----------
## violinplot
[バイオリン図](https://ja.wikipedia.org/wiki/バイオリン図)

![https://en.wikipedia.org/wiki/Violin_plot](https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Violinplot-hiv-paper-plot-pathogens.svg/320px-Violinplot-hiv-paper-plot-pathogens.svg.png)

2017.06.10
https://stats.biopapyrus.jp/r/graph/violinplot.html
ヴァイオリンプロット


2017-06-05
http://d.hatena.ne.jp/MikuHatsune/20170605/1496667435
violinplot の上半分だけ欲しい - 驚異のアニヲタ社会復帰への道

2016-08-20
http://yyhhyy.hatenablog.com/entry/2016/08/20/220000
箱ひげ図とバイオリンプロットの印象の違い



2016/03/18
https://www.karada-good.net/analyticsr/r-446
Rで解析：補助プロットにバイオリンプロットはいかがでしょうか「vioplot」パッケージ

2012/08/31
https://cis-jp.blogspot.jp/2012/08/blog-post_3858.html
色々と考えてみる: 文系のための「数の可視化」（７）

----------
## Fixed or Random Effects

https://mumu.jpn.ph/forest/computer/2016/03/30/3010/
メタアナリシスのモデル | Dr.Clover's Computer Clinic

2015年10月29日
http://n-n-y.blogspot.jp/2015/10/fixed-effects-random-effects.html
ぐちゃぐちゃのーと: 統計: Fixed Effects (固定効果) とRandom Effects (ランダム効果)

2015年6月18日
http://tarohmaru.web.fc2.com/R/GLM.html
離散変数の固定／ランダム効果モデル
2 Fixed Effects Model: ロジスティック回帰分析の固定効果モデルとランダム効果モデル

2012-09-24
http://hosho.ees.hokudai.ac.jp/~kubo/ce/RandomEffectsCrawley.html
生態学データ解析 - ランダム効果とは?
混合効果モデル (mixed effects models) がそう呼ばれている理由はその説明変数 に固定効果 (fixed effects) とランダム効果 (random effects) がまざっているからだ． これらはそれぞれ応答変数 y に対して
- 固定効果 (fixed effects): y の平均にだけ影響およぼす (久保注: 正確には中央値に影響をおよぼす; その結果として平均値なども変わる)
- ランダム効果 (random effects): y の分散 (ばらつき) にだけ影響およぼす (久保注: となるとこちらは中央値は変えないけどばらつきは変える，となるのかな?)

----------
## sample

http://www2.kobe-u.ac.jp/~hamori/Jhamori/explanation(sample%20size).pdf
 (1)「標本の大きさ(サンプルサイズ:sample size)と標本数」について

2017年9月30日
https://sites.google.com/site/fishermultiplecomparison/samplesize
サンプル数とサンプルサイズ n は意味が違う - 統計学的手法の話題 - 生物科学研究所

8:30 PM - 17 Dec 2016
https://twitter.com/stattan/status/810296121805283328
統計たん@本質的に不良設定問題 on Twitter: "サンプルサイズはどれくらいなら十分ですか？！と聞かれても何を達成したいのかがわからないと答えられないですよ。例えば、とある効果量を仮定したもとで検定力を0.8にしたいとか、標準誤差の大きさを○○くらいに抑えたい、などなど。"

2015年9月4日
https://togetter.com/li/869445
統計解析の目的：知見の一般化？それとも、傾向の確認？その場合の再現性って何？ - Togetterまとめ 
- 推測統計学のもうひとつの問題は「実際にはほとんど誰もランダムサンプリングなどしていない」ということで，これは別に心理学や教育学，医学などよくそれで批判される分野に限ったことではなくて，推測統計学の本家本元である農学分野の研究でもランダム性などほとんど保証されないように見える。

http://interdisciplinary.hateblo.jp/entry/20130503/p1
標本の大きさ（サンプルサイズ）の意味でサンプル数を使うのは間違いである

Oct 30, 2010
https://www.youtube.com/watch?v=Hz1fyhVOjr4
Biologist talks to statistician

----------
## References

### [biopapyrus](https://biopapyrus.jp)

https://stats.biopapyrus.jp
biostatistics | バイオスタティスティクス | 生物統計学

https://stats.biopapyrus.jp/r/
R | R の使い方、グラフの書き方、ggplot の使い方

### Unclassified

http://statmodeling.hatenablog.com/category/書評?page=1473554942
StatModeling Memorandum
StanとRとPythonでベイズ統計モデリングします. たまに書評.

名著「図解・ベイズ統計「超」入門 あいまいなデータから未来を予測する技術」涌井貞美著

http://aoki2.si.gunma-u.ac.jp/taygeta/statistics.cgi
統計学関連なんでもあり

http://mjin.doshisha.ac.jp/R/
JIN'S PAGE
R、R言語、R環境・・・・・・

----------
## Execution environment

    > R.version.string
    "R version 3.3.3 (2017-03-06)"

----------

