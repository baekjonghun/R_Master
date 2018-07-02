
#기존 변수를 이용하여 홀수의 합을 구해 보시오 
sum <- 0

x <- c(1,3,5,7,9)


for(i in 1:5 ){
  sum =  x[i] + sum

}
print(sum)


#while 문을 사용하여 1-10 까지 숫자에서 홀수의 합을 구하여라 

i <- 1
result <- 0
while( i<= 10){
    i = i + 1
    result = i + result
}

result




#break 와 next 를 사용한 에제 각 2개만들기 

##gugudan 만들기


for (s1 in 2:9){
#  if(s1 == 3){
#    break

  # 2단까지 출력 하시  

#  }
  
  #  if(s1 == 3){
  #    next
  
  # 3단을 제외 하고 출력하시오
  
  #  }
  
  for (k in 1:9){
    print(paste(s1 , '*' , k , '=' , (s1*k)))
    
  }
}





