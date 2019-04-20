library(reticulate)
use_python("/usr/local/bin/python")
library(shiny)

#connect python to r:
source_python("meerbot_functions.py")


ui <- fluidPage(
  
  
  div(h1("Meerbot Control")),
  
  #Inputs
  sidebarLayout(
    sidebarPanel(
      
      div("Navigation"),
      br(),
      
      actionButton("forward", "Forward"),
      br(),
      br(),
      actionButton("left", "Left"),
      actionButton("right", "Right"),
      br(),
      br(),
      actionButton("backward", "Backward"),
      br(),
      br(),
      actionButton("stop_motors", "Stop Motors"),
      br(),
      br(),
      actionButton("blue_led", "Blue"),
      actionButton("blue_led_off", "Blue Off"),
      br(),
      br(),
      actionButton("right_circle", "Right circle"),
      br(),
      actionButton("lights", "Lights"),
      actionButton("trick", "Trick")
      
      ),
    
    mainPanel(
      
      #Outputs
      titlePanel("Log"),
      textOutput("log")
      
    )
  )
)

server <- function(input, output){
  
  observeEvent(input$stop_motors,{
    #from python:
    stop_motors()
  })    


  observeEvent(input$forward, {
    print("forward_cliked")
    #from python:
    forward()
  })
  
  observeEvent(input$backward, {
    print("backward_cliked")
    #from python:
    backward()
  })
  
  observeEvent(input$left, {
    print("left_cliked")
    #from python:
    left()
  })
  
  observeEvent(input$right, {
    print("right_cliked")
    #from python:
    right()	
  })

  observeEvent(input$blue_led, {
    counter <-0
    
    if (counter%%2 == 0){
    	#from python
	blue_led_on()
    	counter <- counter + 1
    } else {
    	#from python
	blue_led_off()
    	counter <- counter + 1    
    }
  })
 
  observeEvent(input$blue_led_off, {
       	#from python
	blue_led_off()
  })

 observeEvent(input$right_circle, {
	#from python
	right_circle()
})

 observeEvent(input$lights, {
	#from python
	lights()
})

 observeEvent(input$trick, {
	#from python
	trick()
})
    
  
  output$log <- renderText({
  })
}

#set up the website
shinyApp(ui = ui, server = server)

