#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
    
    titlePanel("BMI Calculator"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Please enter your body weight and height"),  
            selectInput("select_measurement", label = h5("Select the measurement"), choices = list("European Measures: kg and cm" = 1, "US Measures: lb and inches" = 2), selected = 1),
            numericInput("input_weight", label = h5("Please enter your body weight"),min = 1, value = NULL),
            numericInput("input_height", label = h5("Please enter your height"),min = 1, value = NULL),
            actionButton("calculate_button", label = "Calculate my BMI score")        
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("BMI score",
                         p(h5("")), textOutput("output_weight"),
                         textOutput("output_height"),  p(h3("Your BMI score:")),
                         textOutput("output_bmi")
                ),
                tabPanel("What is BMI",
                         p(h3("What is Body Mass Index and what it is used for?")),
                         HTML("The body mass index (BMI) is a measure that uses your height and weight to work out if your weight is healthy.
                      
                      The BMI calculation divides an adult's weight in kilograms by their height in metres squared. For example, A BMI of 25 means 25kg/m2.
                      The BMI is a convenient rule of thumb used to broadly categorize a person as underweight, normal weight, overweight, or obese based on tissue mass (muscle, fat, and bone) and height.
                      
                      BMI takes into account natural variations in body shape, giving a healthy weight range for a particular height.
                      
                      Muscle is much denser than fat, so very muscular people, such as heavyweight boxers, weight trainers and athletes, may be a healthy weight even though their BMI is classed as obese.
                      BMI is used differently for children. It is calculated in the same way as for adults but then compared to typical values for other children of the same age. Instead of comparison against fixed thresholds for underweight and overweight, the BMI is compared against the percentiles for children of the same sex and age.
                      These recommended distinctions along the linear scale may vary from time to time and country to country, making global, longitudinal surveys problematic.
                      Your ethnic group can also affect your risk of some health conditions. For example, adults of South Asian origin may have a higher risk of some health problems, such as diabetes, with a BMI of 23, which is usually considered healthy.
                      You should not use BMI as a measure if you're pregnant. Get advice from your midwife or GP if you're concerned about your weight.")                
                ),
                tabPanel("BMI Score Ranges ",
                         p(h4("This is the World Health Organization's (WHO) recommended body weight based on BMI values for adults. It is used for both men and women, age 18 or older.")),
                         HTML("
  
                      <b> >16 </b> ==> Severe Thinnes <br>
                      <br> </br>
                      <b> 16-17 </b> ==> Moderate Thinness <br>
                      <br> </br>
                     <b> 17-18.5 </b> ==> Mild Thinness <br>
                      <br> </br>
                      <b> 18.5-24.9 </b> ==> Normal   <br>
                      <br> </br>
                      <b> 25-30 </b> ==> Overweight <br>
                      <br> </br>
                      <b> 30-35 </b> ==> Obese Class I <br>
                      <br> </br>
                      <b> 35-40 </b> ==> Obese Class II <br>
                      <br> </br>
                      <b> >40 </b> ==> Obese Class III <br>")                
                )
            )
        )
    )
))

