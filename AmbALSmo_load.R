##############################################################################/
##############################################################################/
#Loading packages and data sets
##############################################################################/
##############################################################################/

#loading the necessary packages
library(rgdal)
library(rgeos)
library(plotrix)
library(mapplots)
library(raster)
library(RColorBrewer)


#load geographical data
load("data/REG_SHP.RData")
load("data/DEP_SHP.RData")

#changing the projection of the map to WGS84
DEP_SHP.wgs<-spTransform(DEP_SHP,
                         CRS("+proj=longlat +datum=WGS84"))
#changing the projection of the map
REG_SHP.wgs<-spTransform(REG_SHP,
                         CRS("+proj=longlat +datum=WGS84"))

#crop a subparts of the map
DEP_SHP.1<-crop(DEP_SHP,extent(364666.8,590540.8,6431338.8,6612096.8))
DEP_SHP.2<-crop(DEP_SHP,extent(633281.3,844866.6,6600367.6,6790638.4))
DEP_SHP.3<-crop(DEP_SHP,extent(747072.2,963827.9,6355840.0,6550171.5))
DEP_SHP.4<-crop(DEP_SHP,extent(467049.9,697619.1,6204268.4,6388990.7))
DEP_SHP.5<-crop(DEP_SHP,extent(487049.9,602334.5,6306629.5,6398990.7))
REG_SHP.1<-crop(REG_SHP,extent(364666.8,590540.8,6431338.8,6612096.8))
REG_SHP.2<-crop(REG_SHP,extent(633281.3,844866.6,6600367.6,6790638.4))
REG_SHP.3<-crop(REG_SHP,extent(747072.2,963827.9,6355840.0,6550171.5))
REG_SHP.4<-crop(REG_SHP,extent(467049.9,697619.1,6204268.4,6388990.7))
REG_SHP.5<-crop(REG_SHP,extent(487049.9,602334.5,6306629.5,6398990.7))

DEP_SHP.wgs.1<-crop(DEP_SHP.wgs,extent(-1.25,1.57,44.9,46.6))
DEP_SHP.wgs.2<-crop(DEP_SHP.wgs,extent(2.13,4.95,46.5,48.2))
DEP_SHP.wgs.3<-crop(DEP_SHP.wgs,extent(3.59,6.41,44.3,46.0))
DEP_SHP.wgs.4<-crop(DEP_SHP.wgs,extent(0.15,2.97,42.9,44.6))
REG_SHP.wgs.1<-crop(REG_SHP.wgs,extent(-1.25,1.57,44.9,46.6))
REG_SHP.wgs.2<-crop(REG_SHP.wgs,extent(2.13,4.95,46.5,48.2))
REG_SHP.wgs.3<-crop(REG_SHPs.wgs,extent(3.59,6.41,44.3,46.0))
REG_SHP.wgs.4<-crop(REG_SHP.wgs,extent(0.15,2.97,42.9,44.6))


##############################################################################/
#defining additional function for the mapping####
##############################################################################/

#function for a scale, found in "Auxiliary Cartographic Functions in R: 
#North Arrow, Scale Bar, and Label with a Leader Arrow", Tanimura et al 2007, 
#J of Statistical software
#The code has been slightly modified in order to convert the meter in km
scalebar <- function(loc,length,unit="km",division.cex=.8,...) {
  if(missing(loc)) stop("loc is missing")
  if(missing(length)) stop("length is missing")
  x <- c(0,length/c(4,2,4/3,1),length*1.1)+loc[1]
  y <- c(0,length/(10*3:1))+loc[2]
  cols <- rep(c("black","white"),2)
  for (i in 1:4) rect(x[i],y[1],x[i+1],y[2],col=cols[i])
  for (i in 1:5) segments(x[i],y[2],x[i],y[3])
  labels <- (x[c(1,3)]-loc[1])/1000
  labels <- append(labels,paste((x[5]-loc[1])/1000,unit))
  text(x[c(1,3,5)],y[4],labels=labels,adj=c(0.5,0),cex=division.cex)
}


##############################################################################/
#Writing info session for reproducibility####
##############################################################################/

sink("session_info.txt")
print(sessioninfo::session_info())
sink()
#inspired by an R gist of François Briatte: 
#https://gist.github.com/briatte/14e47fb0cfb8801f25c889edea3fcd9b


##############################################################################/
#END
##############################################################################/