library(ggplot2)
library(dplyr)
library(shiny)
library(DT)
library(shinymetrum)
library(shinydashboard)
#dev
ui <-
  dashboardPage(
    dashboardHeader(),
    dashboardSidebar(
      sidebarMenu(
        menuItem(
          "Dashboard",
          tabName = "dashboard",
          icon = icon("dashboard")
        ),
        menuItem(
          "Widgets",
          tabName = "widgets",
          icon = icon("suitcase")
        ),
        menuItem(
          "Data",
          tabName = "data",
          icon = icon("database")
        ),
        menuItem(
          "Misc. Info",
          tabName = "misc_info",
          icon = icon("info-circle")
        )
      )
    ),
    dashboardBody(
      metrumStyle(),
      tabItems(
        tabItem(
          tabName = "dashboard", 
          fluidRow(
            column(
              width = 4,
              box(
                solidHeader = TRUE, 
                width = NULL,
                title = "Controls",
                br(),
                sliderInput(
                  inputId = "slider",
                  label = "Number of observations:", 
                  min = 10,
                  max = 1000,
                  value = 50
                )
              )
            ),
            column(
              width = 7,
              box(
                title = "Random Normal",
                width = NULL,
                plotOutput("rnormPlot")
              )
            )
          )
        ),
        tabItem(
          tabName = "widgets",    
          fluidRow(
            column(
              width = 8,
              offset = 1,
              box(
                width = NULL,
                radioButtons(
                  inputId = "y_variable",
                  label = "Y Variable",
                  choices = c(
                    "Miles per Gallon" = "mpg",
                    "House Power" = "hp"
                  ),
                  inline = TRUE
                ),
                plotOutput("mtcarsBoxPlot")
              )
            )
          )
        ),
        tabItem(
          tabName = "data",
          fluidRow(
            column(
              width = 10,
              box(
                width = NULL,
                dataTableOutput("mtcarsData")
              )
            )
          )
        ),
        tabItem(
          tabName = "misc_info",
          fluidRow(
            column(
              width = 3,
              offset = 1,
              box(
                width = NULL,
                h4("Current Time"),
                p(Sys.time())
              )
            )
          )
        )
      )
    )
  )
server <- function(input, output) {
  
  plotData <- reactive({
    data.frame(x = rnorm(input$slider))
  })
  
  output$rnormPlot <- renderPlot({
    ggplot(
      plotData(),
      aes(
        x = x
      )
    )+
      geom_density(
        fill = 'green',
        alpha = .7
      )
  })
  
  output$mtcarsBoxPlot <- renderPlot({
    ggplot(
      mtcars,
      aes_string(
        x = "as.factor(cyl)",
        y = input$y_variable,
        group = "as.factor(cyl)",
        fill = "as.factor(cyl)"
      )
    ) +
      geom_boxplot(
        alpha = .8
      ) +
      xlab('Cylinder') +
      ylab(
        ifelse(
          input$y_variable == "mpg", 
          "Miles per Gallon", "Horse Power"
        )
      ) +
      theme(
        legend.position = 'None'
      )
  })
  
  output$mtcarsData <- renderDataTable({
    mtcars %>% 
      tibble::rownames_to_column('model') %>% 
      datatable(
        rownames = FALSE,
        class = "display cell-border",
        options = 
          list(
            pageLength = 15
          )
      )
  })
}

shinyApp(ui, server)
