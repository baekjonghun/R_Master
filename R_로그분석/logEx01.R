library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useSejongDic()

#연령 별 창업 관련 데이터 분석

setwd('E:\\workspace\\R\\R_텍스트 마이닝\\1.텍스트마이닝_일반 분석\\연령별 창업점유율')
dir()
##########20 대 창업 추천#################################
log_20 <- readLines('job_20.txt')

summary(log_20)
head(log_20 , n = 30)

log_20 <- sapply(log_20 , extractNoun  , USE.NAMES = F)

log_20_unlist <- unlist(log_20)

###############한글자 만 출력하기 ####################
log_20_list <- Filter(function(x){nchar(x) >= 2} , log_20_unlist)

log_20_list

################ 전처리#############
log_20_list<- gsub('[~!@#$%&*,\'(\`)_+=?<->.//]/[|]','',log_20_list)
log_20_list <- gsub(pattern = '[ ]{2,}|[ ]+$', replacement = "", log_20_list)
log_20_list <- gsub(pattern = '\'', replacement = "", log_20_list)
log_20_list <- gsub('[A-Z]' , ''  ,log_20_list)
log_20_list <- gsub('[a-z]' , ''  ,log_20_list)
log_20_list <- gsub('[ㄱ-ㅎ]' , ''  ,log_20_list)
log_20_list <- gsub('^' , ''  ,log_20_list)

log_20_list
