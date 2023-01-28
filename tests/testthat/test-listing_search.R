# Author: Kelly Wu
# Date: 2023-01-28

#Unit tests for listing_search function

# Create a fictitious data set for testing
data <- data.frame(
  condition = c("good", 'average', 'average', 'new'),
  price_USD = c(50000, 20000, 80000, 90000),
  model = c('s-class', 'glk', 'gls', 'gls'),
  odometer_mi = c(12000, 30000, 35000, 150000),
  year = c(2016, 2015, 2020, 2010)
)

test_that("Regular use cases", {
  t1 <- listing_search(data, budget=50000, model = "glk", sort_feature = "odometer_mi", ascending = TRUE)
  expect_equal(class(t1), "data.frame", info = "The function did not return a dataframe")
  expect_equal(dim(t1), c(1,5), info = "Wrong number of listings returned")
  expect_equal(t1$model, "glk", info = "The output was not filtered by model= parameter ")
  expect_equal(sort(colnames(t1)), sort(c("price_USD", "model", "odometer_mi", "condition", "year")),
               info = "The dataframe does not contain the correct columns")

  t2 <- listing_search(data, budget=c(50000, 100000), model = "any", sort_feature = "year", ascending = FALSE)
  expect_equal(dim(t2), c(3,5), info = "Wrong number of listings returned")
  expect_equal(t2$model, c("gls", "s-class", "gls"), info = "Wrong values returned by the function")
  expect_equal(t2$year, c(2020, 2016, 2010), info = "Listings are not properly sorted by sort_feature and ascending parameter")

})

test_that("Wrong input for budge and model raise error", {
  expect_error(listing_search(data, budget=c(0, 100, 10000), model = "any", sort_feature = "year",ascending = FALSE))
  expect_error(listing_search(data, budget=c(0, 80000), model = "450", sort_feature = "year", ascending = FALSE), "The specified car model does not exist in the dataframe provided")
  expect_error(listing_search(data, budget=c(0, 80000), model = 450, sort_feature = "year", ascending = FALSE), "The model parameter should have a string as the input")
  expect_error(listing_search(data, budget=c("0", 80000), model = 450, sort_feature = "year", ascending = FALSE), "The budget should be a numeric value or a vector of 2 numeric values.")
  expect_error(listing_search(data, budget=c(0, '80000'), model = 450, sort_feature = "year", ascending = FALSE), "The budget should be a numeric value or a vector of 2 numeric values.")
})

test_that("Wrong input for sort_feature", {
  expect_error(listing_search(data, budget=c(0, 80000), model = "any", sort_feature = c("year","price"), ascending = FALSE), "The input value for sort_feature parameter should be a character value")
  expect_error(listing_search(data, budget=c(0, 80000), model = "any", sort_feature = "color", ascending = FALSE), "The specified sort_feature should be a numeric column in the provided dataframe.")
})

test_that("Wrong input for ascending", {
  expect_error(listing_search(c(1,2,3,4), budget=c(0, 80000), model = "any", sort_feature = "year", ascending = TRUE), "The input dataset is not of R DataFrame format")
})



