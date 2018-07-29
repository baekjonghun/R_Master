
setwd('E:\\R_텍스트 마이닝\\1.텍스트마이닝_일반 분석\\공동구매사항요청분석_인기아이템')
dir()
###작성자:백  종  훈
###작성일:2018-07-04
###내  용:텍스트 마이닝 데이터분석 인기아이템 추출 

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

#한글 명사 설정 
useSejongDic()

data1 <- readLines('yeca_1.txt')

data <- sapply(data1 , extractNoun , USE.NAMES = F)
data_unlist <- unlist(data)

table(data_unlist)


###########전 처리 과정 ########################################

data_list <- Filter(function(x) {nchar(x) >= 2} ,data_unlist)

#################################################


data_list <- gsub('[A-Z]' , ''  ,data_list)
data_list <- gsub('[a-z]' , ''  ,data_list)


data_list <- gsub('[ㄱ-ㅎ]' , ''  ,data_list)
data_list <- gsub('(ㅜ|ㅠ)' , '' , data_list)

data_list <- gsub('\\d+' , '' , data_list) #숫자 제거 
data_list<- gsub('[~!@#$%&*\\.^,()_+=?<->.//]/[|]','',data_list)
data_list<- gsub('\\.','',data_list)

#################################################
###################공백제거######################
data_list <- gsub(pattern = '[ ]{2,}|[ ]+$', replacement = "", data_list)
data_list <- gsub(pattern = '[ ]{3,}|[ ]+$', replacement = "", data_list)

#######update####################################
#################################################
data_list <- gsub('공구해주세요' , '공구'  ,data_list)
data_list <- gsub('공구해주세' , '공구'  ,data_list)
data_list <- gsub('재공구' , '공구'  ,data_list)
data_list <- gsub('공구원해요' , '공구'  ,data_list)
data_list <- gsub('공구원해요~~' , '공구'  ,data_list)
data_list <- gsub('공구\\^\\^' , '공구'  ,data_list)
data_list <- gsub('공구!!' , '공구'  ,data_list)
data_list <- gsub('공구~~' , '공구'  ,data_list)
data_list <- gsub('휘슬러\\s\\"꾹\\~\\"짜는' , '휘슬러'  ,data_list)

#################################################


######delete#####################################
#################################################
data_list <- gsub('\\\\' , ''  ,data_list)
data_list <- gsub('부탁' , ''  ,data_list)
data_list <- gsub('단시' , ''  ,data_list)
data_list <- gsub('리퀍' , ''  ,data_list)
data_list <- gsub('세트' , ''  ,data_list)
data_list <- gsub('에어' , ''  ,data_list)
data_list <- gsub('온수' , ''  ,data_list)
data_list <- gsub('프라이' , ''  ,data_list)
data_list <- gsub('가죽' , ''  ,data_list)
data_list <- gsub('소이' , ''  ,data_list)
data_list <- gsub('언제' , ''  ,data_list)
data_list <- gsub('영어' , ''  ,data_list)
data_list <- gsub('원해' , ''  ,data_list)
data_list <- gsub('이요' , ''  ,data_list)
data_list <- gsub('진공포장' , ''  ,data_list)
data_list <- gsub('캠프' , ''  ,data_list)
data_list <- gsub('공동구매' ,  '' , data_list)
#################################################



wordcount <- table(data_list)

wordcount_top <- head(sort(wordcount , decreasing = T) , 22)

wordcount_top


data_unlist <- gsub('\\')

display.brewer.all()
color <- brewer.pal(12, "Set3")
##########################################################################################

#색설정
display.brewer.all()
color <- brewer.pal(12, "Set3")


#폰트 설정 
windowsFonts(font=windowsFont("a한글사랑L"))

wordcloud(names(wordcount_top), wordcount_top, scale=c(5,0.5),random.order = FALSE, random.color = TRUE, colors = color, family = "font")


#########################################################################################