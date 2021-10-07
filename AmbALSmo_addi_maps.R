##############################################################################/
##############################################################################/
#Code for multiple maps that were not selected for the publication in the end
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

#turning this data frame into a spatial data frame (wgs84)
ambro.wgs<-SpatialPointsDataFrame(coords=databruteTOT[,c(3,2)],
                                  data=databruteTOT,
                                  proj4string=CRS("+proj=longlat +datum=WGS84")
)
ambro<-spTransform(ambro.wgs,CRS("+init=epsg:2154"))


##############################################################################/
#code for the maps by mutation in WGS####
##############################################################################/

#all mutations on one map
op<-par(mar=c(0,0,0,0))
plot(departe.wgs,lwd=0.8,border=grey(0.7))
plot(regions.wgs,lwd=1.8,add=TRUE)
plot(ambro.wgs[ambro.wgs$RS==0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=0.8,
     add=TRUE)
plot(ambro.wgs[ambro.wgs$RS!=0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=0.8,
     add=TRUE)
polygon(x=c(-1.25,1.57,1.57,-1.25,-1.25),
        y=c(46.6,46.6,44.9,44.9,46.6),
        col="transparent",lwd=3,border="lightblue")
polygon(x=c(2.13,4.95,4.95,2.13,2.13),
        y=c(48.2,48.2,46.5,46.5,48.2),
        col="transparent",lwd=3,border="lightblue")
polygon(x=c(3.59,6.41,6.41,3.59,3.59),
        y=c(46.0,46.0,44.3,44.3,46.0),
        col="transparent",lwd=3,border="lightblue")
polygon(x=c(0.15,2.97,2.97,0.15,0.15),
        y=c(44.6,44.6,42.9,42.9,44.6),
        col="transparent",lwd=3,border="lightblue")
par(op)

#export to .pdf 7 x 7 inches

#all mutations on one map
op<-par(mar=c(0,0,1,0),mfrow=c(2,6))
for (i in 4:14) {
  plot(departeL.wgs,lwd=0.8,border=grey(0.7),
       main=colnames(ambro.wgs@data)[i])
  plot(regionsL.wgs,lwd=1.8,add=TRUE)
  plot(ambro.wgs[ambro.wgs@data[,i]==0,],
       pch=as.numeric(as.character(ambro.wgs[ambro.wgs@data[,i]==0,]$SeqMeth)),
       col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
       add=TRUE)
  plot(ambro.wgs[ambro.wgs@data[,i]!=0,],
       pch=as.numeric(as.character(ambro.wgs[ambro.wgs@data[,i]!=0,]$SeqMeth)),
       col=rgb(255,0,0,255,maxColorValue=255),cex=1.5,
       add=TRUE)
}
par(op)

#export to .pdf 18 x 7 inches


##############################################################################/
#code with cropped maps wgs84####
##############################################################################/

op<-par(mar=c(0,0,0,0))
plot(departe.wgs.1,lwd=0.8,border=grey(0.7))
plot(regions.wgs.1,lwd=2.5,add=TRUE)
plot(ambro.wgs[ambro.wgs$RS==0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro.wgs[ambro.wgs$RS!=0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
par(op)

op<-par(mar=c(0,0,0,0))
plot(departe.wgs.2,lwd=0.8,border=grey(0.7))
plot(regions.wgs.2,lwd=2.5,add=TRUE)
plot(ambro.wgs[ambro.wgs$RS==0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro.wgs[ambro.wgs$RS!=0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
par(op)

op<-par(mar=c(0,0,0,0))
plot(departe.wgs.3,lwd=0.8,border=grey(0.7))
plot(regions.wgs.3,lwd=2.5,add=TRUE)
plot(ambro.wgs[ambro.wgs$RS==0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro.wgs[ambro.wgs$RS!=0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
par(op)

op<-par(mar=c(0,0,0,0))
plot(departe.wgs.4,lwd=0.8,border=grey(0.7))
plot(regions.wgs.4,lwd=2.5,add=TRUE)
plot(ambro.wgs[ambro.wgs$RS==0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro.wgs[ambro.wgs$RS!=0,],
     pch=as.numeric(as.character(ambro.wgs[ambro.wgs$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
par(op)


##############################################################################/
#code for the maps by mutation in Lambert 93####
##############################################################################/

#all mutations on one map
op<-par(mar=c(0,0,0,0))
plot(departe,lwd=0.8,border=grey(0.7))
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$RS==0,],
     pch=as.numeric(as.character(ambro[ambro$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=0.8,
     add=TRUE)
plot(ambro[ambro$RS!=0,],
     pch=as.numeric(as.character(ambro[ambro$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=0.8,
     add=TRUE)
polygon(x=c(364666.8,590540.8,590540.8,364666.8,364666.8),
        y=c(6612096.8,6612096.8,6431338.8,6431338.8,6612096.8),
        col="transparent",lwd=3,border="darkblue")
polygon(x=c(633281.3,844866.6,844866.6,633281.3,633281.3),
        y=c(6790638.4,6790638.4,6600367.6,6600367.6,6790638.4),
        col="transparent",lwd=3,border="darkblue")
polygon(x=c(747072.2,963827.9,963827.9,747072.2,747072.2),
        y=c(6550171.5,6550171.5,6355840.0,6355840.0,6550171.5),
        col="transparent",lwd=3,border="darkblue")
# polygon(x=c(467049.9,697619.1,697619.1,467049.9,467049.9),
#         y=c(6388990.7,6388990.7,6204268.4,6204268.4,6388990.7),
#         col="transparent",lwd=3,border="darkblue")
polygon(x=c(487049.9,602334.5,602334.5,487049.9,487049.9),
        y=c(6398990.7,6398990.7,6306629.5,6306629.5,6398990.7),
        col="transparent",lwd=3,border="darkblue")
scalebar(c(191260,6060000),300000,"km",division.cex=1)
par(op)
#export to .pdf 7 x 7 inches

#each mutations on separate map
op<-par(mar=c(0,0,1,0),mfrow=c(2,6))
for (i in 4:14) {
  plot(departeLight,lwd=0.8,border=grey(0.7),
       main=colnames(ambro@data)[i])
  plot(regionsLight,lwd=1.8,add=TRUE)
  plot(ambro[ambro@data[,i]==0,],
       pch=as.numeric(as.character(ambro[ambro@data[,i]==0,]$SeqMeth)),
       col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
       add=TRUE)
  plot(ambro[ambro@data[,i]!=0,],
       pch=as.numeric(as.character(ambro[ambro@data[,i]!=0,]$SeqMeth)),
       col=rgb(255,0,0,255,maxColorValue=255),cex=1.5,
       add=TRUE)
}
scalebar(c(191260,6060000),300000,"km",division.cex=1)
par(op)
#export to .pdf 18 x 7 inches

#each position on separate map
op<-par(mar=c(0,0,1,0),mfrow=c(2,3))

#position 197
plot(departeLight,lwd=0.8,border=grey(0.7),
       main="Position 197")
plot(regionsLight,lwd=1.8,add=TRUE)
plot(ambro,pch=as.numeric(as.character(ambro$SeqMeth)),
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
     add=TRUE)
plot(ambro[ambro@data[,6]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,6]!=0,]$SeqMeth)),
     col="red",cex=1.5,
     add=TRUE)
plot(ambro[ambro@data[,10]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,10]!=0,]$SeqMeth)),
     col="blue",cex=1.5,
     add=TRUE)
plot(ambro[ambro@data[,11]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,11]!=0,]$SeqMeth)),
     col="purple",cex=1.5,
     add=TRUE)
legend(57000,7160000,legend=c("Gln197","Ser197","Thr197"),cex=1,pt.cex=1.8,
       y.intersp=0.5,x.intersp=0.5,
       pch=19,col=c("red","blue","purple"),bg="transparent",bty="n")
scalebar(c(191260,6060000),300000,"km",division.cex=1)

#position 205
plot(departeLight,lwd=0.8,border=grey(0.7),
     main="Position 205")
plot(regionsLight,lwd=1.8,add=TRUE)
plot(ambro,pch=as.numeric(as.character(ambro$SeqMeth)),
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
     add=TRUE)
plot(ambro[ambro@data[,12]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,12]!=0,]$SeqMeth)),
     col="red",cex=1.5,
     add=TRUE)
plot(ambro[ambro@data[,13]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,13]!=0,]$SeqMeth)),
     col="blue",cex=1.5,
     add=TRUE)
plot(ambro[ambro@data[,14]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,13]!=0,]$SeqMeth)),
     col="purple",cex=1.5,
     add=TRUE)
legend(57000,7160000,legend=c("Thr205.1","Thr205.2","Val205"),cex=1,
       pt.cex=1.8,y.intersp=0.5,x.intersp=0.5,
       pch=19,col=c("red","blue","purple"),bg="transparent",bty="n")

#position 376
plot(departeLight,lwd=0.8,border=grey(0.7),
     main="Position 376")
plot(regionsLight,lwd=1.8,add=TRUE)
plot(ambro,pch=as.numeric(as.character(ambro$SeqMeth)),
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
     add=TRUE)
plot(ambro[ambro@data[,7]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,7]!=0,]$SeqMeth)),
     col="red",cex=1.5,
     add=TRUE)
