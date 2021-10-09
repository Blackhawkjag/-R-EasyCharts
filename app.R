#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
1
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("EasyCharts!
               "),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            tags$h3("BoxPlots!"),
            textInput("Data1","Data Point 1", ""),
            textInput("Data2","Data Point 2", ""),
            textInput("BoxplotTitle", "Boxplot Title", ""),
            textInput("Boxplotxlab", "X-Label", ""),
            textInput("Boxplotylab", "Y-Label", ""),
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x <- as.integer(strsplit(input$Data1, ",")[[1]])
        
        y <- as.integer(strsplit(input$Data2, ",")[[1]])
        
        
      
                                 

        # draw the histogram with the specified number of bins
        boxplot(x,y,
                ylim=c(0,50),
                main=input$BoxplotTitle,
                xlab=input$Boxplotxlab,
                ylab=input$Boxplotylab,
                col=c("Purple","Red"))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
