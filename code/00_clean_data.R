library(tidyverse)

CDC_data <- read_csv("data/raw_data.csv")

clean_data <- CDC_data  %>%
  select(where(~ !all(is.na(.))))

analytic <- clean_data %>%
  filter(QuestionId %in% c("QUO30", "QUO31")) %>%
  mutate(
    TimePeriod = case_when(
      QuestionId == "QUO30" ~ "3 months before pregnancy",
      QuestionId == "QUO31" ~ "Last 3 months of pregnancy"
    )
  )

saveRDS(analytic,"data/cleaned_data.rds")