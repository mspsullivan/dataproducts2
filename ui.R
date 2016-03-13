
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Final Four Data Analysis"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      h3('Investigate NCAA Teams for Clustering'),
      h3('Just follow these instructions.'),
      h3('Choose the number of clusters to see team groups by:'),
      h3('Rank, FGM, FGPCT and WINPCT.'),
      sliderInput("bins",
                  "Clusters :",
                  min = 1,
                  max = 10,
                  value = 5),
      h3('How cool is that?')
    ),

    # Show a plot of the clustered data
    mainPanel(
      plotOutput("distPlot"),
      p('Thanks for using this app. See you in 2017.')
    )
  )
))
