
library(ggplot2)
library(dplyr)



#문제1‘전체 인구 대비 미성년 인구 백분율 변수‘를 추가
#      하여 county(지역), 미성년 인구 백분율 출력
#-------- 백분율 구하는 공식 -------------------------------
#
#자기자신의 합계의 백분율 이다 .
##round(prop.table(table(sub_midwest$child)) * 100 ,digits = 1)

#전체 수 구하기 씨티별 전체 평균이므로 해당 사항 없음..
#child_max <- sum(sub_midwest$poptotal)




-------------------------------------------------------------

#미성년 인구 구하기 , 임시 데이터 프레임 추가

  sub_midwest <- midwest %>% mutate(child = poptotal - popadults)
  

#미성년 인구 확인 
  
  sub_midwest %>% select(county , child)



#미성년 백분율 구하기
  sub_midwest <- sub_midwest %>% mutate(ratio_child = (child / poptotal) * 100)
sub_midwest['ratio_child']

#country , ratio_child 출력
sub_midwest %>% select(county , ratio_child)


##문제2county(지역)에서 미성년 인구 백분율이 가장 높
#은 상위 5개의 county, 미성년 인구 백분율 출력

sub_midwest <- sub_midwest %>% select(county , ratio_child) %>% 
  arrange(desc(ratio_child)) 

head(sub_midwest ,n = 5)
                
#[문제3] 미완성 
#아래의 분류표에 따라 미성년 비율 등급 변수를
#추가하고, 각 등급에 몇 개의 지역이 있는지 출력
#(table함수 사용)


#large = 40% 이상
#middle = 30 ~ 40 % 미만
#small = 30% 미만

large <- sub_midwest %>%  filter(ratio_child >= 40)

middle <- sub_midwest %>%  filter(ratio_child >= 30 & ratio_child < 40)

small <- sub_midwest %>%  filter(ratio_child < 30)


middle %>%  summarise(n())

small %>% summarise(n())


table(large$county , dnn = 'dsds' , )


#result 
#large   middle   small
#   32      396       9


