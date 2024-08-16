# Ebola Sierra Leone analysis
# Gideon Kipngetich
# 2024-08-05

# Load packages ----
if(!require(pacman))install.packages("pacman")
pacman::p_load(
  tidyverse,
  inspectdf,
  plotly,
  janitor,
  visdat,
  esquisse
)

# load data ----
ebola_sierra_leone <- read_csv("D:/MyDocs/CoursEra/R projects/ebola_analysis/data/ebola_sierra_leone.csv")


# Explore data ----
head(ebola_sierra_leone)
nrow(ebola_sierra_leone)
tail(ebola_sierra_leone)
dim(ebola_sierra_leone)

summary(ebola_sierra_leone)

# General overview 
visdat::vis_dat(ebola_sierra_leone)

# categorical overview
cat_summary_plot <- show_plot(inspect_cat(ebola_sierra_leone))
ggplotly(cat_summary_plot)

# numerical overview
num_summary_plot <- show_plot(inspect_num(ebola_sierra_leone))
ggplotly(num_summary_plot)


# Analyzing single variables: numeric ----
ebola_sierra_leone$age
age_vec <- ebola_sierra_leone$age
sd(age_vec, na.rm = T)
min(age_vec, na.rm = T)
median(age_vec, na.rm = T)
max(age_vec, na.rm = T)
summary(age_vec)
sum(age_vec, na.rm = T)

# Visualizing single variables: numeric ----
hist(age_vec)
boxplot(age_vec)

# esquisse::esquisser(ebola_sierra_leone)
ggplot(ebola_sierra_leone)+
  aes(x=age)+
  geom_histogram(bins = 30L, fill= "red")+
  theme_minimal()+
  labs(title = "This is my first plot")

# Analyzing single variables: Categorical ----
ebola_sierra_leone$district
table(ebola_sierra_leone$district)
tabyl(ebola_sierra_leone, district, sex)

# Visualizing single variables: Categorical ----

barplot(table(ebola_sierra_leone$district))

#esquisser(ebola_sierra_leone)
ggplot(ebola_sierra_leone) +
  aes(x = district, fill = district) +
  geom_bar() +
  scale_fill_hue(direction = 1) +
  theme_minimal()


# Answer the questions 
# 1. When was the first case reported
min(ebola_sierra_leone$date_of_sample)
# It was 2014-05-23

# 2. what was the median age of those affected?
median(ebola_sierra_leone$age, na.rm = T)
# 35

# 3. Which district had the most reported cases
#esquisser(ebola_sierra_leone)
ggplot(ebola_sierra_leone) +
  aes(x = district, fill = district) +
  geom_bar() +
  scale_fill_hue(direction = 1) +
  theme_minimal()
# The Kailahun had the most reported cases, Kambia being with the least reported cases
# 4. had there been more cases in men or women
ggplot(ebola_sierra_leone) +
  aes(x = sex, fill = sex) +
  geom_bar() +
  scale_fill_hue(direction = 1) +
  theme_minimal()
# Female were the most affected compared to men

# 5. By the end of june 2014, was the outbreak growing or receding
ggplot(ebola_sierra_leone)+
  aes(x = date_of_onset)+
  geom_histogram(bins = 30L, fill= "black")+
  theme_minimal()
# it is not clear whether it is growing or receding.
# It will be recommended that you observe over a period of time to determine ot










































