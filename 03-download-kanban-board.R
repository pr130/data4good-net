library(readr)
library(httr)
library(dotenv)
dotenv::load_dot_env()
slackr::slackr_setup(config_file = ".slackr-slm-list")
#slackr::auth_test()

# download from slack and save to disk (we only get a download url, not the content)
file_path <- "data/kanban.csv"

# get file object 
res_slack_list <- slackr::call_slack_api("api/files.info", file = Sys.getenv("SLACK_LIST_FILEID"))
httr::stop_for_status(res_slack_list)
slack_list <- httr::content(res_slack_list)

# download csv 
csv <- httr::GET(slack_list$file$list_csv_download_url, 
                 write_disk(file_path, overwrite = TRUE), 
                 config = add_headers(Authorization = paste("Bearer", Sys.getenv("SlACK_TOKEN"))))
httr::stop_for_status(csv)



