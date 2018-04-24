# http://nhkuma.blogspot.jp/2012/12/rr.html
# random dispersal: Rいろは・第二部：R基本操作編

# 各種の多様度指数、多様度の解析
# （以下、community1, 2というデータを仮定し、計算してみる）
community1 <- sample(1:5, 10, replace=T) # 10種の個体数を想定（1~5個体の範囲で）
community2 <- t(sapply(1:5, function(s) sample(1:5, 10, replace=T))) # さらに、行列版

library(vegan) # 生物群集解析のためのパッケージ
diversity(community1) # Shannon-Wiener index
# cf. 常用対数にする場合は, diversity(community1, base=2)
diversity(community1, index="simpson") # Simpson index (D)
diversity(community1, index="invsimpson") # Simpson index (1/D)

sim <- vegdist(community2, method="bray")
# 各行の群集間類似度を対戦表で表示（Bray-Curtis dissimilarity）
# 類似度（Bray-Curtis similarity）にするには全体を 1 から引く（1 - sim）
# cf. method="jaccard"：Jaccard類似度（在・不在データやランクの場合）

cruster <- hclust(sim, method="average") # 群平均法を用いたクラスター分析
plot(cruster, hang=-1) # custerを図示、hang=-1 で葉を揃える

# その他、MDS（多次元尺度構成法）なども"vegan"に含まれる
# vegan全般：　http://cc.oulu.fi/~jarioksa/opetus/metodi/vegantutor.pdf
# veganで序列化法（MDS, CCA, RDAなど）：http://cran.r-project.org/web/packages/vegan/vignettes/intro-vegan.pdf
