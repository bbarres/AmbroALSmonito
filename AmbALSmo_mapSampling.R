##############################################################################/
##############################################################################/
#Code for plotting the maps
##############################################################################/
##############################################################################/

#loading the necessary packages and data
source("AmbALSmo_load.R")

#load the resistance results for the 2020 campaign
databruteTOT<-read.delim(
  "data/data_carto_france.txt",
  header=TRUE,
  sep="\t",
  colClasses=c("character","numeric","numeric",
               "numeric","numeric","numeric","numeric",
               "numeric","numeric","numeric","numeric",
               "numeric","numeric","numeric","factor",
               "factor","factor","factor")
)
databruteTOT$RS<-rowSums(databruteTOT[,4:14])
levels(databruteTOT$SeqMeth)<-c(19,17)

#turning this dataframe into a spatial dataframe (wgs84)
ambro.wgs<-SpatialPointsDataFrame(coords=databruteTOT[,c(3,2)],
                                  data=databruteTOT,
                                  proj4string=CRS("+proj=longlat +datum=WGS84")
)
ambro<-spTransform(ambro.wgs,CRS("+init=epsg:2154"))


##############################################################################/
#code for the maps by mutation in WGS####
##############################################################################/

#one single map without R/S information
op<-par(mar=c(0,0,1,0))
#original screening
plot(departe,lwd=0.8,border=grey(0.7))
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$SampRound!="Targeted",],
     pch=0,
     col=rgb(31,133,235,175,maxColorValue=255),cex=1,
     add=TRUE)
plot(ambro[ambro$SampRound=="Targeted",],
     pch=1,
     col=rgb(213,179,0,175,maxColorValue=255),cex=1,
     add=TRUE)
legend(100000,7120000,
       legend=c("Targeted sampling (N=43)","Random sampling (N=213)"),
       cex=0.8,pt.cex=1,y.intersp=1.2,x.intersp=0.8,
       pch=c(1,0),
       col=c(rgb(213,179,0,175,maxColorValue=255),
             rgb(31,133,235,175,maxColorValue=255)),
       bg="transparent",bty="n")
scalebar(c(191260,6060000),300000,"km",division.cex=0.8)
text(594045.1,6502086,labels="NAQ",cex=0.9,font=2,col=grey(0.3))
text(594045.1,6751660,labels="CVL",cex=0.9,font=2,col=grey(0.3))
text(742229.5,6515085,labels="ARA",cex=0.9,font=2,col=grey(0.3))
text(708433,6333104,labels="OCC",cex=0.9,font=2,col=grey(0.3))
text(412064,6720000,labels="PDL",cex=0.9,font=2,col=grey(0.3))
text(870000,6698000,labels="BFC",cex=0.9,font=2,col=grey(0.3))
par(op)

#export to .pdf 5 x 5 inches


##############################################################################/
#END
##############################################################################/