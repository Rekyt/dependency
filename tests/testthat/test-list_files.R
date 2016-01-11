context("Test if package can list R files efficiently")
# Test function that list files in directory
test_that("Not supported types throw errors", {
  expect_error(list_R_files(4), "Provided path(s) must be character(s)",
               fixed = TRUE)
  
  expect_error(list_R_files(4.0), "Provided path(s) must be character(s)",
               fixed = TRUE)
  
  expect_error(list_R_files(c(1, 3)), "Provided path(s) must be character(s)",
               fixed = TRUE)
})

test_that("Non-existent path throws error", {
  # Non existent path
  expect_error(list_R_files("ghgh"), "Directory does not exist")
})

test_that("Default directory is present directory", {
  
  present_file = c("test-list_files.R", "test-used_pkgs.R")
  
  expect_equal(list_R_files(), present_file)
})

test_that("Specifying directory returns good list of files", {
  present_file = c("test-list_files.R", "test-used_pkgs.R")
  print(getwd())
  
  expect_equal(list_R_files("."), present_file)
  
  print(getwd())
  
  expect_equal(list_R_files("../R/"), c("list_R_files.R", "used_pkgs.R"))
})