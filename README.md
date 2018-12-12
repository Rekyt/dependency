# `dependency`

[![Project Status: Abandoned – Initial development has started, but there has not yet been a stable, usable release; the project has been abandoned and the author(s) do not intend on continuing development.](https://www.repostatus.org/badges/latest/abandoned.svg)](https://www.repostatus.org/#abandoned)[![Travis-CI Build Status](https://travis-ci.org/Rekyt/dependency.svg?branch=master)](https://travis-ci.org/Rekyt/dependency) [![codecov.io](https://codecov.io/github/Rekyt/dependency/coverage.svg?branch=master)](https://codecov.io/github/Rekyt/dependency?branch=master)

**NOTE** This repository has been abandoned because of lack of time to develop it. Similar ideas have been developed elsewhere with better success see for example:

- scan functions of [`checkpoint` package](https://github.com/RevolutionAnalytics/checkpoint)
- [`CodeDepends` package](https://github.com/duncantl/CodeDepends) also available on [CRAN](https://cran.r-project.org/package=CodeDepends)
- [`adapr` package](https://github.com/gelfondjal/adapr) also available on [CRAN](https://cran.r-project.org/package=adapr)

A package to make dependency graphs of bunchs of scripts. Imagine you have a series of scripts depending on each other, producing several outputs, dependency lets you follow the dependencies.


## Package Install

```r
devtools::install_github("Rekyt/dependency")
```

## Exported functions

For the moment the only exported function is `list_R_files()` that looks into a given path or series of path for `.R` files.


## /!\ Note

`dependency` is conceived as a very simple and usable package on tightly written scripts; with explicit package loading and scripts sourcing. It does not evaluate the network of dependencies by **evaluating** the scripts but rather by **scraping** them.