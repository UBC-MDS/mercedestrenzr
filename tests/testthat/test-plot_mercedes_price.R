# Author: Morris Zhao
# Date: 2023-01-24

# create an array of 1000 random numbers between 10000 and 500000
data <- as.double(sample(10000:500000, 1000, replace = TRUE))
# create a dataframe with one column named 'price_USD' model column
market_df <- data.frame(price_USD = data, model = "glb 35")

# Test when input model is an integer, the function will throw an error
test_that("Expected exception was not raised", {
  expect_error(plot_mercedes_price(10, 450000, market_df), "The first input should be a character contain the specific model")
  expect_error(plot_mercedes_price(100, 450000, market_df), "The first input should be a character contain the specific model")
  expect_error(plot_mercedes_price(list('glb'), 450000, market_df), "The first input should be a character contain the specific model")
  expect_error(plot_mercedes_price(list(10), 450000, market_df), "The first input should be a character contain the specific model")
})

# Test when input market_df is not a dataframe, the function will throw an error
test_that("Expected exception was not raised", {
  expect_error(plot_mercedes_price('glb', 450000, "market_df"), "The third input should be a data.frame")
  expect_error(plot_mercedes_price('glb', 450000, "glb"), "The third input should be a data.frame")
  expect_error(plot_mercedes_price('glb', 450000, 1234), "The third input should be a data.frame")
  expect_error(plot_mercedes_price('glb', 450000, list(1,2,3,4)), "The third input should be a data.frame")
})

# Test if price column not in the data set, the function will throw an error
test_that("Expected exception was not raised", {
  expect_error(plot_mercedes_price('glb', 400000, market_df, price_col = 'not_in'), "Please insert the name of the price column")
  expect_error(plot_mercedes_price('glb', 400000, market_df, price_col = 'price_CAD'), "Please insert the name of the price column")
})

# Test whether the function returns a plot
test_that("Function did not return a ggplot", {
  expect_type(plot_mercedes_price('glb 35', 400000, market_df), "list")
  expect_type(plot_mercedes_price('glb 35', 300000, market_df), "list")
})
