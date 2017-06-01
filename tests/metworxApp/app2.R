library(shiny)
library(shinymetrum)

ui <- metworxApp(
  metworxTitle = "Sample App",
  div(
    class = "row",
    div(
      class = "col-xs-10 col-xs-offset-1",
      # style = "border-style: solid; border-width: 5px;",
      #-- standard shiny UI code --#
      dashboardPage(
        dashboardHeader(title = "Basic dashboard"),
        dashboardSidebar(),
        dashboardBody(
          # Boxes need to be put in a row (or column)
          fluidRow(
            box(plotOutput("plot1", height = 250)),
            
            box(
              title = "Controls",
              sliderInput("slider", "Number of observations:", 1, 100, 50)
            )
          )
        )
      )
      
      #-- standard shiny UI code --#
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

shinyApp(ui = ui, server = server)
