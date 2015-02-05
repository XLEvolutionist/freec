#################################
# Draws Graphs from FREEC output
#################################

# Simon Renny-Byfield, UC Davis, Feb '15, version 1

###
# Load in required modules
###
library(data.table)

#################################
# Set the working dir, grab files
#################################
setwd("/Users/simonrenny-byfield/GitHubRepos/freec/ratios")
# grab the files
files<-list.files(pattern= c("ratio.txt$"))

#############################
# Set pdf printing conditions
#############################

# open up a pdf for printing the plots
#pdf("copy_numberGraphs.pdf")
# modify par
par (mfcol = c(1,1))
################################
# Print a figure for each sample
################################

# for each of the files read in the data and print a figure
for ( i in files ) {
  # open up a pdf for printing the plots
  png(paste0(i,"_numberGraphs.png"))
  # read in the data using fread() (data.table)
  data<-fread(i,header=TRUE)
  # subset to ten
  #CNVS<-subset(CNVS,V1==10)
  #get chr 10
  chr<-subset(data, subset = Chromosome==10)
  #now try to plot this:
  plot(chr$Start,2*chr$Ratio, ylim = c(0,6), cex = 0.03, col = "cornflowerblue", 
                  xlab="position (bp)", ylab="normalized copy number", main =i )
  points(chr$Start,chr$CopyNumber, cex = 0.3, pch =15)
  #segments(x0=CNVS$V2,x1=CNVS$V3,y0=CNVS$V4,y1=CNVS$V4, lwd=4, col = "black")
  #segments(x0=CNVS$V2,x1=CNVS$V3,y0=CNVS$V4,y1=CNVS$V4, lwd=4, col = "red")
  #close the graphics device
  dev.off()
}#for



