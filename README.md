#World Happiness report Analysis

This App is an interactive application showing the regression between the different six indicators of happpiness that is Logged GDP per capita,
Social support,Healthy life expectancy,Freedom to make life choices,Generosity,Perceptions of corruption and Ladder score of happiness.

#Packages to be installed

require(shiny)
require(ggplot2)

#Usage

Load the packages
require(shiny)
require(ggplot2)

#User inputs

The user selects the dependent variable from the list of all indicators and independent 
variable is default set as Ladder score.Then the graph would be displayed for corresponding inputs in form a graph.

#Dataset

The dataset contains the different inidcators of happiness and ladder scores for all the countries in different regions
of the world.This data is taken from www.kaggle.com

#To run the app directly from console 
runGitHub("Worldhappiness","AnjaliRajagopal","main")

#App layout-World happiness Analysis
![final shiny image](https://user-images.githubusercontent.com/81853539/114882433-3cad9a00-9e04-11eb-99a7-e7763c63d3d3.PNG)

