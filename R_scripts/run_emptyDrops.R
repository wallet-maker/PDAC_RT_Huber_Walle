#source("https://bioconductor.org/biocLite.R")
#biocLite("DropletUtils")

#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")

#BiocManager::install("DropletUtils")

library("DropletUtils")
library(edgeR)
library(Matrix)

args <- commandArgs(trailingOnly = TRUE)
data <- readMM(args[1])
data <- as(t(data), "dgCMatrix")


data_2 <- emptyDrops(data, retain=Inf, test.ambient=T, lower=30)
write.csv(data_2,args[2],quote=F,row.names = F)

