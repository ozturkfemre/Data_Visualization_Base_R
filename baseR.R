### Data Visualization Project ###
##################################

# Data visualization can be defined as the use of graphical or pictorial representations to present data in a way that makes it easier to understand, analyze, and communicate.
# It involves the use of visual elements such as charts, graphs, and maps to help users better understand and interpret complex data sets. Data visualization is an important tool for exploratory data analysis, as well as for communicating results to others.
# By presenting data in a visual format, data visualization can also help to reveal new connections and insights that might not be apparent from a purely numerical or textual analysis.
# Effective data visualization allows viewers to quickly identify patterns, trends, and relationships within the data, and can be used to highlight key insights or communicate complex ideas. 

##############
### Base R ###
##############

# In base R, there are many functions that can be used to create different types of plots. 
# Although there is no clear distinction between high-level and low-level functions, I like to divide functions as such.
# I believe that there are some functions which can be called as high-level plotting functions tend to provide a convenient way to create a specific type of plot with a relatively small amount of code.
# On the other hand, there are some functions which can be called as low-level plotting functions provide more control and flexibility, but require more coding to create a plot.

# At this point, it needs to be noted that the package `ggplot2`, which will be explained later in this project, is built around the concept of "grammar of graphics", which means that it provides a set of rules for building plots by combining basic building blocks or components.
# It is possible to think low-level functions as components in the `ggplot2` package.

############################
### High Level Functions ###
############################

# There are five high-level plotting functions in the base R. There functions can be listed as follows:

# barplot() 
# pie() 
# hist() 
# boxplot() 
# plot() 

###############
### Barplot ###
###############

# The barplot() function in base R is used to create bar charts, which are a type of graph that displays categorical data as rectangular bars with heights or lengths proportional to the values they represent.
# By looking at the relative heights or lengths of the bars, it might be possible to quickly compare the values and identify any trends or patterns.
# The barplot() function in base R has several arguments that can be used to customize the appearance and behavior of the resulting bar chart. 

# Here are some of the most commonly used arguments of the barplot() function: 

# height - a vector or matrix of values that represent the heights of the bars. This argument is required.
# names.arg - a vector of names or labels for the bars. The length of this vector should be equal to the length of the height vector.
# col - a vector of colors for the bars. The length of this vector should be equal to the length of the height vector.
# border - the color of the borders of the bars. The default value is "black".
# main - a main title for the plot.
# xlab - a label for the x-axis.
# ylab - a label for the y-axis.
# legend.text - a vector of labels for the legend.
# args.legend - a list of arguments to control the appearance of the legend.
# width - the width of the bars. The default value is 0.5.
# space - the amount of space between the bars. The default value is 1.
# horiz - a logical value that controls the orientation of the bars. If TRUE, the bars are horizontal; if FALSE, they are vertical. The default value is FALSE.
# density - the density of shading lines in the bars. The default value is 1.
# angle - the angle of shading lines in the bars. The default value is 45.

# Lets create a vector for barplot example:
set.seed(111)
x1 <- sample(LETTERS[1:5], size = 20, rep= T)
let <- table(x1)

# basic barplot() looks like the following:
barplot(let)

# here how it looks like if I add some of the arguments
barplot(let, main = "Title of the plot",  
        xlab = "X axis", 
        ylab = "Y axis", 
        horiz = T, 
        col = c("red", "blue", "gray1", "navy", "gold"), # assigns colors by order
        xlim = c(0,7), # limit values of the x axis
        legend.text = c("Group 1", "Group 2", "Group 3", "Group 4", "Group 5")) # add legends by order

# Advantages:
  
# Clear representation of data: Bar plots are an effective way to represent categorical data as they allow easy visualization of the data.
# Easy to understand: Bar plots are intuitive and easy to understand, even for individuals who are not familiar with the data.
# Comparing groups: They allow for easy comparison of data across different categories or groups.
# Flexibility: Bar plots can be used to display many different types of data, including frequency distributions, percentages, and counts.
# Customizability: They can be customized by changing the colors, labels, and orientation of the bars to make them more visually appealing.

