

############# 데이터 프레임#################################

x <- 10:1
y <- -4:5

q <- c('Hotkey' , 'Football' , 'BaseBoll' , 'Curling' , 'Rugby' , 'Lacrosse' , 'Baseketball' , 'Tennis' ,'Cricket' ,'Soccer' )



theDf  <- data.frame(first = x,Second = y,Sport = q)

nrow(theDf) #열의 수 
ncol(theDf) #컬럼의 수 
dim(theDf) #열과 컬럼의 수 

names(theDf)
names(theDf)[3]


#행의 이름 할당 
rownames(theDf) <- c('one' , 'two' ,'three' , 'four' , 'five' , 'six' , 'seven' , 'Eight'  ,'Nine' , 'Ten')


#인덱스로 다시 돌려 놓기 
rownames(theDf) <- NULL

#데이터가 많은경우 몇개의 행만 출력한다.
head(theDf)
head(theDf , n = 7)
tail(theDf)
class(theDf)

theDf$Sport ##?
theDf[,2:3] #열 3열 전체 



