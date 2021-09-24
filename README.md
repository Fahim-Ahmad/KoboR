# KoboR

### Required packages

```
library(magrittr)
library(readr)
library(httr)
```

### Kobo URL and credentials

```
kobo_url <- 'https://kc.humanitarianresponse.info/api/v1/data.csv'
user_name = '**********'
password = '**********'
```

### List of deployed projects

```
get_projects <- content(
  GET(kobo_url, authenticate(user_name , password), progress()),
  "raw",
  encoding = 'UTF-8'
) %>% 
  read_csv()
```

### URL of a specific project

```
# change the project name based on list of projects deployed in your own KoBo account
project_name <- 'Project_A'
project_url <- get_projects[get_projects$description == project_name, ]$url
```

### The raw data

```
project_data  <- content(
  GET(project_url, authenticate(user_name , password), progress()),
  "raw",
  encoding = 'UTF-8'
) %>% 
  read_csv()
```

***

If you are using Kobo+R most frequently, then you can use my `KoboR()` function and access the data from Kobo without writing the whole bunch of above R script.

```
library(devtools)
library(magrittr)
library(readr)
library(httr)

source_url("https://raw.githubusercontent.com/Fahim-Ahmad/KoboR/main/koboR.R")
df <- koboR(project_name = "******", user_name = "******", password = "******")
```


