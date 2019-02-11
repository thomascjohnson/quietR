#' @rdname quietR-outputs
#' @export
message <- function(...) {
  if (is_verbose("message"))
    base::message(...)
  else
    invisible()
}

#' @rdname verbosity
#' @export
enable_message <- function() {
  enable_verbose("message")
}


#' @rdname verbosity
#' @export
disable_message <- function() {
  disable_verbose("message")
}