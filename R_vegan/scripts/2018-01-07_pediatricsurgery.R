# http://pediatricsurgery.hatenadiary.jp/entry/2018/01/07/122117
# {vegan}を使った菌叢解析の階層的クラスター分析とクラスタリング - Note of Pediatric Surgery

Sys.Date()

# 1. データの作成
library(tidyverse)
library(vegan)
data(dune)
# 2. 階層的クラスター分析
# A. 距離 (あるいは類似度) を求める方法を選択し、個体間の距離 (類似度) を計算する
d <- vegdist(dune, method="bray")
# B. クラスター分析の方法 (最近隣法、最遠隣法など) を選択する
# C. 選択された方法のコーフェン（Cophenetic）行列を求める
hc <- hclust(d, method="average")
# E. 結果について検討を行う
plot(hc)
rect.hclust(hc, 3)
# 4. 実際にクラスタリングする
Group <- cutree(hc, k=3) # クラスターの数
# 5. クラスタリング後に別のパラメーターを比較する
data(dune.env) # duneのメタデータを読み込む
boxplot(A1 ~ Group, data=dune.env, notch = TRUE) # Boxplot
# また次元削減をしたplotにクラスタリングの結果を対応させることもできます。
ord <- cca(dune)
plot(ord, display = "sites")
ordihull(ord, Group, lty = 2, col = "red")
# 参考: cca()

sessionInfo()
