#' Generate a Windows Tree
#'
#' Given a directory, generate a Windows based tree diagram.
#'
#' @param path A path to the directory.
#' @export
#' @examples
#' \dontrun{
#' rstudio_()
#' }
rstudio_ <- function(path = "temp"){
    if (file.exists(path)) {
        message(paste0("\"", path, "\" already exists:\nDo you want to overwrite?\n"))
        ans <- menu(c("Yes", "No"))
        if (ans == "2") {
            stop("rstudio_ aborted")
        } else {
            unlink(path, recursive = TRUE, force = FALSE)
            Sys.sleep(.25)
        }
    }

    dir.create(path)

    cat(paste(rproj, collapse="\n"), file=file.path(path, paste0(basename(path), ".Rproj")))
}


rproj <- c("Version: 1.0", "", "RestoreWorkspace: Default", "SaveWorkspace: Default", 
    "AlwaysSaveHistory: Default", "", "EnableCodeIndexing: Yes", 
    "UseSpacesForTab: No", "NumSpacesForTab: 4", "Encoding: UTF-8", 
    "", "RnwWeave: knitr", "LaTeX: pdfLaTeX", "", "BuildType: Package", 
    "PackageInstallArgs: --no-multiarch", "PackageBuildArgs: --resave-data=best", 
    "PackageCheckArgs: --as-cran")
