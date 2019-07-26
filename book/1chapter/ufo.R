library(ggplot2)

ufo <-read.delim("./data/ufo_awesome.tsv", sep="\t", stringsAsFactors=FALSE, header=FALSE, na.string="")

names(ufo) <- c("DateOccured", "DateReported","Location"
               ,"ShortDescription", "Duration", "LongDescription")
               
good.rows <- ifelse(nchar(ufo$DateOccured) != 8 | nchar(ufo$DateReported) != 8, FALSE, TRUE)
ufo <- ufo[good.rows,]

ufo$DateOccured <- as.Date(ufo$DateOccured, format="%Y%m%d")
ufo$DateOccured <- as.Date(ufo$DateReported, format="%Y%m%d")

get.location <- function(l) {
 split.location <- tryCatch(strsplit(l, ",")[[1]], error=function(e) return(c(NA, NA)))
 clean.location <- gsub("^ ","",split.location)
 if(length(clean.location) > 2){
  return(c(NA,NA)) }
 else {
  return (clean.location) }
}

city.state <- lapply(ufo$Location, get.location)
location.matlix <- do.call(rbind, city.state)
ufo <- transform(ufo, USCity=location.matlix[, 1], USState=tolower(location.matlix[, 2]), stringsAsFactors=FALSE)

us.states <- c("ak","al","ar","az","ca","co","ct","de","fl","ga","hi"
              ,"ia", "id", "in", "ks","ky","la","ma","me","mi","mn","mo"
              ,"il", "ms", "mt", "nc","nd","ne","nh","nj","nm","nv","ny"
              ,"oh", "ok", "or", "pa","ri","sc","sd","tn","tx","ut","va"
              ,"vt", "wa", "wi", "wv","wy")
              
ufo$USState <- us.states[match(ufo$USState, us.states)]
ufo$USCity[is.na(ufo$USState)] <- NA
ufo.us <- subset(ufo, !is.na(USState))

#summary(ufo.us$DateOccured)

quick.hist <- ggplot(ufo.us, aes(x = DateOccured))+geom_histogram()+scale_x_date(major <- "50 years")
ggsave(plot=quick.hist, filename="../quick_hist.png",height = 6, width=8)
