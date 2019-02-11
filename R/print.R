#' Output Functions
#'
#' Masked output functions (cat, message, print) that can be toggled with
#' [verbosity] functions. Instead of implementing your own verbose handling
#' system, use quietR.
#'
#' @param ... Arguments passed to masked output function
#'
#' @name quietR-outputs
#' @export
#'
#' @examples
#' print("Hello World!")
#' disable_verbose()
#' print("Hello World!")
print <- function(...) {
  if (is_verbose("print"))
    base::print(...)
  else
    invisible()
}

#' @rdname verbosity
#' @export
enable_print <- function() {
  enable_verbose("print")
}

#' @rdname verbosity
#' @export
disable_print <- function() {
  disable_verbose("print")
}