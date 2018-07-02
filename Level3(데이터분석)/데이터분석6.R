#성별에 따라 어떤 직업이 많은지 분석 

#성별 (male ,female)
#직업 (job)

#변수 간 관계 분석 
  #1.성별 직업 빈도표 만들기 
  #2.그래프 만들기 



welfare_copy$sex <- ifelse(welfare_copy$sex == 1 ,'male' , 'female')

########남성 의 직업 빈도 상위 10개 출력#########################
job_male <- welfare_copy %>% group_by(job) %>% 
                 filter(!is.na('job') & job != 'NA')  %>% 
                 filter(sex == 'male')  %>% 
                 select(job , sex)  %>% 
                summarise(n =  n()) %>% 
                 arrange(desc(n))

job_male <- head(job_male , n = 10)                

job_male  

#######여성 의 직업 빈도 상위 10개 출력###########################
job_female <- welfare_copy %>% group_by(job) %>% 
  filter(!is.na('job') & job != 'NA')  %>% 
  filter(sex == 'female')  %>% 
  select(job , sex)  %>% 
  summarise(n =  n()) %>% 
  arrange(desc(n))

job_female <- head(job_female , n = 10)                

job_female

################################################################
#그래프 생성####################################################
################################################################

#남성 상위 10개 출력 
ggplot(data = job_male ,  aes(x = reorder(job_male$job , job_male$n) , y = job_male$n )) +  geom_col() +  coord_flip()


#여성 상위 10개 출력 
ggplot(data = job_female ,  aes(x = reorder(job_female$job , job_female$n) , y = job_female$n )) +  geom_col() +  coord_flip()












