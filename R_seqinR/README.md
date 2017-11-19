Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2017-11-19

----------
# SeqinR
- [seqinr](http://seqinr.r-forge.r-project.org)
- [CRAN - Package seqinr](https://cran.r-project.org/web/packages/seqinr/index.html)
seqinr: Biological Sequences Retrieval and Analysis

----------
## Exercise 1

    library("seqinr")  # Loading "seqinr" package
    x <- s2c("atgc")   # Create small data
    x
    length(x)          # Length of a DNA sequence
    table(x)           # Base composition of a DNA sequence
    GC(x)              # GC Content of DNA
    count(x, word = 2) # Count oligomers

----------
## Exercise 2

    # Loading seqinr package
    library(seqinr)
    # list the data sets in the "seqinr" package
    data(package = "seqinr")
    # A toy example of amino-acid counts in three proteins
    data(toyaa)
    # A toy example of codon counts in three coding sequences
    data(toycodon)
    # Fragment of the E. coli chromosome
    example(m16j)
    # 999 coding sequences from E. coli
    data(ec999)
    # to plot genetic code as in textbooks
    tablecode()
    # to translate coding sequences into proteins
    getTrans(ec999)
    # utility data for seqinr
    SEQINR.UTIL
    # To Get Some Protein Statistics
    example(AAstat)
    # Dot Plot Comparison of two sequences
    example(dotPlot)

----------
# Acknowledgements
I am grateful to Drs. Jean R. Lobry and Simon Penel for their advice on SeqinR.

----------
# References

http://www.rdocumentation.org/packages/seqinr
seqinr package | R Documentation

https://rstudio-pubs-static.s3.amazonaws.com/73927_60e9fb345d9d4175b8994b1ff1eff2e2.html
DNA Sequence Statistics using R: Team Project

http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html
(Rで)塩基配列解析
(last modified 2017/11/13, since 2010)
http://www.iu.a.u-tokyo.ac.jp/~kadota/r_seq.html#intro_general_translate_seqinr
イントロ | 一般 | 翻訳配列(translate)を取得(応用) | seqinr(Charif_2005)

https://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/
Using the R SeqinR package - Musings from an unlikely candidateMusings from an unlikely candidate

http://blog.biogem.org/2013/05/dotplot-for-protein-sequences-using-r.html
DotPlot for Protein Sequences using R ~ BioGem.Org

May 29, 2012
https://www.slideshare.net/pau_corral/seqinr-biological-data-handling
SeqinR - biological data handling

June 10, 2011
http://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/index.html
Welcome to a Little Book of R for Bioinformatics! — Bioinformatics 0.1 documentation
https://media.readthedocs.org/pdf/a-little-book-of-r-for-bioinformatics/latest/a-little-book-of-r-for-bioinformatics.pdf

https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf
Applied Statistics for Bioinformatics using R
Wim P. Krijnen
November 10, 2009

https://sites.google.com/site/adversariaoftekijima/r/seqinr
seqinr - 日々草(TEKの備忘録)

----------
