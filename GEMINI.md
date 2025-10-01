# Gemini Guidelines for This R Project

This document provides guidelines and rules for interacting with this R project using Gemini.

## Project Overview

This project is for the Research Data Management Course 2025. It uses R for data analysis and visualization, focusing on economic and health data. The main script is `fair_d.R`, which loads data, cleans it, and generates plots.

## Getting Started

To work with this project, you will need:

1.  **R and RStudio:** The project is set up to be used with RStudio. Open the `FAIR_DATA-Exercise.Rproj` file to get started.
2.  **R Packages:** The project uses several R packages. You can install them by running this command in the R console:
    ```R
    install.packages(c("ggplot2", "plotly", "readxl", "openxlsx", "dplyr", "lubridate"))
    ```

## Project Structure

*   `FAIR_DATA-Exercise.Rproj`: The RStudio project file.
*   `fair_d.R`: The main R script for analysis and visualization.
*   `Data_Folder.zip`: A zip file containing the raw data. The data is in `Research_data.xlsx`.
*   `Vizualizations/`: A folder containing generated plots and visualizations.
*   `README.md`: The main project documentation.
*   `GEMINI.md`: This file.

## Development Guidelines

### Data Handling

*   **Use Relative Paths:** When reading data files, always use relative paths from the project root. For example, instead of `C:/Users/user/project/Data_Folder/Research_data.xlsx`, use `Data_Folder/Research_data.xlsx`.
*   **Data Cleaning:** Keep data cleaning and transformation steps clear and well-commented in the R scripts.

### Coding Style

*   **Follow Existing Style:** When modifying R scripts, follow the existing coding style (variable naming, commenting, etc.).
*   **Libraries:** Use the already included libraries (`ggplot2`, `dplyr`, etc.) for consistency.

### Visualizations

*   **Save Plots:** Save all generated plots and visualizations to the `Vizualizations/` directory.
*   **Descriptive Filenames:** Give your saved plots descriptive filenames (e.g., `gdp_vs_health_expenditure.png`).

## Rules

1.  **No Absolute Paths:** Do not use absolute file paths in the code. All paths should be relative to the project's root directory.
2.  **Keep Folders Organized:**
    *   R scripts go in the root directory.
    *   Data files should be in a `Data/` or `Data_Folder/` directory.
    *   Output visualizations should be saved in the `Vizualizations/` directory.
3.  **Document Your Work:** Add comments to your R code to explain complex logic or data transformations. If you add new features, consider updating the `README.md`.
