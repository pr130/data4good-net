library(rmarkdown)
library(fs)
library(here)

files_meta <- readr::read_csv("data/files.csv")
# convert with pandoc to md
convert_to_md <- function(files_df, out_dir_md = "data/md", verbose = FALSE) {
  files_df$out_path_md <- fs::path(out_dir_md, files_df$id, ext = "md")
  for (i in 1:nrow(files_meta)) {
    # full path are necessary for pandoc to work
    pandoc_convert(input = here::here(files_df$out_path_docx[i]), 
                   output = here::here(files_df$out_path_md[i]), 
                   verbose = verbose, 
                   options = c("--wrap=none", "-t", "markdown_strict"))
  } 
  files_df
}

convert_to_md(files_meta, verbose = TRUE)
