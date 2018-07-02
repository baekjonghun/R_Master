install.packages('readxl')


#설치된 package 로드 
library(readxl)

#excel 파일의 데이터 읽어오기 

list.files()


df_exam <- read_excel('exam.xlsx' , col_names =  T , sheet = 1 )
df_copy <- df_exam  #복사 를 한다. 

mean(df_exam$math)

max(df_copy$math)
min(df_copy$price)

str(df_exam)
#요약

summary(df_exam)

names(df_exam)

#dim
dim(df_exam)

head(df_exam , 3)
tail(df_exam , 3)

