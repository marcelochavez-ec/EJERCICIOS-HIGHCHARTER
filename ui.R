library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

        # Sidebar with a slider input for number of bins
sidebarLayout(
    sidebarPanel(
    selectizeInput("per_id",
                   label = "Periodos",
                   choices = c("",
                            "1er. Semestre 2012",
                            "2do. Semestre 2012",
                            "1er. Semestre 2013",
                            "2do. Semestre 2013",
                            "1er. Semestre 2014",
                            "2do. Semestre 2014",
                            "1er. Semestre 2015",
                            "2do. Semestre 2015",
                            "1er. Semestre 2016",
                            "2do. Semestre 2016",
                            "1er. Semestre 2017",
                            "2do. Semestre 2017"),
                options = list(placeholder = 'Periodos del ENES/Ser Bachiller',
                               onInitialize = I('function() { this.setValue(""); }'))), 
    selectizeInput("prov_reside",
                label = "Provincias",
                width = "100%",
                multiple = TRUE,
                choices = inscritos_1$provincia_reside,
                options = list(
                    placeholder = 'Provincias de residencia de los estudiantes',
                    onInitialize = I('function() { this.setValue(""); }'),
                    maxItems = 24))
                ),
        # Show a plot of the generated distribution
        mainPanel(highchartOutput("hcontainer",height = "500px"))
                )
               ) 
       )
