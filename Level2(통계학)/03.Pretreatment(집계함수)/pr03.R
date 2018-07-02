

## 이상치 ##############################################################

out <- data.frame(gender = c(1,2,3,2,1) , 
                  score = c(10,15,5,20,25))

table(out$gender)
#gender 에서 이상값(3)을 결측치 변경 
out$gender <- ifelse(out$gender == 3 , NA , out$gender)

#score 에서 이상값(25)을 결측치 변경 
out$score <- ifelse(out$score == 25 , NA , out$score)

View(out)



##결측치를 제외한 성별별 점수의 평균을 구하시오
#성별 결측지 제거 
sub_out <- out %>% filter(!is.na(gender))
#성별의 결측지 제거 확인
View(sub_out)

sub_out %>% group_by(gender) %>%
  summarise(mean(score , na.rm = T))


#######극단치#################################################
######너무 한쪽으로 쏠려있는 경우 빼주도록한다. ##############
box <- data.frame(num = c(2,3,1,5,6,10,20))
boxplot(box$num)
boxplot(box$num)$stats #극단치의 경계를 알려준다.

#########################################################
#극단치의 경계선을 넘어간 값을 NA로 변경하시오.##########
box$num <- ifelse(box$num < 1 | box$num >10 , NA , box$num)

box$num








