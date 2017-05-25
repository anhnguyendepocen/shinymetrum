metrumApp <- function(...){
  
  shiny::tagList(
    shiny::tags$head(
      metrumStyle()
    ),
    shiny::tags$nav(
      class = "navbar navbar-default navbar-static-top",
      shiny::tags$div(
        class = "container-fluid",
        shiny::tags$div(
          class = "navbar-header",
          shiny::tags$span(
            class = "navbar-brand"
          )
        )
      )
    ),
    ...
  )
  
}
