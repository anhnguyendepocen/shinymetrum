# library(datasets)
# library(shiny)
# library(shinymetrum)

ui <- shiny::fluidPage(
    # metrumStyle(),
  shiny::tags$h2("Telephones by region"),
  shiny::fluidRow(
    shiny::column(
        width = 4,
        shiny::wellPanel(
          shiny::selectInput(
            "region", "Region:", 
            choices=colnames(datasets::WorldPhones)
          ),
          shiny::helpText("Data from AT&T (1961) The World's Telephones.")
        )
      ),
    shiny::column(
        width = 7,
        shiny::plotOutput("phonePlot")
      )
    )
  )

server <- function(input, output) {
  output$phonePlot <- shiny::renderPlot({
    barplot(
      datasets::WorldPhones[,input$region]*1000, 
      main=input$region,
      ylab="Number of Telephones",
      xlab="Year"
    )
  })
}
shiny::runApp(shiny::shinyApp(ui = ui, server = server))
