metworxApp <- function(..., metworxTitle = "Metworx Shiny App"){
  shiny::tagList(
    shiny::tags$head(
      shiny::tags$meta(
        content="width=device-width, initial-scale=1.0",
        name="viewport"
      ),
      shiny::tags$link(
        rel="stylesheet",
        media="screen",
        href="https://fonts.googleapis.com/css?family=Raleway"
      ),
      shiny::tags$link(
        rel = "shortcut icon",
        href = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/favicon.ico"
      ),
      shiny::includeCSS(
        system.file(
          "shiny-metworx.css",
          package = "shinymetrum"
        )
      )
    ),
    shiny::div(
      class = "container-fluid",
      shiny::tags$header(
        shiny::tags$nav(
          class = "navbar navbar-custom",
          shiny::tags$a(
            href = "http://metrumrg.com/",
            target = "_blank",
            shiny::tags$img(
              src = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/metworxLogo.png",
              alt = "Metworx",
              width = "220",
              height = "69"
            )
          )
        )
      )
    ),
    shiny::tags$div(
      class = "jumbotron jumbo-head",
      shiny::tags$div(
        class = "container-fluid",
        shiny::tags$h1(metworxTitle)
      )
    ),
    ...
  )
}
