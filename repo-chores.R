library(readr)

upload <- readr::read_csv("data/upload.csv")

license_info <- c("# LIZENZ INHALTE\n", 
    "[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/deed.de)\n",
    paste(upload$cc, collapse = "\n"))

readr::write_lines(license_info, "LICENSE_CONTENT")
