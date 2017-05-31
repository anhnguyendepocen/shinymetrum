library(shiny)
library(shinymetrum)

ui <- 
  metworxApp(
    metworxTitle = "Sample App",
    
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
    
  )

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)
