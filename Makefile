all: report/final_report.html

install:
	Rscript -e "renv::restore(prompt = FALSE)"

data/cleaned_data.rds: code/00_clean_data.R data/raw_data.csv
	Rscript code/00_clean_data.R

output/table1.rds: code/01_make_table.R data/cleaned_data.rds
	Rscript code/01_make_table.R

output/figure1.png: code/02_make_figure.R data/cleaned_data.rds
	Rscript code/02_make_figure.R

report/final_report.html: report/final_report.Rmd \
  output/table1.rds output/figure1.png
	Rscript code/03_render_report.R
	
docker_report:
	mkdir -p report
	docker run --rm -v "$$(pwd)/report:/final_project/report" ckim726/prams_project:latest

clean:
	rm -f output/* final_docs/* data/cleaned_data.rds

