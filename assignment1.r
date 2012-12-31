library("MySQL")
drv = dbDriver("MySQL")
con = dbConnect(drv,host="musickin.cb4ut6mpu8fe.us-east-1.rds.amazonaws.com",dbname="musickin",user="musickin",pass="password123")
musickin = dbGetQuery(con,statement="select count(*) as visitors, DAYOFWEEK(viewed_date) as weekday from views group by weekday
+ ORDER BY visitors DESC");
print(musickin)