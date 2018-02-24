#4.1
hair<-read.csv("hair.csv")
hair<-hair[1:7,1:5]
hair<-HairEyeColor
eyehairfreq<-apply(hair,c("Eye","Hair"),sum)
eyehairprop<-eyehairfreq/sum(eyehairfreq)
hairfreq<-apply(hair,c("Hair"),sum)
hairprop<-hairfreq/sum(hairfreq)

eyefreq<-apply(hair,c("Eye"),sum)
eyeprop<-eyefreq/sum(eyefreq)
eyehairprop["Blue",]/eyeprop["Blue"]

#probability of  hair colors given brown eyes
eyehairprop["Brown",]/eyeprop["Brown"]

#probability of  eye colors given brown hair
eyehairprop[,"Brown"]/hairprop["Brown"]

#aggregate group by row for data.frame, time series data, for formula

#apply group by row or column for matrix or array!! if it is a data.frame, it will
#transfer to matrix. If the type of the numeric and character were not same. It 
#will failed.

#4.2
N = 500       # Specify the total number of flips, denoted N.
pHeads = 0.8  # Specify underlying probability of heads.
# Generate a random sample of N flips (heads=1, tails=0):
flipSequence = sample( x=c(0,1), prob=c(1-pHeads,pHeads), size=N, replace=TRUE)
# Compute the running proportion of heads:
r = cumsum( flipSequence ) # Cumulative sum: Number of heads at each step.
n = 1:N                    # Number of flips at each step.
runProp = r / n            # Component by component division.
# Graph the running proportion:
plot( n , runProp , type="o" , log="x" , col="skyblue" ,
      xlim=c(1,N) , ylim=c(0.0,1.0) , cex.axis=1.5 ,
      xlab="Flip Number" , ylab="Proportion Heads" , cex.lab=1.5 ,
      main="Running Proportion of Heads" , cex.main=1.5 )
# Plot a dotted horizontal reference line:
abline( h=pHeads , lty="dotted" )


#4.3
#A   1/6
#B   1/3

#4.4

# Graph of normal probability density function, with comb of intervals.
#meanval = 0.0               # Specify mean of distribution.
#sdval = 0.2                 # Specify standard deviation of distribution.
xlow  = 0 # Specify low end of x-axis.
xhigh = 1 # Specify high end of x-axis.
dx = 0.001               # Specify interval width on x-axis
# Specify comb of points along the x axis:
x = seq( from = xlow , to = xhigh , by = dx )
# Compute y values, i.e., probability density at each value of x:
y = 6*x*(1-x)
# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
plot( x , y , type="h" , lwd=1 , cex.axis=1.5
      , xlab="x" , ylab="p(x)" , cex.lab=1.5 ,
       main="Normal Probability Density" , cex.main=1.5 )
lines( x , y , lwd=3 ,  col="skyblue" )
#B
#deriving the intergral analytically:
#6x(1-x)dx

#C
#The integral is 1 satisfy the equation

#D the maximual value is 0.5

#4.5
source("DBDA2E-utilities.R")
# Graph of normal probability density function, with comb of intervals.
meanval = 0.0               # Specify mean of distribution.
sdval = 1                # Specify standard deviation of distribution.
xlow  = meanval - 3.5*sdval # Specify low end of x-axis.
xhigh = meanval + 3.5*sdval # Specify high end of x-axis.
dx = sdval/10               # Specify interval width on x-axis
# Specify comb of points along the x axis:
x = seq( from = xlow , to = xhigh , by = dx )
# Compute y values, i.e., probability density at each value of x:
y = ( 1/(sdval*sqrt(2*pi)) ) * exp( -.5 * ((x-meanval)/sdval)^2 )
# Plot the function. "plot" draws the intervals. "lines" draws the bell curve.
openGraph(width=7,height=5)
plot( x , y , type="h" , lwd=1 , cex.axis=1.5
      , xlab="x" , ylab="p(x)" , cex.lab=1.5 ,
       main="Normal Probability Density" , cex.main=1.5 )
lines( x , y , lwd=3 ,  col="skyblue" )
# Approximate the integral as the sum of width * height for each interval.
area = sum( dx * y )
# Display info in the graph.

#B
#Now use the normal curve to describe the following belief. 
#Suppose you believe that women’s heights follow a bell-shaped distribution, 
#centered at 162 cm with about two-thirds of all women having heights between 
#147 and 177 cm. What should be the μ and σ parameter values

meanval <- 162              # Specify mean of distribution.
sdval <- 177-162
#The area under (u-sd,u+sd) is 0.333

#6
#School children were surveyed regarding their favorite foods. 
#Of the total sample, 20% were 1st graders, 20% were 6th graders, 
#and 60% were 11th graders. For each grade, the following table shows the 
#proportion of respondents that chose each of three foods as their favorite:
grade_proportions<-c(0.2,0.2,0.6)
data<-matrix(c(0.3,0.6,0.1,0.6,0.3,0.1,0.3,0.1,0.6),nrow =3 ,
             dimnames = list(Grade=c("1st","6th","11th"),
                             food=c("IceCream","Fruit","FrenchFries")),byrow = T)

join_probabilty<-data*grade_proportions
join_probabilty
#P(1st,Icecream)=0.06
#P(1st)*P(Icecream)=0.072=0.2*0.36
#P(1st,Icecream)!=P(1st)*P(Icecream) so they are not independent
P_icecream<-sum(join_probabilty[,"IceCream"])














