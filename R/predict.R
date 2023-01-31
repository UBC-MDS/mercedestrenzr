# Author: Ty Andrews
# Date: 2023-01-21


#' Predicts the price in USD of a Mercedes-Benz.
#'
#' @param model the model of the mercedes, character
#' @param year the year the car was made, integer
#' @param odometer_mi the odomoteter reading of the vehicle, integer
#' @param condition the physical condition of the vehicle, must be one
#'    of 'new', 'like new', 'excellent', 'good', 'fair', 'salvage', character
#' @param paint_color the color the car is painted, character
#' @param version the model version to use, format 'vX', character
#'
#' @return the price of the car as a numeric
#' @import tidyverse
#' @import tidymodels
#' @import here
#' @import bundle
#' @import rlang
#' @export
#'
#' @examples
#' price <- predict_mercedes_price("e-class", 2015, 55000, "fair", "silver")
predict_mercedes_price <- function(model, year, odometer_mi, condition, paint_color, version="v1") {

  if(!is.character(model)){
    stop("The first input should be a character contain the specific model")
  }

  if(!is.numeric(year)){
    stop("The second input should be the year of the car as a whole number, e.g. 1979")
  }

  if(!is.numeric(odometer_mi)){
    stop("The third input should be the miles on the odometer as whole number.")
  }

  if(odometer_mi < 0){
    stop("The odometer_mi must be greater than 0")
  }

  if(!is.character(condition)){
    stop("The forth input should be the condition of the car as characters, one of salvage, used, fair, good, excellent, like new, new")
  }

  if(!is.element(condition, c('salvage', 'used', 'fair', 'good', 'excellent', 'like new', 'new'))){
    stop("The forth input should be one of salvage, used, fair, good, excellent, like new, new")
  }

  if(!is.character(paint_color)){
    stop("The fifth input should be the color of the car as a character, e.g. 'red'")
  }

  new_data <- data.frame(year=c(year),
                         condition=c(condition),
                         model=c(model),
                         paint_color=c(paint_color),
                         odometer_mi = c(odometer_mi),
                         stringsAsFactors=TRUE
  ) |>
    mutate(
      condition = factor(condition, ordered = TRUE, levels = c("salvage", "used", "fair", "good", "excellent", "like new", "new"))
    )

  predict(mercedes_price_model,
          new_data = new_data) |>
    rename(predicted_price_USD = .pred)

}
