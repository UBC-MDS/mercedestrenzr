# Author: Ty Andrews
# Date: 2023-01-25

library(here)
library(bundle)

#' A pretrained model to predict mercedes prices
#'
#' An XGboost model trained and tuned on the sample mercedes dataset.
#'
#' @format A tidymodels workflow including XGboost model.
#' @export
mercedes_price_model <- readRDS(here::here("data", "price-prediction-model_v1.rds")) |>
  bundle::unbundle()
