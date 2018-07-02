
##지역별 연령대 비율 
##분석 절차 

 #1.변수 검토 및 전처리   
        #지역(region) 
        #연령대(ages)

 #2.변수 간 관계 분석
        # 지역별 연령대 비율표 만들기   
        # 그래프 만들기 





######노년층이 많은 지역은 어디 ? ######################

help("switch") 



 #welfare
    welfare_copy <- welfare_copy %>% mutate(welfare  = ifelse(code_region == 1 ,  '서울' ,ifelse(code_region == 2 ,  '수도권(인천/경기)' , ifelse(code_region == 3 ,  '부산/경남/울산' ,ifelse(code_region == 4 ,  '대구/경북' , ifelse(code_region == 5 ,  '대전/충남' , ifelse(code_region == 6 ,  '강원/충북' , ifelse(code_region == 7 ,  '광주/전남/전북/제주도' , NA))))))))



    #age
    welfare_copy <- welfare_copy %>% filter(!is.na(birth)) %>% 
      mutate(age = (2015 - birth ) + 1)
    
    
    #ageg    
    welfare_copy <- welfare_copy %>% mutate(ageg = ifelse(age < 30 , 'young' , ifelse(age >= 30 & age <= 59 , 'middle' , ifelse(age >= 60 , 'old' , age)))) 
    
     
    # 결측값 확인 
     table(welfare_copy$ageg)
     table(welfare_copy$welfare)
      
     
    #지역별  비율 
 welfare_copy %>% select(welfare,ageg) %>% 
                group_by(welfare) %>% summarise(n = n()) %>%  
  mutate( nT = (n / sum(n) * 100 ))

 
 #지역별  연령대 비율
 
 
 #그래프 그리기 
 
    
    
