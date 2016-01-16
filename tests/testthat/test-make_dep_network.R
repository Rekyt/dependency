context("Test tha making a network from dependencies work")

test_that("Directory specification for network dependencies works", {
  expect_error(make_dep_network("K"))
  
  expect_message(make_dep_network())
  
  expect_silent(make_dep_network("."))
})

test_that("Dependency network contains all needed nodes", {
  th_graph = igraph::graph(c(c("testthat", "testthat.R"),
                             c("dependency", "testthat.R")))
  
  real_graph = make_dep_network("..")
})