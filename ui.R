library(shiny)
library (shinythemes)
# Use a fluid Bootstrap layout
fluidPage(   
  
  
  # Give the page a title
  titlePanel("Student Grade Prediction"),
  theme = shinytheme('united'),
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      fileInput("csv_input","Select CSV File to Import",accept=".csv"),
      selectInput("indicator","Indicator",choices=c(NULL)),
      selectInput("prediction","Prediction Grade",choices=c(NULL)),
      selectInput("original","Original Grade",choices=c(NULL)),
      actionButton("run_button","Run Analysis",icon=icon("play"))
      
    ),
    
    
    
    # Create a spot for the barplot
   mainPanel(
   
       tabPanel(
         title = "Plot",
         plotOutput("plot_1"),
         plotOutput("plot_2"),
       )
       
        # fluidRow(
    #       column(width = 5, strong(textOutput("num_var_1_title"))),
     #      column(width = 5, strong(textOutput("num_var_2_title")))
    
     #    ),
      #   fluidRow(
       #    column(width = 5, tableOutput("num_var_1_summary_table")),
        #   column(width = 5, tableOutput("num_var_2_summary_table"))
         
    #     ),
     #    fluidRow(
      #     column(strong("Combined Statistics"))
       #  ),
        # fluidRow(
         #  column(tableOutput("combined_summary_table"))
       
     )
    #  plotOutput("p1")  
   # plotOutput(“plot_1”)
)
    
  
)
