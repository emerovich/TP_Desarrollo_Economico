library(tidyverse)
library(gridExtra)

setwd("D:/Dropbox (MPD)/Eze Merovich")
datos_desarrollo <- read_csv("datos_wolrd_bank.csv")

datos_2017 <- datos_desarrollo[,c(1,2,3,4,62)]
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CBRT.IN'), Birth_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CDRT.IN'), Death_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'NY.GDP.PCAP.CD'), GDP_Per_Capita = `2017`)

datos_2017 <- cbind(rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CBRT.IN'), Tasa_de_Natalidad = `2017`),rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CDRT.IN'), Tasa_de_Mortalidad = `2017`)[,5],rename(filter(datos_2017, Indicator_Code == 'NY.GDP.PCAP.CD'), PBI_per_Capita = `2017`)[,5])

datos_2017$Color <- 'royalblue4'
  #ifelse(datos_2017$Country_Name == c('Japan','Italy','Spain','Portugal','Germany','Finland','Bulgaria','Greece','Sweden','Latvia','Croatia'), 'blue', 'red')

for(i in 1:nrow(datos_2017)){
  if(datos_2017[i,1] %in% c('Japan','Italy','Spain','Portugal','Germany','Finland','Bulgaria','Greece','Sweden','Latvia','Croatia','France','Denmark','Estonia','Malta','Austria','Slovenia','Czech Republic','Lithuania','Nehterlands','Hungary','Belgium','United Kingdom','Switzerland','Romania')){
    datos_2017[i,8] <- 'red'
  } else{
    
  }
}

grafico_2017 <- ggplot(datos_2017)+
  geom_point(mapping = aes(x=Tasa_de_Natalidad, y=Tasa_de_Mortalidad, size=PBI_per_Capita, color = Color))+
  ggtitle('2017')


#1960

datos_1960 <- datos_desarrollo[,c(1,2,3,4,5)]
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CBRT.IN'), Birth_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CDRT.IN'), Death_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'NY.GDP.PCAP.CD'), GDP_Per_Capita = `2017`)

datos_1960 <- cbind(rename(filter(datos_1960, Indicator_Code == 'SP.DYN.CBRT.IN'), Tasa_de_Natalidad = `1960`),rename(filter(datos_1960, Indicator_Code == 'SP.DYN.CDRT.IN'), Tasa_de_Mortalidad = `1960`)[,5],rename(filter(datos_1960, Indicator_Code == 'NY.GDP.PCAP.CD'), PBI_per_Capita = `1960`)[,5])

#datos_1960$Color <- 'royalblue4'
#ifelse(datos_2017$Country_Name == c('Japan','Italy','Spain','Portugal','Germany','Finland','Bulgaria','Greece','Sweden','Latvia','Croatia'), 'blue', 'red')

grafico_1960 <- ggplot(datos_1960)+
  geom_point(mapping = aes(x=Tasa_de_Natalidad, y=Tasa_de_Mortalidad, size=PBI_per_Capita))+
  ggtitle('1960')



#1980

datos_1980 <- datos_desarrollo[,c(1,2,3,4,25)]
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CBRT.IN'), Birth_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CDRT.IN'), Death_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'NY.GDP.PCAP.CD'), GDP_Per_Capita = `2017`)

datos_1980 <- cbind(rename(filter(datos_1980, Indicator_Code == 'SP.DYN.CBRT.IN'), Tasa_de_Natalidad = `1980`),rename(filter(datos_1980, Indicator_Code == 'SP.DYN.CDRT.IN'), Tasa_de_Mortalidad = `1980`)[,5],rename(filter(datos_1980, Indicator_Code == 'NY.GDP.PCAP.CD'), PBI_per_Capita = `1980`)[,5])

#datos_1980$Color <- 'royalblue4'
#ifelse(datos_2017$Country_Name == c('Japan','Italy','Spain','Portugal','Germany','Finland','Bulgaria','Greece','Sweden','Latvia','Croatia'), 'blue', 'red')

grafico_1980 <- ggplot(datos_1980)+
  geom_point(mapping = aes(x=Tasa_de_Natalidad, y=Tasa_de_Mortalidad, size=PBI_per_Capita))+
  ggtitle('1980')


#2000

datos_2000 <- datos_desarrollo[,c(1,2,3,4,45)]
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CBRT.IN'), Birth_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'SP.DYN.CDRT.IN'), Death_Rate = `2017`)
#rename(filter(datos_2017, Indicator_Code == 'NY.GDP.PCAP.CD'), GDP_Per_Capita = `2017`)

datos_2000 <- cbind(rename(filter(datos_2000, Indicator_Code == 'SP.DYN.CBRT.IN'), Tasa_de_Natalidad = `2000`),rename(filter(datos_2000, Indicator_Code == 'SP.DYN.CDRT.IN'), Tasa_de_Mortalidad = `2000`)[,5],rename(filter(datos_2000, Indicator_Code == 'NY.GDP.PCAP.CD'), PBI_per_Capita = `2000`)[,5])

#datos_2000$Color <- 'royalblue4'
#ifelse(datos_2017$Country_Name == c('Japan','Italy','Spain','Portugal','Germany','Finland','Bulgaria','Greece','Sweden','Latvia','Croatia'), 'blue', 'red')

grafico_2000 <- ggplot(datos_2000)+
  geom_point(mapping = aes(x=Tasa_de_Natalidad, y=Tasa_de_Mortalidad, size=PBI_per_Capita))+
  ggtitle('2000')

grid.arrange(grafico_1960, grafico_1980, grafico_2000, grafico_2017, ncol=2)
