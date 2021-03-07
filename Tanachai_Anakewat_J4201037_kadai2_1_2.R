#氏名：アネクワット　タナチャイ
#学籍番号：J4201037
#このRのコードは2020年度Aセメスター統計データ解析I課題2問題1.(ii)の解答です

set.seed(111) # 乱数の初期値の設定
#確率変数Yと自由度nを引数とし、確率変数Zwhを計算する関数を作成
zwhfunction <- function(y, n){
  result <- ((y/n)^(1/3)-(1-2/(9*n)))/sqrt(2/(9*n))
  return(result)
}

##確率変数Zwhを100000こシミュレーションしてヒストグラムを作成し、
##標準正規密度関数を重ね書きしてみる
#グラフを1つの描画領域2*2分割し作成るため
par(mfrow=c(2,2))
#自由度を3,10,100,1000にし、グラフ作成するためのfor loop
for(df in c(3,10,100,1000)){
  #chi-squared分布に従う確率変数Yを100,000個ランダムにシミュレーションする
  y <- rchisq(100000, df, ncp = 0)
  #確率変数Zwhを計算しヒストグラムを作成する
  hist(zwhfunction(y, df), freq = FALSE, 
       col = "lightblue", breaks = 20, 
       xlab = expression(((Y/n)^(1/3)-(1-2/(9*n)))/sqrt(2/(9*n))),
       ylim =c(0,0.45),
       main = (paste("Histogram of Zwh when n =", df)))
  #標準正規密度関数で近似できることの確認
  curve(dnorm, add = TRUE, col = "red", lwd = 2)
}

#グラフより、Wilson-Hilferty変換すると自由度n が十分大きくなくても、
#標準正規分布で変換する前より精度の高い近似ができることが分かる



