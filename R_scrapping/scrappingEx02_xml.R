#작성일 2018-07-12
#작성자 백  종  훈 
#버스 실시간 위치 
#버스 노선 정보 
install.packages('RCurl')
library('XML')
library('methods')
library(RCurl)
library(ggmap)
library(stringr)

dir()
# 
# data <-xmlPaser(file = '')

setwd('E:\\workspace\\R\\R_scrapping\\')
datahere <- c('E:\\workspace\\R\\R_scrapping\\')

url <- 'http://ws.bus.go.kr/api/rest/buspos/getBusPosByRouteSt?ServiceKey=yE4ZSLLTfR%2Bx5PySYfESZoQ8%2BLh53Hbztn7YwCLqGXhWJZRduNrOtSmk57XjSSA%2FVzX%2FG6CmbH58%2BsLIXLlNkA%3D%3D&busRouteId=100100118&startOrd=1&endOrd=13'

download.file(url , paste(datahere , 'busInfo.xml' , sep=''))
dir()

doc <- xmlTreeParse('busInfo.xml' , getDTD = F)
r <- xmlRoot(doc)
r

#######속성 확인##########
xmlName(r)
xmlSize(r)
xmlAttrs(r)


oneplant <- r[[3]]



class(oneplant)



as.double(posX)

as.integer() 

   

seoulKrLocation <- c(125.04 , 33.06 , 131.52,38.27)


y <- 37.496379
x <- 127.035768
dc = data.frame( x = x, y = y) 

dc

# -- 지도 위에 markers 적용
map <- get_googlemap(center = 'seoul' , scale = 1, maptype = 'roadmap' , zoom = 12, maker = dc)


ggmap(map , extent = 'device')
