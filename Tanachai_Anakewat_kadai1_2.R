#氏名：アネクワット　タナチャイ
#学籍番号：J4201037
#このRのコードは第1回レポート課題の問題２の解答です

#投票箱から投票用紙を一枚ずつランダムに取り出すとき
#取り出された投票用紙の順番をランダムする関数を作成する
#つまり、得票数の推移を再現するシミュレーターを作成する
#Aの総得票数は m 票, B の総得票数は n 票であったとする
#１はAの投票用紙、-1 はBの投票用紙を表すとする
pickorder <- function(m,n){
  allcard <- rep.int(1,m)
  allcard <- append(allcard, rep.int(-1,n))
  simulator <- sample(allcard, m+n)
#ランダムした投票用紙の順番を返却
  return(simulator)
}

#開票作業中常にAの得票数がBの得票数を上回っているかを調べる関数
#そうであれば1をそうでなければ０を返す関数を作成する
mycount <- function(c){
#sumの引数をAの得票数とBの得票数の差（A-B）とする
  sum<-0
  for( i in c){
    sum <- sum + i
    if (sum<=0){
#sumが0以下の時は、Aの得票数がBの得票数をもう上回っていないことを示すので、
#0を返却（失敗）
      return(0)
      break
    }
  }
#sumは０より大きい値を保てれば、開票作業中常にAの得票数がBの得票数を
#上回っているということなので、１を返却（成功）
  return(1)
}


#ｘをシムレーションをする回数とする
#ｘ回のうち開票作業中常にそれまでの A の得票数が B の得票数を
#上回っていたケースの割合を計算する関数を作成する
simulation <- function(m, n, x){
#countを成功する回数とする
  count <- 0
  for(i in 1:x){
    count <- count + mycount(pickorder(m,n))
  }
#確率を返す
  return(count/x)
}
#シムレーターを10000回実行する
simulation(60,40,10000)

