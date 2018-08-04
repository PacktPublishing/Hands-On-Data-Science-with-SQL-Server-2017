#setting working directory
getwd();
setwd("C:\\SQLDS\\CH9_Data_Transformations_with_Other_Tools\\CSVs\\");
getwd();

#reading CSV
df <- read.csv2("ProductsWithCategories.csv", dec=".");

#checking and converting ListPrice's column data
df$ListPrice;
typeof(df$ListPrice);
price <- sapply(df$ListPrice, as.double);

#calculating mean and st. dev.
meanPrice <- mean(price);
sdPrice <- sd(price)
c(meanPrice, sdPrice);

#calculating Z-score
zOfAllPrices <- (price - meanPrice) / sdPrice;

#checking Z-score properties
result <- c(mean(zOfAllPrices), sd(zOfAllPrices));
nms <- c("Mean of...", "St. dev. of...");
names(result) <- nms;
result;

#adding the new column back to a data.frame df
df$zScorePrice <- zOfAllPrices;

#showing result
df
