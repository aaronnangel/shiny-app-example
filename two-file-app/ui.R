
# Navigation bar
ui <- navbarPage(
  
  title = "Palmer Penguins Data Explorer",
  
  # Page 1 - About this app
  tabPanel(title = "About this App",
           
           # adding fluidRow with about text ----
           fluidRow(
             # white space 
             column(1),
             # use 10 columns for about text
             column(10, includeMarkdown("text/about.md")),
             # end with white space
             column(1)
           ), #end of fluidRow with About this app text
           
           fluidRow(
             # white space
             column(2),
             # output for leaflet map
             column(8, leafletOutput(outputId = "palmer_station_map")),
             # white space
             column(2)
           ) #end fluidRow with leaflet map
           
           ), #end of page 1 - About this app
  
  # Page 2 - Data exploration
  tabPanel(title = "Explore the Data",
           
           fluidPage(
             
             # Penguin plot sidebarLayout ----
             sidebarLayout(
               
               sidebarPanel(
                 
                 # island pickerInput ----
                 # from shinyWidget package
                 pickerInput(inputId = "penguin_island_input", label = "Select an island(s):",
                             choices = c("Torgersen", "Dream", "Biscoe"),
                             selected = c("Torgersen", "Dream", "Biscoe"),
                             options = pickerOptions(actionsBox = TRUE),
                             multiple = TRUE), #end island pickerInput
                 
                 # bin number sliderInput ----
                 sliderInput(inputId = "bin_num_input", label = "Select number of bins:",
                             value = 25, max = 100, min = 1), # END bin number sliderInput
               ),
               
               mainPanel(
                 plotOutput(outputId = "flipperLength_histogram_output")
               )
                 
               
             ), #end of penguin plot sidebarLayout
             
             # Penguin table sidebarLayout ----
             sidebarLayout(
               sidebarPanel(
                 # year checkbox input ----
                 checkboxGroupInput(inputId = "year_select", 
                                    label = "Select year(s)" ,
                                    choices = c(2007, 2008, 2009),
                                    selected = c(2007, 2008)), # END checkbox input
                 
               ), #end penguin table sidebarPanel
              
               # Penguin table mainPanel ----   
               mainPanel(
                 DT::dataTableOutput(outputId = "interactive_table_output") 
                 
               ) # END penguin table mainPanel
             
           ) # END penguin table sidebarLayout
             
           ) #end of fluidPage
           
  ) #end of page 2
  
) #end of Navbar