legend(57000,7160000,legend=c("Glu376"),cex=1,pt.cex=1.8,
       y.intersp=0.5,x.intersp=0.5,
       pch=19,col=c("red"),bg="transparent",bty="n")

#position 574
plot(departeLight,lwd=0.8,border=grey(0.7),
     main="Position 574")
plot(regionsLight,lwd=1.8,add=TRUE)
plot(ambro,pch=as.numeric(as.character(ambro$SeqMeth)),
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
     add=TRUE)
plot(ambro[ambro@data[,4]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,4]!=0,]$SeqMeth)),
     col="red",cex=1.5,
     add=TRUE)
plot(ambro[ambro@data[,9]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,9]!=0,]$SeqMeth)),
     col="blue",cex=1.5,
     add=TRUE)
legend(57000,7160000,legend=c("Arg574","Leu574"),cex=1,pt.cex=1.8,
       y.intersp=0.5,x.intersp=0.5,
       pch=19,col=c("red","blue"),bg="transparent",bty="n")

#position 578
plot(departeLight,lwd=0.8,border=grey(0.7),
     main="Position 578")
plot(regionsLight,lwd=1.8,add=TRUE)
plot(ambro,pch=as.numeric(as.character(ambro$SeqMeth)),
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
     add=TRUE)
plot(ambro[ambro@data[,8]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,8]!=0,]$SeqMeth)),
     col="red",cex=1.5,
     add=TRUE)
