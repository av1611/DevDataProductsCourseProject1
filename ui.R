library(shiny)

##Reading data
temp <- tempfile()
url <- "http://apps.who.int/gho/athena/api/GHO/WHS2_138.csv?profile=verbose"
download.file(url, temp)
data <- read.csv(temp)
unlink(temp)

##List of countries for selection
countryTable <- table(data$COUNTRY..DISPLAY.)
countryList <- names(countryTable)

shinyUI(fluidPage(
        
        titlePanel("Deaths Due To HIV/AIDS (Per 100,000 Population)"),
        
        sidebarLayout(
                
                sidebarPanel(h5("Select Country"),
                             
                             p("By clicking into the field below, you can select
                                single or multiple countries can be selected in order to 
                                disclose their AIDS mortality for 2001 and 2012."),
                             
                             selectInput("select", label = "", 
                                         choices = countryList, multiple = T),
                             
                             br(), h5("Add Mean"),
                             
                             p("By checking the box below, mean calculations
                               can be added to the table."),
                             
                             checkboxInput("mean", label = ""),
                             
                             br(), br(), h5("Reference"),
                             
                             "Data has been retrieved from World Health Organization", 
                             HTML("<a href=http://apps.who.int/gho/athena/api/GHO/WHS2_138.csv?profile=verbose>
                                  link</a>"),"on", Sys.Date(), ". Information
                             is available", HTML("<a href=http://apps.who.int/gho/indicatorregistry/App_Main/view_indicator.aspx?iid=86>
                                                 here</a>"),"."
                        ),
                
                mainPanel(h4("Table"),
                          
                          tableOutput("table"),
                          
                          h4("Bar Chart"),
                          
                          textOutput("na"),
                          
                          plotOutput("plot")
                        )
                
                )
        )
)