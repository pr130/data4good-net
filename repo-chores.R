library(readr)
library(dplyr)
library(stringr)
library(glue)

upload <- readr::read_csv("data/upload.csv")
done <- upload %>% filter(!str_detect(md, "An dieser Seite arbeiten wir noch"))

license_info <- c("# LIZENZ INHALTE\n", 
    "[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/deed.de)\n",
    glue::glue("- {done$cc}"))

readr::write_lines(license_info, "LICENSE_CONTENT.md")
