#install.packages("xlsx")
#Sys.setenv(JAVA_HOME = "C:\\Gas Balance\\Java64")
setwd("//maran")

library(xlsx)

data <- read.xlsx("01_data/input.xlsx", sheetName = "Tabelle1", header = FALSE)

randomNumbers <- runif(data[1,2], 0, 100)
write.xlsx(randomNumbers, paste0("03_output/", format(Sys.time(), "%Y_%b_%d_%H_%M_"), "output.xlsx"))

#paste0("03_output/", format(Sys.time(), "%Y-%b-%d %H.%M"), "output.xlsx")

#t1 <- Sys.time()
#for(i in 1:1000000){
#  matrix <- matrix(rnorm(data[2,2]^2), data[2,2])
#  transMatrix <- t(matrix)
  
#}
#t2 <- Sys.time()
#t2 - t1