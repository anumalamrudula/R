# Challenge:
# To write an article analysing movie ratings by critics and audience as well as movie budgets for the years 2007-2011.
# Look into the data and provide them with 5 graphs that tell a story about the data.
# And a chart showing how the correlation between audience and critic ratings has evolved throughout the years by genre. 

getwd()
setwd("C:\\Documnets\\Data")
movies <- read.csv("Movie Ratings.csv")
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
str(movies)
movies$Genre <- factor(movies$Genre)
movies$Year <- factor(movies$Year)
str(movies)

#install.packages("extrafont")
library(extrafont)
#font_import(paths = NULL, recursive = TRUE, prompt = TRUE,pattern = NULL)
library(ggplot2)

#------------------------------------- 1st chart ---------------------------------------

# Correlation between audience and critic ratings
p <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre,
                          size = BudgetMillions)) + 
     geom_point() 
p

# We can still improve this
q <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, 
                               colour = Genre))
q + geom_point(size = 3)
q + geom_point(size = 3) + facet_grid(Genre~.)
q + geom_point(size = 3) + facet_grid(.~Year)
q + geom_point(size = 3) + facet_grid(Genre~Year)
q + geom_point(size = 3) + facet_grid(Genre~Year) + geom_smooth()
q + geom_point(aes(size = BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth()
q + geom_point(aes(size = BudgetMillions)) + facet_grid(Genre~Year) + 
  geom_smooth() + coord_cartesian(ylim = c(0,100))

#------------------------------------ 2nd chart ----------------------------------------

r <- ggplot(data = movies, aes(x = CriticRating, y = AudienceRating, colour = Genre,
                               size = BudgetMillions)) 
r + geom_point(aes(x = BudgetMillions)) + xlab("Budget Millions $")
# Budget doesn't effect the rating that the audience will give

#------------------------------------ 3nd chart ----------------------------------------

s <- ggplot(data = movies, aes(x = AudienceRating))
s + geom_histogram(binwidth = 10, fill = "White", colour = "Blue")
# Audience Rating is normally distributed

#------------------------------------ 4th chart ----------------------------------------

s + geom_histogram(binwidth = 10, aes(x = CriticRating), 
                   fill = "White", colour = "Blue")
# Critic Rating is uniformly distributed

#------------------------------------ 5th chart ----------------------------------------

t <- ggplot(data = movies, aes(x = Genre, y = AudienceRating, 
                               colour = Genre))
t + geom_jitter() + geom_boxplot(size = 1.2, alpha = 0.5, 
                                 aes(y = CriticRating)) + ylab("CriticRating") 

#------------------------------------ 6th chart ----------------------------------------

u <- ggplot(data = movies, aes(x = BudgetMillions))
u + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black") 

# We can still improve this
v <- u + geom_histogram(binwidth = 10, aes(fill = Genre), colour = "Black")
v + xlab("Money Axis") + ylab("Number of Movies") + 
  theme(axis.title.x = element_text(color = "DarkGreen", size = 20),
        axis.title.y = element_text(color = "Red", size = 20),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 20),
        legend.text = element_text(size = 15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "DarkBlue",
                                  size = 30,
                                  face = "bold",
                                  family = "Garamond",
                                  hjust = 0.5)) +      
  ggtitle("Movie Budget Distribution")
