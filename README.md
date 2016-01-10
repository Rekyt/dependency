# `dependency`

A package to make dependency graphs of bunchs of scripts. Imagine you have a series of scripts depending on each other, producing several outputs, dependency lets you follow the dependencies.


## Package Install

```r
devtools::install_github("Rekyt/dependency")
```

## Exported functions

For the moment the only exported function is `list_R_files()` that looks into a given path or series of path for `.R` files.


## /!\ Note

`dependency` is conceived a very simple and usable package on tighly written scripts. With well defined packages loadings and scripts sourcing. It does not evaluate the network of dependencies by **evaluating** the scripts rather by **scraping** them.