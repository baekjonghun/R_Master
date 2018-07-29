install.packages("KoNLP")
install.packages('wordcloud')
install.packages('RColorBrewer')


library(KoNLP)
library(RColorBrewer)
library(wordcloud)

#한글 명사 설정 
useSejongDic()

#######가져오기######################
setwd('C:\\bigdata')
dir()



data1 <- readLines('test.txt')

##명사 추출
data <- sapply(data1, extractNoun, USE.NAMES = F)


data
data_unlist <- unlist(data)
data_unlist

wordcount <- table(data_unlist)

wordcount

#top 100 
wordcount_top <-head(sort(wordcount, decreasing = T),100)


wordcount_top

#2 Max delete 
data_list <- Filter(function(x){nchar(x)>=2}, data_unlist)

data_list

###### 불용어 처리#################################



data_unlist <- gsub('[A-Z]' , ''  ,data_list)
data_unlist <- gsub('[a-z]' , ''  ,data_list)


data_unlist <- gsub('[ㄱ-ㅎ]' , ''  ,data_list)
data_unlist <- gsub('(ㅜ|ㅠ)' , '' , data_list)

data_unlist <- gsub('\\d+' , '' , data_list) #숫자 제거 
data_unlist<- gsub('[~!@#$%&*,()_+=?<->.//]/[|]','',data_list)


#동사나 형용사의 활용형을 기본형으로 바꾸거나 ( ex)달리는 -> 달리다 )
#불용어를 고친다.

data_unlist <- gsub('(ㅜ|ㅠ)' , '' , data_list)


#박열에 뭐가 오든 전부 박열로 번
data_unlist = gsub("박열\\S*", "박열", data_unlist)




data_unlist

#사전에 없는 단어 추가 
mergeUserDic(data.frame(c("노잼"), "ncn"))

mergeUserDic(data.frame(readLines("test.txt"), "ncn"))
dir()


#두 번째 정제 작업

wordcount <- table(data_unlist)
wordcount_top <-head(sort(wordcount, decreasing = T),20)

wordcount_top

wordcloud(names(wordcount_top), wordcount_top, scale=c(5,0.5),random.order = FALSE, random.color = TRUE, colors = color, family = "font")

#색설정
display.brewer.all()
color <- brewer.pal(12, "Set3")


#폰트 설정 
windowsFonts(font=windowsFont("a한글사랑L"))

# *: 적어도 0 번 매칭한다.
# +: 적어도 1 번 매칭한다.
# ?: 많아아 1 번 매칭한다.
# {n}: 정확히 n 번 매칭한다.
# {n,}: 적어도 n 번 매칭한다.
# {n,m}: n 번에서 m 번 매칭한다.

