#installng packages, if needed
install.packages('RODBC');   #data access
install.packages('ggplot2'); #graphics

#import libraries
library('RODBC');   
library('ggplot2');

#reading data from database
connString <- "Driver={SQL Server};Server=(local);Database=Phones;Trusted_Connection=yes";
conn <- odbcDriverConnect(connString);
actions <- sqlQuery(conn, "select IsCorporate, Size, ActionRoute, MonthAndYear, Units, TotalPrice, Unit, RecomputeUnits from SourceData.viInputCalls");

#factorization
actions$MonthAndYear <- as.Date.factor(actions$MonthAndYear);
actions$RecomputeUnits <- as.factor(actions$RecomputeUnits);

#exploration
summary(actions);

#ggplot
ggplot(actions, aes(x=MonthAndYear, y=Units)) + geom_point(aes(col=Units), size=3);

#training
sample.size = 0.70 * nrow(actions);
sample.count <- sample(seq_len(nrow(actions)), size = sample.size)

actions.training <- actions[sample.count, ]
actions.test <- actions[-sample.count, ]
