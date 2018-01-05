#' List all R files in directory
#'
#' @param path A character string indicating a path or a list of paths
#' 
#' @return A character vector of found files with extensions in ".R"
#' @export
list_R_files = function(path = ".") {
  
  if (!is.character(path)) {
    stop("Provided path(s) must be character(s)")
  }
  path = Filter(dir.exists, path)
  
  if (length(path) == 0) {
    stop("Directory does not exist")
  }
  
  files_list = list.files(path, pattern="[.]R$")
  
  return(files_list)
}
