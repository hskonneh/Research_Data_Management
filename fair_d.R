# load the required packages for the project

library(ggplot2)
library(plotly)
library(readxl)
library(openxlsx)
library(dplyr)
library(lubridate)
# load the data into a variable.

econ_data <- readxl::read_xlsx("C:/Users/LENIVO/Documents/my_R_Scripts/FAIR_D-Exercise/FAIR_DATA-Exercise/Data_Folder/Research_data.xlsx",sheet = "Sheet2")
View(econ_data)

#remove ghe_pof_gdp column.
nd <- econ_data %>% select (-ghe_pof_gdp)
View(nd)

# drop rows from row 23 to end

new_econData <- econ_data[-c(23:nrow(econ_data)), ]
View(new_econData)

#let's check our data types of each column
str(new_econData)

# Convert the "YEAR" column to date, BUT THIS METHOD DOSEN'T work. We'll try another
new_econData$year <- as.Date(new_econData$year)
View(new_econData)

# I have made a mistake above, i included the days and months, which i don't want. now i will delete and reassign the variable again.
rm(new_econData)
View(new_econData)

new_econData$year <- make_date(year = new_econData$year)
str(new_econData)
View(new_econData)

nnd <- new_econData
convert_to_year_date <- function(year){
  as.Date(paste0(year, "01-01"))
}
nnd$year <- sapply(nnd$year, convert_to_year_date)

View(nnd)
rm(nnd)


p <- new_econData %>% ggplot(,aes(year, `gdp in $`)) +
  geom_line()

ggplotly(p)

View(new_econData)

plt <- ggplot(new_econData, aes(year,gee_pof_gdp)) + geom_line(color = "blue") + geom_smooth(color="red") +
  scale_y_log10() +
  labs(
    title = "Trend Analysis of GDP (SLE)",
    x = "Year",
    y = "% of Govt Expenditure on Education"
  )
ggplotly(plt)

plt <- ggplot(new_econData, aes(year,gee_pof_gdp)) + geom_line(color = "blue") +
  scale_y_log10() +
  labs(
    title = "Trend Analysis of GDP (SLE)",
    x = "Year",
    y = "% of Govt Expenditure on Education"
  )
ggplotly(plt)

# let's replace that one NA in the Data Frame.
new_econData$ghe_pof_gdp <- ifelse( # we select the column and use an ifelse statement that if
  is.na(new_econData$ghe_pof_gdp), # there is NA in the column ghe_pof_gdp of new_econData Data Frame,
  mean(new_econData$ghe_pof_gdp, na.rm = TRUE), # calculate the mean of the column,replace and remove the NA value in the original data
  new_econData$ghe_pof_gdp # else leave the column as it is.
)


plt_s <- ggplot(new_econData, aes(x = `gdp per capita $`, y = ghe_pof_gdp, colour = `gdp per capita $`)) +
  geom_point(color = ifelse( new_econData$ghe_pof_gdp > 2, "red", "black")) +
  labs(
    title = " A Scatter Plot of Govt Health Exp VS GDP Per Capita",
    x = "GDP per capita ($)",
    y = "% of Govt Health Exp"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5, # Center Title
      face = "bold",
      color = "darkblue"
    )
  )
ggplotly(plt_s)
#####
plt_s <- ggplot(new_econData, aes(x = `gdp per capita $`, y = ghe_pof_gdp, colour = `gdp per capita $`)) +
  geom_point() +
  labs(
    title = " A Scatter Plot of Govt Health Exp VS GDP Per Capita",
    x = "GDP per capita ($)",
    y = "% of Govt Health Exp"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5, # Center Title
      face = "bold",
      color = "darkblue"
    )
  )
ggplotly(plt_s)

#####
# let's get our line of best fit

lbft <- ggplot(new_econData, aes(x = `gdp per capita $`, y = ghe_pof_gdp )) +
  geom_point() +
  geom_smooth(method = "lm", col = "grey") +
  labs(
    title = " A graph of Linear Regression of GDP Per Capita($) on % of Govt Health Exp on Health",
    x = "GDP Per Capita ($)",
    y = "% of GDP on Govt Health Exp"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", colour = "darkblue")
  )
ggplotly(lbft)

model <- stats::glm( ghe_pof_gdp ~ `gdp per capita $`, data = new_econData)

summary(model)




