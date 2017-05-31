shinymetrum
===============
Use Metrum style in shiny apps.

## Installation
```R
devtools::install_github("metrumresearchgroup/shinymetrum")
```

## Metworx Shiny App
```R
library(shiny)
library(shinymetrum)

ui <- metworxApp(
  metworxTitle = "Sample App",
  
  #-- standard shiny UI code --#
  fluidPage(    
    sidebarLayout(      
      sidebarPanel(
        sliderInput('nDraws', '# of Draws', 5, 100, 50)
      ),
      mainPanel(
        plotOutput('randNorm')
      )
    )
  )
  #-- standard shiny UI code --#
  
)

server <- function(input, output) {
  output$randNorm <- renderPlot({
    plot(density(rnorm(input$nDraws)))
  })
}

shinyApp(ui = ui, server = server)

```

![](https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/github/screenshots/metworxApp.png)

## Metrum Style Shiny App
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