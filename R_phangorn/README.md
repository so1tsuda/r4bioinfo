----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-05-05

----------

# phangorn
phangorn: Phylogenetic Analysis in R

- 論文 [Schliep KP. Bioinformatics. 2011 Feb 15;27(4):592-3.](https://www.ncbi.nlm.nih.gov/pubmed/21169378)
- [CRAN - Package phangorn](https://cran.r-project.org/web/packages/phangorn/index.html)
 - Reference manual:	phangorn.pdf
 - Vignettes:	
   - Ancestral Sequence Reconstruction
   - Constructing phylogenetic trees
   - Advanced features
   - IntertwiningTreesAndNetworks
   - Splits and Networx

----------

	#install.packages("phangorn")
	packageVersion("phangorn")

----------
## ryamada

http://www.statgenet.med.kyoto-u.ac.jp/StatGenet/lectures/2015/ryamadaBonEn3.html
R codes in ryamada’s genetstat
Wednesday, June 03, 2015

	library(phangorn)
	allTrees(5) # 頂点数5でクラスタリングパターンを列挙する
	trees<-allTrees(5)
	plot(trees)

[遺伝統計学の基礎 Rによる遺伝因子解析・遺伝子機能解析 - 山田亮 - Google ブックス](https://books.google.co.jp/books?id=rFNoBRSp-jwC&pg=PA282&lpg=PA282&dq=phangorn&source=bl&ots=iV3t-Fwghf&sig=kO84v37QnCl0LoWMe9oAaVvAwho&hl=ja&sa=X&ved=0ahUKEwjp5deIyNbTAhUHzbwKHTC2AuIQ6AEISzAI#v=onepage&q=phangorn&f=false)

----------

# Acknowledgements
I am grateful to Dr. Klaus Schliep <klaus.schliep@gmail.com> for his advice on phangorn.

----------
# References

http://www.geocities.jp/ancientfishtree/R_JI.html
R - 井上 潤
phangorn: AA 配列から BS 値付き NJ tree を得る．
phangorn: AA 配列から NJ tree を得る．

http://leeswijzer.hatenablog.com/entry/2012/12/27/145354
Rによる系統解析パッケージ〈phangorn〉 - archief voor stambomen

http://www.okadajp.org/RWiki/?CRAN%20パッケージリスト--III#j70ad563
phangorn: R による系統発生学 †
R による系統発生学（最尤法、最大節約法、距離法およびアダマール結合をもちいた系統樹およびネットワーク）

https://sites.google.com/site/kfuku52/mp/disttopol
樹形間距離 - Kenji Fukushima's website
Robinson-Foulds距離はRパッケージ'phangorn'のRF.dist()関数で計算できる。

http://d.hatena.ne.jp/MikuHatsune/20131214/1387003786
Rの初心者向けコード(生物系) - 驚異のアニヲタ社会復帰への道

----------
