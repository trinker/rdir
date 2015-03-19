#' Separate Path
#'
#' Separate a path into hierarchical drectories and file.
#'
#' @param path A path to the file/directory.
#' @param copy2clip logical.  If \code{TRUE} attempts to copy to the clipboard.
#' Default copies to the clipboard if used interactively.
#' @export
#' @examples
#' path_("C:/Users/Tyler/Desktop/guy")
path_ <-
function(path = NULL, copy2clip = is.global(2)){
    if (is.null(path)) path <- WP()
    m <- strsplit(path, "(?<=[/|\\\\])", perl=TRUE)[[1]]
    o <- paste0(lapply(2*0:c(length(m)-1), function(i) {
        paste(rep(" ", i), collapse="")
    }), "-> ", m)
    if (copy2clip) write_clip(o)
    out <- paste(o, collapse="\n")
    class(out) <- c("path_", class(out))
    out
}



#' Prints a path_ object
#'
#' Prints a path_ object.
#'
#' @param x A \code{path_} object.
#' @param \ldots Other arguments passed to \code{\link[base]{cat}}.
#' @export
#' @method print path_
print.path_ <- function(x,  ...){
    cat(x, "\n", ...)
}

