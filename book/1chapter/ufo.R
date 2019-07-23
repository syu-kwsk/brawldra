library(ggplot2)

ufo<-read.delim("data/ufo_awesome.tsv", sep="\t", stringsAsFactors=FALSE, header=FALSE, na.string="")

head(ufo)