library(shiny)
library(shinymetrum)
library(shinydashboard)

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
                collapsible = TRUE,
                width = NULL,
                title = "Controls",
                sliderInput(
                  inputId = "slider",
                  label = "Number of observations:", 
                  min = 1,
                  max = 100,
                  value = 50
                )
              )
            ),
            column(
              width = 6,
              box(
                title = "Plots",
                width = NULL,
                plotOutput("plot1")
              )
            )
          )
        ),
        tabItem(
          tabName = "widgets",    
          fluidRow(
            column(
              width = 6,
              offset = 2,
              tags$p("widgets tab content")
            )
          )
        )
      )
    )
  )

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)
