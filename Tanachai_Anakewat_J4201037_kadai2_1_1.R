#氏名：アネクワット　タナチャイ
#学籍番号：J4201037
#このRのコードは2020年度Aセメスター統計データ解析I課題2問題1.(i)の解答です

set.seed(111) # 乱数の初期値の設定
#確率変数Yと自由度nを引数とし、確率変数Zを計算する関数を作成
zfunction <- function(y, n){
  result <- (y-n)/sqrt(2*n)
  return(result)
}

##確率変数Zを100000個シミュレーションしてヒストグラムを作成し、
##標準正規密度関数を重ね書きしてみる
#グラフを1つの描画領域2*2分割し作成るため
par(mfrow=c(2,2))
#自由度を3,10,100,1000にし、グラフ作成するためのfor loop
for(df in c(3,10,100,1000)){
  #chi-squared分布に従う確率変数Yを100,000個ランダムにシミュレーションする
  y <- rchisq(100000, df, ncp = 0)
  #確率変数Zを計算しヒストグラムを作成する
  hist(zfunction(y, df), freq = FALSE, 
     col = "lightblue", breaks = 20, 
     xlab = expression((Y-n)/sqrt(2*n)),
     main = (paste("Histogram of Z when n =", df)))
  #標準正規密度関数で近似できることの確認
  curve(dnorm, add = TRUE, col = "red", lwd = 2)
}
#グラフより、自由度n が十分大きければ、標準正規分布で近似できることが分かる
#つまり自由度の大きさにつれて、近似の精度が高くなる。



