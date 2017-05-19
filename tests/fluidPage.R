library(datasets)
library(shiny)
library(shinymetrum)

ui <-
  navbarPage(
    metrumStyle(),
    tags$h2("Telephones by region"),
    fluidRow(
      column(
        width = 4,
        wellPanel(
          selectInput(
            "region", "Region:", 
            choices=colnames(WorldPhones)
          ),
          helpText("Data from AT&T (1961) The World's Telephones.")
        )
      ),
      column(
        width = 7,
        plotOutput("phonePlot")
      )
    )
  )

server <- function(input, output) {
  output$phonePlot <- renderPlot({
    barplot(
      WorldPhones[,input$region]*1000, 
      main=input$region,
      ylab="Number of Telephones",
      xlab="Year"
    )
  })
}
shinyApp(ui = ui, server = server)
