library(ggplot2)
library(dplyr)
library(shiny)
library(DT)
library(shinymetrum)
library(shinydashboard)

# Data used throughout the app
app_data <- 
  mtcars %>% 
  tibble::rownames_to_column(
    var = 'model'
  ) %>% 
  mutate(
    cyl = as.factor(cyl)
  )