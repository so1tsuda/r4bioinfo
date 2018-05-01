Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2018-05-01

----------

# R_memo

## Table of Contents
- [Updates](#updates)
- [Colorless Green Ideas]()
- [TJO]()
- [QTL](#qtl)
- [r-markdown](#r-markdown)
- [stock](#stock)
- [Finance](#finance)

----------

## Updates

----------

## QTL

https://www.ncbi.nlm.nih.gov/pubmed/27284200
Science. 2016 Jun 10;352(6291):aad0189. doi: 10.1126/science.aad0189.
Systems proteomics of liver mitochondria function.
R/qtl (58). 

20171112
https://www.slideshare.net/HiromiKanegae/ngs-81948750
ゲノム育種を実装・利用するためのNGSデータ解析
24. r/qtl

2014年6月28日
https://www.trifields.jp/r-cran-task-view-statistical-genetics-733
QTLマッピング：

2014-05-29
https://lecture.ecc.u-tokyo.ac.jp/~aiwata/biomet/biometrics_lec07.pdf
QTL解析 - 講義用WWWサーバ

https://www.jstage.jst.go.jp/article/jsbbr/15/3/15_122/_pdf
育種学研究 15: 122–127(2013)
特集記事 ワークショップ報告
育種のための情報解析ツール使い倒し塾
神沼英里 1)・七夕高也 2)・矢野健太郎 3)・清水顕史 4)・岩田洋佳 5)

各講演のねらいと要旨
4.QTL 解析の基礎と応用

http://www.eonet.ne.jp/~vor-dem-gesetz/QTL.htm
QTL解析
バイオインフォマティクス講習会(2013年9月12日、日本植物細胞分子生物学会）)

http://www.eonet.ne.jp/~vor-dem-gesetz/Rmap.pdf
R/qtl による連鎖地図の作成
清水顕史

2012-03-06
http://togodb.biosciencedbc.jp/entry/stga_tool/559
R/QTL [ゲノム解析ツール リンク集 - Tool]
QTLマッピングを行うための環境を提供するR（統計解析ソフトウェア）のアドオンプログラムである。HMMを用いることにより遺伝子型が不明なデータに対応できる。

https://www.ncbi.nlm.nih.gov/pubmed/20966004
Bioinformatics. 2010 Dec 1;26(23):2990-2. doi: 10.1093/bioinformatics/btq565. Epub 2010 Oct 21.
R/qtl: high-throughput multiple QTL mapping.
Arends D1, Prins P, Jansen RC, Broman KW.

http://www.ism.ac.jp/~kuriki/paper/kuriki-up-r.pdf
QTL 解析の統計モデルと検定の多重性調整
栗木 哲∗
このような統一的 な扱いは,Sen & Churchill (2001) により提案され,R/qtl (Broman, et al. (2003)) とし て実装されている.
この並べ替え検定は直感的に分かりやすい方法であり,R/qtl などの多くのプログラム に実装されている.しかし次のような問題点がある.

http://www.okadajp.org/RWiki/?Rでベイズ統計学
- bqtl: ベイジアン QTL マッピング用の道具集
- BayesQTLBIC: Bayesian multi-locus QTL analysis based on the BIC criterion

----------

## r-markdown

2018年05月11日
http://www.kyoritsu-pub.co.jp/bookdetail/9784320112438
再現可能性のすゝめ ―RStudioによるデータ解析とレポート作成― / 高橋 康介　著

2018-02-22
http://hosho.ees.hokudai.ac.jp/~kubo/ce/RmarkDown.html
生態学データ解析 - R Markdown

2018/3/12 高橋康介
https://www.slideshare.net/kohske/rrstudior-markdown
再現可能性ベストプラクティス 　解析方法とレポート作成方法の再現可能性 　RとRStudioとR Markdownを通して

Jul 13, 2017
https://www.slideshare.net/YoshihikoKunisato/ss-77835559
統計解析の再現可能性を高める取り組み

"2017年2月17日"
https://kazutan.github.io/kazutanR/Rmd_intro.html
R Markdown入門

