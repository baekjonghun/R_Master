# 함수정의 
#매개변수 2개 덧셉, 곱셈 의 결과를 리턴


#함수 호출
cal <- function(n1,  n2){
  
  result1 = n1  + n2
  result2 = n1  * n2
  
  re = c(result1 , result2)
  return(re)
}


avg <- function(n){
  sum(value) / length(value)
}

num <- c(1:9)
avg(num)

#함수정의 3#################################################
#나머지  기본값 설정

div  <- function( n , divisor=2){
         n %% divisor
         print(dovoddor)
       }
div(5,3)
div(19,  divisor = 4)

cat( 'hi', result , result1 ,seq = c(',', '\n'))


input <- scan()
class(input)
#한줄을 읽어 드린다. 
#아예 한줄을 읽어 드린다 . 

line_input <- readline('input text')
line_input <- as.integer(line_input)


#1+
#2-
#else none
sum_sub <- function(n1,n2,cal){
  result <- 0
  if(cal == 1){
    result = n1 + n2
  }else if(cal == 2){
    result = n1 - n2
  }else{
    print('1,2 else data')
    result = NA
  }
  
  return(result)
}


result  <- sum_sub(5,3,3)


print(result)



#첫번째 인수는 소수 두번째 인수는 정수 
#공분산 이란 ?
#
# 공분산
# 위키백과, 우리 모두의 백과사전.
# 둘러보기로 가기검색하러 가기
# 확률론과 통계학에서, 공분산(共分散, 영어: covariance)은 2개의 확률변수의 상관정도를 나타내는 값이다.(1개의 변수의 이산정도를 나타내는 분산과는 별개임) 만약 2개의 변수중 하나의 값이 상승하는 경향을 보일 때, 다른 값도 상승하는 경향의 상관관계에 있다면, 공분산의 값은 양수가 될 것이다. 반대로 2개의 변수중 하나의 값이 상승하는 경향을 보일 때, 다른 값이 하강하는 경향을 보인다면 공분산의 값은 음수가 된다. 이렇게 공분산은 상관관계의 상승 혹은 하강하는 경향을 이해할 수 있으나 2개 변수의 측정 단위의 크기에 따라 값이 달라지므로 상관분석을 통해 정도를 파악하기에는 부적절하다. 상관분석에서는 상관관계의 정도를 나타내는 단위로 모상관계수 ρ를 사용한다


#
#
#

covaruabce <- function(n1 , n2){
  #2행 2열의 행렬을 만든다.
  
  
  x  <- matrix(c(n1) , nrow = n2  , ncol =n2)
  
  # x , y 의 값이 같다. 같으므로 1.0  
  x[1,1] = as.double(1.0)
  x[2,2] = 1.0
  x[3,3] = 1.0
  x[4,4] = 1.0
  
  return(x)
}


re <- covaruabce('0.8' ,4)
re
