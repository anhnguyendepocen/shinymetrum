# metrumApp <- function(...){
#   
#   shiny::tagList(
#     shiny::tags$head(
#       metrumStyle(),
#       includeMetrum('metrum-js', 'js')
#     ),
#     shiny::tags$nav(
#       class = "navbar navbar-default navbar-static-top",
#       shiny::tags$div(
#         class = "container-fluid",
#         shiny::tags$div(
#           class = "navbar-header",
#           shiny::tags$span(
#             class = "navbar-brand"
#           )
#         )
#       )
#     ),
#     ...
#   )
#   
# }
metrumApp <- function(...){
  shiny::tagList(
    shiny::tags$head(
      shiny::tags$meta(
        content="width=device-width, initial-scale=1.0",
        name="viewport"
      ),
      shiny::tags$link(
        rel = "shortcut icon",
        href = "https://metrumrg-soft.s3.amazonaws.com/shinyapps/shinymetrum/favicon.ico"
      ),
      includeMetrum("metrum-app", "css"),
      includeMetrum("metrum-app", "js")
    ),
    shiny::tags$img(
      id = "metrum-app-load-image",
      class="center-block",
      alt = "Metrum Research Group",
      src = "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/metrum_new_logo.png"
    ),
    shiny::tags$div(
      id = "metrum-app-content",
      style = "visibility:hidden !important;",
      shiny::tags$nav(
        class = "navbar navbar-fixed-top",
        shiny::tags$div(
          class = "container-fluid",
          shiny::tags$a(
            class = "navbar-brand",
            href = "http://metrumrg.com/",
            target = "_blank",
            shiny::tags$img(
              id = "metrum-logo",
              alt = "Metrum Research Group",
              src = "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/metrum_new_logo.png"
              #src = "https://raw.githubusercontent.com/metrumresearchgroup/shinymetrum/master/inst/img/logo_m.png"
            )
          )
        )
      ),
      ...
    )
  )
}
