library(shiny)

library(ggplot2)

library(data.table)

# Define a server for the Shiny app
function(input , output) {
  
  data_input <- reactive({
    req(input$csv_input)
    fread(input$csv_input$datapath)
  })
  
  observeEvent(data_input(),{
    choices <- c(names(data_input()))
    updateSelectInput(inputId = "indicator", choices = c("age","failures","Medu","Fedu","higher","goout","romantic"))
    updateSelectInput(inputId = "prediction", choices = c("RandomForest"))
    updateSelectInput(inputId = "original", choices = c("G3"))
  })
  
  indicator <- eventReactive(input$run_button,input$indicator)
  prediction <- eventReactive(input$run_button,input$prediction)
  original <- eventReactive(input$run_button,input$original)
  
  plot_1 <- eventReactive(input$run_button,{
    draw_plot_1(data_input(), indicator(), prediction())
  })
  
  draw_plot_1 <- function(data_input, indicator, prediction){
 #   if(num_var_1 != not_sel & 
 #      num_var_2 != not_sel ){
      ggplot(data = data_input, 
             aes_string(x = prediction,y = indicator)) +
        geom_point(size = 3, color = 'blue')
  #  }
  }
  
  plot_2 <- eventReactive(input$run_button,{
    draw_plot_2(data_input(), indicator(), original())
  })
  
  draw_plot_2 <- function(data_input, indicator, original, col ="red"){
    #   if(num_var_1 != not_sel & 
    #      num_var_2 != not_sel ){
    ggplot(data = data_input, 
           aes_string(x = original,y = indicator)) +
      geom_point(size = 3, color = 'red')
    #  }
  }
  
  output$plot_1 <- renderPlot(plot_1())
  output$plot_2 <- renderPlot(plot_2())
}