metrumStyle <- function(){
  shiny::tags$head(
    shiny::tags$link(
      rel = "shortcut icon",
      href = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/favicon.ico"
    ),
    shiny::includeCSS(
      "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/css/metrum-style.css"
    ),
    shiny::includeScript(
      "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/js/replace-logo.js"
    )
  )
}