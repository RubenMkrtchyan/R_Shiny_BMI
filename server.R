#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(htmlwidgets)
shinyServer(function(input, output) {
    result <- reactiveValues()
    observe({
        input$calculate_button
        if(input$select_measurement == 1)
        {
            result$bmi <- isolate({
                input$input_weight / ((input$input_height/100)^2)
            })
        }
        else
        {
            result$bmi <- isolate({
                (703 * input$input_weight) / ((input$input_height)^2) 
            })
        }
    })
    
    output$output_bmi <- renderText({
        if(input$calculate_button == 0) ""
        else 
            paste(round(result$bmi, digits = 2))
    })
    
})

