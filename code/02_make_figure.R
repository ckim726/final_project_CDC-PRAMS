library(tidyverse)
library(ggplot2)

analytic <- readRDS("data/cleaned_data.rds")

plot <- analytic %>%
  group_by(LocationDesc, TimePeriod) %>%
  summarise(
    Prevalence = mean(Data_Value, na.rm = TRUE),
    .groups = "drop"
  )

plot2 <- ggplot(plot, aes(x = LocationDesc, y = Prevalence, fill = TimePeriod)) +
  geom_col(position = "dodge") +
  labs(
    title = "Maternal Smoking Before vs Late Pregnancy by Location",
    x = "Location",
    y = "Smoking Prevalence (%)",
    fill = "Time Period"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    text = element_text(size = 12)
  )

ggsave(("output/figure1.png"), plot2, width = 8, height = 5)