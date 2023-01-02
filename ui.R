library(shiny)


shinyUI(fluidPage(
  titlePanel("Word2vec embedding of Wikipedia words"),
    sidebarLayout(
    position="right",
    sidebarPanel(
      helpText("Select and drag to zoom in."),
      helpText("Optionally, enter a word for highlighting, or two words to highlight shortest paths between them:"),
      textInput("word1", 
                   label = "First word:", 
                   value = ""),
      textInput("word2", 
                label = "Second word:", 
                value = "")
    ),
    
    mainPanel(  
      plotOutput("mainplot", height=600,
                  brush = brushOpts(id = "plot_brush")
       ),
      checkboxInput("giant", label = "Restrict to giant component?", value = FALSE)
    )
  ),
  sidebarLayout(
    position="right",
    sidebarPanel(
      helpText(""),
      plotOutput("plot_hover")
    ),
    mainPanel(  
      plotOutput("subplot", height=600,
                 hover = hoverOpts(id="plot_hover", delayType="throttle")
      ),
      wellPanel(selectInput("layout", 
                            label = "Zoom graph layout:",
                            choices = c("As in main plot above",
                                        "Fruchterman-Reingold",
                                        "Kamada-Kawai",
                                        "Reingold-Tilford"),
                            selected = "Fruchterman-Reingold")
      )
    )
  )
  )
  )