library(googledrive)
library(fs)
library(dplyr)
library(readr)
library(dotenv)
dotenv::load_dot_env()

googledrive::drive_auth()

# use googledrive package to find files in shared drive, download them
download_docs_as_docx <- function(out_dir = "data/doc") {
  files_df <- drive_find(Sys.getenv("DOC_PREFIX"), type = "document", shared_drive = Sys.getenv("GDRIVE_SHARED"))
  files_df$out_path_docx <- fs::path(out_dir, files_df$id, ext = "docx")
  for (i in 1:nrow(files_df)) {
    dr <- files_df[i, ]
    drive_download(dr, path = dr$out_path_docx, type = "docx", overwrite = TRUE)
  }
  files_df$out_dir_docx <- out_dir
  files_df
}


# download files , write out metadata
files <- download_docs_as_docx()
files %>% 
  dplyr::select(id, out_dir_docx, out_path_docx) %>% 
  readr::write_csv("data/files.csv")



