setwd('C:\\Users\\Administrator.Sc-201801171515\\Desktop\\en_speeche_cloude')
dir()
install.packages('tm')  #텍스트 마이닝 설치하기

library(RColorBrewer)
library(wordcloud)

library(tm) #텍스트 마이닝 패키지 import 

readLine <- readLines('en_speeche.txt')

#mac 사용시 한글 깨짐
#해결망안

data <- iconv(data1 , "WINDOWS-1252" , "UTF-8")

class(readLine)
typeof(readLine)

#벡터형으로 저장하기 
testText <- VectorSource(readLine)
#corpus로 변환하여 저장하기 
corpus <- Corpus(testText)

#문장 부호 제거하기 
corpus <- tm_map(corpus , removePunctuation)

#특정 문자 제거하기 
corpus <- tm_map(corpus , removeWords , c('0','1','2','3','4','5','6','7','8','9'))

#입력 텍스트가 영문인경우 ,대문자를 소문자로 변환하기 
corpus <- tm_map(corpus , tolower)



#불용어 제거시 : /library/tm/stopword/english.dat 파일 편집 
#불용어란 문장을 나타내는대 크게 중요하지 않는 파일을 말한다. 
corpus <- tm_map(corpus , removeWords , stopwords('english'))

#데이터 확인
inspect(corpus)
strwrap(corpus[[1]])



corpus <- tm_map(corpus , PlainTextDocument)  

#단어의 빈도수 행렬로 표현 
dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)

#문서내 각 단어의 발생빈도를 측정한후 , 오름차순으로 정렬하기 
frequency <- colSums(dtm2)
frqyency <- sort(frequency , decreasing = T)

#frequency에 저장된 값 확인하기 
frqyency

#발생빈도가 높은 상위5개 출력하기 
frequency[1:5]

#발생 빈도가 높은 상위 20개를 막대그래프를 형태로 출력하기 
barplot(frequency[1:20] , las = 3)

#wordcloude 실행 

