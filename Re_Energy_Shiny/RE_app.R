library(shiny)
library(ggplot2)
library(dplyr)
library(ggmap)
library(maps)
library(readr)


# UI -----------------------------------------------------------------
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
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("Map")
      )
   )
)

# Server -------------------------------------------------------------
RE_server <- function(input, output) {
   
   output$Map <- renderPlot({
     Canada_Map <- read_csv("ca_postal_codes.csv")
     
     Canada_ggmap <- get_map(location = 'Canada', zoom = 3, 
                             maptype = "terrain",
                             source = 'google', color = 'bw')
     
     ggmap(Canada_ggmap) +
       geom_polygon(data = Canada_Map, mapping = aes(x = Longitude, y = Latitude, 
                                                     fill = Province, group = Province)) +
       ylim(40, 75)
   })
}

# Run the application 
shinyApp(ui = RE_ui, server = RE_server)

