# https://peat-clark.github.io/BIO381/veganTutorial.html
# Vegan Tutorial
# Peter Clark

Sys.Date()

# Datasets
library(vegan)

#data(package = "vegan") ## names of data sets in the package
data(dune) # Vegetation and Environment in Dutch Dune Meadows
str(dune) #a data frame of observations of 30 species at 20 sites

# Diversity
diversity(dune,index = "simpson") # calculate Simpson's 1-D Index of Diversity for each site. # closer to 1 = greater diversity

simpson <- diversity(dune, "simpson") # or assign to var.
simpson 

shannon <- diversity(dune) # note that Shannon's is default
shannon #Typically ranges from 1.5 - 3.4, higher = more diverse 

par(mfrow = c(1, 2))  # use par to generate panels with 1 row of 2 graphs
hist(simpson)
hist(shannon)

par(mfrow = c(1, 2))
bray = vegdist(dune, "bray") 
gower = vegdist(dune, "gower")
hist(bray, xlim = range(0.0,1.0))
hist(gower, xlim = range(0.0,1.0))

    par(mfrow = c(1, 1))

# Rarefaction
spAbund <- rowSums(dune)  #gives the number of individuals found in each plot
spAbund # view observations per plot 

raremin <- min(rowSums(dune))  #rarefaction uses the smallest number of observations per sample to extrapolate the expected number if all other samples only had that number of observations
raremin # view smallest # of obs (site 17)

sRare <- rarefy(dune, raremin) # now use function rarefy
sRare #gives an "expected"rarefied" number of species (not obs) if only 15 individuals were present

rarecurve(dune, col = "blue") # produces rarefaction curves # squares are site numbers positioned at observed space. To "rarefy" a larger site, follow the rarefaction curve until the curve corresponds with the lesser site obs. This gives you rarefied species richness

# Non-Metric Multidimensional Scaling
set.seed(2) # random no. generator / way to specify seeds, 2=no. of integers?
community_matrix=matrix(
   sample(1:100,300,replace=T),nrow=10, # counts up to 100, 300 cells
   dimnames=list(paste("community",1:10,sep=""),paste("sp",1:30,sep="")))
head(community_matrix)

example_NMDS=metaMDS(community_matrix, # Our community-by-species matrix
                     k=2) # The number of reduced dimensions. Increase if high stress is problem. 

plot(example_NMDS)

ordiplot(example_NMDS,type="n") #Ordination plot function especially for congested plots
orditorp(example_NMDS,display="species",col="red",air=0.01) #The function adds text or points to ordination plots
orditorp(example_NMDS,display="sites",cex=1.25,air=0.01)

treat=c(rep("Treatment1",5),rep("Treatment2",5))
ordiplot(example_NMDS,type="n")
ordihull(example_NMDS,groups=treat,draw="polygon",col="grey90",label=F)
orditorp(example_NMDS,display="species",col="red",air=0.01)
orditorp(example_NMDS,display="sites",col=c(rep("green",5),rep("blue",5)),
   air=0.01,cex=1.25)

#spider plot
ordiplot(example_NMDS,type="n")
ordispider(example_NMDS,groups=treat)
orditorp(example_NMDS,display="species",col="red",air=0.01)
orditorp(example_NMDS,display="sites",col=c(rep("green",5),rep("blue",5)),
         air=0.01,cex=1.25)

# Define random elevations for previous example
elevation=runif(10,0.5,1.5)
# Use the function ordisurf to plot contour lines
ordisurf(example_NMDS,elevation,main="",col="forestgreen")

# Finally, display species on plot
orditorp(example_NMDS,display="species",col="grey30",air=0.1,
   cex=1)

# unused code
plot(0:10,0:10,type="n",axes=F,xlab="Abundance of Species 1",ylab="")
axis(1)
points(5,0); text(5.5,0.5,labels="community A")
points(3,0); text(3.2,0.5,labels="community B")
points(0,0); text(0.8,0.5,labels="community C")

plot(0:10,0:10,type="n",xlab="Abundance of Species 1",
     ylab="Abundance of Species 2")
points(5,5); text(5,4.5,labels="community A")
points(3,3); text(3,3.5,labels="community B")
points(0,5); text(0.8,5.5,labels="community C")

# install.packages("scatterplot3d")
library(scatterplot3d) # an R package for the visualization of multivariate data in a three dimensional space.
d<-scatterplot3d(0:10,0:10,0:10,type="n",xlab="Abundance of Species 1",
  ylab="Abundance of Species 2",zlab="Abundance of Species 3"); d

d$points3d(5,5,0); text(d$xyz.convert(5,5,0.5),labels="community A")
d$points3d(3,3,3); text(d$xyz.convert(3,3,3.5),labels="community B")
d$points3d(0,5,5); text(d$xyz.convert(0,5,5.5),labels="community C")

sessionInfo()

