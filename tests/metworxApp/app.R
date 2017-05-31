library(shiny)
library(shinymetrum)

ui <- metworxApp(
  metworxTitle = "Sample App",
  
  #-- standard shiny UI code --#
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
  #-- standard shiny UI code --#
  
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)