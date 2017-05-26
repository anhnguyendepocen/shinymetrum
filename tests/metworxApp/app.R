
server <- function(input, output) {
}

ui <- 
  metworxApp(
    tags$h1("app stuff")
  )

shiny::shinyApp(ui = ui, server = server)