# Disadvantages:
  
# Limited to categorical data: Bar plots are only useful for categorical data and may not be appropriate for continuous data.
# Limited to a small number of categories: If there are too many categories, the plot may become too cluttered to read easily.
# Misleading scaling: If the scale of the y-axis is not appropriate, the bars can be misleading and give the impression that the differences between the data points are greater or smaller than they actually are.
# Can hide differences: If the bars are too wide or too close together, differences between the data points may be obscured, making it difficult to accurately compare the data.
# Limitations in data complexity: Bar plots may not be the best choice for displaying complex data, and other visualization methods may be more appropriate.


########################
### stacked bar plot ###
########################

# A stacked bar plot is a type of bar chart that displays multiple variables by stacking them on top of each other. 
# Each bar in the chart represents a category, and the height or length of the bar represents the total value of the variables being stacked. 
# The stacked bar plot breaks down the total value of each category into different segments, with each segment representing a different variable.

set.seed(111)
x1 <- sample(LETTERS[1:5], size = 50, rep = T)        
x2 <- sample(c("Group 1", "Group 2"), size = 50, rep = T)

let2 <- table(x1,x2)

# here how stacked bar plot looks like 
barplot(let2, xlab = "X axis",
        ylab = "Y axis", 
        col = c("red", "blue", "gray1", "navy", "gold"),
        legend.text = rownames(let2),
        xlim = c(0,3))


##########################
### clustered bar plot ###
##########################

# A clustered barplot, also known as a grouped barplot, is a type of bar chart that displays multiple variables for each category by grouping them together. 
# In a clustered barplot, each category has multiple bars, one for each variable being displayed, and the bars for each variable are grouped together side by side.

barplot(let2, xlab = "X axis", 
        ylab = "Y axis", 
        col = c("red", "blue", "gray1", "navy", "gold"),
        legend.text = rownames(let2),
        xlim = c(0,14),
        beside = T) # for clustered barplot


#################
### Pie Chart ###
#################

# A pie chart is a type of circular graph that is commonly used to represent data as a set of slices, where each slice corresponds to a category and its area or angle represents the proportion of that category relative to the whole. 
# The total area or angle of the pie represents the total value of the data being displayed. The pie() function in R is used to create a pie chart

# Here are some of the most commonly used arguments of pie() function: 

# x: A vector of non-negative numeric values that specifies the data to be represented in the pie chart.
# labels: A character vector of labels to be used for each slice of the pie chart.
# main: A title for the pie chart.
# col: A vector of colors to be used for each slice of the pie chart.
# border: A color to be used for the border of each slice of the pie chart.
# lty: The line type to be used for the border of each slice of the pie chart.
# init.angle: The starting angle in degrees for the first slice of the pie chart.
# clockwise: A logical value that specifies whether the slices of the pie chart should be drawn clockwise or counterclockwise.
# density: A value that specifies the density of shading lines for each slice of the pie chart.
# angle: A vector of angles in degrees to be used for shading each slice of the pie chart.
# ...: Additional graphical parameters to be passed to the pie() function, such as cex, font, and family.

# Lets create a vector for pie chart example:
set.seed(111)
x1 <- sample(LETTERS[1:5], size = 20, rep = T)  
let <- table(x1)

r1 <- (let/length(x1))

l1 <- paste("Group-", names(let) , sep= " " , r1*100, "%")

# basic pie() looks like the following:
pie(let, labels = l1, 
    main = "Title",
    col = c("red", "blue", "gray2", "navy", "gold")
)

# here how it looks like if we add some of the arguments
pie(let, labels = l1, 
    main = "Title",
    col = c("red4", "blue4", "gray2", "tomato4", "gold"),
    border = "cyan",
    init.angle = 90,
    lty = 6
)

# Pie charts have several advantages and disadvantages. Some of these include:
  
# Advantages:
  
