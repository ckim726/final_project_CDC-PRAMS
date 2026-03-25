library(tidyverse)
library(gt)
analytic <- readRDS(here::here("data/cleaned_data.rds"))

clean_table <- analytic %>%
  select(LocationDesc, TimePeriod, Data_Value) %>%
  pivot_wider(
    names_from = TimePeriod,
    values_from = Data_Value
  ) %>%
  mutate(
    Reduction = `3 months before pregnancy` - `Last 3 months of pregnancy`
  ) %>%
  rename(
    Location = LocationDesc,
    Before = `3 months before pregnancy`,
    During = `Last 3 months of pregnancy`
  ) %>%
  arrange(desc(Reduction))

clean_table %>%
  gt() %>%
  tab_header(
    title = "Smoking Prevalence Before vs Late Pregnancy (2011)",
    subtitle = "CDC PRAMStat"
  ) %>%
  cols_label(
    Before = "Before Pregnancy (%)",
    During = "Last 3 Months (%)",
    Reduction = "Absolute Reduction (%)"
  ) %>%
  fmt_number(columns = c(Before, During, Reduction), decimals = 1)

saveRDS(clean_table, here::here("output/table1.rds"))