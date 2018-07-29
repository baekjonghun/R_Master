library(KoNLP)
library(RColorBrewer)
library(wordcloud)


useSejongDic()

setwd('C:\\Users\\Administrator.Sc-201801171515\\Desktop\\nmh_Speech_cloude')

dir()




data1 <- readLines('nmh_speech.txt')

data <- sapply(data1 , extractNoun , USE.NAMES = F)

data
data_unlist <- unlist(data)

wordcount_top

data_list <- Filter(function(x){nchar(x) >= 2} , data_unlist)

data_list


wordcount <- table(data_list)

wordcount_top <- head(sort(wordcount , decreasing = T) , 100)

####################불용어 처리 ############################

#delete
data_unlist <- gsub('하기' , ''  ,data_list)
data_unlist <- gsub('무엇' , ''  ,data_list)
data_unlist <- gsub('어던' , ''  ,data_list)
data_unlist <- gsub('하게' , ''  ,data_list)
data_unlist <- gsub('훌륭' , ''  ,data_list)
data_unlist <- gsub('만큼' , ''  ,data_list)
data_unlist <- gsub('이번' , ''  ,data_list)
data_unlist <- gsub('감사합니' , ''  ,data_list)

#update 
data_unlist <- gsub('대한' , '대한민국'  ,data_list)
data_unlist <- gsub('민국' , '대한민국'  ,data_list)
data_unlist <- gsub('이번' , '년도'  ,data_list)
data_unlist <- gsub('한*미간' , '한*미'  ,data_list)
data_unlist <- gsub('21' , '21세기'  ,data_list)


wordcount <- table(data_unlist)
wordcount_top <- head(sort(wordcount , decreasing = T) , 20)

#색설정 
display.brewer.all()
color <- brewer.pal(12 , 'Set3')

windowsFonts(font = windowsFont('a한글사랑L'))

wordcloud(names(wordcount_top), wordcount_top, scale=c(5,0.5),random.order = FALSE, random.color = TRUE, colors = color, family = "font")
