library(rmarkdown)

rmarkdown::render(
  input = "report/final_report.Rmd",
  output_file = "final_report.html",
  output_dir = "final_docs"
)