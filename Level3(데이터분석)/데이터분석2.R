#####################################
library('foreign')
library('dplyr')
library('ggplot2')
library('readxl')
setwd('C:\\Users\\Administrator\\Desktop\\workspace\\R_data분석\\file')
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
##나이와 월급의 관계###############

class(welfare_copy$birth)

summary(welfare_copy$birth)

qplot(welfare_copy$birth)

table(is.na(welfare_copy$birth))

##결측치 , 이상치 없음 
##있다면 다음 작업을 실행 해야함 
#welfare_copy <- ifelse(welfare_copy$birth == 9999 , NA, welfare_copy$birth)
#table(is.na(welfare_copy$birth))


summary(welfare_copy$b)

#파생 변수를 이용해서 , 나이변수 추가 
#나이:2015 - 태어난 년도 + 1 
welfare_copy <- welfare_copy %>% filter(!is.na(birth)) %>% 
     mutate(age = (2015 - birth ) + 1)


table(welfare_copy$age)

summary(welfare_copy$age)

qplot(welfare_copy$age)

#나이별 월급 평균표 만들기 
#결측치 제외 

age_income <- welfare_copy %>% group_by(age) %>% 
                 filter(!is.na(income)) %>% 
                 summarise(mean_income = mean(income)) %>%  
                  select(age , mean_income)
#앞부분(상위)6개 데이터 확인 
head(age_income)

#그래프 만들기 
ggplot(data =age_income  , aes(x = age , y =  mean_income)) + geom_line()

View(age_income)

#어떤 연령대에서 월급을 가장 많이 받을까? 
#연령대 파생 변수 만들기 

welfare_copy <- welfare_copy %>% mutate(ageg = ifelse(age < 30 , 'young' , ifelse(age >= 30 & age <= 59 , 'middle' , ifelse(age >= 60 , 'old' , age)))) 

table(welfare_copy$ageg)

#그래프로 확인 
qplot(welfare_copy$ageg)

#연령에 따른 월급표 만들기 
ageg_income <- welfare_copy %>% filter(!is.na(income)) %>% 
                   group_by(ageg) %>% 
                  summarise(mean_income = mean(income)) 
#middle 282
#old 125
#young 164 

#확인
ageg_income

#그래프 만들기 
ggplot( data = ageg_income , aes(x = ageg  , y = mean_income)) + geom_bar(stat= 'identity') + scale_x_discrete(limits = c('young' , 'middle' , 'old'))







