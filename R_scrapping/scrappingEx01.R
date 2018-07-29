#작성일:2018-07-12
#작성자:백  종  훈 


#보배드림 
library(httr)


r <- GET('http://www.bobaedream.co.kr/list?code=best&s_cate=&maker_no=&model_no=&or_gu=10&or_se=desc&s_selday=&pagescale=30&info3=&noticeShow=&s_select=&s_key=&level_no=&bestCode=&bestDays=&bestbbs=&vdate=&type=list&page=10')
  

#상태 정보  추출
http_status(r)

#해더 
headers(r)

#server 정보 추출
headers(r)$server

###########################본문정보 추출#############################
content(r ,'raw')
content(r ,'text')
content(r , 'parse' , type = 'application/json')
   

###########################추출및 시각화#############################

library(rvest)
library(dplyr)
library(httr)
library(rvest)
Sys.setlocale('LC_ALL' , 'English')

url <- 'https://ko.wikipedia.org/wiki/대한민국_제20대_국회의원_선거'

poll <- url %>%  
        read_html() %>%  
        html_nodes(xpath = '//*[@id="mw-content-text"]/table[4]') %>% 
        html_table(fill =TRUE) %>% 
        .[[1]]


poll
