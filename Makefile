install:
	Rscript -e "renv::restore(prompt = FALSE)"
all: final_docs/final_report.html
	
data/cleaned_data.rds: code/00_clean_data.R data/CDC_PRAMS.csv
	Rscript code/00_clean_data.R

output/table1.rds: code/01_make_table.R data/cleaned_data.rds
	Rscript code/01_make_table.R

output/figure1.png: code/02_make_figure.R data/cleaned_data.rds
	Rscript code/02_make_figure.R

final_docs/final_report.html: report/final_report.Rmd \
  output/table1.rds output/figure1.png
	Rscript code/03_render_report.R

clean:
	rm -f output/* final_docs/*data/cleaned_data.rds
