#' List all R files in directory
#'
#' @param path A character string indicating a path or a list of paths
#' 
#' @return A character vector of found files with extensions in ".R"
#' @importFrom dplyr %>%
#' @export
list_R_files = function(path = ".") {
  
  if (!is.character(path)) {
    stop("Provided path(s) must be character(s)")
  }
  
  # Check which path exists
  path_exist = sapply(path, dir.exists)
  
  path = path[path_exist]
  
  if (length(path) == 0) {
    stop("Directory does not exist")
  }
  
  files_list = list.files(path) %>%
    # Get only files ending in ".R"
    stringr::str_extract_all(pattern = ".*.R$") %>%
    unlist()
  
  return(files_list)
}