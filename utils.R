# DEAL WITH IMAGES ------------
# replace lines where an image is inserted with "CDLBILD" for easier search in 
# wordpress
library(stringr)
library(dotenv)
dotenv::load_dot_env()

BASE_URL <- "https://civic-data.de/selbstlernmaterial/#"
USE_MAKRDOWN_STRICT  <- as.logical(as.numeric(Sys.getenv("USE_MARKDOWN_STRICT")))

remove_gdocs_images <- function(lines, markdown_strict = USE_MAKRDOWN_STRICT) {
  if (markdown_strict) {
    # uses img html tags
    lines <- str_remove_all(lines, "<img.+?/>")
  } else {
    # ![](media/image1.png){width="6.267716535433071in" height="2.4583333333333335in"}
    is <- str_which(lines, "^!\\[(.+)?\\]\\(media/.+?\\}.?$")
    if (length(is) > 0) {
      lines <- lines[-is]
    }
    lines
  }

}

clean_links <- function(lines, markdown_strict = USE_MAKRDOWN_STRICT) {
  if (markdown_strict) {
    lines <- str_remove_all(lines, "</?u>")
  } else {
    # remove {.underline}, take care of bold (**) and italic (* / _)
    lines <- str_replace_all(lines, "\\[(\\*{1,2}|_{1})?\\[", "\\[\\1")
    lines <- str_replace_all(lines, "\\]\\{.underline\\}", "")
  }
  return(lines)
}

clean_image_embeds <- function(lines) {
  # remove \ that gets inserted by pandoc 
  # \![imagedesc\](https://civic-data.de/app/uploads/something)
  is <- str_which(lines, "https://civic-data.de/app/uploads/")
  if (length(is) > 0) {
    lines_with_images <- lines[is]
    # remove and replace affected lines
    lines[is]  <- stringr::str_remove_all(lines_with_images, "\\\\")
  }
  lines
}

clean_lines <- function(lines) {
  # character vector
  lines <- clean_links(lines)
  lines <- remove_gdocs_images(lines)
  lines <- clean_image_embeds(lines)

  # remove \ at end of line
  lines <- str_remove_all(lines, "\\\\$")
  
  # remove everything until Erklaerung starts
  pos_erkl <- str_which(lines, "## Erklärung")
  lines <- lines[pos_erkl:length(lines)]
  return(lines)
}

clean_collapsed <- function(content) {
  # remove weird ```{=html}\n<!-- -->\n```
  content <- str_remove_all(content, "```\\{=html\\}\n<!-- -->\n```\n")
  content <- str_remove_all(content, "<!-- -->\n\n")
  return(content)
}

replace_example_com <- function(lines) {
  str_replace_all(lines, "https://example.com/", BASE_URL)
}


#' get file name from id
#' @param data.frame kanban slack kanban board. needs to have columns id and title.
#' @param numeric id of term
#' @return file name
get_file_name <- function(title, id, ext = "md") {
  title_part <- str_remove_all(tolower(title), "[^\\w\\s]")
  title_part <- str_replace_all(title_part, "\\s", "-")
  paste0(id, "-", title_part, ".", ext)
}


check_for_errors <- function(content, title, valid_slugs, markdown_strict = USE_MAKRDOWN_STRICT) {
  
  # slugs are linked that do not exist as a term
  linked_slugs <- str_match_all(content, 
                                  glue::glue("{BASE_URL}(.+?)\\)"))[[1]][,2]
  not_in_board <- linked_slugs[!linked_slugs %in% valid_slugs]
  if (length(not_in_board) > 0) print(glue::glue("{not_in_board} is wrongly linked in {title}"))
  stopifnot(length(not_in_board) == 0)

 
  # other weird artifacts
  stopifnot(!str_detect(content, " X ")) # X ist relevant für dich
  stopifnot(!str_detect(content, "\\{.underline\\}")) # links
  stopifnot(!str_detect(content, "\\{=html\\}"))
  stopifnot(!str_detect(content, "media/image")) # images not replaced with CDLBILD
  stopifnot(!str_detect(content, "\n#{1,}\\s+\n")) # empty headers
  stopifnot(!str_detect(content, "<!--"))

  return(TRUE)
}

# WIP
extract_lines <- function(start_i, end_i, all_lines) {
  title_line <- all_lines[start_i]
  # extract id and title 
  id <- as.integer(str_extract(title_line, "\\d{1,2}"))
  begriff_lines <- all_lines[start_i:end_i]
  return(list(id = id, lines = begriff_lines))
}