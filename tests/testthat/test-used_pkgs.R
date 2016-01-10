context("Test if used packages are well detected")

test_that("File loading function can accept only file names", {
  expect_error(load_file(1), "Provided file name must be a character",
               fixed = TRUE)
  
  expect_error(load_file(c(1, 2)), "Provided file name must be a character",
               fixed = TRUE)
  
  expect_error(load_file(c(T, T)), "Provided file name must be a character",
               fixed = TRUE)
  
  expect_error(load_file("not_present_file"), "File not found", fixed = TRUE)
  
  expect_error(load_file(c("onefile", "second file")),
               "A single file name must be provided", fixed = TRUE)
})

test_that("When correct file name provided, output is correct", {
  testthat_file = load_file("../testthat.R")
  
  expect_true(is.character(testthat_file))
  
  expect_equal(testthat_file[1], "library(testthat)")
})