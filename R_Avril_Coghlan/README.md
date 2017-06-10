
# [Welcome to a Little Book of R for Bioinformatics!](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)  
By Avril Coghlan  

## [Chapters in this Book](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/index.html#chapters-in-this-book)
**目次**
- [How to install R and a Brief Introduction to R](#how-to-install-r-and-a-brief-introduction-to-r)
- [DNA Sequence Statistics (1)](#dna-sequence-statistics-1)
- [DNA Sequence Statistics (2)](#dna-sequence-statistics-2)
- [Sequence Databases](#sequence-databases)
- [Pairwise Sequence Alignment](#pairwise-sequence-alignment)
- [Multiple Alignment and Phylogenetic trees](#multiple-alignment-and-phylogenetic-trees)

----------

## [How to install R and a Brief Introduction to R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html)
R言語入門

### Running R

[R の起動と終了](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html)  

![http://cse.naro.affrc.go.jp/takezawa/r-tips/r/02.html](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/image/Mac.gif)

### [A brief introduction to R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/installr.html#a-brief-introduction-to-r)

[簡単な計算](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/03.html)  
演算子


[オブジェクトと代入（付値）](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/05.html)


[ベクトル](http://stat.biopapyrus.net/vector/vector.html)  
ベクトルの作成は関数`c()`を用いる。


[ベクトル要素へのアクセス](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/13.html)  
インデックス（添字）  


[リスト](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/23.html)  
リストは異なる型（数値や文字列）のデータをまとめられる。
リストの作成は関数`list()`を用いる。


`[[ ]]`はリスト内の要素（ベクトル）を取り出す。


リストの要素に名前が付けられている場合、`$`記号でアクセスする。


`table()`関数

    mybases <- c("A", "C", "G", "T", "A")
    table(mybases)
    mytable <- table(mybases)
    mytable
    mytable[[1]]
    mytable[["A"]]

[簡単な計算](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/03.html)  
関数


[ヘルプ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/07.html)


標準偏差 standard deviation を計算する関数を探す


ベクトルの値の平均


[関数の定義](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/31.html)  
[関数の作り方 | functionによりRの関数を定義する方法](http://stat.biopapyrus.net/r/user-function.html)  


Rを終了:  

    quit()

### Links and Further Reading

https://cran.r-project.org/doc/contrib/Lemon-kickstart/

https://cran.r-project.org/doc/manuals/R-intro.html

----------

## [DNA Sequence Statistics (1)](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter1.html)
**DNA配列の統計 (1)**

![https://ja.wikipedia.org/wiki/GC含量](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/AT-GC.jpg/400px-AT-GC.jpg)

### Using R for Bioinformatics
**R言語を用いたバイオインフォマティクス**

### R packages for bioinformatics: Bioconductor and SeqinR
**バイオインフォマティクスのためのRパッケージ：BioconductorとSeqinR**

[パッケージ | RのパッケージをCRANからインストールする方法と利用方法](http://stat.biopapyrus.net/r/package-function.html)

パッケージ[`seqinr`](https://cran.r-project.org/web/packages/seqinr/index.html)のインストール:  

    #install.packages("seqinr")

[パッケージ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/08.html)`seqinr`を呼び出す:  


[ヘルプ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/07.html)


Bioconductorパッケージ[`Biostrings`](http://bioconductor.org/packages/release/bioc/html/Biostrings.html)のインストール:  

    #source("https://bioconductor.org/biocLite.R")
    #biocLite("Biostrings")

`Biostrings`パッケージの呼び出し:  

    library(Biostrings)

### FASTA format
**[FASTA](http://quma.cdb.riken.jp/help/fastaHelp_j.html)形式**

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P1_image5.png)

### The NCBI sequence database
**[NCBI](https://ja.wikipedia.org/wiki/国立生物工学情報センター)配列データベース**

![http://www.ddbj.nig.ac.jp/insdc/insdc-j.html](http://www.ddbj.nig.ac.jp/wp-content/uploads/insdc_shoukai550_20130515.gif)  

- [INSDC - DDBJ/EBI/NCBI国際塩基配列データベース](http://www.ddbj.nig.ac.jp/insdc/insdc-j.html)  
  - 米国 [National Centre for Biotechnology Information (NCBI)](http://www.ncbi.nlm.nih.gov)  
  - 欧州 [European Bioinformatics Institute (EBI)](http://www.ebi.ac.uk)  
  - 日本 [DNA Data Bank of Japan (DDBJ)](http://www.ddbj.nig.ac.jp/index-j.html)  

配列データにはユニークな識別子（アクセッション *accession*）が割り当てられている。例えば、WHOが[顧みられない熱帯病 Neglected Tropical Diseases](http://www.tm.nagasaki-u.ac.jp/multiplex/phase1/ntd.html)として挙げている[デング熱](https://ja.wikipedia.org/wiki/デング熱)を引き起こすウイルスのDNA配列のNCBIアクセッションは以下:  

- デング熱ウイルスのゲノム配列
  - DEN-1 [NC_001477](http://www.ncbi.nlm.nih.gov/nuccore/NC_001477)
  - DEN-2 [NC_001474](http://www.ncbi.nlm.nih.gov/nuccore/NC_001474)
  - DEN-3 [NC_001475](http://www.ncbi.nlm.nih.gov/nuccore/NC_001475)
  - DEN-4 [NC_002640](http://www.ncbi.nlm.nih.gov/nuccore/NC_002640)

![https://ja.wikipedia.org/wiki/デング熱](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Dengue.jpg/250px-Dengue.jpg)

### Retrieving genome sequence data via the NCBI website
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

### Retrieving genome sequence data using SeqinR
**Rパッケージ[`seqinr`](https://cran.r-project.org/web/packages/seqinr/index.html)を用いて、ゲノム配列データを取得**

    #choosebank("refseqViruses")
    #query2 <- query("query2","AC=NC_001477")
    #dengueseq <- getSequence(query2$req[[1]])

### Writing sequence data out as a FASTA file
**配列データを[FASTA](http://quma.cdb.riken.jp/help/fastaHelp_j.html)形式ファイルとして書き出す**

    library("seqinr")
    dengue <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/den1.fasta")
    dengueseq <- dengue[[1]]


[作業ディレクトリ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/06.html)の変更と確認:  

    getwd()
    setwd("~")
    setwd("~/Downloads/")

### Reading sequence data into R
**配列データをRに読み込む**

`read.fasta()`関数でFASTA形式ファイル（den1.fasta）を読み込む:  


変数`dengue`は[リスト](http://stat.biopapyrus.net/vector/list.html)。リストの1番目の要素を代入した
変数`dengueseq`は塩基配列を含む[ベクトル](http://stat.biopapyrus.net/vector/vector.html)  
以下のコマンドは、塩基配列の最初の50塩基を出力する:  


### Length of a DNA sequence
**DNA配列の長さ**


### Base composition of a DNA sequence
**DNA配列の塩基組成**


![https://ja.wikipedia.org/wiki/GC含量](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/AT-GC.jpg/400px-AT-GC.jpg)

### GC Content of DNA
**DNAの[GC含量](https://ja.wikipedia.org/wiki/GC含量)**
(G+C)/(A+T+G+C)

    (2240+2770)/(3426+2240+2770+2299)


細菌のGC含量とゲノムサイズ

![https://en.wikipedia.org/wiki/Inferring_horizontal_gene_transfer](https://upload.wikimedia.org/wikipedia/en/thumb/f/f5/Inferring_horizontal_gene_transfer_average_GC_content.svg/400px-Inferring_horizontal_gene_transfer_average_GC_content.svg.png)

### DNA words
**連続塩基**

    words(length = 2)  #  dinucleotides 2連続塩基 
    words(length = 3)  # trinucleotides 3連続塩基

`count`関数で連続塩基のカウント

    # Count oligomers (monomer/dimer/trimer/etc)
    help(count)
    count(s2c("atg"), 2)



### Summary


### Links and Further Reading

Chapter 9 “Analyzing Sequences” in the book "Applied statistics for bioinformatics using R" by Krijnen (https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter1.html#exercises)
演習

----------

## [DNA Sequence Statistics (2)](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter2.html)
**DNA配列の統計 (2)**

### A little more introduction to R
**続・R言語入門**


[Rで繰り返しを含む数列の生成（rep関数、seq関数）](http://tips-r.blogspot.jp/2014/05/repseq.html)


[30. 繰り返し文](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/30.html)  
for による繰り返し




[48. とりあえず plot()](R-Source)


[関数の定義](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/31.html)  
[関数の作り方 | functionによりRの関数を定義する方法](http://stat.biopapyrus.net/r/user-function.html)  


`＃`の後が[コメント](http://yusuke-memo.blogspot.jp/2009/10/r.html)行となる。


### [Reading sequence data with SeqinR](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#reading-sequence-data-with-seqinr)
Rパッケージ[`seqinr`](https://cran.r-project.org/web/packages/seqinr/index.html)で
配列データを読み込み

DEN-1デング熱ウイルスのゲノム配列を取得する。

    # system('curl -L "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=NC_001477&rettype=fasta&retmode=text" > den1.fasta')
    # dengue <- read.fasta(file = "https://raw.githubusercontent.com/haruosuz/r4bioinfo/master/R_Avril_Coghlan/examples/den1.fasta")


### [Local variation in GC content](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#local-variation-in-gc-content)
GC含量の局所変動は、変異バイアスや[水平伝播](https://ja.wikipedia.org/wiki/遺伝子の水平伝播)を示唆


### [A sliding window analysis of GC content](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#a-sliding-window-analysis-of-gc-content)
GC含量の移動解析


### [A sliding window plot of GC content](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#a-sliding-window-plot-of-gc-content)
GC含量の移動プロット

`for`ループを使う。異なる範囲（windowsize: 2000, 3000, 300 塩基）のプロットを作成する。

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P2_image3.png)

[ウェブサイト](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#a-sliding-window-plot-of-gc-content)から
`slidingwindowplot`関数をコピペして、以下の通り実行:  



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


[ρ](https://ja.wikipedia.org/wiki/Ρ)統計量はDNA文字列の[観測値/期待値]を計算する。2連続塩基の場合、ρ値は次の通り計算される:  

ρ(xy) = fxy/(fx*fy),

ここで、"fxy", "fx", "fy"は、DNA配列中の文字列"xy", "x", "y"の頻度である。

例えば、2連続塩基"GC"のρ値の計算式は:  

ρ(GC) = fGC/(fG * fC)

ここで、"fGC", "fG", "fC"は、DNA配列中の文字列"GC", "G", "C"の頻度である。


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

### Summary


### Links and Further Reading

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter2.html#exercises)
演習

----------

## [Sequence Databases](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html)
**配列データベース**

### The NCBI Sequence Database

### [Querying the NCBI Database via R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#querying-the-ncbi-database-via-r)
**Rを介してNCBIデータベースを照会する**


    # query("RefSeqBact", "SP=Bacteria")
    #Error in query("RefSeqBact", "SP=Bacteria") : 
    #  invalid request:"unknown species at (^): \"SP

    #> 	query("SchistosomamRNA", "SP=Schistosoma mansoni AND M=mrna")
    #Error in readLines(socket, n = nelem, ok = FALSE) : 
    #  too few lines read in readLines
    #In addition: Warning message:
    #In readLines(socket, n = nelem, ok = FALSE) :
    #  incomplete final line found on '->pbil.univ-lyon1.fr:5558'

#### [Example: finding the sequence for the DEN-1 Dengue virus genome](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter3.html#example-finding-the-sequence-for-the-den-1-dengue-virus-genome)
**例：DEN-1デングウイルスゲノムの配列を取得**

    Dengue1 <- query("Dengue1", "AC=NC_001477")

----------

## [Pairwise Sequence Alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/src/chapter4.html)
**2つの配列間でのアラインメント**

**[ペアワイズシーケンスアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E3.83.9A.E3.82.A2.E3.83.AF.E3.82.A4.E3.82.BA.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88)**

![https://ja.wikipedia.org/wiki/シーケンスアラインメント](https://upload.wikimedia.org/wikipedia/commons/8/86/Zinc-finger-seq-alignment2.png)

塩基の置換(Substitution)、挿入(Insertion)、欠失(Deletion)

![http://www.bbc.co.uk/education/guides/zc499j6/revision/2](http://a.files.bbci.co.uk/bam/live/content/zdjy4wx/large)

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

[作業ディレクトリ](http://cse.naro.affrc.go.jp/takezawa/r-tips/r/06.html)の変更と確認:  

    getwd()
    setwd("~")
    setwd("~/Downloads/")

`read.fasta()`関数で、FASTAファイルをRに読み込む:  

    # system("curl -O http://www.uniprot.org/uniprot/Q9CD83.fasta")
    # system("curl -O http://www.uniprot.org/uniprot/A0PQ23.fasta")

[How can I access resources on this web site programmatically?](http://www.uniprot.org/help/programmatic_access)

### [Retrieving a UniProt protein sequence using SeqinR](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#retrieving-a-uniprot-protein-sequence-using-seqinr)
**SeqinRでUniProtのタンパク質配列を取得**

    leprae <- query("leprae", "AC=Q9CD83")
    ulcerans <- query("ulcerans", "AC=A0PQ23")

### [Comparing two sequences using a dotplot](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#comparing-two-sequences-using-a-dotplot)
**ドットプロットで2つの配列を比較**

タンパク質のアミノ酸配列や核酸の塩基配列の[相同性 (homology)](https://ja.wikipedia.org/wiki/相同)（共通の祖先に由来すること）は、配列類似性に基づいて判断される。
[ドットプロット](https://ja.wikipedia.org/wiki/ドットプロット_%28バイオインフォマティクス%29)とは、2本の配列を比較するためのグラフである。
両軸に全く同じ配列をとれば、右上がりの対角線が現れる。

テストデータで確認する:  

    # Create tests
    x <- s2c("atgc")
    par(mfrow=c(2,2))
    dotPlot(x,x)
    dotPlot(x,rev(x))
    dotPlot(rep(x,2),rep(x,2))

*M.leprae*と*M.ulcerans*のコリスミ酸リアーゼのタンパク質配列のドットプロットを作成する:  


![http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P4_image5.png)

ヒトの[血小板由来成長因子](https://ja.wikipedia.org/wiki/血小板由来成長因子) (Platelet-Derived Growth Factor, PDGF) と [サル肉腫ウイルスの癌遺伝子 v-sis](https://www.wikigenes.org/e/mesh/e/21827.html) のアミノ酸配列は類似性が高い。([Doolittle RF et al., 1983](https://www.ncbi.nlm.nih.gov/pubmed/6304883))

    # "sp|P01127|PDGFB_HUMAN Platelet-derived growth factor subunit B OS=Homo sapiens GN=PDGFB PE=1 SV=1"          
    # "sp|P01128|TSIS_WMSV PDGF-related-transforming protein sis OS=Woolly monkey sarcoma virus GN=V-SIS PE=3 SV=1"

    library("seqinr")
    seq1 <- read.fasta(file = "http://www.uniprot.org/uniprot/P01127.fasta")[[1]]
    seq2 <- read.fasta(file = "http://www.uniprot.org/uniprot/P01128.fasta")[[1]]

    # Comparing two sequences using a dotplot
    dotPlot(seq1, seq2)

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


[**Gap penalty**](https://en.wikipedia.org/wiki/Gap_penalty)

ギャップの最初の位置には、
ギャップ（挿入・欠失）開始時のペナルティ(*gap opening penalty*)と
ギャップ（挿入）継続時のペナルティ(*gap extension penalty*)を与える。
隣接するギャップは一回の挿入・欠失で生じたと考える。

- [ClustalW ヘルプ | DDBJ](http://www.ddbj.nig.ac.jp/search/help/clustalwhelp-j.html)

`pairwiseAlignment()`関数で、DNA配列("GAATTC"と"GATTA")間の最適なグローバルアライメントを見つける:  


出力結果:


このアライメントは、4個の一致(match)、1個の不一致(mismatch)、長さ1の1個のギャップ(gap)が含まれているので、スコアは (4\*2)+(1\*-1)+(1\*-10) = -3 となる。  
【注意】gapOpening = -2, gapExtension = -8 は、ギャップの最初の位置は (-2-8=)-10 のスコアが割り当てられ、ギャップの後続の位置は -8 のスコアが与えられることを意味する。

- [Needleman–Wunsch | グローバルアライメントを求めるアルゴリズム](https://bi.biopapyrus.jp/seq/alignment/needleman–wunsch.html)

![https://bi.biopapyrus.jp/seq/alignment/needleman–wunsch.html](http://bi.biopapyrus.net/media/nw-005.png)

### [Pairwise global alignment of protein sequences using the Needleman-Wunsch algorithm](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#pairwise-global-alignment-of-protein-sequences-using-the-needleman-wunsch-algorithm)
**2つのタンパク質配列間のグローバル・アライメント**

アミノ酸置換行列 [BLOSUM (BLOcks SUbstitution Matrix)](https://en.wikipedia.org/wiki/BLOSUM)

![https://en.wikipedia.org/wiki/BLOSUM](https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/BLOSUM62.gif/400px-BLOSUM62.gif)



タンパク質配列("PAWHEAE"と"HEAGAWGHEE")間の最適なグローバルアライメントを見つける:  


出力結果:


ギャップ(`---`)は -10-8-8 = -26 のスコアが与えられる。

- [バイオインフォマティクス (第3回) 榊原康文](https://www.dna.bio.keio.ac.jp/lecture/bioinfo/bioinformatics-3.pdf)
- 2009.9.12 [バイオインフォマティクス基礎講座 配列解析 川端 猛](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_3_1.pdf)
- [バイオインフォマティクス-ゲノム配列から機能解析へ-第3章3.4節配列アラインメントにおけるスコア行列とギャップペナルティの使用方法](http://qiita.com/kino-tohoku/items/d4e0441e7ed6222106fa)

### [Aligning UniProt sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#aligning-uniprot-sequences)
**UniProt配列のアライメント**

    library("seqinr")
    lepraeseq <- read.fasta(file = "http://www.uniprot.org/uniprot/Q9CD83.fasta")[[1]]
    ulceransseq <- read.fasta(file = "http://www.uniprot.org/uniprot/A0PQ23.fasta")[[1]]

    # 文字ベクトルを文字列に変換
    # convert vectors of characters into strings

    # 大文字に変換
    # convert strings to uppercase 

    # pairwiseAlignment


出力結果:


### [Viewing a long pairwise alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#viewing-a-long-pairwise-alignment)
**2つの配列間のアライメントの表示と出力**

    writePairwiseAlignments(globalAlignLepraeUlcerans)

    writePairwiseAlignments(globalAlignLepraeUlcerans, file="./myAlignment.txt")

### [Pairwise local alignment of protein sequences using the Smith-Waterman algorithm](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#pairwise-local-alignment-of-protein-sequences-using-the-smith-waterman-algorithm)
**2つのタンパク質配列間のローカル・アライメント**



    writePairwiseAlignments(localAlignLepraeUlcerans)

### [Calculating the statistical significance of a pairwise global alignment](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#calculating-the-statistical-significance-of-a-pairwise-global-alignment)
**ペアワイズグローバルアラインメントの統計的有意性の計算**

### [Summary](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html#summary)


    library("seqinr")
    ?c2s

    library(Biostrings)
    ?pairwiseAlignment

### Links and Further Reading
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
演習

----------

## [Multiple Alignment and Phylogenetic trees](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html)
**多重配列アライメントと系統樹**

- [シーケンスアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント)
  - [ペアワイズアラインメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E3.83.9A.E3.82.A2.E3.83.AF.E3.82.A4.E3.82.BA.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.B3.E3.83.A1.E3.83.B3.E3.83.88)
  - [多重配列アライメント](https://ja.wikipedia.org/wiki/シーケンスアラインメント#.E5.A4.9A.E9.87.8D.E9.85.8D.E5.88.97.E3.82.A2.E3.83.A9.E3.82.A4.E3.83.A1.E3.83.B3.E3.83.88)
- [多重整列](https://ja.wikipedia.org/wiki/多重整列) [Multiple sequence alignment](https://en.wikipedia.org/wiki/Multiple_sequence_alignment)

![https://ja.wikipedia.org/wiki/多重整列](https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/RPLP0_90_ClustalW_aln.gif/575px-RPLP0_90_ClustalW_aln.gif)

![https://ja.wikipedia.org/wiki/系統樹](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Tree_of_life_ja.svg/350px-Tree_of_life_ja.svg.png)

- [系統樹](https://ja.wikipedia.org/wiki/系統樹) [Phylogenetic tree](https://en.wikipedia.org/wiki/Phylogenetic_tree)
- [系統学](https://ja.wikipedia.org/wiki/系統学) [Phylogenetics](https://en.wikipedia.org/wiki/Phylogenetics)
- [分子系統学](https://ja.wikipedia.org/wiki/分子系統学) [Molecular phylogenetics](https://en.wikipedia.org/wiki/Molecular_phylogenetics)
- [平成21年度ゲノムリテラシー講座 分子系統解析 講義資料 (PDF)](http://www.jst.go.jp/nbdc/bird/jinzai/literacy/streaming/h21_4_3.pdf)
- [授業/H24/進化生物学I/系統樹に関する基本用語 - 千葉大系統分類](http://nesseiken.info/Chiba_lab/index.php?cmd=read&page=授業%2FH24%2F進化生物学I%2F系統樹に関する基本用語)
- [北村雄一のホームページ](http://www5b.biglobe.ne.jp/~hilihili/index.html)
  - [系統トップ](http://www5b.biglobe.ne.jp/~hilihili/keitou/keitoutop.html)
   - [系統学と進化のあれこれ](http://www5b.biglobe.ne.jp/~hilihili/keitou/keitoutop02.html)
- [archief voor stambomen 系統樹ハンターの狩猟記録](http://leeswijzer.hatenablog.com)

### Retrieving a list of sequences from UniProt
**UniProtから複数の配列を取得**

    library("seqinr")
    # create a function to retrieve several sequences from UniProt
    retrieve_seqs_uniprot <- function(ACCESSION) read.fasta(file = paste0("http://www.uniprot.org/uniprot/",ACCESSION,".fasta"), seqtype = c("AA"), strip.desc = TRUE)[[1]]

    seqnames <- c("P06747", "P0C569", "O56773", "Q5VKP1") # Make a vector containing the names of the sequences
    seqs <- lapply(seqnames,  retrieve_seqs_uniprot)      # Retrieve the sequences and store them in list variable "seqs"


### Installing the CLUSTAL multiple alignment software

[Clustal](https://ja.wikipedia.org/wiki/Clustal)は広く用いられている多重整列プログラムである。

### [Creating a multiple alignment of protein, DNA or mRNA sequences using CLUSTAL](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#creating-a-multiple-alignment-of-protein-dna-or-mrna-sequences-using-clustal)
**CLUSTALを用いたタンパク質/DNA/mRNA配列の多重アライメントの作成**

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P5_image8.png)

    library(Biostrings)
    mySequences <- readAAStringSet(file = "phosphoproteins.fasta")

    #source("http://www.bioconductor.org/biocLite.R"); biocLite("msa")
    library(msa)
    myAlignment <- msa(mySequences)

    # write an XStringSet object to a file
    writeXStringSet(unmasked(myAlignment), file = "myAlignment.fasta")

### [Reading a multiple alignment file into R](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#reading-a-multiple-alignment-file-into-r)
**多重アライメントのファイルをRに読み込む**

    library(seqinr)
    virusaln <- read.alignment(file = "myAlignment.fasta", format = "fasta")

### Viewing a long multiple alignment
**長い多重アライメントの表示**

    print(myAlignment, show="complete")

### Discarding very poorly conserved regions from an alignment

### [Calculating genetic distances between protein sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#calculating-genetic-distances-between-protein-sequences)
**タンパク質配列間の遺伝的距離を計算する**


### [Calculating genetic distances between DNA/mRNA sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#calculating-genetic-distances-between-dna-mrna-sequences)

### [Building an unrooted phylogenetic tree for protein sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#building-an-unrooted-phylogenetic-tree-for-protein-sequences)
**タンパク質配列の無根系統樹の構築**

    #install.packages("ape")
    library(ape)
    mytree <- nj(virusdist)

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P5_image9.png)

系統樹で"Q5VKP1"と"P06747"がグループを形成し、"O56773"と"P0C569"がグループを形成している。

    # get sequence annotations
    unlist(getAnnot(seqs))

    sp|P06747|PHOSP_RABVP Phosphoprotein OS=Rabies virus (strain Pasteur vaccins / PV) GN=P PE=1 SV=1
    sp|P0C569|PHOSP_MOKV Phosphoprotein OS=Mokola virus GN=P PE=1 SV=1
    sp|O56773|PHOSP_LBV Phosphoprotein OS=Lagos bat virus GN=P PE=2 SV=1
    sp|Q5VKP1|PHOSP_WCBV Phosphoprotein OS=West Caucasian bat virus GN=P PE=2 SV=1

### [Building a rooted phylogenetic tree for protein sequences](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#building-a-rooted-phylogenetic-tree-for-protein-sequences)
**タンパク質配列の有根系統樹の構築**

    library("seqinr")
    retrieve_seqs_uniprot <- function(ACCESSION) read.fasta(file = paste0("http://www.uniprot.org/uniprot/",ACCESSION,".fasta"), seqtype = c("AA"), strip.desc = TRUE)[[1]]

    seqnames <- c("Q10572","E3M2K8","Q8WS01","Q9VT99")
    seqs <- lapply(seqnames,  retrieve_seqs_uniprot)   
    # write out the sequences to a FASTA file:
    write.fasta(seqs, seqnames, file="fox1.fasta")

    library(Biostrings)
    mySequences <- readAAStringSet(file = "fox1.fasta")

    library(msa)
    myAlignment <- msa(mySequences)
    # convert msa for the seqinr package
    fox1aln <- msaConvert(myAlignment, type="seqinr::alignment")

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P5_image10.png)

    mydist <- dist.alignment(fox1aln)

    library(ape)
    mytree <- nj(mydist)
    mytree <- root(mytree, outgroup = "Q8WS01", resolve.root = TRUE)
    plot.phylo(mytree, main = "Phylogenetic Tree")

![](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/_images/P5_image11.png)

[外群](https://ja.wikipedia.org/wiki/外群)として"Q8WS01"を選択し、系統樹に根をつける。
最初に外群("Q8WS01")と他の集団("Q9VT99", "Q10572", "E3M2K8")が分岐し、次に"Q9VT99"と他の集団("Q10572", "E3M2K8")が分岐したと推定される。

    # get sequence annotations
    unlist(getAnnot(seqs))

    tr|Q9VT99|Q9VT99_DROME RNA-binding Fox protein 1, isoform J OS=Drosophila melanogaster GN=Rbfox1 PE=4 SV=3
    tr|Q8WS01|Q8WS01_9NEOP Elongation factor-1 alpha (Fragment) OS=Kladothrips waterhousei GN=EF-1a PE=4 SV=1
    sp|Q10572|FOX1_CAEEL Sex determination protein fox-1 OS=Caenorhabditis elegans GN=fox-1 PE=1 SV=2
    tr|E3M2K8|E3M2K8_CAERE CRE-FOX-1 protein OS=Caenorhabditis remanei GN=Cre-fox-1 PE=4 SV=1

### Building a phylogenetic tree for DNA or mRNA sequences

### [Saving a phylogenetic tree as a Newick-format tree file](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#saving-a-phylogenetic-tree-as-a-newick-format-tree-file)
**系統樹をNewick形式ファイルとして保存する**

    write.tree(mytree, file="myNewick.tree")

### Summary


### Links and Further Reading

### [Exercises](http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter5.html#exercises)
演習

----------
