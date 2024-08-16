# Ebola Sierra Leone analysis
# John Sample-Name Doe
# 2024-01-01


# Load packages ----
if(!require(pacman)) install.packages("pacman")
pacman::p_load(
  tidyverse,
  janitor,
  inspectdf,
  here # new package we will use soon
)


# Load data ----
ebola_sierra_leone <- read_csv(here("data/ebola_sierra_leone.csv")) 

# Cases by district ----
district_tab <- tabyl(ebola_sierra_leone, district)
district_tab_arranged <- arrange(district_tab, -n)


write.csv(x =district_tab_arranged, file = "output/district tabulation.csv")

# Visualize categorical variables ----
categ_vars_plot<- show_plot(inspect_cat(ebola_sierra_leone))
categ_vars_plot


ggsave(categ_vars_plot,filename ="output/categorical_plot.png")
ggsave(categ_vars_plot,filename ="output/categorical_plot.pdf", width = 10, height = 10)

# Visualize numeric variables ----
num_vars_plot <- show_plot(inspect_num(ebola_sierra_leone))
num_vars_plot

ggsave(num_vars_plot,filename ="output/numerical_plot.png")









