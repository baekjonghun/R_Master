install.packages('tidyverse')

library(tidyverse)

#내  용:문자열 다루기 
#작성자:백종훈 
#작성일:2018-06-30
#참  조:http://r4ds.had.co.nz/strings.html


#바뀐내용

#문자열 길이
str_length(c('a' ,'R for data science' , NA))
#1 18 na 


#문자열 합치기
str_c('x', 'y')
#xy 

str_c('x' , 'y' , 'c')
#xyc

str_c('x', 'y' , sep =',')
#x,y

x <- c('abc' , NA)
str_c('|-' , x , '-|')
#"|-abc-|" NA 

str_c('prefix-' , c('a' ,'b' , 'c') , '-suffix')
name <- 'Headey'
time_of_day <- 'morning'
birthday <- FALSE

str_c(
  'good ' , time_of_day , ' ' , name  ,
  if(birthday){
    "and Happy Birtjday"
  }
)
#"good morning Headey"


#문자열 부분 집합 (문자열의 일부분만 추출)
x <- c('Aaple' , 'Benana' , 'Pear')
str_sub(x , 1 , 3)

str_sub(x , -1)
#e , a , r

str_sub(x , -3)
#"ple" "ana" "ear"

str_sub(x , -3  , -1)
#"ple" "ana" "ear"

#대문자 소문자 변경

str_sub(x, 1, 1) <- str_to_lower(str_sub(x, 1,1))
#"aaple"  "benana" "pear"

str_to_upper(c('i'  , 'l'))
#"I" "L"

str_to_upper(c('i' , 'l') , locale = 'tr')


### R 기본 문자열 다루기 #######################################
paste(1:12)
paste0(1:12)
#[1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12"


nth <- paste0(1:12 , c('st' , 'nd' , 'rd' , rep('th' , 9)))
#[1] "1st"  "2nd"  "3rd"  "4th"  "5th"  "6th"  "7th"  "8th"  "9th"  "10th" "11th" "12th"

paste(month.abb , 'is the'  , nth  , 'month of the year')
# 
# [1] "Jan is the 1st month of the year"  "Feb is the 2nd month of the year"  "Mar is the 3rd month of the year" 
# [4] "Apr is the 4th month of the year"  "May is the 5th month of the year"  "Jun is the 6th month of the year" 
# [7] "Jul is the 7th month of the year"  "Aug is the 8th month of the year"  "Sep is the 9th month of the year" 
# [10] "Oct is the 10th month of the year" "Nov is the 11th month of the year" "Dec is the 12th month of the year"

paste(month.abb , letters)
# [1] "Jan a" "Feb b" "Mar c" "Apr d" "May e" "Jun f" "Jul g" "Aug h" "Sep i" "Oct j" "Nov k" "Dec l" "Jan m" "Feb n"
# [15] "Mar o" "Apr p" "May q" "Jun r" "Jul s" "Aug t" "Sep u" "Oct v" "Nov w" "Dec x" "Jan y" "Feb z"


paste(month.abb, "is the", nth, "month of the year.", sep = "_*_")
# [1] "Jan_*_is the_*_1st_*_month of the year."  "Feb_*_is the_*_2nd_*_month of the year." 
# [3] "Mar_*_is the_*_3rd_*_month of the year."  "Apr_*_is the_*_4th_*_month of the year." 
# [5] "May_*_is the_*_5th_*_month of the year."  "Jun_*_is the_*_6th_*_month of the year." 
# [7] "Jul_*_is the_*_7th_*_month of the year."  "Aug_*_is the_*_8th_*_month of the year." 
# [9] "Sep_*_is the_*_9th_*_month of the year."  "Oct_*_is the_*_10th_*_month of the year."
# [11] "Nov_*_is the_*_11th_*_month of the year." "Dec_*_is the_*_12th_*_month of the year."

paste0(nth , collapse = ', ')
#[1] "1st, 2nd, 3rd, 4th, 5th, 6th, 7th, 8th, 9th, 10th, 11th, 12th"

paste("1st", "2nd", "3rd", collapse = ", ") # probably not what you wanted
#[1] "1st 2nd 3rd"

paste(month.abb, nth, sep = ": ", collapse = "; ")
#[1] "Jan: 1st; Feb: 2nd; Mar: 3rd; Apr: 4th; May: 5th; Jun: 6th; Jul: 7th; Aug: 8th; Sep: 9th; Oct: 10th; Nov: 11th; Dec: 12th"

(title <- paste(strwrap(
  "Stopping distance of cars (ft) vs. speed (mph) from Ezekiel (1930)",
  width = 30), collapse = "\n"))
plot(dist ~ speed, cars, main = title)

#[1] "Stopping distance of cars\n(ft) vs. speed (mph) from\nEzekiel (1930)"


#-----------------정규표현식------------------------###
## 문자 selector 
########################################################
x <- c('apple' , 'banana' , 'pear')
str_view(x , 'an')
str_view(x , '.a.')
#해당 문자열을 보여줍니다.


#apple
#banana
#pear

dot <- '\\.'
writeLines(dot)
#\.


str_view(c('abc' , 'a.c' , 'bef') , 'a\\.c')


x <- 'a\\b'
writeLines(x)
#a\b

str_view(x ,'\\\\')
#백슬러쉬 4개 필요 

x <- c('apple' , 'benana', 'pear')
str_view(x , '^a') #a 의 값이 시작값에 있는 문자열을 찾습니다. 
#[a]pple

str_view(x , 'a$') #a 의 값이 끝에 있는 문자열을 찾습니다.

str_view(x , '^apple$')

str_view(c("abc", "a.c", "a*c", "a c"), "a[ ]")
#a[ ]c  특정 문자열을 찾는다. 


###############roop##########################################################
# 
# ?: 0 또는 1
# +: 1 개 이상
# *: 0 이상
x <- '1888 is the longest year Roman numberals: MDCCCCKXXVIII'
str_view(x , 'CC?') # CC 

str_view(x , 'CC+') #C 로 연결된  CCCC selector ~~  

# 
# {n}: 정확히 n 개
# {n,}: n 이상
# {,m}: 최대 m
# {n,m}: n과 m 사이


str_view(fruit, '(...)\\1', match = TRUE)

 ############일치 확인###########################################################

x <- c('apple' , 'banana' , 'pear')
#[1] "apple"  "banana" "pear"
str_detect(x  , 'e') #[1]  TRUE FALSE  TRUE


mean(str_detect(words , '[aeiou]$'))
# 0.2765306

df <- tibble(
  word = words , 
  i = seq_along(word)
)

df %>% filter(str_detect(words , 'x$'))
# 
# word      i
# <chr> <int>
# 1 box     108
# 2 sex     747
# 3 six     772
# 4 tax     841


x <- c('apple' , 'banana' , 'pear')
str_count(x ,'a')
#[1] 1 3 1


mean(str_count(words, "[aeiou]"))
#[1] 1.991837

df %>% 
   mutate(
     vowels = str_count(word , '[aeiou]'), 
     consonants = str_count(word , '[^aeiou]')
   )

#####일치 항목 교체########
x <- c('apple' , 'pear' , 'banana')
str_replace(x , '[aeiou]' , '-')
x <- c('1 house' , '2 cars' , '3 people')

sentences %>%  
   str_replace('([^ ]+) ([^ ]+) ([^ ]+)' ,'\\1 \\2 \\3') %>% 
   head(5)

# [1] "The birch canoe slid on the smooth planks."  "Glue the sheet to the dark blue background." "It's easy to tell the depth of a well."     
# [4] "These days a chicken leg is a rare dish."    "Rice is often served in round bowls."  


apropos('replace')
