# Author: Ty Andrews
# Date: 2023-01-25

library(here)
library(bundle)

mercedes_price_model <- readRDS(here::here("data", "price-prediction-model_v1.rds")) |>
  bundle::unbundle()
