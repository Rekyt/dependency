make_dep_network = function(given_name) {
  
  # If provided name is not a directory
  if (!dir.exists(given_name)) {
    
    # If provided name is not a file name
    if (!file.exists(given_name)) {
      
      stop("No file nor directory found with this name")
    
      } else {
        
        message("Single file provided, making network on file")
        
        file_list = given_name
    }
  }
  
  file_list = list_R_files(path = given_name)
  
}