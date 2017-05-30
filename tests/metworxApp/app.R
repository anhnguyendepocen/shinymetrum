
server <- function(input, output) {
}

ui <- 
  metworxApp(
    wellPanel(
      tags$p("app content")
    )
  )

shiny::shinyApp(ui = ui, server = server)