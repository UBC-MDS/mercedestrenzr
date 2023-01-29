# Author: Spencer Gerlach
# Date: 2023-01-28

# Unit tests for the listing_summary function.

# Create toy data for package testing
toy_data <- data.frame(model = c("gl-class", "gl-class", "gl-class", "gl-class","amg", "amg", "amg", "amg", "sl-class"),
                       odometer_mi = c(25, 50, 10, 15, 30, 45, 10, 15, 99),
                       price_USD = c(2500, 5000, 1000, 10500, 3000, 4500, 1000, 1500, 8735))


test_that("Typical function works as expected", {
  ls1 <- listing_summary(data = toy_data)
  expect_equal(sum(ls1$avg_mileage_mi), 149, "avg_mileage_mi column not calculated correctly")
  expect_equal(sum(ls1$median_mileage_mi), 141, "median_mileage_mi column not calculated correctly")
  expect_equal(sum(ls1$avg_price_USD), 15985, "avg_price_USD column not calculated properly")
  expect_equal(sum(ls1$median_price_USD), 14735, "median_price_USD column not calculated properly")
  expect_equal(length(ls1), 7, "incorrect number of columns returned")
  expect_equal(nrow(ls1), 3, "incorrect number of rows returned")
})

  ls2 <- listing_summary(data = toy_data, model="gl-class")
  expect_equal(nrow(ls2), 1, "model type filter not working correctly")


test_that("Wrong data type inputs raise error.", {
expect_error(listing_summary(data = "toy_data"), "The input data must be a data.frame type.")
  expect_error(listing_summary(data = toy_data, model = 1234), "The model parameter must be a character input.")
  expect_error(listing_summary(data = toy_data, model_col = 1234), "The model_col parameter must be a character input.")
  expect_error(listing_summary(data = toy_data, price_col = 1234), "The price_col parameter must be a character input.")
  expect_error(listing_summary(data = toy_data, odometer_col = 1234), "The odometer_col parameter must be a character input.")
})

test_that("Wrong model types cannot be input.", {
  expect_error(listing_summary(data = toy_data, model = "1234"), "The model type specified does not exist in the data.")
})

test_that("Correct column names are used", {
  ls3 <- listing_summary(data = toy_data)
  col_names <- c("avg_mileage_mi", "avg_price_USD", "median_mileage_mi", "median_price_USD", "model", "percent_of_market", "rarity")
  expect_equal(sum(sort(colnames(ls3)) == sort(col_names)), 7, "Column names not generated correctly")
})

