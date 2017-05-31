shinymetrum
===============
Apply Metrum style to shiny apps.

## Installation
```R
devtools::install_github("metrumresearchgroup/shinymetrum")
```

## Metworx App
```R
library(shiny)
library(shinymetrum)

ui <- metworxApp(
  metworxTitle = "Sample App",
  
  fluidPage(    
    sidebarLayout(      
      sidebarPanel(
        tags$p("side bar content")
      ),
      mainPanel(
        tags$p("main panel content")
      )
    )
  )
  
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)

```

## Metrum Style App
#### shiny
```R
library(shiny)
library(shinymetrum)

ui <- navbarPage(
  metrumStyle(), # apply metrum style
  tabPanel(
    title = "First Tab",
    tags$p("first tab content")
  ),
  tabPanel(
    title = "Second Tab",
    tags$p("second tab content")
  )
)

server <- function(input, output) {
  
}

shinyApp(ui, server)

```

#### shinydashboard
```R
library(shiny)
library(shinydashboard)
library(shinymetrum)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        text = "First Tab",
        tabName = "first_tab",
        icon = icon("bar-chart")
      ),
      menuItem(
        text = "Second Tab",
        tabName = "second_tab",
        icon = icon("database")
      )
    )
  ),
  dashboardBody(
    metrumStyle(), # apply metrum style
    tabItems(
      tabItem(
        tabName = "first_tab",
        tags$p("first tab content")
      ),
      tabItem(
        tabName = "second_tab",
        tags$p("second tab content")
      )
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui, server)

```