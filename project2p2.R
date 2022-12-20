

## Bootstrap for Average UVA admission offers from 2016-2022

offers <- c(9668,10058,9828,9778,9231,9951,9503)
B <- 2000
boot.samps <- sapply(1:B, function(x) sample(offers, 7, replace = T))
boot.means <- apply(boot.samps, 2, mean)

boot.tb<-rep(NA, B)
for(b in 1:B){
  boot.tb[b]<-(mean(boot.samps[,b])-mean(offers))/
    (sd(boot.samps[,b])/sqrt(length(offers)))
}

t.025<-quantile(boot.tb, .025)
t.975<-quantile(boot.tb, .975)

pivot.lb<-mean(offers)-(t.975*(sd(offers)/sqrt(length(offers))))
pivot.ub<-mean(offers)-(t.025*(sd(offers)/sqrt(length(offers))))
print(c(pivot.lb, pivot.ub))

## Bootstrap for Average Enrolled Students 2016-2022

enrolled <- c(3683,3788,3822,3920,3785,3890,4030)
B <- 2000
boot.samps <- sapply(1:B, function(x) sample(enrolled, 7, replace = T))
boot.means <- apply(boot.samps, 2, mean)

boot.tb<-rep(NA, B)
for(b in 1:B){
  boot.tb[b]<-(mean(boot.samps[,b])-mean(enrolled))/
    (sd(boot.samps[,b])/sqrt(length(enrolled)))
}

t.025<-quantile(boot.tb, .025)
t.975<-quantile(boot.tb, .975)

pivot.lb<-mean(enrolled)-(t.975*(sd(enrolled)/sqrt(length(enrolled))))
pivot.ub<-mean(enrolled)-(t.025*(sd(enrolled)/sqrt(length(enrolled))))
print(c(pivot.lb, pivot.ub))

# ## Permutation Test for GPA (male v. female)
# df <- data.frame(gpa=c(3.39,3.4,3.42,3.46,3.53,3.67,3.3,3.33,3.36,3.38,3.46,3.59),samplenum = c(rep("1",6), rep("2",6)))
# female <- c(3.39,3.4,3.42,3.46,3.53,3.67)
# male <- c(3.3,3.33,3.36,3.38,3.46,3.59)
# hist(female)
# hist(male)
# 
# choose(12,6)
# 
# library(perm)
# 
# D_obs = mean(df$gpa[1:6]) - mean(df$gpa[7:12])
# D_obs #test statistic
# 
# results <- permTS(df$gpa[1:6],df$gpa[7:12], 
#                   alternative = "greater", exact = TRUE)
# 
# results$p.value # p-value

## WILCOXON TEST for GPA female v. male
### (data is heavy tailed and skewed so wilcoxon over permutation)
df <- data.frame(gpa=c(3.39,3.4,3.42,3.46,3.53,3.67,3.3,3.33,3.36,3.38,3.46,3.59),samplenum = c(rep("1",6), rep("2",6)))
female <- c(3.39,3.4,3.42,3.46,3.53,3.67)
male <- c(3.3,3.33,3.36,3.38,3.46,3.59)
hist(female)
hist(male)

ranks<-rank(df$gpa, ties.method="average")
newdf <- rbind(df$gpa, ranks)
newdf$ranks <- as.numeric(newdf$ranks)

W_obs <- sum(ranks[1:6]) 
W_obs 

wilresults <- wilcox.test(df$gpa[1:6], df$gpa[7:12], alternative="greater")
wilresults$p.value

## KW TEST for GPA per school @ UVA (2017-2021)
library("clinfun")
library("tidyverse")

samp1<-c(3.43,3.42,3.42,3.49,3.54)
n1<-length(samp1)

samp2<-c(3.33,3.36,3.39,3.48,3.63)
n2<-length(samp2)

samp3<-c(3.64,3.64,3.64,3.63,3.69)
n3<-length(samp3)

samp4<-c(3.43,3.43,3.46,3.53,3.63)
n4<-length(samp4)

samp5<-c(3.35,3.38,3.41,3.52,3.61)
n5<-length(samp5)

samp6<-c(3.53,3.54,3.61,3.64,3.73)
n6<-length(samp6)

samp7<-c(3.63,3.65,3.71,3.73,3.79)
n7<-length(samp7)

data<-c(samp1, samp2, samp3,samp4,samp5,samp6,samp7)
groups<-c(rep(1, n1), rep(2, n2), rep(3, n3),rep(4,n4),rep(5,n5),rep(6,n6),rep(7,n7))
my_df <- data.frame(x = data, sample = groups)

num.perms<-factorial(n1+n2+n3+n4+n5+n6+n7)/(factorial(n1)*factorial(n2)*factorial(n3)*factorial(n4)*factorial(n5)*factorial(n6)*factorial(n7))
print(num.perms)

kruskal.test(my_df$x, my_df$sample)

## KW & JT Test for GPA per academic level @ UVA (2017-2021)
samp1<-c(3.38,3.44,3.49,3.62,3.71)
n1<-length(samp1)

samp2<-c(3.36,3.38,3.43,3.52,3.65)
n2<-length(samp2)

samp3<-c(3.36,3.38,3.4,3.43,3.6)
n3<-length(samp3)

samp4<-c(3.37,3.39,3.42,3.41,3.54)
n4<-length(samp4)

data<-c(samp1, samp2, samp3,samp4)
groups<-c(rep(1, n1), rep(2, n2), rep(3, n3),rep(4,n4))
my_df <- data.frame(x = data, sample = groups)

num.perms<-factorial(n1+n2+n3+n4)/(factorial(n1)*factorial(n2)*factorial(n3)*factorial(n4))

kruskal.test(my_df$x, my_df$sample)

# Because the p-value is large (0.4574), we fail to reject the null hypothesis and can conclude
# that there is not a significant difference of GPA values between academic levels.

df <- data.frame(values = c(samp1, samp2, samp3,samp4),
                 groups = c(rep(1, n1), rep(2, n2), rep(3, n3),rep(4,n4)))

jonckheere.test(df$values, df$groups, alternative="decreasing", nperm = 10000)

# With an alpha level of 0.1, the p-value is small enough to reject the null and conclude that
# the GPAs decrease from first to fourth year.



