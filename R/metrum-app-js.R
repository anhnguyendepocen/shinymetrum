metrumAppJS <- function(session, code){
  session$sendCustomMessage(type = "metrumAppJS", message = code)

}
