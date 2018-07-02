#성별 월급 차이는 연령대별로 다를까 ?

#분석 절차 

#1.변수 검토 및 전처리 
#연령대(파생 변수명:ageg)
#성별(변수명 : sex)
#월급(변수명: income)


#2.변수간 관계 분석 

#연령대 및 성별 월급 차이 


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
  mutate(age = (2015 - birth ) + 1)

welfare_copy <- welfare_copy %>% mutate(ageg = ifelse(age < 30 , 'young' , ifelse(age >= 30 & age <= 59 , 'middle' , ifelse(age >= 60 , 'old' , age)))) 




#종교유무에 따른 이혼율

#종교 data 확인 -> 전처리 

#자료형 확인
class(welfare_copy$religion)

#데이터 일부 확인
head(welfare_copy$religion)

#빈도표,이상치 확인
table(welfare_copy$religion)

#전처리 : 1
welfare_copy$religion <- ifelse(welfare_copy$religion == 1 , 'yes' , 'no')

#결혼 유무 
class(welfare_copy$marriage)
table(welfare_copy$marriage)

#변수 여부 - 이혼 여부 
welfare_copy$group_marriage <- ifelse(welfare_copy$marriage == 1 , 'marrage' , ifelse(welfare_copy$marriage == 3 , 'divorce'  , NA )) 

#빈도표 확인 
welfare_copy$group_marriage

table(welfare_copy$marriage)

qplot(welfare_copy$group_marriage)

#종교에 따른 이혼율 
religion_m <- welfare_copy %>% 
            filter(!is.na(group_marriage)) %>%  
            group_by(religion , group_marriage) %>% 
            summarise( n = n()) %>% 
            mutate(total = sum(n)) %>%  
            mutate(pct = n / total * 100) #백분율 


#데이터 확인 
religion_m

#종교 여부에 따른 이혼율 divorce
divorce = religion_m[ c(1,3 ), c('religion' , 'pct')]

#그래프 만들기 
ggplot(data  = divorce, aes(x = religion , y = pct)) + geom_col()
