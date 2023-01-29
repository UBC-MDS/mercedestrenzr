# Author: Morris Zhao
# Date: 2023-01-17

library(ggplot2)
library(tidyverse)

#' Plot Mercedes Price
#'
#' Plot a density plot of a specific Mercedes-Benz model to see where the current vehicle's price
#' falls within the distribution of prices for that model in the market.
#'
#' @param model character The model of the vehicle.
#' @param price numeric  The price of the vehicle.
#' @param market_df data.frame Data containing information on used Mercedes-Benz in the market.
#' @param model_col character The name of the column of model. (By default 'model')
#' @param price_col character The name of the column of price. (By default 'price_USD')
#'
#' @return ggplot Density plot of prices for the specified Mercedes-Benz model.
#' @import ggplot2
#' @import tidyverse
#' @import rlang
#' @export
#'
#' @examples
#' data <- as.double(sample(10000:500000, 1000, replace = TRUE))
#' market_df <- data.frame(price_USD = data, model = "glb 35")
#' plot_mercedes_price('glb 35', 200000, market_df)
plot_mercedes_price <- function(model, price, market_df, model_col = 'model', price_col = 'price_USD') {

  # Test if inputs have correct type
  if(!is.character(model)){
    stop("The first input should be a character contain the specific model")
  }

  if(!is.numeric(price)){
    stop("The second input should be a number (the price of the car)")
  }

  if(!is.data.frame(market_df)){
    stop("The third input should be a data.frame")
  }

  # test if price column in the data set
  if(!price_col %in% colnames(market_df)){
    stop("Please insert the name of the price column")
  }

  # test if model input is a categoric in the dataset's model
  if(!model_col %in% colnames(market_df)){
    stop("Please insert the name of the model column")
  }

  # filter the data set for the specific model
  market_df <- market_df[market_df[,model_col] == model,]

  # Calculating the median of the market
  #mean <- mean(market_df[,price_col])

  # different message will be send base on price
  #if (price > mean) {
  #  message <- paste0("The input price", " = ", price, " is larger than the average of the market")
  #} else {
  #  message <- paste0("The input price", " = ", price, " is smaller than the average of the market")
  #}
  message <- "The Density Plot of Current Price"

  final_plot <- ggplot(market_df) +
    # aes(x = price_USD) +
    aes(x = !!rlang::sym(price_col)) +
    # aes_string(x = price_col) +
    geom_density(fill = 'blue', alpha=0.5) +
    geom_vline(xintercept = price, color = 'red') +
    #ggtitle(message) +
    ggtitle(message) +
    xlab("Price") +
    ylab("Density") +
    theme(plot.title = element_text(hjust = 0.5),
          axis.text.x = element_text(hjust = 1))

  return(final_plot)
}
