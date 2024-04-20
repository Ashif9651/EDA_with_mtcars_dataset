library(graphics)

# to load dataset pkg 
library(datasets)


# to load 'mtcars'

data("mtcars")

mtcars$mpg


#view total number of records
dim(mtcars)

#view all the attributes
names(mtcars)

# To analyze the structure of given datase
#summarization of data
str(mtcars)

#summarize dataset
'''
 Min: The minimum value.
    1st Qu: The value of the first quartile (25th percentile).
    Median: The median value.
    Mean: The mean value.
    3rd Qu: The value of the third quartile (75th percentile).
    Max: The maximum value. 
    
'''    
summary(mtcars)

#Analysis : Visualization
#plot()- function is used to plot R objects

#syntax : plot(x,y,type,main,sub,xlab,ylab,asp,col)
'''
x     : x coordinates
y     : y coordinates
type  : 'p' for points, 'l' for lines, 'b' both, 'h' high density plots
main  : title
sub   : subtitle 
xlab  : label for x coordinate
ylab  : label for y coordinate
asp   : Aspect ratio (y/x)
col   : color of the points/lines
'''

#Objective :1
#to plot mpg(Milles per gallon) vs no. of cars

plot(mtcars$mpg,xlab = 'Number of cars',ylab = 'Milles per gallaon',col='red')

plot(mtcars$mpg,type = 'l' ,xlab = 'Number of cars',ylab = 'Milles per gallaon',col='red')

#Findings-1


#Objective :2
# find the relation bt hp ans mpg
plot(mtcars$hp,mtcars$mpg,xlab = 'HotsePower',ylab = 'Miles per gallon',
     type = 'h',col='magenta')

#Findings-2
#finding hp and mpg variables will have negative corelation 


#Bar plot
#Horizontal
barplot(mtcars$hp, xlab = 'Horse Power', col='cyan', horiz=TRUE )

#Vertical
barplot(mtcars$hp, ylab = 'Horse Power', xlab='no. of cars', col='cyan', horiz=FALSE )

#Objective-4
#To find histogram for mpg 
hist(mtcars$mpg,xlab = 'Miles per gallon',ylab = 'Hostogram for mpg', col = 'gold')
#findings :  cars having mpg bt:  10-15 range is only 6

#box plot
#Objective 5

#draw box plot for disp and hp
boxplot(mtcars[3:4])


#====================================

#Adv plot with ggplot2 package
#consist of
'''
data
layers
scales
coordinates
Faceting
Themes

Three basic major componenet to buikd ggplot
1. Data : Dataset to be plotted
2. Asthetics : mappling of data to visualization
3. Geometric/Layers: visual elements user for data
 syntax
 ggplot(data=NULL.mapping=aes() + geom_function)



'''

install.packages("ggplot2")
#Analysis using mtcars dataset
#Objectiv 6:
# To plot scatter plot for cyl vs engine type(vs)

#Data prepration:
#lets first convert categorical col to factors

mtcars$am <- as.factor(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$gear <- as.factor(mtcars$gear)

#to scatter plot
ggplot(mtcars,aes(x=cyl,y=vs))+geom_point()

# to over come with overplotting prob lets add certain noise to the dataset
ggplot(mtcars,aes(x=cyl,y=vs))+geom_jitter(width = 0.1,alpha= 0.5,col = 'red')

#Multi variate plotting
# more than three variable in graph
#using color asethetic ro represent third variable with legends on the right side

ggplot(mtcars, aes(x=cyl, y=vs, color=am)) + geom_jitter(width=0.1)


#to add labels

ggplot(mtcars, aes(x=cyl, y=vs, color=am)) + geom_jitter(width=0.1)+
  labs(x='Cylinders',y='Engine type',color='Transmission(0=automatic,1=manual)')

ggplot(mtcars, aes(x=cyl, y=vs, color=am)) + geom_jitter(width=0.1)+
  labs(x='Cylinders',y='Engine type',color='Transmission(0=automatic,1=manual)')


#To plot with shape =1 and size = 4
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(size = 4, shape = 1) +
  labs(x = "Weight",y = "Miles per Gallon", color = "Cylinders")


#Stacked Bar Plots
##To draw a bar plot of cyl(Number of Cylinders) according to the Transmission 
# type
# using geom_bar() and fill()



ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar() +
  labs(x = "Cylinders", y = "Car count", fill = "Transmission")

#Themes
# It is used to change the attributes of non-data elements of our plot like text, lines, background, 
# etc. We use the theme_function() to make changes to these elements for data visualization in R
'''Some of the commonly used theme function is as follows:
 theme_bw() :- For white background and gray grid lines
 theme_gray:- For gray background and white grid lines
 theme_linedraw:- For black lines around the plot
 theme_light:- For light gray lines and axis
 theme_void:- An empty theme, useful for plots with non-standard coordinates or for 
drawings
 theme_dark():- A dark background designed to make colors pop out
'''

ggplot(mtcars, aes(x = cyl, fill = am)) +
geom_bar(position = "fill") +
theme_classic()+
labs(x = "Cylinders",y = "Proportion",fill = "Transmission")



#Faceting
# It is used to further drill down data and split the data by one or more variables, and then plot the 
# subsets of the data altogether for optimum data visualization in R.
##To facet the following plot according to gear(Number of Gears(3,4,5)), we 
#use
#facet_grid() function as follows:

ggplot(mtcars, aes(x = cyl, fill = am)) +
geom_bar() + facet_grid(.~gear)+ 
#facet_grid(rows ~ columns)theme_bw() +
  labs(title = "Cylinder count by
  transmission and Gears",x = "Cylinders", y = "Count",fill =
"Transmission")




