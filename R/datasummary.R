# Author: Spencer Gerlach
# Date: 2023-01-28

#' Returns a dataframe summary of all existing Mercedes-Benz car listings
#' Summary mileage, price, and rarity information is shown.
#'
#'
#' @param data data.frame The input Mercedes-Benz dataframe
#' @param model character A character vector that lists all Mercedes-Benz model types to be included in the final summary table.
#' @param model_col character The name of the column in the input dataframe that represents the Mercedes-Benz model
#' @param odometer_col character The name of the column in the input dataframe that represents the Mercedes-Benz mileage (odometer reading in miles)
#' @param price_col character The name of the column in the input dataframe that represents the Mercedes-Benz sale price (price in USD)
#'
#' @return data.frame Summary dataframe of Mercedes-Benz models, including average and median mileage (mi) and price (USD), and information about rarity. A model will be considered common, uncommon, or rare based on the percentage of market listings.
#' @import tidyverse
#' @import rlang
#' @export
#'
#' @examples
#' toy_data <- data.frame(model = c("gl-class", "gl-class", "gl-class", "amg", "amg", "amg"),
#' odometer_mi = c(100000, 200000, 400000, 100000, 200000, 400000),
#' price_USD = c(10000, 20000, 40000, 10000, 20000, 40000))
#' listing_summary(data = toy_data, model="all")
#' listing_summary(data = toy_data, model="gl-class")
listing_summary <- function(data, model="all", model_col="model", odometer_col="odometer_mi", price_col="price_USD") {

  # === Exception Handling ===

  # check input data is a dataframe
  if(!is.data.frame(data)){
    stop("The input data must be a data.frame type.")
  }

  # check model is a character input
  if(!is.character(model)){
    stop("The model parameter must be a character input.")
  }

  # check model is in the list of possible unique model types
  if(!(model %in% unique(data$model) | model == "all")){
    stop("The model type specified does not exist in the data.")
  }

  # check model_col is a character input
  if(!is.character(model_col)){
    stop("The model_col parameter must be a character input.")
  }

  # check price_col is a character input
  if(!is.character(price_col)){
    stop("The price_col parameter must be a character input.")
  }

  # check odometer_col is a character input
  if(!is.character(odometer_col)){
    stop("The odometer_col parameter must be a character input.")
  }


  # === Function ===
  model_col <- dplyr::sym(model_col)
  odometer_col <- dplyr::sym(odometer_col)
  price_col <- dplyr::sym(price_col)

  # Filter for relevant columns and remove skewing data
  filtered_mercedes <- data |>
    dplyr::select({{model_col}}, {{odometer_col}}, {{price_col}}) |>
    dplyr::filter({{price_col}} < 500000, {{odometer_col}} < 400000)

  # Count total number of listings remaining
  num_filtered <- nrow(filtered_mercedes)

  # Create a numeric summary table of all listings
  summary_table <- filtered_mercedes |>
    dplyr::group_by({{model_col}}) |>
    dplyr::summarize(avg_mileage_mi = round(mean({{odometer_col}}, na.rm = TRUE), 0),
                     median_mileage_mi = round(median({{odometer_col}}),0),
                     avg_price_USD = round(mean({{price_col}}, na.rm=TRUE), 0),
                     median_price_USD = median({{price_col}}, na.rm = TRUE),
                     percent_of_market = round(100*(dplyr::n() / num_filtered), 1),
                     rarity = dplyr::case_when(percent_of_market <= 5 ~ "Rare",
                                               percent_of_market < 15 & percent_of_market > 5 ~ "Uncommon",
                                               percent_of_market >= 15 ~ "Common")
    )

  if(model != "all"){
    summary_table <- summary_table |>
      dplyr::filter({{model_col}} == {{model}})
  }

  return(summary_table)
}
