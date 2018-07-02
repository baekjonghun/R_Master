library('ggplot2')
library('plotly')



setwd('F:\\workspace\\R\\RLevel1\\Level4(데이터 시각화)\\file')

getwd()
dir()

df <- read.csv( 'df.csv')
df_sub <- df

df_sub

#히스토 그램 값을 세준다./도수 부포표 : 데이터 의 개수 
ggplot(df_sub, aes(x = team)) + geom_bar(fill = 'dark blue')

#데이터 값을 그대로 사용 : 
ggplot(df_sub , aes(team , kda)) + geom_bar(stat = 'identity')

#누적 막대 그래프 그리기 
pa
install.packages('reshape')
library(reshape)

df2 <- melt(df , id.vars = 'team')
names(df)
str(df2)


df2
bar<-ggplot(df2, aes(x=team, y=value, fill=variable))
bar+geom_bar(stat="identity" )


##묶은 세로 막대형 그래프 그리기 
bar<-ggplot(df2 , aes(x = team , y = value , fill = variable)) + geom_bar(stat  = 'identity' , position = 'dodge')
bar


year <- c('1998','1998','1999','1999')

sum1 <- c(34 , 31 , 23 , 43)
type <- c( 0, 1,0,1 )


data.frame(year = year , sum1 = sum1  ,type = type)





# year  total  arrest
# 1998  17    15
# 1999  16    15
# 2000  17    15

#원본데이터 
test1 <- data.frame(year = c(1998,1999,2000) , total = c(17,16,17) , arrest = c(15,15,15))

#새롭게 만들기 
test2 <- data.frame(year  = c(test1$year , test1$year ) , type =  c(test1$total , test1$arrest) , col = c(0,0,0,1,1,1)  )

test2
