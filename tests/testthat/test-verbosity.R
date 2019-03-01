context("Testing toggling verbosity")

test_that("toggling functions correctly", {
  expect_output(print("Hello World!"))

  disable_verbose()

  expect_silent(print("Hello World!"))

  enable_print()
  disable_verbose("print")
  disable_print()

  expect_silent(print("Hello World!"))

  enable_cat()

  expect_output(cat("Hello World!"))

  disable_cat()

  expect_silent(cat("Hello World!"))

  disable_verbose()

  expect_silent(print("Hello World!"))
  expect_silent(cat("Hello World!"))
  expect_silent(message("Hello World!"))

  enable_verbose()

  disable_verbose(c("cat", "print"))

  expect_setequal(getOption("quietR"), "message")

  enable_verbose()

  expect_setequal(getOption("quietR"), c("print", "cat", "message"))

  expect_message(message("Hello World!"))
  expect_output(cat("Hello World!"))
  expect_output(print("Hello World!"))

  disable_message()
  expect_silent(message("Hello World!"))

  enable_message()
  expect_message(message("Hello World, again!"))
})