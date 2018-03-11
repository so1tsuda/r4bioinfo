Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-12-02

----------

# R for statistics
**Rによる統計解析**

## Table of Contents
- [Updates](#updates)
  - [2017-11](#2017-11)
  - [2017-09](#2017-09)
- [MIC](#mic) Maximal information coefficient
- [violinplot](#violinplot)
- [Fixed or Random Effects](#fixed-or-random-effects)
- [References](#references)
  - [biopapyrus](#biopapyrus)

----------
## Updates

### GC skew

https://twitter.com/hoxo_m/status/970197370548862977
h(o x o_)m＜ わかりみ。 on Twitter: "“Rで簡単な変化点検知(changepointパッケージ) - RigelのR言語メモであーる(R言語だけとは言っていない)” https://t.co/NVruBqwjcb"

https://speakerdeck.com/hoxom/bi-nu-nizhen-rarenaitamefalsebian-hua-jian-zhi-ru-men
彼女に振られないための変化検知入門 // Speaker Deck

### 2017-12
### 2017-11

7 Nov 2017
https://twitter.com/fronori/status/927889710206263301
Tetsuo Ishikawa on Twitter: "Rでの同順位ありスピアマン順位相関ρのp値の計算法について書きました。"Cannot compute exact p-value with ties"とか「タイがあるため、正確なp値を計算することができません」表示に怯まないために。 https://t.co/fj9aa3rw5F"

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

http://pediatricsurgery.hatenadiary.jp/entry/2018/03/04/133703
ggplot2でviolin plotとdotplotの両方で可視化する - Note of Pediatric Surgery

28 Nov 2017
https://twitter.com/kyn02666/status/935668829203570688
das Kino on Twitter: "violin plotはデータの位置が分かりにくいことがあって，最近はよほどデータが多くない限りgeom_pointかjitterを使うようにしていたが，sinaplotは両方の性質を持っているようで良さげ。sinaplotパッケージはggplot2ベースではないけど，ggfor… https://t.co/PVISlyMP1m"

2016/11/26
https://www.karada-good.net/analyticsr/r-537
Rで解析：ggplot2の表現が高まります「ggforce」パッケージ

![](https://www.karada-good.net/wp/wp-content/uploads/2016/11/geom_sina-320x263.png)

2017.11.27
https://stats.biopapyrus.jp/r/graph/beeswarm.html
ビースウォーム | 値を点としてグラフ上にプロットされる

![](https://stats.biopapyrus.jp/media/beeswarm3.png)

2017.06.10
https://stats.biopapyrus.jp/r/graph/violinplot.html
ヴァイオリンプロット | 中央値、四分位点のほかに、データの分布密度も同時に確認できるプロット



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

![](https://2.bp.blogspot.com/-YmvzBYCZsuI/UEBR9qPOr-I/AAAAAAAAA3E/dHoF9moqv30/s320/Rplot001.png)

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

