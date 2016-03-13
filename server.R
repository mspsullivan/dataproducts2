
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate clusters based on input$bins from ui.R
    x <- read.csv("ncaastats03082016.csv")
    # drop everyhing but 1, 5, 7. 10
    # Those are Rank, FGM, FGPCT, and WINPCT
    winning <- x[ -c(1,2, 3, 4, 6, 8, 9, 11) ]

    # K-Means Clustering with 1-10 clusters
    fit <- kmeans(winning,input$bins)
    
    # Cluster Plot against 1st 2 principal components
    
    # vary parameters for most readable graph
    library(cluster) 
    clusplot(winning, fit$cluster, color=TRUE, shade=TRUE, 
             labels=2, lines=0)
  })

})