2016/10/15
https://kazutan.github.io/HijiyamaR5/rmd_intro.html#/
R Markdown入門
Hijiyama.R #5

2015年8月14日：高橋康介
http://gihyo.jp/admin/serial/01/r-markdown
R Markdownで楽々レポートづくり：連載｜gihyo.jp … 技術評論社

----------

### stock
Stock Price
株価

2017年7月6日
https://logics-of-blue.com/get-stock-data-and-plot-with-r/
Rによる株式データの取得とグラフの描画 | Logics of Blue

http://kabube.hatenablog.com/entry/2016/12/31/000915
【R言語】 時系列データの基本的な分析 その1 - 株初心者が本気で儲けるブログ

https://dmjtmj-stock.com/entry/2016/12/19/20161219000000
【R言語】 Yahoo!ファイナンスから株価データを取得する方法 その２ | 株初心者が本気で儲けるブログ

	# インストール
	install.packages("quantmod")
	install.packages("XML")

	# 読み込み
	library(quantmod)
	library(XML)
 
	# 株価の取得
	# 環境オブジェクトの定義→株価データ取得→header修正
	jpn<-new.env()
    ninten <- getSymbols.yahooj('7974', src="yahooj",auto.assign=FALSE,from="2005-02-01",to="2016-11-30")
	names(ninten)<-c("Open","High","Low","Close","Volume","Adjusted")
    write.csv(as.data.frame(ninten), "table.nintendo.csv")
    plot(ninten)

- https://info.finance.yahoo.co.jp/history/?code=7974 任天堂(株)
- https://info.finance.yahoo.co.jp/history/?code=998407 日経平均株価

https://dmjtmj-stock.com/entry/2016/12/15/140416
【R言語】 Yahoo!ファイナンスから株価データを取得する方法 その１ | 株初心者が本気で儲けるブログ

	install.packages("RFinanceYJ")
	library(RFinanceYJ)

http://d.hatena.ne.jp/graySpace/20160107/1452158047
quantmodで株価データ取得 - 日常メモ

(追記 2016/1/12)「auto.assign=FALSE」にしなければ、新たな変数への代入が出来なかったということ。「auto.assign=TRUE」だと自動的に（この場合は）「YJ6758.T」という変数へ取得データが格納される。

    library(quantmod)
	#getSymbols.yahooj('6758.T', src="yahooj",auto.assign=TRUE)
	T6758<-getSymbols.yahooj('6758.T', src="yahooj",auto.assign=FALSE,from="1980-01-01")
	plot(T6758)

http://labo.utsubo.tokyo/2016/12/06/rで株価データ取得/
Rで株価データ取得

	library(quantmod)

	# DOW
	dow<-new.env()
	dow.name<-getSymbols("DOW",env=dow,src="yahoo", from='2016-01-01',to='2016-06-30')

Warning: DOW download failed; trying again.
Error: DOW download failed after two attempts. Error message:
HTTP error 404.

http://penoa.hatenablog.com/entry/2016/01/31/145149
R言語を使って株価データを取得（スクレイピング）する方法 - ことばにならないなにか

Error in file(file, "rt") : cannot open the connection
In addition: There were 14 warnings (use warnings() to see them)

Error in file(file, "rt") : cannot open the connection
In addition: There were 37 warnings (use warnings() to see them)

2014/08/05
http://ranalysis.blog.fc2.com/blog-entry-97.html
ヤフーファイナンスの株価の時系列データを取得するRパッケージ：RFinanceYJ | リケジョ２８歳が育休中に学んだ【「R」によるデータ分析】の記録

	quote.url2 <- "http://info.finance.yahoo.co.jp/history/?code=9984.T"
	r <- readHTMLTable(quote.url2)

Error: failed to load external entity "http://info.finance.yahoo.co.jp/history/?code=9984.T"

2010年08月20日
http://www.atmarkit.co.jp/ait/articles/1008/20/news092_2.html
Rによるオープン・データの可視化（1）：実践！ Rで学ぶ統計解析の基礎（3） - ＠IT

http://kamonohashiperry.com/archives/769
Rで株価の時系列データを簡単に集計する | かものはしの分析ブログ

