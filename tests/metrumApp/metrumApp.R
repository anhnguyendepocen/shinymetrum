library(datasets)
library(shiny)
library(shinydashboard)
library(shinymetrum)

ui <- 
  metrumApp(
    tags$h2("Telephones by region"),
    fluidRow(
      column(
        width = 4,
        wellPanel(
          actionButton('runJS','runJS'),
          selectInput(
            inputId = "region",
            label = "Region:",
            choices = colnames(WorldPhones)
          ),
          helpText("Data from AT&T (1961) The World's Telephones.")
        )
      ),
      column(
        width = 7,
        plotOutput("phonePlot"),
        dataTableOutput('tableTest')
      )
    )
  )

server <- function(input, output, session) {
  output$phonePlot <- renderPlot({
    barplot(
      WorldPhones[,input$region]*1000, 
      main=input$region,
      ylab="Number of Telephones",
      xlab="Year"
    )
  })
  
  output$tableTest <- renderDataTable({
    mtcars
  })
  
  observeEvent(input$runJS, {
    metrumJS(session, "alert('run js');")
  })
}
shinyApp(ui = ui, server = server)
