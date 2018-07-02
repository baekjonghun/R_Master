install.packages('plotly')

#package load

library('plotly')
library('ggplot2')

#데이터
g1 <- ggplot(data = mpg ,   aes(x = displ   , y = hwy , col = drv))+ geom_point()


#인터렉티브 그래프 맘들기 
ggplotly(g1)
###################################################################################
###########  데이터 확인 ##########################################################
###################################################################################

?diamonds

# 그래프 만들기 


g2 <- ggplot(data = diamonds , aes(x = cut  , fill = clarity)) +  geom_bar(position = 'dodge')

ggplotly(g2)

####################################################################################
install.packages('dygraphs')


library('dygraphs')
library('xts')

?economics

#데이터 복사 

e <- economics
e


#시계열 객체 
?xts

#그래프 만들기 
eco <- xts(e$unemploy , order.by = e$date)
typeof(eco)

dygraph(eco) %>%  dyRangeSelector()

#여러 값 표현 
#저축률 
eco_p <- xts(e$psavert , order.by = e$date)

#실업자수 
eco_u <- xts(e$unemploy/1000 , order.by = e$date)

#저축률+실업자 - > 합치기 
e_bind <- cbind(eco_p ,eco_u)

head(e_bind)

colnames(e_bind) <- c('psavert'  , 'unemploy')

dygraph(e_bind) %>% dyRangeSelector() 

ggplot(ggplot)