https://www.r-bloggers.com/trading-strategy-52-weeks-high-effect-in-stocks/
Trading Strategy: 52-Weeks High Effect in Stocks | R-bloggers

----------

### Finance

https://www.trifields.jp/r-cran-task-view-empirical-finance-727
R言語 CRAN Task View：経験的ファイナンス | トライフィールズ

http://datascience.jp/data.example.html
Data Science Consortium
金融

リーマンショック以来，数理ファイナンス，金融工学の熱気も一段落したようですが，それはデリバティブ取引という一種のゲームの枠組みを支える役目が一段落しただけで，金融データの取り扱いとその解析，それにもとづくリスク管理といった基本的な流れはいまだに変わっていないと思います．

金融時系列をいくつかの成分に分解するというアイディアは古くからありますが，局所回帰( lowess )をうまく使いこなせば， かなりのことが見えてきます．

市場の休日，うるう年なども考慮したR データフレームのダンプ http://datascience.jp/yen.int/yen.int.R

2017/10/4
https://dmjtmj-stock.com/entry/2017/01/02/003045
【R言語】 xtsパッケージでの時系列データ解析 | 株初心者が本気で儲けるブログ

2016年12月26日
https://qiita.com/wakuteka/items/95ac758070f6f4d89a96
R言語 標準データセットの私的まとめ - Qiita
attitude
とある金融機関における各部署の職員の意識調査(attitude survey)データ。

http://www.panrolling.com/books/wb/wb231.html
Rとトレード ――確率と統計のガイドブック (ウイザードブックシリーズVol.231) 単行本 – 2015/12/12
　金融データ分析を行ったり、モデル駆動のトレード戦略を構築するクオンツやトレーダーたちは、毎日どういったことをやっているのだろうか。

2015/10/08
http://sssslide.com/speakerdeck.com/stakaya/modannarde-jin-rong-detajie-xi-falseji-chu
https://speakerdeck.com/stakaya/modannarde-jin-rong-detajie-xi-falseji-chu
"モダンなRで"金融データ解析の基礎 by Shinichi Takayanagi

http://tjo.hatenablog.com/entry/2014/09/05/191033
シリーズUseful R『戦略的データマイニング』『金融データ解析の基礎』ご恵贈いただきました - 六本木で働くデータサイエンティストのブログ

http://d.hatena.ne.jp/hotoku/20140809/1407576274
献本御礼：金融データ解析の基礎 - hotoku とは

http://www.kyoritsu-pub.co.jp/bookdetail/9784320123717
金融データ解析の基礎 (シリーズ Useful R 8) 単行本 – 2014/8/9

http://arbitrage.jpn.org/bookshelf/osaki-r-programming-for-finance/
ファイナンスのためのRプログラミング

http://www.kyoritsu-pub.co.jp/bookdetail/9784320110441
ファイナンスのためのRプログラミング ―証券投資理論の実践に向けて― / 大崎 秀一　吉川 大介　著 | 共立出版

ファイナンスのためのRプログラミング ―証券投資理論の実践に向けて― 単行本 – 2013/10/24

http://gihyo.jp/book/2012/978-4-7741-5315-5
「R」でおもしろくなるファイナンスの統計学：書籍案内｜技術評論社

「R」でおもしろくなるファイナンスの統計学 (知識ゼロでもわかる統計学) 単行本（ソフトカバー） – 2012/11/7

http://yut.hatenablog.com/entry/20120730/1343605481
2012-07-30
R言語を用いた自己回帰モデルによる株価予測を試してみた

	UKgas
	ts.plot( UKgas )
	ar_result <- ar(UKgas)
	pred_result <- predict( ar_result, n.ahead = 40 )

http://web.sfc.keio.ac.jp/~kogure/course/2008fall/fe/fe.html
http://web.sfc.keio.ac.jp/~kogure/course/2008fall/fe/fe2008_4.pdf
計量ファイナンス( 2008年秋学期) 第4回:10月27日
コンピュータ実習1: ーR事始め+データベース紹介ー

----------

## 


----------

## 

----------





