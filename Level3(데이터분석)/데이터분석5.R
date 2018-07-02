
#############################################################################################
library('foreign')
library('dplyr')
library('ggplot2')
library('readxl')
setwd('E:\\workspace\\R\\project_RLevel1\\Level3(데이터분석)\\file')
getwd()
dir()

welfare <- read.spss(file = 'Koweps.sav'  , to.data.frame = T) 

class(welfare)
welfare_copy <- welfare

dim(welfare_copy)
str(welfare_copy)
summary(welfare_copy)
head(welfare_copy)
tail(welfare_copy)
View(welfare_copy)


welfare_copy <- rename(welfare_copy , 
                       sex = h10_g3, #성별
                       birth = h10_g4, #태어난 연도 
                       marriage = h10_g10, #혼인 상태
                       religion = h10_g11, #종교 
                       income = p1002_8aq1,#월급
                       code_job = h10_eco9, #직종 코드
                       code_region = h10_reg7) #지역 코드



welfare_copy <- welfare_copy %>% filter(!is.na(birth)) %>% 
  mutate(age = (2015 - welfare_copy$birth ) + 1)



############################################################################################

#직업별 월급 차이 

#1.변수 검토및 전처리 
#code_job 
#income


#2.변수간 관계 분석 
#직업별 월급 평균표 만들기 
#그래프 만들기 

############################################################
##직업별 월급 차이 

class(welfare_copy$code_job)

table(welfare_copy$code_job)

qplot(welfare_copy$code_job)

#전처리 

list_job <- read_excel('koweps_codebook.xlsx' , sheet = 2 , col_names = T)

list_job
head(list_job)
dim(list_job)


welfare_copy <- left_join(welfare_copy, list_job , by = 'code_job')
  
  
welfare_copy %>% filter(!is.na(code_job)) %>% 
                   group_by(code_job) %>% 
                   select(code_job , job)
  
  head(welfare_copy , n = 10)

  
welfare_copy %>% filter(!is.na(code_job)) %>% 
    group_by(code_job) %>% 
    select(job , job)
  
  

# 직업별 월급 차이 분석 
test <- welfare_copy  %>% filter(!is.na(job)) %>% filter(!is.na(income)) %>% 
                group_by(job) %>%
      summarise(mean_income =  mean(income)) %>%  
      select(mean_income , job)

##상위 10
topMean<- test %>% arrange(desc(mean_income)) %>%  
        select( job , mean_income)

top10 <- head(topMean , n = 10)

top10


###그래프 그리기  

p <- ggplot(data =top10 ,aes( x = reorder(job , mean_income) , y = mean_income) ) + geom_col() + coord_flip() 


p + theme(axis.title.x = element_text(angle=0, face="italic", size=14)) 
  + theme(axis.title.y = element_text(angle=0, face="italic", size=14)) 



#########그래프분석 

#to10 중에서 1위는 금속 공학 기술자가 차지 하였고 
#2위부터는 의료전문 전문가 단체 임원 이 차지하였다.
#상위랭크는 여러 직업군의 관리자가 많고 그밖에는 금형업계 관련 기술자 들이다.   
#주로 관리자나  금형,석유 관련 전문 기술자들인것을 알수 가 있습니다.

########################################################################

bottom10 <- tail(topMean , n = 10)


###그래프 그리기  

ggplot(data =bottom10 ,aes( x = reorder(job , -mean_income) , y = mean_income) )  + geom_col() + coord_flip() + ylim(0,850)




