library(shiny)
library(ggplot2)
library(dplyr)
library(ggmap)
library(maps)
library(mapdata)



# UI
RE_ui <- fluidPage(
   
   # Application title
   titlePanel("Renewable Energy Electricity Generation in Each Year"),
   
   # Sidebar
   sidebarLayout(
      sidebarPanel(
         sliderInput("Years",
                     "Select Year",
                     min = 2005,
                     max = 2015,
                     value = 2010)
         selectInput
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Server
RE_server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      x    <- faithful[, 2] 
      Years <- seq(min(x), max(x), length.out = input$bins + 1)
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
   output$Map <- renderPlot({
     usa <- map_data("usa") # we already did this, but we can do it again
     ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group)) + 
       coord_fixed(1.3)
   })
}

# Run the application 
shinyApp(ui = RE_ui, server = RE_server)

