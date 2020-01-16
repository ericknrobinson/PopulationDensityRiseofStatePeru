#Code for Roscoe et al. "Population density and size facilitate interactive capacity and the rise of the state"
#Submitted to Philosophical Transcactions of the Royal Society B, CROSSDEM Special Issue

#Making Figure 3. SPD and Monte-Carlo Model Test using the rcarbon v1.3 (Bevan and Crema 2017) package.
require(rcarbon)

#Calibrate Dates
n.coast.peru.cal <- calibrate(x = n.coast.peru$C14_date, errors = n.coast.peru$Error, calCurves = "shcal13", normalised = F, calMatrix = T)

#Bin Dates Per Site
n.coast.peru.bin <- binPrep(sites = n.coast.peru$Site_Name, ages = n.coast.peru$C14_date, h = 200)

#SPD with 1000 MC Simulations
n.coast.peru.expnull.1000cut <- modelTest(n.coast.peru.cal, errors = n.coast.peru$Error, bins = n.coast.peru.bin, nsim = 1000, runm = 100, timeRange = c(10000,1000), model = "exponential", datenormalised = F)

#Plot SPD
plot(n.coast.peru.expnull.1000cut, xaxt = "n")
axis(1, at = c(10000,9000,8000,7000,6000,5000,4000,3000,2000,1000))

#Summarize Results
summary(n.coast.peru.expnull.1000cut)

#Extracting site frequency data per 200 year calibrated date bins for Fig. 4
#Calibrate
df.x = calibrate(df$cra,df$errors,ids=df$ID)
#Extract sigma ranges
n.coast.peru.summary =summary(n.coast.peru.cal,prob=0.954)




