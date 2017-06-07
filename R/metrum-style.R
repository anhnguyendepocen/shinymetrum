metrumStyle <- function(){
  shiny::tags$head(
    shiny::tags$link(
      rel = "shortcut icon",
      href = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/favicon.ico"
    ),
    shiny::includeCSS(
      system.file(
        "metrum-style.css",
        package = "shinymetrum"
      )
    ),
    shiny::includeScript(
      system.file(
        "replace-logo.js",
        package = "shinymetrum"
      )
    )
  )
}