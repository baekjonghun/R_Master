library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useSejongDic()

setwd('C:\\Users\\Administrator.Sc-201801171515\\Desktop\\bgh_Speech_cloude')

dir()

data1 <- readLines('bgh_sheech.txt')

data <- sapply(data1  , extractNoun , USE.NAMES = F)

data_unlist <- unlist(data)



#################문자처리 ################################
##############char update delte#############################
#delete 
data_unlist <- gsub('하기' , ''  ,data_list)
data_unlist <- gsub('제공' , ''  ,data_list)
data_unlist <- gsub('하게' , ''  ,data_list)
data_unlist <- gsub('해서' , ''  ,data_list)
data_unlist <- gsub('있도' , ''  ,data_list)
data_unlist <- gsub("\'경제혁신" , ''  ,data_list)
data_unlist <- gsub('번째' , ''  ,data_list)
data_unlist <- gsub('이번' , ''  ,data_list)
data_unlist <- gsub('것들이' , ''  ,data_list)
data_unlist <- gsub('그것' , ''  ,data_list)
data_unlist <- gsub('그동안' , ''  ,data_list)


#update 
data_unlist <- gsub('북한이' , '북한'  ,data_list)
data_unlist <- gsub('\'DMZ' , 'DMZ'  ,data_list)
data_unlist <- gsub('\'규제개혁' , '규제개혁'  ,data_list)
data_unlist <- gsub('\'민관합동' , '민관합동'  ,data_list)
data_unlist <- gsub('\'유라시아' , '유라시아'  ,data_list)
data_unlist <- gsub('\'친환경에너지' , '친환경에너지'  ,data_list)
data_unlist <- gsub('갑오년(甲午年)' , '갑오년'  ,data_list)
data_unlist <- gsub('계획\'' , '계획'  ,data_list)
data_unlist <- gsub('계획’을' , '계획'  ,data_list)
data_unlist <- gsub('고용창출력이' , '고용창출력'  ,data_list)

##################전처리###################################


data_list <- Filter(function(x){nchar(x) >= 2} , data_unlist)
data_unlist<- gsub('[~!@#$%&*,\'(\`)_+=?<->.//]/[|]','',data_list)
data_unlist <- gsub(pattern = '[ ]{2,}|[ ]+$', replacement = "", data_unlist)
data_unlist <- gsub(pattern = '\'', replacement = "", data_unlist)


data_unlist


#############################################################

wordcount <- table(data_unlist)


wordcount_top <- head(sort(wordcount , decreasing = T) , 100)


wordcount_top


temp <- as.character(wordcount_top)
temp


data_unlist




#색설정
display.brewer.all()
color <- brewer.pal(12, "Set3")

#폰트 설정 
windowsFonts(font=windowsFont("a한글사랑L"))

wordcloud(names(wordcount_top), wordcount_top, scale=c(5,0.5),random.order = FALSE, random.color = TRUE, colors = color, family = "font")