# Pie charts are easy to understand and interpret, making them a popular choice for displaying data.
# They allow for easy comparison of proportions or percentages across different categories.
# Pie charts have an attractive design that can make data more appealing and engaging.
# Pie charts are efficient in terms of space and can display a large amount of data in a small area.
# They are best used to display one set of data where the categories do not have any overlapping.

# Disadvantages:
  
# Pie charts can be difficult to compare accurately, particularly if the slices are small or if there are many categories.
# They can be misleading if the slices are not drawn to scale or if the angles are not accurate.
# Pie charts may not be the best choice for displaying complex data, and other visualization methods may be more appropriate.
# Pie charts are not ideal for displaying large amounts of data or data with many categories.
# They are limited to displaying proportions and do not show absolute values or counts.

#################
### Histogram ###
#################

# A histogram is a graphical representation of the distribution of a dataset. 
# It is a type of bar plot that represents the frequency or count of values that fall within a set of intervals or "bins". 
# The x-axis represents the intervals or bins of values, while the y-axis represents the frequency or count of values that fall within each interval.

# Bin width is an important detail that has been widely studied in the literature and is still debated. 
# This is because deciding the number and width of the bins in a histogram can have a significant impact on the resulting visualization. 

# Lets look at the significance of the bins with basic histograms.
# I will use mpg variable from the `mtcars` package.

mpg <- mtcars$mpg

# here how basic histogram looks like with default bin width.
hist(mpg)

# if I change breaks as follows, it will look like this. 
hist(mpg, breaks = 2)

# Assuming that I wanted to analyse this histogram to have an idea about the distribution of the mpg variable, I would have different ideas about the distribution of the mpg variable for both graphs. 
# For this reason, there are several methods for determining the appropriate number of bins, including:

# Sturges' formula: This method uses the following formula to determine the number of bins: k = 1 + log2(n), where k is the number of bins and n is the number of data points.
# https://www.tandfonline.com/doi/abs/10.1080/01621459.1926.10502161

# Freedman-Diaconis rule: This method uses the interquartile range (IQR) to determine the width of each bin. The formula for the bin width is: bin width = 2 * IQR / (n^(1/3)), where n is the number of data points.
# https://link.springer.com/article/10.1007/BF01025868

# Scott's rule: This method uses the standard deviation of the data to determine the width of each bin. The formula for the bin width is: bin width = 3.5 * sd / (n^(1/3)), where sd is the standard deviation of the data and n is the number of data points.
# https://academic.oup.com/biomet/article-abstract/66/3/605/232642?redirectedFrom=fulltext


# Here are some of the most commonly used arguments of pie() function:

# x: A vector of numeric values that specifies the data to be represented in the histogram.
# breaks: A specification of the breakpoints (i.e., the edges of the bins) to use in the histogram. This can be a numeric vector, or a function such as breaks = "FD" to use the Freedman-Diaconis rule for determining the bin widths.
# freq: A logical value that specifies whether the y-axis should represent the frequency (i.e., the count of values in each bin) or the density (i.e., the proportion of values in each bin).
# col: The color to use for the bars of the histogram.
# border: The color to use for the borders of the bars of the histogram.
# lwd: The line width to use for the borders of the bars of the histogram.
# density: A value between 0 and 1 specifying the density of shading lines for the bars of the histogram.
# angle: The angle in degrees of the shading lines for the bars of the histogram.
# add: A logical value that specifies whether the histogram should be added to an existing plot.
# axes: A logical value that specifies whether the axes should be drawn for the histogram.
# plot: A logical value that specifies whether the histogram should be plotted.
# labels: A logical value that specifies whether labels should be added to the bars of the histogram.
# ...: Additional graphical parameters to be passed to the hist() function, such as cex, font, and family.

# here how it looks like if I add some of the arguments
hist(mpg,
     breaks = "FD", # for Freedman-Diaconis rule
     freq = F,
     ylim = c(0,0.08),
     col = "burlywood4",
     border = "burlywood2",
     axes = F, labels = T)
