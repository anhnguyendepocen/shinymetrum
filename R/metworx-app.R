metworxApp <- function(...){
  
  shiny::tagList(
    shiny::tags$head(
      shiny::tags$link(
        rel = "shortcut icon",
        href = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/favicon.ico"
      ),
      shiny::bootstrapLib(),
      shiny::includeCSS(
        system.file(
          "shiny-metworx.css",
          package = "shinymetrum"
        )
      )
    ),
    ...
  )
  
}