# Load a file in memory
load_file = function(file_name) {
  return(readLines(file_name))
}

# Returns the packages loaded in the file
loaded_pkg = function(stored_file) {
  
  loaded_pkg = stringr::str_extract(stored_file, ".*(?!#).*(library|require)\\(.*\\)") %>%
    na.omit() %>%
    as.vector() %>%
    stringr::str_replace_all('(library|require)\\(|\\)|"|\"', "")
  
  return(unique(loaded_pkg))
}

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

# pkgs = lapply(files_list, function(single_file) {
#   file_in_mem = load_file(single_file)
#   
#   found_pkg
# })