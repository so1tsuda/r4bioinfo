Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-11-23

----------

# Statistics
**統計学**

## Table of Contents
- [violinplot](#violinplot)
- [Fixed or Random Effects](#fixed-or-random-effects)
- [2017-11](#2017-11)
- [2017-10](#2017-10)
- [2017-09](#2017-09)
- [biopapyrus](#biopapyrus)

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
## 2017-11


### 2017-11-16

https://twitter.com/kohske/status/930869204911194112
kohske on Twitter: "思い出した、シンプソンのパラドックスだ。 https://t.co/jxIo1Ipngx https://t.co/W7R7mDc1eI"

https://twitter.com/h_okumura/status/930651352052715521
Haruhiko Okumura on Twitter: "労働時間と知的好奇心には，国レベルでは非常に強い負の相関があるが，個人レベルでは逆に正の相関がある https://t.co/N8Z00ljFfB"

https://oku.edu.mie-u.ac.jp/~okumura/stat/piaac.html
奥村 晴彦
Last modified: 2017-11-15 13:15:29





    # wh                0.001243   0.000180   6.904 5.08e-12 ***


----------
## 2017-10

### MIC
https://en.wikipedia.org/wiki/Maximal_information_coefficient
Maximal information coefficient

Published on Aug 30, 2013
https://www.slideshare.net/motivic/tokyo-r-lt-25759212
21世紀の手法対決 (MIC vs HSIC)

    #install.packages("minerva")

https://stats.stackexchange.com/questions/157143/maximal-information-coefficient-mic
correlation - maximal information coefficient - MIC - Cross Validated

the coefficient is between 0 and 1, 

0 implies statistically independent variables and 1 perfect (noiseless) functional relationship, up to the approximation determined by the parameter α

September 17, 2014
https://www.r-bloggers.com/maximal-information-coefficient-part-ii/
Maximal Information Coefficient (Part II) 

December 19, 2011
https://www.r-bloggers.com/maximal-information-coefficient-mic/
Maximal Information Coefficient (MIC) | R-bloggers

----------
## 2017-09

2017年09月16日 | 統計学
http://blog.goo.ne.jp/r-de-r/e/019d0afc8e702b044768dd8eeaed3dcf
wilcox.test と wilcox_test 前者だったら残念ですね！ - 裏 RjpWiki
どんな場合でも，coin ライブラリの wilcox_test を使おうということだ。
wilcox.test は使わない。


----------
## [biopapyrus](https://biopapyrus.jp)

https://stats.biopapyrus.jp
biostatistics | バイオスタティスティクス | 生物統計学

https://stats.biopapyrus.jp/r/
R | R の使い方、グラフの書き方、ggplot の使い方

----------
## Execution environment

    > R.version.string
    "R version 3.3.3 (2017-03-06)"

----------
## References

http://aoki2.si.gunma-u.ac.jp/taygeta/statistics.cgi
統計学関連なんでもあり

http://mjin.doshisha.ac.jp/R/
JIN'S PAGE
R、R言語、R環境・・・・・・

----------

