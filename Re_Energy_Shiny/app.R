library(shiny)
library(ggplot2)
library(dplyr)
library(ggmap)
library(maps)
library(mapdata)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Renewable Energy Electricity Generation in Each Year"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("Years",
                     "Select Year",
                     min = 2005,
                     max = 2015,
                     value = 2010)
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
      x    <- faithful[, 2] 
      Years <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
   output$Map <- renderPlot({
     usa <- map_data("usa") # we already did this, but we can do it again
     ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group)) + 
       coord_fixed(1.3)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

