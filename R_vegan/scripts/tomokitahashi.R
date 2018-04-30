# https://sites.google.com/site/tomokitahashi/r_vegan
# R_vegan - Kitahashi's Web Site

Sys.Date()

cat("# 1. RでMDS")
# https://sites.google.com/site/tomokitahashi/r_vegan/mds
# ここではnMDS（非計量多次元尺度法： non-metric Multi-Dimensional Scaling）を用いて群集構造の変異を2次元プロットとして可視化する。
library(MASS)        #パッケージ”MASS”の呼び出し
library(vegan)       #パッケージ”vegan”の呼び出し
data(dune)           # veganに入っているデータセット”dune”の呼び出
dune.mds<- metaMDS(log10(dune+1),distance="bray",autotransform=FALSE)
dune.mds$stress                         # stress値の確認
scores(dune.mds,display=c("sites"))         #ここに各サイトのスコアが入っている
dune.scores<- scores(dune.mds,display=c("sites"))   #スコアを名前付け
plot(dune.scores,xlab="",ylab="",xaxt="n",yaxt="n")  #プロットする
identify(dune.scores)

cat("# 2. RでPERMANOVA")
# https://sites.google.com/site/tomokitahashi/r_vegan/permanova
# PERMANOVA (Permutational Multivariate Analysis of Variance)を用いて、群集の変異の有意性を検定する。
library(MASS)             #パッケージ”MASS”の呼び出し
library(vegan)            #パッケージ”vegan”の呼び出し
data(dune)                      # veganに入っているデータセット”dune”の呼び出し
data(dune.env)            #データセット”dune.env”の呼び出し
adonis(dune~Management, data=dune.env, permutations=9999, method="bray")

sessionInfo()