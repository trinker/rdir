#' Separate Path
#'
#' Separate a path into hierarchical drectories and file.
#'
#' @param path A path to the file/directory.
#' @param copy2clip logical.  If \code{TRUE} attempts to copy to the clipboard.
#' @export
#' @examples
#' path_("C:/Users/Tyler/Desktop/guy")
path_ <-
function(path = NULL, copy2clip = TRUE){
    if (is.null(path)) path <- reports::WP()
    m <- strsplit(path, "(?<=[/|\\\\])", perl=TRUE)[[1]]
    o <- paste0(lapply(2*0:c(length(m)-1), function(i) paste(rep(" ", i), collapse="")), "-> ", m)
    if (copy2clip) try(cat(paste(o, collapse="\n"), file="clipboard"))
    invisible(paste(o, collapse="\n"))
}
