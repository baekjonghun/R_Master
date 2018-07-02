#theUrl <- http://jaredlander.com/data/TomatoFirst.csv

#tomato <- read.table(file= theUrl , header= TRUE , seq = ',') 


list.files()
txt4 <- read.csv('fruit_info.csv')

#팩터는 데이터를 정수형태로 관리한다.
txt4$fruito

#데이터 유실 .... header  = F 를 명시한다. 
txt6 <- read.csv('fruit_info_nolabel.csv' , header = T , col.names = c('ho' ,'fruit' ,'price'))
names(txt6) <- c('ho' , 'fruit' , 'price')
txt6
#컬럼명 설정 방법1
txt6 <- read.csv()


id <- c(11)
class <- c(3)
math <- c(50)
english <- c(50)
grade <- c('D')


test <- data.frame(id,class,math , english , grade)
###################
quiz_csv <- read.csv('quiz_csv.csv')
quiz_csv <- rbind(quiz_csv, test)
quiz_csv


#csv 파일로 저장 
write.csv(quiz_csv , '')


