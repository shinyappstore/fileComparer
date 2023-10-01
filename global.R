# author: obi obianom

# prepare environment
quickcode::clean(clearPkgs = T)
quickcode::libraryAll(shiny, diffr, shinyjs, clear = TRUE)

# app.version
app.version <- 0.2

# reactives
info.keep <- reactiveValues()
info.keep$files <-c()


# globalfunctions
error.out <- function(ret){
  runjs(paste0("$('#returnres1').html('",ret,"')"))
}
