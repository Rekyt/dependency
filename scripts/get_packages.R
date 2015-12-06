# Script containing functions to analyze dependencies of a given collection of
# R scripts
#
# Author: Matthias Grenié
#
#

# Packages --------------------------------------------------------------------
library(dplyr)
library(stringr)
library(tidyr)

# Functions -------------------------------------------------------------------

# Load a file in memory
load_file = function(file_name) {
  return(readLines(file_name))
}

# Returns the packages loaded in the file
loaded_pkg = function(stored_file) {
  
  loaded_pkg = str_extract(stored_file, ".*(?!#).*library\\(.*\\)") %>%
    na.omit() %>%
    as.vector() %>%
    str_replace_all('library\\(|\\)|"|\"', "")
  
  return(unique(loaded_pkg))
}

# Returns packages not loaded but used with '::' and ':::' in file
used_pkg = function(stored_file) {
  
  used = str_extract(stored_file, ".*(?!#).*:{2,3}") %>%
    str_extract("[:alnum:]*:{2,3}") %>%
    na.omit() %>%
    as.vector() %>%
    str_replace(":{2,3}", "")
  
  return(unique(used))
}

# Returns lists of sources scripts when available
sourced_scripts = function (stored_file) {
  
  sourced = str_extract(stored_file, ".*(?!#).*source\\(.*\\)") %>%
    na.omit() %>%
    as.vector() %>%
    str_replace_all('source\\(|\\)|"|\"', "")
  
  return(unique(sourced))
} 