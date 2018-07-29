install.packages('DBI')
install.packages('RODBC')

library(DBI)
library(RODBC)
db  <- odbcConnect('orcl' , 'scott'  ,'tiger')

db  <- odbcConnect('orcl' , 'scott'  ,'tiger')

sql <- sqlQuery(db  , query = ,'select * from emp' ) 

close.connection(db)