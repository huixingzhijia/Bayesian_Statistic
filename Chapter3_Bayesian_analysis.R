 matrix( 1:6 , nrow=2 ,       # with names of dimensions and rows and columns
          dimnames=list( TheRowDimName=c("Row1Name","Row2Name") ,  
                         TheColDimName=c("Col1Name","Col2Name", "Col3Name") ) )
 
 matrix( 1:6 , nrow=2 , byrow=TRUE )

 xfol = factor( x , levels=c("low","medium","high") , ordered=TRUE ,
                labels=c("Bottom SES","Middle SES","Top SES") ) 
xfol 



MyList <- list( "a"=1:3 , "b"=matrix(1:6,nrow=2) , "c"="Hello, world." )
MyList
MyList[[1]]     # the contents of the first list item
MyList[[1]][2]# the second element of the first list item
MyList[1]## the first list item, including its name
#matrix the data type should be same. However, the data.frame like list
#the data type can be different. 

d <- data.frame( Integers=1:3 , NumberNames=c("one","two","three") )
d[[2]]#the second element content
d[2]#the second element with its name
d[,2]
d[2,2]

#saving files
hair<-read.csv("hair.csv",header=T)
hair<-hair[1:7,1:5]

#R aggregate function:
#The aggregate function provides the answer. The  first argument, 
#specified as "x=," is the data we want summarized. The "by=" argument is a 
#list of factors for grouping the data. The "FUN=" argument is the function 
#that should be applied to the groups of data. For example:

#Summarize aggregation function

aggregate( x=hair$Number,by=list(Gender=hair$Gender,Hair=hair$Hair),FUN=median )
aggregate( Number ~ Gender + Hair ,data=hair , FUN=median )

#aggregation to see how many times various levels of a factor occure, or
#how many times combinations of factor level occur.
aggregate(x=list(count=rep(1,nrow(hair))),by=list(gender=hair$Gender,hair=hair$Hair),FUN=sum)
#there is no 0

hair
#another way is generate with table functions:

table(list(Gender=hair$Gender,hair=hair$Hair))

#apply
a<-array( 1:24 , dim=c(3,4,2) , # 3 rows, 4 columns, 2 layers
          dimnames= list( RowDimName = c("R1","R2","R3") ,
                          ColDimName = c("C1","C2","C3","C4") ,
                          LayDimName = c("L1","L2") ) )
apply(a,MARGIN =c(2,3),FUN = sum)
#Margin specifies which dimensions to retain

#Suppose we want to know the sums of the values within columns and layers, 
#collapsed across rows. This means we want to retain the second and third
#dimensions, while collapsing across the other dimension

library(reshape2)
am<-melt(a)
am

asqplusb<-function(a,b=1){
  c=a^2+b
  return(c)
}
asqplusb(3,2)
x=5
if(x<=3){
  show("Small")
}else{
  show("big")
}

countdown=0
for (countdown in 1:5) {
  show(countdown)
}







