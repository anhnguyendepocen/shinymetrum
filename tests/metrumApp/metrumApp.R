library(datasets)
library(shiny)
library(shinydashboard)
library(shinymetrum)

ui <- 
  metrumApp(
    # dashboardPage(skin='black',
    #   dashboardHeader(title = "Basic dashboard"),
    #   dashboardSidebar(),
    #   dashboardBody(
    #     # Boxes need to be put in a row (or column)
    #     fluidRow(
    #       box(plotOutput("plot1", height = 250)),
    # 
    #       box(
    #         title = "Controls",
    #         sliderInput("slider", "Number of observations:", 1, 100, 50)
    #       )
    #     )
    #   )
    # )

    fluidPage(
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
          plotOutput("phonePlot")# ,
          # dataTableOutput('tableTest')
        )
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
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  observeEvent(input$runJS, {
    metrumAppJS(session, "alert('run js');")
  })
}
shinyApp(ui = ui, server = server)
