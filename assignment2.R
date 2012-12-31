library("RMySQL")
drv = dbDriver("MySQL")
con = dbConnect(drv,host="musickin.cb4ut6mpu8fe.us-east-1.rds.amazonaws.com",dbname="musickin",user="musickin",pass="password123")
s=" select count(*) as checkedincount, views.venue_name, DAYOFWEEK(viewed_date) as weekday from views  WHERE checked_in = 1 group by weekday,venue_name ORDER BY checkedincount DESC;"
musickin = dbGetQuery(con,statement=s);
print(musickin)
library("ggplot2")
qplot(weekday, data=musickin, geom="bar", weight=checkedincount, ylab="checkedincount")