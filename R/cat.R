#' @rdname quietR-outputs
#' @export
cat <- function(...) {
  if (is_verbose("cat"))
    base::cat(...)
  else
    invisible()
}

#' @rdname verbosity
#' @export
enable_cat <- function() {
  enable_verbose("cat")
}

#' @rdname verbosity
#' @export
disable_cat <- function() {
  disable_verbose("cat")
}
