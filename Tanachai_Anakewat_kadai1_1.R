#氏名：アネクワット　タナチャイ
#学籍番号：J4201037
#このRのコードは第1回レポート課題の問題１の解答です

#関数tanh(x)を作成する
tanh <- function(x){
  out <- (exp(x)-exp(-x))/(exp(x)+exp(-x))
  return(out)
}

#方程式tanh(x)+0.2x+0.3を作成する
equation <-function(x){
  out <- tanh(x)+0.2*x+0.3
  return(out)
}

#セカント法で関数の近似解を求める関数を作成する
secant <- function(f, x0, x1, epsilon){
  xn <-x1　#xnを定義する
  xm <- x0　#xmの引数としてxn-1を定義する
  #while文を使って｜xn-xn-1|<εという条件を作成する
  while(abs(xn-xm)>=epsilon){　
    t <- xn-((xn-xm)*f(xn)/(f(xn)-f(xm)))
    xm <- xn　#新しいxn-1を定義する
    xn <- t　#新しいxnを定義する
  }
  #最新のxnを計算結果として外に返却
  return(xn)
}

#方程式の解を求める
secant(equation, 1.3, 1.1, 10^(-8))


