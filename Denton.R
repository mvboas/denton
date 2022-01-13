#Rotina para calcular denton
#Feito por: Marcelo Vilas Boas de Castro
#última atualização: 10/11/2020

#Definindo diretórios a serem utilizados
getwd()
setwd("C:/Users/User/Documents")

#Instalando e ativando pacote necessário
#install.packages("tempdisagg")
library(tempdisagg)
library(rio)


#Importando séries

#SÃ©rie trimestral sem ajuste
baseT = read.csv2("Serie trimestral.csv", header=T)
tstri<-ts(baseT, start = c(1995, 1), end = c(2008, 4), frequency = 4)

#Série anual
baseA = read.csv2("Serie anual.csv", header=T)
tsanu<-ts(baseA, start = 1995, end = 2008, frequency = 1)

#Aplicando Denton
Denton <- td(tsanu ~ 0 + tstri, conversion="average", to = "quarterly", method = "denton", h="2")
baseD = ts(Denton$values, start = c(1995, 1), end = c(2008, 4), frequency = 4)

#Exportando arquivo
write.csv2(baseD, "Serie trimestral ajustada por Denton.csv")
export(baseD, "Serie trimestral ajustada por Denton.xlsx")