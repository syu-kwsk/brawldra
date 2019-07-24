library(ggplot2)
ufo<-read.delim("data/ufo_awesome.tsv", sep="\t", stringsAsFactors=FALSE, header=FALSE, na.string="")

names(ufo) <-c("DateOccured", "DateReported","location","ShortDescription", "Duration", "LongDescription")
# head(ufo[which(nchar(ufo$DateOccured) != 8 | nchar(ufo$DateReported) != 8), 1])

good.rows <-ifelse(nchar(ufo$DateOccured) != 8 | nchar(ufo$DateReported) != 8, FALSE, TRUE)
# length(which(!good.rows))

ufo <-ufo[good.rows,]

ufo$DateOccured <-as.Date(ufo$DateOccured, format="%Y%m%d")
ufo$DateOccured <-as.Date(ufo$DateReported, format="%Y%m%d")

head(ufo)