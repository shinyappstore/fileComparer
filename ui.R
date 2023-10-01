# application UI object
# author: obi obianom

ui <- fluidPage(
  tags$head(
    tags$script(src = "script.js"),
    tags$link(rel = "stylesheet", href = "style.css")
  ),
  titlePanel(paste0("Shiny File Comparer v", app.version), "@rpkg.net"),
  useShinyjs(), # use shiny jshr(),
  div("@About - Please note that this was developed exclusively using shiny and the diffr packages."), hr(),
  div(
    div(
      width = 12,
      div(id = "returnres1"),
      div(
        id = "uploaderholder1",
        fileInput("difffile1", "Upload the file #1"),
        fileInput("difffile2", "Upload the file #2"),
        class = "d-flex w-100 pb-2 pt-4 px-5 mb-3 bg-white shadow-md"
      ),
      hr(),
      div(id = "difffileinsideholder2"),
      div(
        title = "Diffr files",
        div(
          id = "difffileinsideholder",
          diffr("sample1.R", "sample2.R", width = "100%")
        )
      )
    )
  )
)
