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
