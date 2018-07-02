#작성일:2018-06-27
#작성자:백 종 훈

library(readxl)
library(ggplot2)
library(plotly)
library(extrafont)
library(dplyr)
setwd('E:\\workspace\\R\\project_RLevel1\\Level4(데이터 시각화)\\file')
################변수명##############################
#cs : 테스트 데이터 프레임 
#



##################문제1-1 customers2.xlsx#############################

cs1 <- read_excel('customers2.xlsx')

#변수명 변경 
names(cs1) <- c('cust_name' , 'sex' ,'age' , 'location' , 'days_purchase' ,'recency' , 'num_books' , 'amt_books' , 'amt_non_book' , 'amt_total' , 'interest_genre'   , 'num_genre' , 'membership' , 'sms_option')

cs <- cs1
head(cs)
summary(cs)
class(cs)

fonttable()

names(cs)


#탐색적 데이터 분석이란 ? 
#1.데이터에 대한 질문을 찾는다.
#2.데이터에 대한 시각화 , 변환 , 모델링으로 답을 찾는다.
#3.답을 통해 질문을 심화하고, 새로운 질문을 찾는다.

##########################문제1-2###################### 
##############남,여 각각 sms 수신 동의 비율 산출########

#남자의 총 수 
cs %>% filter(sex == '남') %>%  summarise(n = n()) #14
#여자의 총 수
cs %>% filter(sex == '여') %>%  summarise(n = n()) #06

#남자
man <- cs  %>% filter(!is.na(sms_option)) %>% filter(sex == '남') %>% 
        group_by(sex) %>% summarise( n=  n() /14  * 100 )

#여자
girl <- cs  %>% filter(!is.na(sms_option)) %>%  filter(sex == '여') %>% 
  group_by(sex) %>% summarise( n=  n() /06  * 100  )

##위아래로 테이블 합치기 
sms_fur <- bind_rows(man , girl)
sms_fur
#sex       n
#<chr> <dbl>
#1 남     71.4
#2 여     83.3
#############성별이 남이면서 가입기간간이 가장 오래된 사람의 이름 , 성별,가입기간 추출#############

test <- cs %>% filter(sex == '남') %>% 
  select(cust_name , sex , membership) %>% arrange(desc(membership))

top1 <- head(test , n = 1)
top1

#############문제 3-1####################
############custlist Create##############
custlist <- data.frame( prchs = c(3,2,7,1) , location = c('seoul','busan', 'inchon', NA ) , years = c(3,2,1,5) , name = c('jon' , 'may' , 'kim', 'park'))

custlist
############custlist update##############
custlist2 <- data.frame( prchs = c(4,4) , location = c('busan' ,'LA') , years = c(2,2) , name = c( 'yoon' ,'yoon'))

custlist<-bind_rows(custlist , custlist2)
custlist

###########point columne crate###########
custlist$point <- c(32,21,11,33,0,0)
custlist

##########location nat NA################
notLocation1 <- custlist$location[is.na(custlist$location)==F]

notLocation <- custlist  %>% filter(!is.na(location)) %>%
  select(location)

notLocation #dataFrame~~
notLocation1 #vector 

#########create age columne##############
custlist$age <-c(23,27,23,27,23,27)


##########variable update ###############
names(custlist) <- c('prchs' , 'location' , 'years' , 'lastname' , 'point' ,'age' )
colnames(custlist)
##########Fistname coulmene Create#######
custlist$frstname <- c('tim' , 'ma' , 'mo' ,'ne' , 'sh', 'ih')

##########First Last Join################

#forstme 과 fullname 변수 추가 

#문자열 연결하기

temp = c()

for (i in 1:6){
  temp[i] =  paste(custlist['frstname'][i,]  , custlist['lastname'][i,])
}

custlist$fullname <- c(temp)

#####외국인 노동자 증가################### 
#####외국인 결혼##########################
#####전체 인구대비 외국인 비율############

