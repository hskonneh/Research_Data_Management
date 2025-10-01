# Load the required packages for the project.
# ggplot2 is for data visualization.
library(ggplot2)
# plotly is for creating interactive plots.
library(plotly)
# readxl is for reading Excel files.
library(readxl)
# openxlsx is for writing Excel files.
library(openxlsx)
# dplyr is for data manipulation.
library(dplyr)
# lubridate is for working with dates.
library(lubridate)

# Load the data from the "Sheet2" of the "Research_data.xlsx" file into a variable called econ_data.
econ_data <- readxl::read_xlsx("Research_data.xlsx", sheet = "Sheet2")
# Display the loaded data in a new window.
View(econ_data)

# Remove the 'ghe_pof_gdp' column from the econ_data dataframe and store the result in a new dataframe called 'nd'.
nd <- econ_data %>% select(-ghe_pof_gdp)
# Display the 'nd' dataframe.
View(nd)

# Remove rows from 23 to the end of the econ_data dataframe and store the result in a new dataframe called new_econData.
new_econData <- econ_data[-c(23:nrow(econ_data)), ]
# Display the new_econData dataframe.
View(new_econData)

# Check the data types of each column in the new_econData dataframe.
str(new_econData)

# The following section contains some trial and error for date conversion.
# The initial attempts were incorrect and have been corrected later in the script.

# Attempt to convert the "year" column to a Date object. This method is not ideal as it adds month and day.
# new_econData$year <- as.Date(new_econData$year)
# View(new_econData)

# The script author notes a mistake and removes the dataframe to start over with the date conversion.
# rm(new_econData)
# View(new_econData)

# Correctly convert the "year" column to a date format using the make_date function from the lubridate package.
new_econData$year <- make_date(year = new_econData$year)
# Check the structure of the dataframe again to confirm the date conversion.
str(new_econData)
# Display the dataframe with the corrected date format.
View(new_econData)

# The following block is another approach to date conversion that was tested.
# It defines a function to convert a year to a date and applies it to the 'year' column.
# This is not the final method used in the script.
# nnd <- new_econData
# convert_to_year_date <- function(year){
#   as.Date(paste0(year, "01-01"))
# }
# nnd$year <- sapply(nnd$year, convert_to_year_date)
# View(nnd)
# rm(nnd)

# Create a ggplot object 'p' for a line chart of 'gdp in $' over the 'year'.
p <- new_econData %>% ggplot(, aes(year, `gdp in $`)) +
  geom_line()

# Convert the ggplot object 'p' to an interactive plotly object.
ggplotly(p)

# Display the new_econData dataframe again.
View(new_econData)

# Create a ggplot object 'plt' for a line chart of 'gee_pof_gdp' over the 'year'.
# It includes a smooth line and a logarithmic y-axis.
plt <- ggplot(new_econData, aes(year, gee_pof_gdp)) + geom_line(color = "blue") + geom_smooth(color="red") +
  scale_y_log10() +
  labs(
    title = "Trend Analysis of GDP (SLE)",
    x = "Year",
    y = "% of Govt Expenditure on Education"
  )
# Convert the ggplot object 'plt' to an interactive plotly object.
ggplotly(plt)

# Create another ggplot object 'plt' for a line chart of 'gee_pof_gdp' over the 'year'.
# This version does not have the smoothed line.
plt <- ggplot(new_econData, aes(year, gee_pof_gdp)) + geom_line(color = "blue") +
  scale_y_log10() +
  labs(
    title = "Trend Analysis of GDP (SLE)",
    x = "Year",
    y = "% of Govt Expenditure on Education"
  )
# Convert the ggplot object 'plt' to an interactive plotly object.
ggplotly(plt)

# Replace the NA value in the 'ghe_pof_gdp' column with the mean of the column.
new_econData$ghe_pof_gdp <- ifelse( # Use an ifelse statement.
  is.na(new_econData$ghe_pof_gdp), # If a value in the column is NA,
  mean(new_econData$ghe_pof_gdp, na.rm = TRUE), # replace it with the mean of the column (ignoring NAs in the mean calculation).
  new_econData$ghe_pof_gdp # Otherwise, keep the original value.
)


# Create a scatter plot 'plt_s' of 'ghe_pof_gdp' vs 'gdp per capita $'.
# Points are colored red if 'ghe_pof_gdp' is greater than 2, otherwise black.
plt_s <- ggplot(new_econData, aes(x = `gdp per capita $`, y = ghe_pof_gdp, colour = `gdp per capita $`)) +
  geom_point(color = ifelse( new_econData$ghe_pof_gdp > 2, "red", "black")) +
  labs(
    title = " A Scatter Plot of Govt Health Exp VS GDP Per Capita",
    x = "GDP per capita ($)",
    y = "% of Govt Health Exp"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5, # Center the title.
      face = "bold",
      color = "darkblue"
    )
  )
# Convert the ggplot object 'plt_s' to an interactive plotly object.
ggplotly(plt_s)
#####
# Create another scatter plot 'plt_s', this time with default coloring.
plt_s <- ggplot(new_econData, aes(x = `gdp per capita $`, y = ghe_pof_gdp, colour = `gdp per capita $`)) +
  geom_point() +
  labs(
    title = " A Scatter Plot of Govt Health Exp VS GDP Per Capita",
    x = "GDP per capita ($)",
    y = "% of Govt Health Exp"
  ) +
  theme(
    plot.title = element_text(
      hjust = 0.5, # Center the title.
      face = "bold",
      color = "darkblue"
    )
  )
# Convert the ggplot object 'plt_s' to an interactive plotly object.
ggplotly(plt_s)

#####
# Create a scatter plot 'lbft' with a linear regression line of best fit.
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
# Convert the ggplot object 'lbft' to an interactive plotly object.
ggplotly(lbft)

# Create a generalized linear model 'model' to analyze the relationship between 'ghe_pof_gdp' and 'gdp per capita $'.
model <- stats::glm( ghe_pof_gdp ~ `gdp per capita $`, data = new_econData)

# Display the summary of the model, which includes coefficients, p-values, and other statistics.
summary(model)