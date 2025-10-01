# Research Data Management and Analysis.

This repository offers a structured pathway to broaden your technical and analytical abilities through hands-on exercises, tutorials, and real-world examples. It highlights the pivotal role of research data management, guiding you from data collection and organization to long-term preservation and responsible sharing.

By weaving in best practices for metadata creation, version control, and reproducible workflows, this project empowers you to handle diverse datasets with confidence, ensuring your research remains transparent, reliable, and primed for future discovery.

## Economic Analysis

This repository provides a comprehensive examination of Sierra Leone’s economy through variables such as GDP growth, inflation rates, employment figures, trade balances, and sectoral outputs. You’ll sharpen your skills in data cleaning, statistical modeling, and visualization by working with real-world datasets.

## 📜 Table of Contents

- [Project Status](#project-status)
- [Getting Started](#getting-started)
- [Dataset](#dataset)
- [File Structure](#file-structure)
- [Analysis and Visualizations](#analysis-and-visualizations)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## 📈 Project Status

For a detailed log of recent changes and updates to the project, please see the [project_updates.md](project_updates.md) file.

## 🚀 Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [R](https://www.r-project.org/)
- [RStudio](https://www.rstudio.com/)

### Installation

1. **Clone the repository:**
   ```sh
   git clone <repository-url>
   ```
2. **Open the project in RStudio:**
   Open the `FAIR_DATA-Exercise.Rproj` file.
3. **Install R packages:**
   Run the following command in the R console to install the necessary packages:
   ```R
   install.packages(c("ggplot2", "plotly", "readxl", "openxlsx", "dplyr", "lubridate"))
   ```

### Running the Analysis

Open the `fair_d.R` script in RStudio and run it to perform the data analysis and generate the visualizations.

## 💾 Dataset

The dataset used for this analysis is `Research_data.xlsx`. It contains economic and health indicators for Sierra Leone. The columns include:

- `year`: The year of the observation.
- `gdp in $`: Gross Domestic Product in US dollars.
- `gdp per capita $`: GDP per capita in US dollars.
- `gee_pof_gdp`: Percentage of Government Expenditure on Education.
- `ghe_pof_gdp`: Percentage of Government Health Expenditure of GDP.

For more detailed information about the dataset, please refer to the `MetaData.docx` file.

## 📁 File Structure

```
.
├── .gitignore
├── fair_d.R
├── FAIR_DATA-Exercise.Rproj
├── GEMINI.md
├── LICENSE
├── MetaData.docx
├── project_updates.md
├── README.md
├── Research_data.xlsx
└── Vizualizations
    └── Vizualizations
        ├── ... (HTML and PNG files)
        └── about_visuals.md
```

- **`.Rproj`**: The RStudio project file.
- **`.R`**: The main R script for the analysis.
- **`Research_data.xlsx`**: The dataset file.
- **`Vizualizations/Vizualizations/`**: Contains the output visualizations from the R script.
- **`Vizualizations/Vizualizations/about_visuals.md`**: Documentation for the visualizations.
- **`MetaData.docx`**: Contains the metadata for the dataset.
- **`GEMINI.md`**: Guidelines for interacting with this project using Gemini.
- **`project_updates.md`**: A log of recent changes to the project.
- **`LICENSE`**: The project license.
- **`README.md`**: This file.

## 📊 Analysis and Visualizations

The `fair_d.R` script performs the following steps:

1. **Loads the data** from `Research_data.xlsx`.
2. **Cleans the data** by removing unnecessary columns and rows with missing values.
3. **Transforms the data**, including converting the 'year' column to a date format.
4. **Generates visualizations** to explore the relationships between different variables.

The following visualizations are created:

- A line chart showing the trend of GDP over the years.
- A line chart showing the trend of the percentage of government expenditure on education.
- A scatter plot of Government Health Expenditure vs. GDP Per Capita.
- A linear regression plot of GDP Per Capita vs. Government Health Expenditure.

The generated plots are saved in the `Vizualizations/` directory in both HTML (interactive) and PNG (static) formats. You can find more details about the visualizations in `Vizualizations/Vizualizations/about_visuals.md`.

## 🔮 Future Enhancements

The current analysis provides a foundational understanding of the data. Future work could expand on this by incorporating more advanced econometric techniques to explore the causal impact of government health expenditure on GDP. Potential enhancements include:

- **Advanced Regression Analysis:**

  - **Multiple Regression:** Include other relevant variables (e.g., education expenditure, inflation) to build a more robust model of GDP.
  - **Panel Data Analysis:** If data from multiple countries or regions were available, panel data models could control for unobserved heterogeneity.
- **Time Series Analysis:**

  - **ARIMA (Autoregressive Integrated Moving Average):** Model and forecast GDP and health expenditure as time series data.
  - **GARCH (Generalized Autoregressive Conditional Heteroskedasticity):** Model the volatility in the economic data.
  - **Vector Autoregression (VAR):** Analyze the dynamic relationships between multiple time series variables simultaneously.
- **Causality Tests:**

  - **Granger Causality Test:** Investigate whether past values of health expenditure can predict future values of GDP.

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m '''Add some AmazingFeature'''`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

##     Acknowledgments

- Elwazi-Open Data Science Platform  for the Research Data Management Course.
