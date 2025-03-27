library(googledrive)
library(fs)
library(dplyr)
library(readr)

googledrive::drive_auth()

# use googledrive package to find files in shared drive, download them
download_images <- function(out_dir = "data/images", format = "png") {
  files_df <- drive_find(pattern = "\\d{1,2}-\\d{4}.+?", type = format, shared_drive = "03_education")
  files_df$out_path <- fs::path(out_dir, files_df$name)
  for (i in 1:nrow(files_df)) {
    dr <- files_df[i, ]
    if (!file.exists(dr$out_path)) {
      print(dr$out_path)
      drive_download(dr, path = dr$out_path, overwrite = FALSE)
    }
  }
}


# download files
files <- download_images(format = "png")
files <- download_images(format = "svg")

