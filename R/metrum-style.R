metrumStyle <- function(tab_title = "Metrum - Shiny App"){
  shiny::tags$head(
    shiny::tags$link(
      rel = "shortcut icon",
      href = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/favicon.ico"
    ),
    shiny::tags$title(
      tab_title
    ),
    shiny::includeCSS(
      system.file(
        "shiny-metrum.css",
        package = "shinymetrum"
      )
    ),
    shiny::includeScript(
      system.file(
        "shiny-metrum.js",
        package = "shinymetrum"
      )
    )
  )
}