# Load a file in memory
load_file = function(file_name) {
  if (!is.character(file_name)) {
    stop("Provided file name must be a character")
  }
  
  if (length(file_name) > 1) {
    stop("A single file name must be provided")
  }
  
  if (!file.exists(file_name)) {
    stop("File not found")
  }
  
  return(readLines(file_name))
}

# Returns the packages loaded in the file
get_loaded_pkg = function(stored_file) {
  
  loaded_pkg = stringr::str_extract(stored_file, ".*(?!#).*(library|require)\\(.*\\)") %>%
    na.omit() %>%
    as.vector() %>%
    stringr::str_replace_all('(library|require)\\(|\\)|"|\"', "")
  
  return(unique(loaded_pkg))
}

# Returns packages not loaded but used with '::' and ':::' in file
get_used_pkg = function(stored_file) {
  
  used = str_extract(stored_file, ".*(?!#).*:{2,3}") %>%
    str_extract("[:alnum:]*:{2,3}") %>%
    na.omit() %>%
    as.vector() %>%
    str_replace(":{2,3}", "")
  
  return(unique(used))
}

used_pkg = function(file_names) {
  stored_files = lapply(file_names, load_file)
}