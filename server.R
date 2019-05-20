#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$hcontainer <- renderHighchart({
        
        hc <- hchart(inscritos_1,
               "column",
               hcaes(x=if (input$per_id == provincia_residencia),
                     y=total_inscritos,
                     group=interaction(periodo))) %>% 
            hc_add_theme(hc_theme_google())
        
        if (input$per_id != FALSE) {
            hc <- hc %>%
                hc_plotOptions(series = list(stacking = input$per_id))
        }
        
        hc
    })

})
