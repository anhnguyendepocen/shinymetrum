
server <- function(input, output) {
}

ui <- 
  metworxApp(
    wellPanel(
      tags$p("app stuff")
    )
  )

shiny::shinyApp(ui = ui, server = server)