#' Getting and Setting Verbosity
#'
#' Use the `is_verbose`, `enable_verbose` and `disable_verbose` to toggle
#' console output functions.
#'
#' @param func character - which function(s) to enable
#'
#' @return logical, whether or not to output specified function
#' @name verbosity
#' @export
#'
#' @examples
#' # Returns FALSE:
#' is_verbose("print") #FALSE
#'
#' enable_verbose()
#' # Now it returns TRUE:
#' is_verbose("print") #TRUE
#'
#' disable_verbose()
#' # Now it returns FALSE:
#' is_verbose() #FALSE
#' is_verbose("print") #FALSE
#'
#' enable_verbose("print")
#' print("Hi there!") # Outputs
#' cat("I won't output") # Doesn't output
is_verbose <- function(func = c("print", "cat", "message")) { # nocov start
  func <- match.arg(func, several.ok = TRUE)

  isTRUE(func %in% verbose_outputs())
} # nocov end

verbose_outputs <- function() { # nocov start
  outputs <- getOption("quietR")

  if (is.null(outputs))
    outputs <- c("print", "cat", "message")

  if (is.logical(outputs) && length(outputs) == 1L && !is.na(outputs) &&
      !outputs)
    c()
  else
    outputs
} # nocov end

#' @rdname verbosity
#' @export
enable_verbose <- function(func = c("print", "cat", "message")) {
  if (!missing(func)) {
    func <- match.arg(func, several.ok = TRUE)

    outputs <- append(verbose_outputs(), func)

    options(quietR = unique(outputs))
  } else {
    options(quietR = eval(formals()$func))
  }

  invisible()
}

#' @rdname verbosity
#' @export
disable_verbose <- function(func = c("print", "cat", "message")) {
  if (!missing(func)) {
    func <- match.arg(func, several.ok = TRUE)

    outputs <- setdiff(verbose_outputs(), func)

    if (is.null(outputs))
      outputs <- FALSE

    options(quietR = outputs)
  } else {
    options(quietR = FALSE)
  }

  invisible()
}
