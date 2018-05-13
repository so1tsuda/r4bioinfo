Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2018-04-28

----------
# [A Little Book of R For Bioinformatics](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)  
By Avril Coghlan  

https://github.com/avrilcoghlan/LittleBookofRBioinformatics/blob/master/index.rst

## [Chapters in this Book](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/index.html#chapters-in-this-book)
**目次**
- [How to install R and a Brief Introduction to R](#how-to-install-r-and-a-brief-introduction-to-r)
- [Neglected Tropical diseases](#neglected-tropical-diseases)
- [DNA Sequence Statistics (1)](#dna-sequence-statistics-1)
- [DNA Sequence Statistics (2)](#dna-sequence-statistics-2)
- [Sequence Databases](#sequence-databases)
- [Pairwise Sequence Alignment](#pairwise-sequence-alignment)
- [Multiple Alignment and Phylogenetic trees](#multiple-alignment-and-phylogenetic-trees)

----------

## [How to install R and a Brief Introduction to R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html)
**R言語入門**

- [R言語入門 (全13回) - プログラミングならドットインストール](http://dotinstall.com/lessons/basic_r)
- [R-Tips](http://cse.naro.affrc.go.jp/takezawa/r-tips/r.html)

### [Installing R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#installing-r)

- [R のインストール - RjpWiki](http://www.okadajp.org/RWiki/?R%20のインストール)
- [01.セットアップ・参考文献](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/01.html)

### [Installing R packages](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#installing-r-packages)

- [パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)
- [08. パッケージ・ライブラリ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/08.html)

#### [How to install an R package](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#how-to-install-an-r-package)

パッケージ[`seqinr`](https://cran.r-project.org/web/packages/seqinr/index.html)のインストール:  

    # install the "seqinr" package
    install.packages("seqinr")

`seqinr`パッケージの呼び出し:  

    # load the "seqinr" package into R
    library(seqinr)

#### [How to install a Bioconductor R package](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#how-to-install-a-bioconductor-r-package)

Bioconductorパッケージ[`Biostrings`](http://bioconductor.org/packages/release/bioc/html/Biostrings.html)のインストール:  

    # install the Bioconductor package called "Biostrings"
    source("https://bioconductor.org/biocLite.R")
    biocLite("Biostrings")

`Biostrings`パッケージの呼び出し:  

    # load the "Biostrings" package into R
    library(Biostrings)

### [Running R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#running-r)

- [02. R の起動と終了](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html)  

![](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/image/windows.gif)
![http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/image/Mac.gif)

Rを終了:  

	# To quit R, type:
    quit()
	q()

### [A brief introduction to R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#a-brief-introduction-to-r)

[簡単な計算](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/03.html)  
演算子

	# typing in commands
	2*3
	10-3

[オブジェクトと代入（付値）](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/05.html)

	# assign the value 2*3 to the variable x
	x <- 2*3

	# To view the contents of any R object, just type its name
	x

データ型：文字列(character)、実数(numeric)、論理値(logical)など
[09. データの型](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/09.html)
[25. データ型とデータ構造](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/25.html)

[ベクトル](http://stat.biopapyrus.net/vector/vector.html)  
ベクトルの作成は関数`c()`を用いる。

	# create a vector called myvector that has elements with values 8, 6, 9, 10, and 5:
	myvector <- c(8, 6, 9, 10, 5)

	# see the contents of the variable myvector:
	myvector

[ベクトル要素へのアクセス](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/13.html)  
インデックス（添字）  

	# get the value of the 4th element in the vector myvector
	myvector[4]

[リスト](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/23.html)  
リストは異なる型（数値や文字列）のデータをまとめられる。
リストの作成は関数`list()`を用いる。

	# In contrast to a vector, a list can contain elements of different types (e.g. both numeric and character elements).
	# create a list mylist:
	mylist <- list(name="Fred", wife="Mary", myvector)
	mylist

`[[ ]]`はリスト内の要素（ベクトル）を取り出す。

	# extract the second and third elements from mylist:
	mylist[[2]]
	mylist[[3]]

リストの要素に名前が付けられている場合、`$`記号でアクセスする。

	# mylist$wife is the same as mylist[[2]]:
	mylist$wife

	# find the names of the named elements in a list
	attributes(mylist)

[table 関数を使ったクロス集計](http://nshi.jp/contents/r/crosstab/)

    # produce a table variable that contains the number of bases:
    mybases <- c("A", "C", "G", "T", "A")
    table(mybases)
    # store the table variable produced by the function table(), and call the stored table “mytable”:
    mytable <- table(mybases)
    mytable
    # access the 1st element in the table mytable (the number of base “A”):
    mytable[[1]]
    mytable[["A"]]

[簡単な計算](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/03.html)  
関数

    # calculate the log to the base 10 of a number:
	log10(100)

[ヘルプ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/07.html)

	# get help about a particular function
	help(log10)

標準偏差 standard deviation を計算する関数を探す

	# search for all functions containing the word “deviation” in their description:
	help.search("deviation")
	RSiteSearch("deviation")

ベクトルの値の平均

	# calculate the average of the values in the vector myvector
	mean(myvector)

[関数の定義](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/31.html)  
[関数の作り方 | functionによりRの関数を定義する方法](http://stat.biopapyrus.net/r/user-function.html)  

	# create a function to calculate the value of 20 plus square of some input number:
	myfunction <- function(x) { return(20 + (x*x)) }
	# use the function for different input numbers (eg. 10, 25):
	myfunction(10)
	myfunction(25)

### [Links and Further Reading](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#links-and-further-reading)

https://cran.r-project.org/doc/contrib/Lemon-kickstart/
Kickstarting R

https://cran.r-project.org/doc/manuals/R-intro.html
An Introduction to R

----------

## [Neglected Tropical diseases](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter0.html)
[顧みられない熱帯病](http://www.tm.nagasaki-u.ac.jp/multiplex/phase1/ntd.html)

[顧みられない熱帯病情報 (@ntd_bu) | Twitter](https://twitter.com/ntd_bu)

2017年8月 [人と微生物の深くて長い関係 | 日経サイエンス](http://www.nikkei-science.com/page/sci_book/bessatu/51221_prologue.html)

日本ではあまり馴染みがないが，公衆衛生の基盤が整っていない熱帯地域では，寄生虫や細菌・ウイルスによる感染症が蔓延し，人々の生活を脅かしている。「[10億人を苦しめる忘れられた熱帯病](http://www.nikkei-science.com/page/magazine/1004/201004_086.html)」は，忘れられた熱帯病（Neglected tropical diseases，NTD）の撲滅に力を注いできたホッツ（Peter J. Hotez）による優れた総説である。この分野では，多くの線虫感染症の特効薬であるイベルメクチンを発見・実用化して[ノーベル生理学・医学賞を受賞した日本の大村智博士の貢献](http://www.nikkei-science.com/201512_024.html)も特筆されるべきものだ。

![](http://www.nikkei-science.com/wp-content/uploads/2010/03/201004_086.jpg)
![](http://www.nikkei-science.com/wp-content/uploads/2015/10/4b7bff74a24f2adbb078c5bbbfd49b31.jpg)

2017年04月21日 [FORTH｜新着情報｜顧みられない熱帯病に対する今までにない進展－WHO報告](http://www.forth.go.jp/topics/2017/04211319.html)

2017-4-19 [顧みられない熱帯病(かえりみられないねったいびょう)とは - コトバンク](https://kotobank.jp/word/顧みられない熱帯病-1611483)

Apr 18, 2017 Bill Gates [Neglected Tropical Diseases - YouTube](https://www.youtube.com/watch?v=sEHmXUvpHA4)

2016年6月 [三大感染症および顧みられない熱帯病（Neglected Tropical Diseases, NTDs）｜持続可能な開発目標（Sustainable Development Goals, SDGs）｜グローバルヘルス｜日本製薬工業協会](http://www.jpma.or.jp/globalhealth/ntds/index.html)

![](http://www.jpma.or.jp/globalhealth/ntds/img/img_index_01.png)

2015年10月 [neglected tropical diseases：バイオキーワード集｜実験医学online：羊土社](https://www.yodosha.co.jp/jikkenigaku/keyword/3519.html)

![](https://www.yodosha.co.jp/book_img_detail/9784758103503.jpg)

2015? [顧みられない熱帯病と三大感染症について | Eisai ATM Navigator](https://atm.eisai.co.jp/ntd/)

----------

## [DNA Sequence Statistics (1)](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter1.html)
**DNA配列の統計 (1)**

![https://ja.wikipedia.org/wiki/GC含量](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/AT-GC.jpg/400px-AT-GC.jpg)

### [Using R for Bioinformatics](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#using-r-for-bioinformatics)
**R言語を用いたバイオインフォマティクス**

![http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/image/Mac.gif)

### [R packages for bioinformatics: Bioconductor and SeqinR](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#r-packages-for-bioinformatics-bioconductor-and-seqinr)
**バイオインフォマティクスのためのRパッケージ：BioconductorとSeqinR**

`seqinr`パッケージの呼び出し:  

	# load the “SeqinR” R package
	library("seqinr")

[ヘルプ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/07.html)

	# ask for more information about the library() function
	help("library")

### [FASTA format](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#fasta-format)
**[FASTA形式](http://quma.cdb.riken.jp/help/fastaHelp_j.html)**

https://www.ncbi.nlm.nih.gov/search/?term=A06852

### [The NCBI sequence database](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#the-ncbi-sequence-database)
**[NCBI](https://ja.wikipedia.org/wiki/国立生物工学情報センター)配列データベース**

配列データにはユニークな識別子（アクセッション *accession*）が割り当てられている。例えば、WHOが[顧みられない熱帯病 Neglected Tropical Diseases](#neglected-tropical-diseases)として挙げている[デング熱](https://ja.wikipedia.org/wiki/デング熱)を引き起こすウイルス (Dengue virus: DEN-1, DEN-2, DEN-3, DEN-4) のDNA配列のNCBIアクセッションは以下の通り:  
- [NC_001477](http://www.ncbi.nlm.nih.gov/nuccore/NC_001477) (Dengue virus 1, complete genome)
- [NC_001474](http://www.ncbi.nlm.nih.gov/nuccore/NC_001474) (Dengue virus 2, complete genome)
- [NC_001475](http://www.ncbi.nlm.nih.gov/nuccore/NC_001475) (Dengue virus 3, complete genome)
- [NC_002640](http://www.ncbi.nlm.nih.gov/nuccore/NC_002640) (Dengue virus 4, complete genome)

2015年9月 [デング熱ストッパー | 日経サイエンス](http://www.nikkei-science.com/201509_046.html)
自然界によく見られる細菌の助けを借りて，蚊によるデング熱の媒介を阻止する試みが始まっている。　

![](https://pbs.twimg.com/media/DHWayFxXkAEKzM4.jpg)

2002年7月 [細菌が操る性転換 | 日経サイエンス](http://www.nikkei-science.com/page/sci_book/bessatu/51221.html)
昆虫などに広く寄生するボルバキア属の細菌は，寄生した相手を雄から雌に性転換させたり雄になる卵を殺したりする。また寄生相手の交配を妨害することさえある。

![](https://pbs.twimg.com/media/DRoodFWVQAEesVG.jpg)

### [Retrieving genome sequence data via the NCBI website](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#retrieving-genome-sequence-data-via-the-ncbi-website)
**NCBIウェブサイトでゲノム配列データの検索**

DEN-1デング熱ウイルスのDNA配列を検索するには、NCBIウェブサイト (https://www.ncbi.nlm.nih.gov) にアクセスし、ウェブページ上部の検索ボックスにNCBI accession [ NC_001477 ] を入力して、"Search"ボタンを押す:  

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P1_image0.png)

以下は検索結果ページの例:  

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P1_image1.png)

例えば、"PubMed"データベースには科学論文の要約が、"Nucleotide"にはDNA/RNA配列データが、"Protein"にはタンパク質配列データが含まれる。  
"Nucleotide"をクリックすると、[NC_001477](http://www.ncbi.nlm.nih.gov/nuccore/NC_001477)の配列データに移動する。

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P1_image3.png)

DNA配列データをFASTA形式ファイルで保存するには、ウェブページの右上にある"Send"をクリックし、メニューで"File"を選択し、"Format"メニューから"FASTA"を選択し、"Create file"をクリックする。

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P1_image4.png)

ダウンロード後、ファイル名 "sequence.fasta.txt" を "den1.fasta" に変更する。

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P1_image5.png)

### [Retrieving genome sequence data using SeqinR](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#retrieving-genome-sequence-data-using-seqinr)
**RパッケージSeqinRを用いて、ゲノム配列データを取得**

    require("seqinr")
    choosebank("refseqViruses")
    query2 <- query("query2","AC=NC_001477")
    dengueseq <- getSequence(query2$req[[1]])

### [Writing sequence data out as a FASTA file](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#writing-sequence-data-out-as-a-fasta-file)
**配列データを[FASTA](http://quma.cdb.riken.jp/help/fastaHelp_j.html)形式ファイルとして書き出す**

	write.fasta(names="DEN-1", sequences=dengueseq, file.out="den1.fasta")

### [Reading sequence data into R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#reading-sequence-data-into-r)
**配列データをRに読み込む**

`read.fasta()`関数でFASTA形式ファイル（den1.fasta）を読み込む:  

	library("seqinr")
	dengue <- read.fasta(file = "den1.fasta")
    #dengue <- read.fasta(file = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=NC_001477&rettype=fasta&retmode=text")
	dengueseq <- dengue[[1]]

変数`dengue`は[リスト](http://stat.biopapyrus.net/vector/list.html)。リストの1番目の要素を代入した
変数`dengueseq`は塩基配列を含む[ベクトル](https://stats.biopapyrus.jp/r/basic/vector.html)

以下のコマンドは、塩基配列の最初の50塩基を出力する:  

	dengueseq[1:50]

### [Length of a DNA sequence](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#length-of-a-dna-sequence)
**DNA配列の長さ**

	length(dengueseq)

### [Base composition of a DNA sequence](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#base-composition-of-a-dna-sequence)
**DNA配列の塩基組成**

配列中の各ヌクレオチド（"a" "c" "g" "t"）の出現頻度を数える:  

	table(dengueseq)

### [GC Content of DNA](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#gc-content-of-dna)
**DNAの[GC含量](https://ja.wikipedia.org/wiki/GC含量)**

    # (G+C)/(A+T+G+C)
    (2240+2770)/(3426+2240+2770+2299)

	GC(dengueseq)

### [DNA words](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#dna-words)
**連続塩基**

    words(length = 2) #  dinucleotides 2連続塩基 
    words(length = 3) # trinucleotides 3連続塩基

`count`関数で連続塩基のカウント

    # Count oligomers (monomer/dimer/trimer/etc)
    help(count)
    count(s2c("atg"), 2)

	count(dengueseq, 1)
	count(dengueseq, 2)

	denguetable <- count(dengueseq,1)
	denguetable[[3]]
	denguetable[["g"]]

[Dutta C, Paul S. (2012) Microbial lifestyle and genome signatures.](https://www.ncbi.nlm.nih.gov/pubmed/23024607)

[西田洋巳 (2012) ゲノム塩基配列の偏りと生物機能](http://www.iu.a.u-tokyo.ac.jp/~hnishida/tokuron4.htm)

遺伝子水平伝播を推定
[Inferring horizontal gene transfer](https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer)

ゲノムサイズとGC含量との関係
[Relationship between genome size and GC content for sequenced Bacterial and Archaeal genomes.](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2704378/figure/pgen-1000565-g001/)

![](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2704378/bin/pgen.1000565.g001.jpg)

1998年4月 [自然界を渡り歩く細菌のDNA | 日経サイエンス](http://www.nikkei-science.com/page/magazine/9804/DNA.html)
親から子へ遺伝情報が受け継がれるという遺伝学の基本原理では説明できない遺伝情報のやりとり「水平伝播」の発見のきっかけとその後の展開。

![](https://pbs.twimg.com/media/DH0ul2wXsAEEZ8o.jpg)

http://www.nikkei-science.com/?p=14437
細菌の遺伝子交換，ずっと頻繁～日経サイエンス2011年6月号より | 日経サイエンス

### [Summary](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#summary)

	length()
	table()
	GC()
	count()

テストデータで確認する:  

    # Create tests
    x <- s2c("atgc")
    length(x)
    table(x)
    GC(x)
    count(x, 2)

### [Links and Further Reading](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#links-and-further-reading)

Chapter 9 “Analyzing Sequences” in the book "Applied statistics for bioinformatics using R" by Krijnen (https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#exercises)
**演習**
[回答例](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter_answers.html#dna-sequence-statistics-1)

----------

## [DNA Sequence Statistics (2)](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter2.html)
**DNA配列の統計 (2)**

### [A little more introduction to R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#a-little-more-introduction-to-r)
**続・R言語入門**

	x <- 100
	log10(x)
	myvector <- c(30,16,303,99,11,111)
	mean(myvector)
	myvector[3]

[Rで繰り返しを含む数列の生成（rep関数、seq関数）](http://tips-r.blogspot.jp/2014/05/repseq.html)

	# create a sequence of numbers
	seq(1, 100, by = 1)
	seq(1, 100, by = 2)

[30. 繰り返し文](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/30.html)  
for による繰り返し

	# for loop to carry out the same command several times
	for (i in 1:10) { print (i*i) }

	avector <- c(2, 9, 100, 133)
	for (i in avector) { print (i*i) }

	for (i in seq(1, 10, by = 2)) { print (i*i) }

[48. とりあえず plot()](R-Source)

    par(family="Times")

	# plot a scatterplot of the values in myvector1 against the values in myvector2
	myvector1 <- c(10, 15, 22, 35, 43)
	myvector2 <- c(3, 3.2, 3.9, 4.1, 5.2)
	plot(myvector1, myvector2, xlab="myvector1", ylab="myvector2")
	plot(myvector1, myvector2, xlab="myvector1", ylab="myvector2", type="b")

[関数の定義](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/31.html)  
[関数の作り方 | functionによりRの関数を定義する方法](http://stat.biopapyrus.net/r/user-function.html)  

	# create our own functions
	myfunction <- function(x) { return(20 + (x*x)) }
	myfunction(10)
	myfunction(25)
	myfunction

`＃`の後が[コメント](http://yusuke-memo.blogspot.jp/2009/10/r.html)行となる。

	# writing the comment text after the “#” sign
	x <- 100
	log10(x) # Finds the log to the base 10 of variable x.

### [Reading sequence data with SeqinR](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#reading-sequence-data-with-seqinr)
Rパッケージ[`seqinr`](https://cran.r-project.org/web/packages/seqinr/index.html)で配列データを読み込み

DEN-1デング熱ウイルスのゲノム配列を取得する:  

	library("seqinr")                           # Load the SeqinR package.
	dengue <- read.fasta(file = "den1.fasta")   # Read in the file "den1.fasta".
    #dengue <- read.fasta(file = "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=NC_001477&rettype=fasta&retmode=text")
	dengueseq <- dengue[[1]]                    # Put the sequence in a vector called "dengueseq".

    # obtain nucleotides 452-535 of DNA sequence stored in the vector `dengueseq`
	dengueseq[452:535]

### [Local variation in GC content](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#local-variation-in-gc-content)
GC含量の局所変動は、変異バイアスや[水平伝播](https://ja.wikipedia.org/wiki/遺伝子の水平伝播)を示唆

    # GC content of DNA sequence stored in the vector `dengueseq`
	GC(dengueseq)

### [A sliding window analysis of GC content](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#a-sliding-window-analysis-of-gc-content)
GC含量の移動解析

	GC(dengueseq[1:2000])      # 塩基配列の 1-2000 番目のGC含量
	GC(dengueseq[2001:4000])   # 塩基配列の 2001-4000 番目のGC含量
	GC(dengueseq[4001:6000])   # 塩基配列の 4001-6000 番目のGC含量
	GC(dengueseq[6001:8000])   # 塩基配列の 6001-8000 番目のGC含量
	GC(dengueseq[8001:10000])  # 塩基配列の 8001-10000 番目のGC含量
	GC(dengueseq[10001:10735]) # 塩基配列の 10001-10735 番目のGC含量

### [A sliding window plot of GC content](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#a-sliding-window-plot-of-gc-content)
GC含量の移動プロット

`for`ループを使う。異なる範囲（windowsize: 2000, 3000, 300 塩基）のプロットを作成する。

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P2_image3.png)

[ウェブサイト](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#a-sliding-window-plot-of-gc-content)から
`slidingwindowplot`関数をコピペして、以下の通り実行:  

	slidingwindowplot(3000, dengueseq)

	slidingwindowplot(300, dengueseq)

`zoo`パッケージを使う:  

    # install.packages('zoo')
    library(zoo)
    windowsize <- 300
    x <- seq(from = 1, to = length(dengueseq)-windowsize, by = windowsize)
    y <- rollapply(data = dengueseq, width = windowsize, by = windowsize, FUN = GC)
    plot(x, y, type="b", xlab="Position (bp)", ylab="GC content")

- [ベクトルの一定範囲に関数を適用しながら逐次計算していく（ローリング処理）](http://d.hatena.ne.jp/teramonagi/20100831/1283261344)
- [Mean of a sliding window in R - Cross Validated ](http://stats.stackexchange.com/questions/3051/mean-of-a-sliding-window-in-r)

### [Over-represented and under-represented DNA words](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#over-represented-and-under-represented-dna-words)
連続塩基組成 [Genomic signature](https://en.wikipedia.org/wiki/Genomic_signature) / [k-mer](https://en.wikipedia.org/wiki/K-mer)

![https://en.wikipedia.org/wiki/K-mer](https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/K-mer-example.png/440px-K-mer-example.png)

	count(dengueseq, 2)

[ρ](https://ja.wikipedia.org/wiki/Ρ)統計量はDNA文字列の[観測値/期待値]を計算する。2連続塩基の場合、ρ値は次の通り計算される:  

ρ(xy) = fxy/(fx*fy),

ここで、"fxy", "fx", "fy"は、DNA配列中の文字列"xy", "x", "y"の頻度である。

例えば、2連続塩基"GC"のρ値の計算式は:  

ρ(GC) = fGC/(fG * fC)

ここで、"fGC", "fG", "fC"は、DNA配列中の文字列"GC", "G", "C"の頻度である。

	count(dengueseq, 1) # Get the number of occurrences of 1-nucleotide DNA words
	2770/(3426+2240+2770+2299) # Get fG
	2240/(3426+2240+2770+2299) # Get fC
	count(dengueseq, 2) # Get the number of occurrences of 2-nucleotide DNA words
	500/(1108+720+890+708+901+523+261+555+976+500+787+507+440+497+832+529) # Get fGC
	0.04658096/(0.2580345*0.2086633) # Get rho(GC)

2連続塩基 "aa" "ac" "ag" "at" "ca" "cc" "cg" "ct" "ga" "gc" "gg" "gt" "ta" "tc" "tg" "tt" のρ値（観測値/期待値）を計算する:  

    ( af1 <- count(dengueseq, 1) ) # absolute frequencies of 1-mer
    ( rf1 <- af1 / sum(af1) )      # relative frequencies of 1-mer
    ( af2 <- count(dengueseq, 2) ) # absolute frequencies of 2-mer
    ( rf2 <- af2 / sum(af2) )      # relative frequencies of 2-mer
    ( oe.2 <- rf2 / apply(expand.grid(rf1, rf1), 1, prod) ) # observed / expected

`rho`関数を使う:  

    rho(dengueseq, wordsize = 2)

    # Create tests
    x <- s2c("atgc"); rho(x, wordsize = 2)

ゲノムの2連続塩基組成
[Genome signature (dinucleotide relative abundances) of genomes](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC17754/figure/F1/)

### [Summary](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#summary)

	seq()
	print()
	plot()
	numeric()
	function()

### [Links and Further Reading](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#links-and-further-reading)

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#exercises)
**演習**
[回答例](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter_answers.html#dna-sequence-statistics-2)

----------

## [Sequence Databases](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html)
**配列データベース**

### [The NCBI Sequence Database](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#the-ncbi-sequence-database)
[NCBI](https://ja.wikipedia.org/wiki/国立生物工学情報センター)配列データベース

[塩基配列データベース構築の国際協調](https://www.ddbj.nig.ac.jp/insdc.html)

![](https://www.ddbj.nig.ac.jp/images/center/insdc_shoukai.gif)

### [Searching for an accession number in the NCBI database](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#searching-for-an-accession-number-in-the-ncbi-database)
**NCBIデータベースでアクセッション番号の検索**

[DNA Sequence Statistics (1)](#dna-sequence-statistics-1)
を参照されたい。

### [NCBI Sequence Format (NCBI Format)](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#ncbi-sequence-format-ncbi-format)
**[GenBank形式](http://quma.cdb.riken.jp/help/gbHelp_j.html)**

- 2018-04-20 [DDBJ DDBJ 公開形式 (Flat file)](https://www.ddbj.nig.ac.jp/ddbj/flat-file.html)
- 2017.03.12 [DDBJ/GenBank | 核酸データベース](https://bi.biopapyrus.jp/db/genbank.html)

DEFINITION 
ORGANISM 
REFERENCE 
FEATURES 
ORIGIN 

### [RefSeq](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#refseq)

- [RefSeq - JI 井上 潤](http://www.geocities.jp/ancientfishtree/RefSeq.html)
- [RefSeq | 重複のない生物の遺伝子データベース（ゲノムデータベース）](http://bi.biopapyrus.net/biodb/refseq.html)
- [What is the difference between RefSeq and GenBank?](https://www.ncbi.nlm.nih.gov/books/NBK50679/#RefSeqFAQ.what_is_the_difference_between_1)

### [Querying the NCBI Database](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#querying-the-ncbi-database)
**NCBIデータベースに照会する**

### [Querying the NCBI Database via the NCBI Website](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#querying-the-ncbi-database-via-the-ncbi-website)
**NCBIウェブサイト経由でNCBIデータベースを照会する**

[Search Field Descriptions for Sequence Database](https://www.ncbi.nlm.nih.gov/books/NBK49540/)

https://www.ncbi.nlm.nih.gov/
検索ボックス入力例
- NC_001477[AC]
- Nature[JOUR] AND 460[VOL] AND 352[PAGE]
- "Chlamydia trachomatis"[ORGN]
- "Berriman M"[AU]
- flagellin OR fibrinogen
- "Mycobacterium leprae"[ORGN] AND dnaA
- "Homo sapiens"[ORGN] AND "colon cancer"
- "Homo sapiens"[ORGN] AND malaria
- "Homo sapiens"[ORGN] AND biomol_mrna[PROP]
- "Bacteria"[ORGN] AND srcdb_refseq[PROP]
- "colon cancer" AND srcdb_refseq[PROP]

#### [Example: finding the sequences published in Nature 460:352-358](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#example-finding-the-sequences-published-in-nature-460-352-358)

### [Querying the NCBI Database via R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#querying-the-ncbi-database-via-r)
**Rを介してNCBIデータベースに問い合わせる**

	library("seqinr") # Load the SeqinR R package
	choosebank()      # List all the sub-databases in ACNUC
	choosebank("genbank") # Specify that we want to search the 'genbank' ACNUC sub-database
	choosebank("refseq") # Specify that we want to search the 'refseq' ACNUC sub-database

    # search for GenBank sequences from Bacteria
    choosebank("genbank")
    GenBankBact <- query("GenBankBact", "SP=Bacteria")
    GenBankBact
	closebank()

	# search for mRNA sequences from the parasitic worm Schistosoma mansoni 
	choosebank("genbank")
    SchistosomamRNA <- query("SchistosomamRNA", "SP=Schistosoma mansoni AND M=mrna")
	closebank()

#### [Example: finding the sequence for the DEN-1 Dengue virus genome](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#example-finding-the-sequence-for-the-den-1-dengue-virus-genome)
**例：DEN-1デングウイルスゲノムの配列を取得**

	choosebank("refseqViruses")
    Dengue1 <- query("Dengue1", "AC=NC_001477")
	attributes(Dengue1)
	Dengue1$nelem
	Dengue1$req
	attr(Dengue1, "names")
	attr(Dengue1, "class")
	dengueseq <- getSequence(Dengue1$req[[1]])
	dengueseq[1:50]
	annots <- getAnnot(Dengue1$req[[1]])
	annots[1:20]
	closebank()

#### [Example: finding the sequences published in Nature 460:352-358](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#id8)

	choosebank("genbank") # Specify that we want to search the 'genbank' ACNUC sub-database

On Apr 23, 2018, Dr. Simon Penel <> wrote:

#### [Saving sequence data in a FASTA-format file](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#saving-sequence-data-in-a-fasta-format-file)

	choosebank("genbank")                             # select the ACNUC sub-database to be searched
    humtRNAs <- query("humtRNAs", "SP=homo sapiens AND M=TRNA")   # specify the query
	myseqs <- getSequence(humtRNAs)                   # get the sequences
	mynames <- getName(humtRNAs)                      # get the names of the sequences
	write.fasta(myseqs, mynames, file.out="humantRNAs.fasta")
	closebank()

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#exercises)
**演習**
[回答例](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter_answers.html#sequence-databases)

----------

## [Pairwise Sequence Alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter4.html)
**2つの配列間でのアラインメント**

**[ペアワイズシーケンスアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E3.83.9A.E3.82.A2.E3.83.AF.E3.82.A4.E3.82.BA.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88)**

![https://ja.wikipedia.org/wiki/シーケンスアラインメント](https://upload.wikimedia.org/wikipedia/commons/8/86/Zinc-finger-seq-alignment2.png)

塩基の置換(Substitution)、挿入(Insertion)、欠失(Deletion)

![http://www.bbc.co.uk/education/guides/zc499j6/revision/2](https://bam.files.bbci.co.uk/bam/live/content/zdjy4wx/large)

2009年4月 [多様性の源　複雑な生物を生む力 | 日経サイエンス](http://www.nikkei-science.com/page/magazine/0904/200904_036.html)
変異

### [UniProt](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#uniprot)

[Swiss-Prot](https://ja.wikipedia.org/wiki/Swiss-Prot) タンパク質データベース

### [Viewing the UniProt webpage for a protein sequence](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#viewing-the-uniprot-webpage-for-a-protein-sequence)

![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Mycobacterium_leprae.jpeg/200px-Mycobacterium_leprae.jpeg)

[*Mycobacterium leprae*（らい菌）](https://ja.wikipedia.org/wiki/らい菌)の[コリスミ酸リアーゼ](https://ja.wikipedia.org/wiki/コリスミ酸リアーゼ)（chorismate lyase）タンパク質配列を検索するには、UniProtウェブサイト (http://www.uniprot.org) にアクセスし、ウェブページ上部の検索ボックスにUniProt accession [ [Q9CD83](http://www.uniprot.org/uniprot/Q9CD83) ] を入力して、"Search"ボタンを押す:  

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P4_image0.png)

### [Retrieving a UniProt protein sequence via the UniProt website](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#retrieving-a-uniprot-protein-sequence-via-the-uniprot-website)
**UniProtのウェブサイトからタンパク質配列を取得**

[ハンセン病（Leprosy）](https://ja.wikipedia.org/wiki/ハンセン病)の原因細菌[*Mycobacterium leprae*（らい菌）](https://ja.wikipedia.org/wiki/らい菌)と
[ブルーリ潰瘍（Buruli ulcer）](https://ja.wikipedia.org/wiki/ブルーリ潰瘍)の原因細菌[*Mycobacterium ulcerans*](http://www.nih.go.jp/niid/ja/diseases/ha/buruli-ulcer/1366-idsc/iasr-topic/1793-dj3863.html)
の[コリスミ酸リアーゼ](https://ja.wikipedia.org/wiki/コリスミ酸リアーゼ)タンパク質配列（UniProt accession は[Q9CD83](http://www.uniprot.org/uniprot/Q9CD83)と[A0PQ23](http://www.uniprot.org/uniprot/A0PQ23)）をFASTA形式（ファイル名"Q9CD83.fasta"と"A0PQ23.fasta"）で保存する。

- [Using the UniProt basket | Train online](https://www.ebi.ac.uk/training/online/course/uniprot-exploring-protein-sequence-and-functional/exploring-uniprotkb-results-page/using-unip)

![](http://www.ebi.ac.uk/training/online/sites/ebi.ac.uk.training.online/files/user/4057/documents/screen_shot_2014-11-06_at_15.44.16.png)  

'Add to basket'ボタンを押す。右上の'Basket'ボタンを押し、'Download'ボタンを押す。

![](http://www.ebi.ac.uk/training/online/sites/ebi.ac.uk.training.online/files/user/4057/documents/screen_shot_2014-11-06_at_15.44.29.png)  

`read.fasta()`関数で、FASTAファイルをRに読み込む:  

	library("seqinr")
	leprae <- read.fasta(file = "Q9CD83.fasta")
	ulcerans <- read.fasta(file = "A0PQ23.fasta")
	lepraeseq <- leprae[[1]]
	ulceransseq <- ulcerans[[1]]
    # lepraeseq <- read.fasta(file = "http://www.uniprot.org/uniprot/Q9CD83.fasta")[[1]]
    # ulceransseq <- read.fasta(file = "http://www.uniprot.org/uniprot/A0PQ23.fasta")[[1]]
	lepraeseq # Display the contents of the vector "lepraeseq"

[How can I access resources on this web site programmatically?](http://www.uniprot.org/help/programmatic_access)

### [Retrieving a UniProt protein sequence using SeqinR](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#retrieving-a-uniprot-protein-sequence-using-seqinr)
**SeqinRでUniProtのタンパク質配列を取得**

	library("seqinr")
	choosebank("swissprot")
    leprae <- query("leprae", "AC=Q9CD83")
	lepraeseq <- getSequence(leprae$req[[1]])
    ulcerans <- query("ulcerans", "AC=A0PQ23")
	ulceransseq <- getSequence(ulcerans$req[[1]])
	closebank()
	lepraeseq # Display the contents of "lepraeseq"

### [Comparing two sequences using a dotplot](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#comparing-two-sequences-using-a-dotplot)
**ドットプロットで2つの配列を比較**

タンパク質のアミノ酸配列や核酸の塩基配列の[相同性 (homology)](https://ja.wikipedia.org/wiki/相同)（共通の祖先に由来すること）は、配列類似性に基づいて判断される。
[ドットプロット](https://ja.wikipedia.org/wiki/ドットプロット_%28バイオインフォマティクス%29)
とは、2本の配列を比較するためのグラフである。
両軸に全く同じ配列をとれば、右上がりの対角線が現れる。

テストデータで確認する:  

    # Create tests
    x <- s2c("atgc")
    par(mfrow=c(2,2))
    dotPlot(x,x)
    dotPlot(x,rev(x))
    dotPlot(rep(x,2),rep(x,2))

*M.leprae*と*M.ulcerans*のコリスミ酸リアーゼのタンパク質配列のドットプロットを作成する:  

	dotPlot(lepraeseq, ulceransseq)

![http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P4_image5.png)

### [Pairwise global alignment of DNA sequences using the Needleman-Wunsch algorithm](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#pairwise-global-alignment-of-dna-sequences-using-the-needleman-wunsch-algorithm)
**2つのDNA配列間のグローバル・アライメント**

[**グローバルアラインメントとローカルアラインメント**](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E3.82.B0.E3.83.AD.E3.83.BC.E3.83.90.E3.83.AB.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88.E3.81.A8.E3.83.AD.E3.83.BC.E3.82.AB.E3.83.AB.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88)

![](https://upload.wikimedia.org/wikipedia/commons/4/4b/Global-local-alignment.png)

【例題】DNA配列("GAATTC"と"GATTA")間の最適なグローバルアライメントを見つける。

例えば、塩基の一致(match)に+2のスコア、不一致(mismatch)に-1のペナルティ、ギャップ(gap)に-2のペナルティを与える。

以下のアラインメントのスコアは、2 + 2 + (-1) + 2 + (-2) + (-1) = 2

    GAATTC
    GATT-A

以下のアラインメントのスコアは、2 + 2 + (-2) + 2 + 2 + (-1) = 5

    GAATTC
    GA-TTA

**scoring matrix (substitution matrix)**

Biostringsパッケージの`nucleotideSubstitutionMatrix()`関数でスコアマトリックス(置換行列)を作る:  

	library(Biostrings)
	sigma <- nucleotideSubstitutionMatrix(match = 2, mismatch = -1, baseOnly = TRUE)
	sigma # Print out the matrix

[**Gap penalty**](https://en.wikipedia.org/wiki/Gap_penalty)

ギャップの最初の位置には、
ギャップ（挿入・欠失）開始時のペナルティ(*gap opening penalty*)と
ギャップ（挿入）継続時のペナルティ(*gap extension penalty*)を与える。
隣接するギャップは一回の挿入・欠失で生じたと考える。

- [ClustalW ヘルプ | DDBJ](http://www.ddbj.nig.ac.jp/search/help/clustalwhelp-j.html)

`pairwiseAlignment()`関数で、DNA配列("GAATTC"と"GATTA")間の最適なグローバルアライメントを見つける:  

	s1 <- "GAATTC"
	s2 <- "GATTA"
	globalAligns1s2 <- pairwiseAlignment(s1, s2, substitutionMatrix = sigma, 
			gapOpening = -2, gapExtension = -8, scoreOnly = FALSE)
	globalAligns1s2 # Print out the optimal alignment and its score

出力結果:

	Global PairwiseAlignmentsSingleSubject (1 of 1)
	pattern: [1] GAATTC 
	subject: [1] GA-TTA 
	score: -3 

このアライメントは、4個の一致(match)、1個の不一致(mismatch)、長さ1の1個のギャップ(gap)が含まれているので、スコアは (4\*2)+(1\*-1)+(1\*-10) = -3 となる。  
【注意】gapOpening = -2, gapExtension = -8 は、ギャップの最初の位置は (-2-8=)-10 のスコアが割り当てられ、ギャップの後続の位置は -8 のスコアが与えられることを意味する。

- [Needleman–Wunsch | グローバルアライメントを求めるアルゴリズム](https://bi.biopapyrus.jp/seq/alignment/needleman–wunsch.html)

![https://bi.biopapyrus.jp/seq/alignment/needleman–wunsch.html](http://bi.biopapyrus.net/media/nw-005.png)

### [Pairwise global alignment of protein sequences using the Needleman-Wunsch algorithm](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#pairwise-global-alignment-of-protein-sequences-using-the-needleman-wunsch-algorithm)
**2つのタンパク質配列間のグローバル・アライメント**

アミノ酸置換行列 [BLOSUM (BLOcks SUbstitution Matrix)](https://en.wikipedia.org/wiki/BLOSUM)

![https://en.wikipedia.org/wiki/BLOSUM](https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/BLOSUM62.gif/400px-BLOSUM62.gif)

	data(BLOSUM50)
	BLOSUM50

	data(package="Biostrings")

タンパク質配列("PAWHEAE"と"HEAGAWGHEE")間の最適なグローバルアライメントを見つける:  

	data(BLOSUM50)
	s3 <- "PAWHEAE"
	s4 <- "HEAGAWGHEE"
	globalAligns3s4 <- pairwiseAlignment(s3, s4, substitutionMatrix = "BLOSUM50", 
				gapOpening = -2, gapExtension = -8, scoreOnly = FALSE)
	globalAligns3s4

出力結果:

	Global PairwiseAlignmentsSingleSubject (1 of 1)
	pattern: [1] P---AWHEAE 
	subject: [1] HEAGAWGHEE 
	score: -5 

ギャップ(`---`)は -10-8-8 = -26 のスコアが与えられる。

- 2009.9.12 [バイオインフォマティクス基礎講座 配列解析 川端 猛](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_3_1.pdf)
- [バイオインフォマティクス-ゲノム配列から機能解析へ-第3章3.4節配列アラインメントにおけるスコア行列とギャップペナルティの使用方法](http://qiita.com/kino-tohoku/items/d4e0441e7ed6222106fa)

### [Aligning UniProt sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#aligning-uniprot-sequences)
**UniProt配列のアライメント**

    library("seqinr")
    lepraeseq <- read.fasta(file = "http://www.uniprot.org/uniprot/Q9CD83.fasta")[[1]]
    ulceransseq <- read.fasta(file = "http://www.uniprot.org/uniprot/A0PQ23.fasta")[[1]]

    # 文字ベクトルを文字列に変換
    # convert vectors of characters into strings
	lepraeseqstring <- c2s(lepraeseq)     # Make a string that contains the sequence in "lepraeseq"
	ulceransseqstring <- c2s(ulceransseq) # Make a string that contains the sequence in "ulceransseq"

    # 大文字に変換
    # convert strings to uppercase 
	lepraeseqstring <- toupper(lepraeseqstring)
	ulceransseqstring <- toupper(ulceransseqstring)
	lepraeseqstring # Print out the content of "lepraeseqstring"

    #library(Biostrings); data(BLOSUM50)
    # pairwiseAlignment
	globalAlignLepraeUlcerans <- pairwiseAlignment(lepraeseqstring, ulceransseqstring,
		substitutionMatrix = BLOSUM50, gapOpening = -2, gapExtension = -8, scoreOnly = FALSE)

	globalAlignLepraeUlcerans # Print out the optimal global alignment and its score

出力結果:

	Global PairwiseAlignmentsSingleSubject (1 of 1)
	pattern: [1] MT-----NR--T---LSREEIRKLDRDLRILVATN...FQDTPREELDRCQYSNDIDTRSGDRFVLHGRVFKN 
	subject: [1] MLAVLPEKREMTECHLSDEEIRKLNRDLRILIATN...FEDNSREEPIRHQRS--VGT-SA-R---SGRSICT 
	score: 627 

### [Viewing a long pairwise alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#viewing-a-long-pairwise-alignment)
**2つの配列間のアライメントの表示と出力**

    writePairwiseAlignments(globalAlignLepraeUlcerans)

    writePairwiseAlignments(globalAlignLepraeUlcerans, file="globalAlignLepraeUlcerans.txt")

### [Pairwise local alignment of protein sequences using the Smith-Waterman algorithm](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#pairwise-local-alignment-of-protein-sequences-using-the-smith-waterman-algorithm)
**2つのタンパク質配列間のローカル・アライメント**

	localAlignLepraeUlcerans <- pairwiseAlignment(lepraeseqstring, ulceransseqstring,
		substitutionMatrix = BLOSUM50, gapOpening = -2, gapExtension = -8, scoreOnly = FALSE, type="local")

	localAlignLepraeUlcerans # Print out the optimal local alignment and its score

    writePairwiseAlignments(localAlignLepraeUlcerans)

### [Calculating the statistical significance of a pairwise global alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#calculating-the-statistical-significance-of-a-pairwise-global-alignment)
**ペアワイズグローバルアラインメントの統計的有意性の計算**

### [Summary](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#summary)

	data()
	?toupper

    library("seqinr")
    ?c2s

    library(Biostrings)
	nucleotideSubstitutionMatrix()
    ?pairwiseAlignment

### [Links and Further Reading](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#links-and-further-reading)

- [配列の記載に用いる略号 | DDBJ](http://www.ddbj.nig.ac.jp/sub/code-j.html)
  - [核酸塩基コード](http://www.ddbj.nig.ac.jp/sub/code-j.html#nucleotide-1)
  - [アミノ酸コード](http://www.ddbj.nig.ac.jp/sub/code-j.html#amino-1)
- [2-1. 配列解析基礎 Basic Sequence Analysis 坊農 秀雅](http://www.iu.a.u-tokyo.ac.jp/~kadota/bioinfo_ngs_sokushu_2014/20140905_2-1_bono.pdf)
- [Aritalab:Lecture/Bioinformatics/Alignment - Metabolomics.JP](http://metabolomics.jp/wiki/Aritalab:Lecture/Bioinformatics/Alignment)
- [置換行列 | スコアマトリックスの作り方](https://bi.biopapyrus.jp/seq/score-matrix.html)
- [アラインメント | 核酸あるいはアミノ酸配列を複数並べ類縁度を可視化](https://bi.biopapyrus.jp/seq/alignment/)
- [Needleman–Wunsch | グローバルアライメントを求めるアルゴリズム](https://bi.biopapyrus.jp/seq/alignment/needleman–wunsch.html)
- [Smith-Waterman | ローカルアラインメントを求めるアルゴリズム](https://bi.biopapyrus.jp/seq/alignment/smith-waterman.html)

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#exercises)
**演習**
[回答例](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter_answers.html#sequence-alignment)

----------

## [Multiple Alignment and Phylogenetic trees](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html)
**多重配列アライメントと系統樹**

- [多重整列](https://ja.wikipedia.org/wiki/多重整列) [マルチプルアライメント](http://bio-info.biz/article/ase_msa.html) [Multiple sequence alignment](https://en.wikipedia.org/wiki/Multiple_sequence_alignment) 
- [系統樹](https://ja.wikipedia.org/wiki/系統樹) [Phylogenetic tree](https://en.wikipedia.org/wiki/Phylogenetic_tree) 
- [系統学](https://ja.wikipedia.org/wiki/系統学) [Phylogenetics](https://en.wikipedia.org/wiki/Phylogenetics) 

![https://bioinf.comav.upv.es/courses/biotech3/theory/phylogeny.html](https://bioinf.comav.upv.es/courses/biotech3/static/phylogeny/phylo_msa.png)

R言語デモ

    # 多重整列 Multiple Sequence Alignment
    #source("http://www.bioconductor.org/biocLite.R"); biocLite("msa")
    library(msa)
    example(msa)

    # 系統樹 Phylogenetic trees
    #install.packages("ape")
    library(ape)
    example(plot.phylo)

### [Retrieving a list of sequences from UniProt](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#retrieving-a-list-of-sequences-from-uniprot)
**UniProtから複数の配列を取得**

[狂犬病ウイルス](https://ja.wikipedia.org/wiki/狂犬病ウイルス) Rabies virus, Mokola virus, Lagos bat virus, West Caucasian bat virus の Phosphoprotein のタンパク質配列（UniProt accession は 
[P06747](http://www.uniprot.org/uniprot/P06747), 
[P0C569](http://www.uniprot.org/uniprot/P0C569), 
[O56773](http://www.uniprot.org/uniprot/O56773), 
[Q5VKP1](http://www.uniprot.org/uniprot/Q5VKP1)）を取得し、FASTA形式で保存する:  

    library("seqinr")
    # create a function to retrieve several sequences from UniProt
    retrieve_seqs_uniprot <- function(ACCESSION) read.fasta(file = paste0("http://www.uniprot.org/uniprot/",ACCESSION,".fasta"), seqtype = c("AA"), strip.desc = TRUE)[[1]]

    seqnames <- c("P06747", "P0C569", "O56773", "Q5VKP1") # Make a vector containing the names of the sequences
    seqs <- lapply(seqnames,  retrieve_seqs_uniprot)      # Retrieve the sequences and store them in list variable "seqs"
	length(seqs)      # Print out the number of sequences retrieved
	seq1 <- seqs[[1]] # Get the 1st sequence
	seq1[1:20]        # Print out the first 20 letters of the 1st sequence
	seq2 <- seqs[[2]] # Get the 2nd sequence
	seq2[1:20]        # Print out the first 20 letters of the 2nd sequence

	# write the sequences to a FASTA-format file
	write.fasta(seqs, seqnames, file="phosphoproteins.fasta")

### [Installing the CLUSTAL multiple alignment software](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#installing-the-clustal-multiple-alignment-software)

多重整列プログラム
[Clustal](https://ja.wikipedia.org/wiki/Clustal)

[プログラムのダウンロード](http://www2.tba.t-com.ne.jp/nakada/takashi/phylogeny/hajikeju2.html#programs)
- [clustalw-2.1-macosx.dmg](http://www.clustal.org/download/current/clustalw-2.1-macosx.dmg)
- [SeaView](http://doua.prabi.fr/software/seaview_data/seaview4.zip)

### [Creating a multiple alignment of protein, DNA or mRNA sequences using CLUSTAL](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#creating-a-multiple-alignment-of-protein-dna-or-mrna-sequences-using-clustal)
**CLUSTALを用いたタンパク質/DNA/mRNA配列の多重アライメントの作成**

    # Read an XStringSet object from a file
    library(Biostrings)
    mySequences <- readAAStringSet(file = "phosphoproteins.fasta")

    # Multiple Sequence Alignment using ClustalW
    #source("http://www.bioconductor.org/biocLite.R"); biocLite("msa")
    library(msa)
    myAlignment <- msa(mySequences, "ClustalW")
    myAlignment

    # write an XStringSet object to a file
    writeXStringSet(unmasked(myAlignment), file = "virusaln.fasta")

    system("open .")

### [Reading a multiple alignment file into R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#reading-a-multiple-alignment-file-into-r)
**多重アライメントのファイルをRに読み込む**

    library(seqinr)
    virusaln <- read.alignment(file = "virusaln.fasta", format = "fasta")
    names(virusaln)
	virusaln$seq

### [Viewing a long multiple alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#viewing-a-long-multiple-alignment)
**多重アライメントの表示**

    print(myAlignment, show="complete")

### [Discarding very poorly conserved regions from an alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#discarding-very-poorly-conserved-regions-from-an-alignment)

### [Calculating genetic distances between protein sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#calculating-genetic-distances-between-protein-sequences)
**タンパク質配列間の遺伝的距離を計算する**

	virusdist <- dist.alignment(virusaln) # Calculate the genetic distances
	virusdist                             # Print out the genetic distance matrix

距離行列より、"O56773"と"P0C569"との間の遺伝的距離が最小（0.4142670）、"Q5VKP1"と"O56773"との間の遺伝的距離が最大（0.5067117）である。

### [Building an unrooted phylogenetic tree for protein sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#building-an-unrooted-phylogenetic-tree-for-protein-sequences)
**タンパク質配列の無根系統樹の構築**

タンパク質配列の距離行列に基づいて、[近隣結合法 NJ (Neighbor-Joining)](https://ja.wikipedia.org/wiki/近隣結合法) により系統樹を構築する。系統樹では、"Q5VKP1"と"P06747"が群を形成し、"O56773"と"P0C569"が群を形成した。

    # construct a phylogenetic tree with the neighbor joining algorithm
    #install.packages("ape")
    library(ape)
    mytree <- nj(virusdist)
    plot.phylo(mytree, type="unrooted") # plot the unrooted phylogenetic tree

    # get sequence annotations
    unlist(getAnnot(seqs))

    # Phylogenetic diversity (PD): "the sum of the lengths of all those branches"
    sum(mytree$edge.length)

系統学的多様性: 系統樹の枝長の総和
- [Phylogenetic diversity - Wikipedia](https://en.wikipedia.org/wiki/Phylogenetic_diversity)
- [論文の紹介： 生物多様性を進化系統学的な尺度で測る (情報：農業と環境 No.83 2007.3)](http://www.naro.affrc.go.jp/archive/niaes/magazine/083/mgzn08304.html)
- [系統的多様性 - Draft of Pediatric Surgery](https://sites.google.com/site/noteofpaediatricsurgery/in-silico/meta16s/figtree/keitouteki)

[系統推定の基本用語](http://nesseiken.info/Chiba_lab/index.php?cmd=read&page=授業%2FH24%2F進化生物学I%2F系統樹に関する基本用語)
- 枝長(branch length)　その枝で生じた変化の数。
- 根を持つ系統樹を有根系統樹(rooted tree), 根を持たない系統樹を無根系統樹(unrooted tree)と呼ぶ。
- 内群（ingroup）　今、系統推定の対象としているグループのこと。
- 外群 (outgoup)　内群に含まれない分類群はすべて外群（outgroup）になる。外群は通常、系統樹に根をつけるときに使われ、内群の姉妹群から複数のものを用いることが多い。

### [Building a rooted phylogenetic tree for protein sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#building-a-rooted-phylogenetic-tree-for-protein-sequences)
**タンパク質配列の有根系統樹の構築**

線虫 fox-1 遺伝子は性決定に関わる。
[線虫 Caenorhabditis elegans](https://ja.wikipedia.org/wiki/カエノラブディティス・エレガンス), Caenorhabditis remanei, [Kladothrips waterhousei](http://what-when-how.com/insects/thrips-insects/), [キイロショウジョウバエ Drosophila melanogaster](https://ja.wikipedia.org/wiki/キイロショウジョウバエ) の 相同タンパク質配列（UniProt accession は 
[Q10572](http://www.uniprot.org/uniprot/Q10572), 
[E3M2K8](http://www.uniprot.org/uniprot/E3M2K8), 
[Q8WS01](http://www.uniprot.org/uniprot/Q8WS01), 
[Q9VT99](http://www.uniprot.org/uniprot/Q9VT99)
）を取得し、多重配列アライメントに基づく有根系統樹を構築する。
[外群](https://ja.wikipedia.org/wiki/外群)として"Q8WS01"を選択し、系統樹に根をつける。

    # retrieve several sequences from UniProt
    library("seqinr")
    retrieve_seqs_uniprot <- function(ACCESSION) read.fasta(file = paste0("http://www.uniprot.org/uniprot/",ACCESSION,".fasta"), seqtype = c("AA"), strip.desc = TRUE)[[1]]
	#seqnames <- c("Q10572","E3M2K8","Q8WS01","E1FUV2","A8NSK3","Q9VT99")
    seqnames <- c("Q10572","E3M2K8","Q8WS01","Q9VT99")
    seqs <- lapply(seqnames,  retrieve_seqs_uniprot)

    # write out the sequences to a FASTA file
    write.fasta(seqs, seqnames, file="fox1.fasta")

    # Read an XStringSet object from a file
    library(Biostrings)
    mySequences <- readAAStringSet(file = "fox1.fasta")

    # Multiple Sequence Alignment using ClustalW
    library(msa)
    myAlignment <- msa(mySequences)

    # convert msa for the seqinr package
    fox1aln <- msaConvert(myAlignment, type="seqinr::alignment")

    # calculating genetic distances between protein sequences
    mydist <- dist.alignment(fox1aln)

    # construct a phylogenetic tree with the neighbor joining algorithm
    library(ape)
    mytree <- nj(mydist)
    mytree <- root(mytree, outgroup = "Q8WS01", resolve.root = TRUE)
    plot.phylo(mytree, main = "Phylogenetic Tree")

    # get sequence annotations
    unlist(getAnnot(seqs))

### [Saving a phylogenetic tree as a Newick-format tree file](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#saving-a-phylogenetic-tree-as-a-newick-format-tree-file)
**系統樹をNewick形式ファイルとして保存する**

    write.tree(mytree, file="myNewick.tre")

- [Newick形式のファイルを修正して多分岐の系統樹を作成する - kiliwave](http://kiliwave.hatenablog.com/entry/2016/11/16/205345)
- [Newick書式から系統樹を描く - ryamadaの遺伝学・遺伝統計学メモ (id:ryamada22)](http://d.hatena.ne.jp/ryamada22/20050513/1115948852)

### [Calculating genetic distances between DNA/mRNA sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#calculating-genetic-distances-between-dna-mrna-sequences)
**DNA/mRNA配列間の遺伝的距離を計算する**

    library("seqinr")
    # create a function to retrieve several nucleotide sequences from NCBI
    retrieve_ncbi_fna <- function(ACCESSION) read.fasta(file = paste0("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=",ACCESSION,"&rettype=fasta&retmode=text"), seqtype = c("DNA"), strip.desc = TRUE)[[1]]
    
	seqnames <- c("AF049118", "AF049114", "AF049119", "AF049115")  # Make a vector containing the names of the sequences
    seqs <- lapply(seqnames, retrieve_ncbi_fna) # Retrieve the sequences and store them in list variable "seqs"

    # get sequence annotations
    unlist(getAnnot(seqs))

	# write out the sequences to a FASTA-format file
	write.fasta(seqs, seqnames, file="virusmRNA.fasta")

    # Read an XStringSet object from a file
    library(Biostrings)
    mySequences <- readDNAStringSet(file = "virusmRNA.fasta")

    # Multiple Sequence Alignment using ClustalW
    library(msa)
    myAlignment <- msa(mySequences)

    # convert msa for the seqinr package
    virusmRNAaln <- msaConvert(myAlignment, type="seqinr::alignment")

    # calculate a genetic distance for DNA/mRNA sequences
    library(ape)
	virusmRNAalnbin <- as.DNAbin(virusmRNAaln) # Convert the alignment to "DNAbin" format
	virusmRNAdist <- dist.dna(virusmRNAalnbin) # Calculate the genetic distance matrix
	virusmRNAdist                              # Print out the genetic distance matrix

### [Building a phylogenetic tree for DNA or mRNA sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#building-a-phylogenetic-tree-for-dna-or-mrna-sequences)
**DNA/mRNA配列の系統樹の構築**

    # construct a phylogenetic tree with the neighbor joining algorithm
    library(ape)
    mytree <- nj(virusmRNAdist)
    plot.phylo(mytree, type="unrooted") # plot the unrooted phylogenetic tree

### Summary

    # library(seqinr)
    ?read.alignment
    ?dist.alignment

    # library(msa)
    example(msa)

    # library(ape)
    ?dist.dna
    example(nj)
    ?write.tree

### Links and Further Reading

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#exercises)
**演習**
[回答例](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter_answers.html#multiple-alignment-and-phylogenetic-trees)

----------

----------

- [系統推定の基本用語](http://nesseiken.info/Chiba_lab/index.php?cmd=read&page=授業%2FH24%2F進化生物学I%2F系統樹に関する基本用語)
- [系統学と進化のあれこれ](http://www5b.biglobe.ne.jp/~hilihili/keitou/keitoutop02.html)
- [archief voor stambomen 系統樹ハンターの狩猟記録](http://leeswijzer.hatenablog.com)
- [これが「棒の手紙」だ！](http://kokorohaitsumo15sai.la.coocan.jp/bonotegami.htm)

https://www.fifthdimension.jp/wiki.cgi
田辺晶史, 2010, "ベイジアンMCMCによる生物間系統関係の推定法", 2010年度日本計量生物学会特別セッション『農学・生態学・進化学でのベイズ統計手法の応用に関する諸問題』. Preprint PDF: 20100522BiometricsJapanPreprint.pdf(5955)
https://www.fifthdimension.jp/wiki.cgi?page=FrontPage&file=20100522BiometricsJapanPreprint%2Epdf&action=ATTACH

[SeaView](http://doua.prabi.fr/software/seaview)
[使用法](http://www2.tba.t-com.ne.jp/nakada/takashi/phylogeny/seaview2.html)

----------

# Acknowledgements

I am grateful to Drs. Simon Penel and Jean R. Lobry for their advice on SeqinR.

----------
