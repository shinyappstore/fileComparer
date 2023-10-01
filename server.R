# application Server function
# author: obi obianom

server <- function(input, output, session) {
  observeEvent(input$difffile1, {
    if (not.null(input$difffile1$datapath)) {
      info.keep$files[1] <- input$difffile1$datapath
    }
  })

  observeEvent(input$difffile2, {
    if (not.null(input$difffile2$datapath)) {
      info.keep$files[2] <- input$difffile2$datapath
    }
  })

  observe({
    if (length(info.keep$files) == 2) {
      if (all(not.empty(info.keep$files))) {
        gext <- tolower(tools::file_ext(info.keep$files))
        mtext <- c("txt", "html", "r", "htm", "rmd", "md", "tbl", "csv","ctl","mod", "css", "js", "jsp", "php", "qmd", "rtf")
        init(ct1, ct2, ct3, value = FALSE) # initialize proceed function
        if (gext[1] %in% mtext) ct1 <- TRUE else error.out(paste0("File 1 must be one of these formats: ", paste(mtext, collapse = ", ")))
        if (gext[2] %in% mtext) ct2 <- TRUE else error.out(paste0("File 2 must be one of these formats: ", paste(mtext, collapse = ", ")))
        if (tools::md5sum(info.keep$files[1]) != tools::md5sum(info.keep$files[2])) ct3 <- TRUE else error.out("File 1 & file 2 are exactly the same files, so cannot be compared")
        # if proceed is true
        runjs(paste0("$('#difffileinsideholder').html('')"))
        if (ct1 & ct2 & ct3) {
          error.out("")
          insertUI(
            "#difffileinsideholder",
            where = "beforeBegin",
            diffr(info.keep$files[1], info.keep$files[2], width = "100%")
          )
        }
      }
    }
  })
}
