#' Generate a Windows Tree
#'
#' Given a directory, generate a Windows based tree diagram.
#'
#' @param path A path to the directory.
#' @param out An optional outfle (typically .txt) to print to.
#' @param include.files logical.  If \code{TRUE} files and drectories will be
#' included.
#' @param additional Additonal arguments passed to
#' href{https://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/tree.mspx?mfr=true}{\code{tree}}.
#' @param copy2clip logical.  If \code{TRUE} attempts to copy to the clipboard.
#' @export
#' @examples
#' \dontrun{
#' tree_()
#' }
tree_ <- function(path = ".", out = NULL, include.files = TRUE,
    additional = NULL, copy2clip = FALSE){

    if (is.null(out)){
        tmp <- tempdir()
        out <- file.path(tmp, paste0(gsub(":|\\s+", "_", Sys.time()), ".txt"))
    }
    fls <- ifelse(include.files, "/f", "")
    cmd <- paste("tree", shQuote(path), fls, "/a >", additional, shQuote(out))
    shell(cmd)
    out <- readLines(out)

    if (copy2clip) write_clip(out)
    out <- paste(out, collapse="\n")
    class(out) <- c("tree_", class(out))
    out
}

#' Prints a tree_ object
#'
#' Prints a tree_ object.
#'
#' @param x A \code{tree_} object.
#' @param \ldots Other arguments passed to \code{\link[base]{cat}}.
#' @export
#' @method print tree_
print.tree_ <- function(x,  ...){
    cat(x, "\n", ...)
}

