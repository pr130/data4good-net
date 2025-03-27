library(stringr)
library(readr)
library(dplyr)

source("utils.R")

board <- readr::read_csv("data/kanban.csv")
board <- board %>% 
  filter(status != "Backlog")

# each begriff has a tab in the google doc
# in markdown those tab titles have the format: **id - begriff**
# regex to find the lines where the google docs tabs begin
find_tab_boundaries <- function(lines) {
  # this is where the tabs begin
  start_lines <- lines %>% stringr::str_which("^\\*\\*\\d{1,2} \\-.+?\\*\\*$")
  # tabs end at the line before the next start or for the first one, at the end of the document
  if (length(start_lines) == 1) {
    end_lines <- length(lines)
  } else {
    end_lines <- c(start_lines[2:length(start_lines)] - 1, length(lines))
  }
  data.frame(start_lines = start_lines, end_lines = end_lines)
}

extract_content <- function(begriff_lines, kanban = board) {
  
  # extract id and title 
  id <- as.integer(str_extract(begriff_lines[1], "\\d{1,2}"))
  title <- kanban$title[kanban$id == id]
  status <- kanban$status[kanban$id == id]

  print(glue::glue("{id} {title} - processing"))

  # get lines between start and end and clean
  begriff_lines <- begriff_lines %>% 
    clean_lines() %>% 
    replace_example_com()

  begriff_content <- paste(begriff_lines, collapse = "\n")
  begriff_content <- clean_collapsed(begriff_content)
  begriff_content <- paste0("# ", title, "\n", begriff_content) # add title

  if (status != "Done") {
    # Placeholder for not done
    begriff_content <- glue::glue("
    # {title}
    ## Erklärung
    An dieser Seite arbeiten wir noch.

    ## Wann ist {title} für euch relevant?
    An dieser Seite arbeiten wir noch.

    ## Was sind die Implikationen von {title} für euch? 
    An dieser Seite arbeiten wir noch.

    ## Mehr zu Datenanalyse   
    An dieser Seite arbeiten wir noch.

    ## Weiterführende Materialien

    ")
  }
  return(list(id = id, title = title, file_name = get_file_name(title, id), md = begriff_content))
}


# read in each document, find the tab boundaries and extract (and save) the content for each tab
author_md_files <- list.files("data/md/", full.names = TRUE)
all_df <- purrr::map_dfr(author_md_files, function(author_md_file) {
  print(author_md_file)
  # read markdown for author
  author_md_lines <- readr::read_lines(author_md_file)
  # find all boundaries and split lines 
  boundaries <- find_tab_boundaries(author_md_lines)
  lines_split <- purrr::map2(boundaries$start_lines, boundaries$end_lines, ~ author_md_lines[.x:.y])

  # extract and clean content
  df <- purrr::map_dfr(lines_split, function(lines, kanban = board) {
    print("------------------")
    begriff_list <- extract_content(lines, kanban)
    print(glue::glue("{begriff_list$id} {begriff_list$title} - writing to disk"))
    readr::write_lines(begriff_list$md, fs::path("data/md_upload", begriff_list$file_name))
    print(glue::glue("{begriff_list$id} {begriff_list$title} - checking for errors"))
    check_for_errors(begriff_list$md, begriff_list$title, kanban$slug)
    
    return(begriff_list)
  })
  
  return(df)
})

# WRITE DF TO DISK ---------
all_df <- all_df %>% arrange(id)

readr::write_csv(all_df, "data/cleaned_content.csv")

