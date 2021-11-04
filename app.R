

library(shiny)
library(shinythemes)

# Reserve Ui for application
ui <- fluidPage(theme = shinytheme("superhero"),
                
                # Application title
                titlePanel("EasyCharts!
               "),
                
                # First Window for Box Plots
                navbarPage("Plots, Graphs, and Charts:",
                           tabPanel("BoxPlot",
                                    sidebarLayout(
                                      sidebarPanel(
                                        tags$h3("BoxPlots!"),
                                        textInput("Data1","Data Point 1", ""),
                                        textInput("Data2","Data Point 2", ""),
                                        textInput("Boxdata1", "Data1 Label", ""),
                                        textInput("Boxdata2", "Data2 Label", ""),
                                        textInput("BoxplotTitle", "Boxplot Title", ""),
                                        textInput("Boxplotxlab", "X-Label", ""),
                                        textInput("Boxplotylab", "Y-Label", ""),
                                        textInput("Boxcolor1", "Color 1", ""),
                                        textInput("Boxcolor2", "Color 2", ""),
                                        
                                      ),
                                      
                                      
                                      
                                      # Show a plot of the generated distribution
                                      mainPanel(plotOutput("distPlot")))),
                           tabPanel("LinePlot",
                                    sidebarPanel(
                                      tags$h3("LinePlots!"),
                                      textInput("LineData1","Data Point 1", ""),
                                      textInput("LineData2","Data Point 2", ""),
                                      textInput("linexlab", "X-Lab", ""),
                                      textInput("lineylab", "Y-Lab", ""),
                                    ),
                                    mainPanel(plotOutput("lineplot"))),
                           
                           tabPanel("BarPlot",
                                    sidebarPanel(
                                      tags$h3("BarPlots!"),
                                      textInput("BarData1","Data Point 1", ""),
                                      textInput("BarData2","Title", ""),
                                      textInput("BarData3","Xlab", ""),
                                      textInput("BarData4","ylab", ""),
                                    ),
                                    mainPanel(plotOutput("barplot")))))







# Define server logic 
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # Set variables for dual input box plot
    boxplotv1 <- as.integer(strsplit(input$Data1, ",")[[1]])
    boxplotv2 <- as.integer(strsplit(input$Data2, ",")[[1]])
    
    label1 <- input$Boxdata1
    label2 <- input$Boxdata2
    
    boxcolor1 <- input$Boxcolor1
    boxcolor2 <- input$Boxcolor2
    
    
    
    # draw boxplot
    boxplot(boxplotv1,boxplotv2,
            ylim=c(0,1000),
            names=c(label1,label2),
            main=input$BoxplotTitle,
            xlab=input$Boxplotxlab,
            ylab=input$Boxplotylab,
            col=c(boxcolor1,boxcolor2))
  })
  
  #LinePlot Shit
  output$lineplot <- renderPlot({
    lineplotv1 <- as.integer(strsplit(input$LineData1, ",")[[1]])
    lineplotv2 <- as.integer(strsplit(input$LineData2, ",")[[1]])
    linexlab <- input$linexlab
    lineylab <- input$lineylab
    
    #Draw Line Plot
    plot(x=lineplotv1, y=lineplotv2,
         xlim=c(0,40),
         ylim=c(0,199),
         pch=17,
         ylab=lineylab,
         xlab=linexlab,
    )
    
    
  })
  
  #Barplot Shit
  output$barplot <- renderPlot({
    barplotv1 <- as.integer(strsplit(input$BarData1, ",")[[1]])
    bartitle <- input$BarData2
    barxlab <- input$BarData3
    Barylab <- input$BarData4
    
    
    
    
    #Draw Barplot
    barplot(barplotv1,
            main=bartitle,
            xlab=barrxlab,
            ylab=Barylab,
            col="blue",
            names.arg=c("test1","test2","test3","test4"))
    
    
    
  })
}

# Run the application 


shinyApp(ui = ui,  server = server)
