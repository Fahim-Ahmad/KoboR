koboR <- function(project_name, user_name, password) {
  
  projects <- content(
    GET('https://kc.humanitarianresponse.info/api/v1/data.csv', authenticate(user_name , password), progress()),
    "raw",
    encoding = 'UTF-8'
  ) %>% 
    read_csv()

  if (isTRUE(projects == "Invalid username/password.")) {
    print(projects)
  } else {
    if (nrow(projects[projects$description == project_name, ]) == 0) {
      print('Incorrect project name.')
    } else {
      data  <- content(
        GET(projects[projects$description == project_name, ]$url, authenticate(user_name , password), progress()),
        "raw",
        encoding = 'UTF-8'
      ) %>%
        read_csv() 
    }
  }
  
  return(data)
  
}




