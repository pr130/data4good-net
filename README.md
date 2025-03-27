# CDL Selbstlernmaterial 

## Content
### License
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/deed.de)

See `LICENSE_CONTENT` for details for each page.

## Tooling / Code

 [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


This repository provides the code + pipeline to:

1. download the Google Docs for each author
2. convert them to markdown
3. extract the individual pages / tabs for each term
4. clean the content
5. upload the data to google sheets


### Setup

install packages with `renv`.

```r
install.packages("renv")
renv::restore()
```

### Requirements
The following files that are not checked into this repository are needed to run the pipeline:

`.slackr-slm-list` (see slackr package documentation)

```
token: token
incoming_webhook_url: webhook url
icon_emoji: can be empty
username: slackr
channel: #a-channel
```

`.env`

```
SLACK_TOKEN="same slack token as in slackr file"
SLACK_LIST_FILEID="id of Slack List (kanban board)"
USE_MARKDOWN_STRICT=1 # or 0
UPLOAD_SHEET="google sheets url"
GDRIVE_SHARED="shared drive name where google docs reside"
DOC_PREFIX="common prefix of google docs - for searching"
```

`data/meta/authors.csv`: used to match from Slack List to names to use for the CC-BY License

```
email, name
max.musterperson@email.de, Max Musterperson
```


## Run

The R files are to be run sequentially, indicated per their number prefix.

You can run `pipeline.R` to execute them in the right order or run them individually.

You can also use `make` to resolve dependencies in a more elegant and efficient way:

```
make upload
```
This does not automatically re-download the Google docs and the Slack Kanban board. To do so: 

```
make download-gdocs # optional
make download-kanban # optional
make upload
```


intermediate targets - again, those do not automatically download their online dependencies. This has to be done using the targets `download-gdocs` respectively `download-kanban`

```
# make download-gdocs 
make data/md/
```

```
make download-gdocs # optional
make download-kanban # optional
make data/md_upload/
```