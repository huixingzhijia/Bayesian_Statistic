source("DBDA2E-utilities.R")  # Load definitions of graphics functions etc.

source("BernGrid.R")          # Load the definition of the BernGrid function
Theta = seq( 0 , 1 , length=1001 )  # Specify fine comb for Theta.
pTheta = pmin( Theta , 1-Theta )
pTheta = pTheta/sum(pTheta)
Data = c(rep(0,3),rep(1,1))
# Triangular shape for pTheta.
# Make pTheta sum to 1.0
# Same as c(0,0,0,1). 25% heads with N=4.
openGraph(width=5,height=7)  # Open a graphics window.
posterior = BernGrid( Theta, pTheta , Data , plotType="Bars" ,
                      showCentTend="Mode" , showHDI=TRUE , showpD=FALSE )
#saveGraph(file="BernGridExample",type="jpg")

#5.1

#use the previous result as our prior or believe for the following questions
prior=0.019#the probability that person have disease prior
p_nd<-1-prior
p_positive_d<-0.99
p_negative_d<-1-p_positive_d
p_positive_nd<-0.05
p_negative_nd<-1-p_positive_nd
P_disease_negative<-prior*p_negative_d/(prior*p_negative_d+p_nd*p_negative_nd)
P_disease_negative

#5.2

N1<-100000*0.05*(1-0.001)#test positive while do not have disease
N1

N2<-99900-N1#test negative while don't have disease
N2

N_positive<-(99+N1)
N3
N_negative<-1+N2
N_negative


#B
P_d_positive<-99/N_positive
P_d_positive#match with Bayesian rule

#C Markov Chain
P_positive_d<-10000*99/100#according to the discription
#test positive rate is 99% of the people who have disease
P_positive_d#9900

P_positive_nd<-9990000*0.05#the number according to the discription
P_positive_nd#499500

#if we re-testing everyone who has tested positive on the first test
P_negative_d<-9900*0.01
P_negative_d

P_negative_nd<-499500*0.95#the number 499500 become the prior number
P_negative_nd

#D
rate<-99/(474525+99)
rate
#Same as the exercise 5.1

#5.3

#A
proir<-0.001
p_nd<-1-prior
p_positive_d<-0.99
p_negative_d<-1-p_positive_d
p_positive_nd<-0.05
p_negative_nd<-1-p_positive_nd
P_disease_negative<-prior*p_negative_d/(prior*p_negative_d+p_nd*p_negative_nd)
P_disease_negative

#B
#the posterior result from previous is the prior of this one
prior<-P_disease_negative
p_nd<-1-prior
p_positive_d<-0.99
p_negative_d<-1-p_positive_d
p_positive_nd<-0.05
p_negative_nd<-1-p_positive_nd
P_disease_positive<-prior*p_positive_d/(prior*p_positive_d+p_nd*p_positive_nd)
P_disease_positive
#the result was matched 