legend(57000,7160000,legend=c("Ile578"),cex=1,pt.cex=1.8,
       y.intersp=0.5,x.intersp=0.5,
       pch=19,col=c("red"),bg="transparent",bty="n")

#position 654
plot(departeLight,lwd=0.8,border=grey(0.7),
     main="Position 654")
plot(regionsLight,lwd=1.8,add=TRUE)
plot(ambro,pch=as.numeric(as.character(ambro$SeqMeth)),
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
     add=TRUE)
plot(ambro[ambro@data[,5]!=0,],
     pch=as.numeric(as.character(ambro[ambro@data[,5]!=0,]$SeqMeth)),
     col="red",cex=1.5,
     add=TRUE)
legend(57000,7160000,legend=c("Arg654"),cex=1,pt.cex=1.8,
       y.intersp=0.5,x.intersp=0.5,
       pch=19,col=c("red"),bg="transparent",bty="n")
scalebar(c(191260,6060000),300000,"km",division.cex=1)

par(op)

#export to .pdf 12 x 7 inches


##############################################################################/
#code with cropped maps Lambert 93####
##############################################################################/

op<-par(mar=c(0,0,0,0))
plot(departe.1,lwd=0.8,border=grey(0.7))
plot(regions.1,lwd=2.5,add=TRUE)
plot(ambro[ambro$RS==0,],
     pch=as.numeric(as.character(ambro[ambro$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro[ambro$RS!=0,],
     pch=as.numeric(as.character(ambro[ambro$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
scalebar(c(380000,6440000),50000,"km",division.cex=1)
par(op)
#export to .pdf 7 x 5.5 inches

op<-par(mar=c(0,0,0,0))
plot(departe.2,lwd=0.8,border=grey(0.7))
plot(regions.2,lwd=2.5,add=TRUE)
plot(ambro[ambro$RS==0,],
     pch=as.numeric(as.character(ambro[ambro$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro[ambro$RS!=0,],
     pch=as.numeric(as.character(ambro[ambro$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
scalebar(c(780000,6610000),50000,"km",division.cex=1)
par(op)
#export to .pdf 7 x 5.5 inches

op<-par(mar=c(0,0,0,0))
plot(departe.3,lwd=0.8,border=grey(0.7))
plot(regions.3,lwd=2.5,add=TRUE)
plot(ambro[ambro$RS==0,],
     pch=as.numeric(as.character(ambro[ambro$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro[ambro$RS!=0,],
     pch=as.numeric(as.character(ambro[ambro$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
scalebar(c(762000,6530000),50000,"km",division.cex=1)
par(op)
#export to .pdf 7 x 5.5 inches

# op<-par(mar=c(0,0,0,0))
# plot(departe.4,lwd=0.8,border=grey(0.7))
# plot(regions.4,lwd=2.5,add=TRUE)
# plot(ambro[ambro$RS==0,],
#      pch=as.numeric(as.character(ambro[ambro$RS==0,]$SeqMeth)),
#      col=rgb(0,0,0,150,maxColorValue=255),cex=2,
#      add=TRUE)
# plot(ambro[ambro$RS!=0,],
#      pch=as.numeric(as.character(ambro[ambro$RS!=0,]$SeqMeth)),
#      col=rgb(255,0,0,150,maxColorValue=255),cex=2,
#      add=TRUE)
# scalebar(c(630000,6370000),50000,"km",division.cex=1)
# par(op)
# #export to .pdf 7 x 5.5 inches

op<-par(mar=c(0,0,0,0))
plot(departe.5,lwd=0.8,border=grey(0.7))
plot(regions.5,lwd=2.5,add=TRUE)
plot(ambro[ambro$RS==0,],
     pch=as.numeric(as.character(ambro[ambro$RS==0,]$SeqMeth)),
     col=rgb(0,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
plot(ambro[ambro$RS!=0,],
     pch=as.numeric(as.character(ambro[ambro$RS!=0,]$SeqMeth)),
     col=rgb(255,0,0,150,maxColorValue=255),cex=2,
     add=TRUE)
scalebar(c(493000,6388000),25000,"km",division.cex=1)
par(op)
#export to .pdf 7 x 5.5 inches


##############################################################################/
#maps Random vs targeted####
##############################################################################/

#two maps, one screening, one monitoring
op<-par(mar=c(0,0,1,0),mfrow=c(1,2))
#original screening
plot(departe,lwd=0.8,border=grey(0.7),
     main="Screening (N=45)")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$RS==0 & ambro$SampRound=="Screening",],
     pch=1,
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.1,
     add=TRUE)
plot(ambro[ambro$RS!=0 & ambro$SampRound=="Screening",],
     pch=1,
     col=rgb(255,0,0,250,maxColorValue=255),cex=1.1,
     add=TRUE)
#NGS monitoring
plot(departe,lwd=0.8,border=grey(0.7),
     main="Monitoring (N=210)")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$RS==0 & ambro$SampRound!="Screening",],
     pch=3,
     col=rgb(50,100,0,150,maxColorValue=255),cex=0.4,
     add=TRUE)
plot(ambro[ambro$RS!=0 & ambro$SampRound!="Screening",],
     pch=3,
     col=rgb(255,0,0,250,maxColorValue=255),cex=0.4,
     add=TRUE)
scalebar(c(191260,6060000),300000,"km",division.cex=1)
par(op)
#export to .pdf 12 x 5 inches

#one single map without R/S information
op<-par(mar=c(0,0,1,0))
#original screening
plot(departe,lwd=0.8,border=grey(0.7),
     main="Sampling type")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$SampRound!="Screening",],
     pch=0,
     col=rgb(31,133,235,175,maxColorValue=255),cex=1,
     add=TRUE)
plot(ambro[ambro$SampRound=="Screening",],
     pch=1,
     col=rgb(213,179,0,175,maxColorValue=255),cex=1,
     add=TRUE)
legend(760000,6200000,
       legend=c("Screening (N=43)","Monitoring (N=210)"),
       cex=0.8,pt.cex=1,y.intersp=1.2,x.intersp=0.8,
       pch=c(1,0),
       col=c(rgb(213,179,0,175,maxColorValue=255),
             rgb(31,133,235,175,maxColorValue=255)),
       bg="transparent",bty="n")
scalebar(c(191260,6060000),300000,"km",division.cex=1)
par(op)


##############################################################################/
#maps phenotype####
##############################################################################/

#2 maps with only independent information
op<-par(mar=c(0,0,1,0),mfrow=c(1,2))
#Imazamox phenotype
plot(departe,lwd=0.8,border=grey(0.7),
     main="Imazamox (N=39)")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$Imz=="S",],
     pch=19,
     col=rgb(50,100,0,150,maxColorValue=255),cex=1,
     add=TRUE)
plot(ambro[ambro$Imz=="R",],
     pch=19,
     col=rgb(255,0,0,250,maxColorValue=255),cex=1,
     add=TRUE)
#Tribenuron phenotype
plot(departe,lwd=0.8,border=grey(0.7),
     main="Tribenuron (N=36)")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$Tbn=="S",],
     pch=19,
     col=rgb(50,100,0,150,maxColorValue=255),cex=1,
     add=TRUE)
plot(ambro[ambro$Tbn=="R",],
     pch=19,
     col=rgb(255,0,0,250,maxColorValue=255),cex=1,
     add=TRUE)
scalebar(c(191260,6060000),300000,"km",division.cex=1)
par(op)
#export to .pdf 12 x 5 inches

#2 maps with both information
op<-par(mar=c(0,0,1,0),mfrow=c(1,2))
#Imazamox phenotype
plot(departe,lwd=0.8,border=grey(0.7),
     main="Imazamox (N=39)")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$Imz=="S",],
     pch=19,
     col=rgb(50,100,0,100,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Imz=="R" & (ambro$Tbn=="S"|ambro$Tbn=="Fail"),],
     pch=19,
     col=rgb(255,165,0,180,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Imz=="R" & ambro$Tbn=="R",],
     pch=19,
     col=rgb(255,0,0,210,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Imz=="Fail",],
     pch=21,
     col="black",bg="transparent",cex=1.2,
     add=TRUE)
#Tribenuron phenotype
plot(departe,lwd=0.8,border=grey(0.7),
     main="Tribenuron (N=36)")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[ambro$Tbn=="S",],
     pch=19,
     col=rgb(50,100,0,150,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Tbn=="R" & (ambro$Imz=="S"|ambro$Imz=="Fail"),],
     pch=19,
     col=rgb(255,165,0,180,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Tbn=="R" & ambro$Imz=="R",],
     pch=19,
     col=rgb(255,0,0,210,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Tbn=="Fail",],
     pch=21,
     col="black",bg="transparent",cex=1.2,
     add=TRUE)
scalebar(c(191260,6060000),300000,"km",division.cex=1)
par(op)
#export to .pdf 12 x 5 inches


#one map for the 4 possibilities
op<-par(mar=c(0,0,1,0))
#Imazamox and/or Tribenuron phenotypes
plot(departe,lwd=0.8,border=grey(0.7),
     main="Bioassay phenotype (N=41)")
plot(regions,lwd=1.8,add=TRUE)
plot(ambro[(ambro$Imz=="S" & ambro$Tbn=="S")|
             (ambro$Imz=="S" & ambro$Tbn=="Fail")|
             (ambro$Imz=="Fail" & ambro$Tbn=="S"),],
     pch=21,col="transparent",
     bg=rgb(50,100,0,100,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Imz=="R" & (ambro$Tbn=="S"|ambro$Tbn=="Fail"),],
     pch=21,col="transparent",
     bg=rgb(255,205,42,210,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Tbn=="R" & (ambro$Imz=="S"|ambro$Imz=="Fail"),],
     pch=21,col="transparent",
     bg=rgb(255,162,12,210,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$Imz=="R" & ambro$Tbn=="R",],
     pch=21,col="transparent",
     bg=rgb(255,30,30,210,maxColorValue=255),cex=1.2,
     add=TRUE)
plot(ambro[ambro$RS==1 & ambro$Imz!="Untest",],
     pch=21,
     col="blue",bg="transparent",cex=1.2,
     add=TRUE)
par(op)


##############################################################################/
#END
##############################################################################/