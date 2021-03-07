#氏名：アネクワット　タナチャイ
#学籍番号：J4201037
#このRのコードは2020年度Aセメスター統計データ解析I課題2問題2の解答です

kikou <- read.csv("kikou2019.csv", fileEncoding = "sjis") # データの読み込み
x <- kikou$風速　# 風速のデータ
x_log <- log(x)　# 風速のデータの対数変換
mu <- mean(x_log)　# 風速のデータを対数変換した平均

# 風速のデータを対数変換したデータから不偏分散と分散の95%信頼区間の
# 上端・下端を計算する関数の作成
myest <- function(x = x_log, n=365, alpha = 0.05){
  s2 <- var(x) # 不偏分散
  ui <- (n-1) * s2/qchisq(alpha/2, df = n - 1) # 上側信頼限界
  li <- (n-1) * s2/qchisq(1-alpha/2, df = n - 1) # 下側信頼限界
  return(c(s2 = s2, ui = ui, li = li))
}
result <- myest()
ui <- result[2]
li <- result[3]
print(c(li,ui)) # 分散の95%信頼区間

##風速データの対数変換の分布に正規分布を当てはめてみる
par(mfrow=c(2,1))
#適当な方法としてdnormのパラメータを設定すること
hist(x_log, freq = FALSE, 
     col = "lightblue", breaks = 20, 
     xlab = expression("log(風速)"),
     ylab = expression("Density"),
     main = (paste("log(風速)")))
#正規分布の確率密度関数を上書きする
curve(dnorm(x, mean = mu, sd = sqrt(result[1]), log = FALSE), add = TRUE, col = "red", lwd = 2)
#凡例の作成
legend("topright",
       legend = c("log(風速)", "Normal Distribution"),
       col = c("lightblue","red"), lwd = 3, 
       cex=0.75)

##風速データの分布に対数正規分布を当てはめてみる
hist(x, freq = FALSE, 
     col = "lightgreen", breaks = 20, 
     xlab = expression("風速"),
     ylab = expression("Density"),
     main = (paste("風速")))
#対数正規分布の確率密度関数を上書きする
curve(dlnorm(x, meanlog = mu, sdlog = sqrt(result[1]), log = FALSE), add = TRUE, col = "red", lwd = 2)
#凡例の作成
legend("topright",
       legend = c("風速", "Log Normal Distribution"),
       col = c("lightgreen","red"), lwd = 3,
       cex=0.75)