World Happiness report Analysis

This App is an interactive application showing the regression between the different six indicators of happpiness that is Logged GDP per capita,
Social support,Healthy life expectancy,Freedom to make life choices,Generosity,Perceptions of corruption and Ladder score of happiness.

Packages to be installed

require(shiny)
require(ggplot2)

Usage

Load the packages
require(shiny)
require(ggplot2)

User inputs

The user selects the dependent variable from the list of all indicators and independent 
variable is default set as Ladder score.Then the graph would be displayed for corresponding inputs in form a graph.
The summary tab displays the linear regression of dependent and independent variables.

Dataset

The dataset contains the different inidcators of happiness and ladder scores for all the countries in different regions
of the world.This data is taken from www.kaggle.com

To run the app directly from console 
install(shiny)
runGitHub("Worldhappiness","AnjaliRajagopal","main")

#App layout-World happiness Analysis
![finalfinal](https://user-images.githubusercontent.com/81853539/114901249-e6952280-9e14-11eb-90d8-d9eee00c1971.PNG)


