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
#' @export
#' @examples
#' \dontrun{
#' dir_tree_win()
#' }
dir_tree_win <- function(path = ".", out = NULL, include.files = TRUE, additional = NULL){

    if (is.null(out)){
        tmp <- tempdir()
        out <- file.path(tmp, paste0(gsub(":|\\s+", "_", Sys.time()), ".txt"))
    }
    fls <- ifelse(include.files, "/f", "")
    cmd <- paste("tree", shQuote(path), fls, "/a >", additional, shQuote(out))
    shell(cmd)
    readLines(out)
}

