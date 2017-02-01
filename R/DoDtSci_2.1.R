data1 <- read.csv(url("http://stat.columbia.edu/~rachel/datasets/nyt1.csv"))

                                        # split by age
head(data1)
data1$agecat <- cut(data1$Age, c(-Inf, 0, 18, 24, 34, 44, 54, 64, Inf))

                                        # summary
summary(data1)

#install.packages("doBy")
library("doBy")
siterange <- function(x) {
    c(length(x), min(x), mean(x), max(x))
}
summaryBy(Age~agecat, data = data1, FUN = siterange)

summaryBy(Gender+Signed_In+Impressions,Clicks~agecat,
          data = data1)

install.packages("ggplot2")
library(ggpplot2)

