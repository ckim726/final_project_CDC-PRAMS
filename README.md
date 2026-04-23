# CDC_PRAMS Smoking Analysis

---

## Code Structure

The analysis is organized into separate R scripts to ensure reproducibility:

- `code/00_clean_data.R`  
  - Reads the raw dataset  
  - Filters relevant variables (QUO30, QUO31)  
  - Creates the analytic dataset  

- `code/01_make_table.R`  
  - Processes the analytic dataset  
  - Reshapes the data  
  - Calculates smoking reduction  
  - Saves the table as `output/table1.rds`  

- `code/02_make_figure.R`  
  - Aggregates smoking prevalence  
  - Creates a bar plot using `ggplot2`  
  - Saves the figure as `output/figure1.png`  

- `code/03_render_report.R`  
  - Renders the final report using R Markdown  

---

## Table and Figure

- **Table 1**
  - Created by: `code/01_make_table.R`
  - Output: `output/table1.rds`

- **Figure 1**
  - Created by: `code/02_make_figure.R`
  - Output: `output/figure1.png`
---

## Output
- Table: `output/table1.rds`  
- Figure: `output/figure1.png`  

## How to Generate the Final Report

Run the following command: ```bash make

This will generate the final report at:
report/final_report.html

---

## Reproducibility
To reproduce this project, follow these steps:

1. Clone the repository:
   git clone https://github.com/ckim726/final_project_CDC-PRAMS.git

2. Navigate to the project directory:
   cd final_project_CDC-PRAMS

3. Restore the R package environment:
   make install

4. Build the report:
   make
   
## Docker
1. Build Docker Image
docker build -t prams_project .

2. Run Report
Mac/Linux-OS-specific
docker run --rm -v "$(pwd)/report:/final_project/report" prams_project
This will create a folder called report/ in your local directory containing the compiled HTML report.

3.push to DockerHub
https://hub.docker.com/r/ckim726/prams_project

