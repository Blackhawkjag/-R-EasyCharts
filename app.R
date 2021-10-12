
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
                            textInput("BoxplotTitle", "Boxplot Title", ""),
                            textInput("Boxplotxlab", "X-Label", ""),
                            textInput("Boxplotylab", "Y-Label", ""),
                            selectInput("ColorChoice", "Choose Color1", c("Red", "Green","Blue")),
                            selectInput("ColorChoice2","Pick Second Color", c("Red", "Green","Blue")),
                            
                          ),
                      
                        

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )))))
        
        

# Define server logic 
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # Set variables for dual input box plot
        boxplotv1 <- as.integer(strsplit(input$Data1, ",")[[1]])
        
        boxplotv2 <- as.integer(strsplit(input$Data2, ",")[[1]])
        
        boxcolor1 <- input$ColorChoice
        boxcolor2 <- input$ColorChoice2
        
      

        # draw boxplot
        boxplot(boxplotv1,boxplotv2,
                ylim=c(0,50),
                main=input$BoxplotTitle,
                xlab=input$Boxplotxlab,
                ylab=input$Boxplotylab,
                col=c(boxcolor1,boxcolor2))
    })
}

# Run the application 


shinyApp(ui = ui,  server = server)

