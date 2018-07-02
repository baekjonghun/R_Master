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
setwd('F:\\workspace\\R\\project_RLevel1\\Level3(데이터분석)\\file')
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


#age
welfare_copy <- welfare_copy %>% filter(!is.na(birth)) %>% 
  mutate(age = (2015 - birth ) + 1)
########################################################################################

#ageg
welfare_copy <- welfare_copy %>% mutate(ageg = ifelse(age < 30 , 'young' , ifelse(age >= 30 & age <= 59 , 'middle' , ifelse(age >= 60 , 'old' , age)))) 

#sex
welfare_copy$sex <- ifelse(welfare_copy$sex == '1' , 'male' , 'female')
table(welfare_copy$sex)
########################################################################################

#연령대 및 성별 월급 평균

sex_income <- welfare_copy %>% filter(!is.na(income)) %>% 
                 group_by(ageg  ,sex) %>% 
                 summarise(mean_income = mean(income))

sex_income

##그래프 만들기 #fill = 누적
posiotions = c('young' , 'middle' ,'old')

ggplot(data =sex_income , aes(x = ageg , y = mean_income , fill = sex)) + 
   geom_col() + scale_x_discrete(limits = posiotions)
  
##그래프에서 성별 맏대 분리 
ggplot(data =sex_income , aes(x = ageg , y = mean_income , fill = sex)) + 
  geom_col(position = 'dodge') + scale_x_discrete(limits = posiotions)

##그래프에서 성별 맏대 분리
# [그래프 분석]
# • 성별에 따른 월급 차이는 연령대 별로 다름을 알 수 있음
# • 초년에는 차이가 크지 않다가 중년에 크게 벌어져서 남성이 여성에 비해 166만원 가
# 량 많이 받는 것으로 나타났음
# • 노년의 성별 월급 차이는 중년에 비해 차이가 줄었지만, 여전히 남성의 월급이 92만
# 원 가량 많은 것으로 나타났음
# • 남성의 경우 초년과 노년의 월급 차이는 크지 않음을 알 수 있음
# • 하지만 여성의 경우 노년이 초년 보다 적은 월급을 받음(차이가 있음)을 알 수 있음



age_income <- welfare_copy %>% filter(!is.na(income)) %>% 
  group_by(age  ,sex) %>% 
  summarise(mean_income = mean(income))


age_income

index1 =  c('male' , 'female')
 ggplot(data = age_income ,aes(x=age , y = mean_income , fill = sex)) + geom_line( aes(color = sex)) 
 # [그래프 분석]
 # • 남성 월급은 50세 전후까지 지속적으로 증가하다가
 # 급격히 감소
 # • 여성 월급은 30세 전후까지 상승하다가 그 이후로
 # 지속적으로 완만하게 감소
 # • 성별 월급은 30세부터 지속적으로 벌어져 50대 초반
 # 에 가장 크게 벌어지고 이후 점차 줄어들어 70대 후
 # 반이 되면 비슷한 수준이 됨을 알 수 있음
