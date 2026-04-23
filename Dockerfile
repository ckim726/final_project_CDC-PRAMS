FROM rocker/tidyverse

RUN apt-get update && apt-get install -y pandoc

WORKDIR /final_project

COPY code code
COPY data data
COPY Makefile .
COPY report/final_report.Rmd report/final_report.Rmd

RUN mkdir -p output
RUN mkdir -p report

RUN Rscript -e "install.packages(c('gt','here'), repos='https://cloud.r-project.org')"

CMD ["make"]