# Retrieving publications data from Google Scholar
if(!require(scholar))
{
  install.packages("scholar")
}

# Using the authors ID to search
# id <- 'AAjzt1MAAAAJ'

id <- as.character(readline(prompt = "Please enter the Authors ID: "))
                   
# Checking whether the authors id is valid

author_check <- function(id){
  
  author_profile <- try(get_profile(id))
  if(class(author_profile) == "try-error") {
    cat("Enter a valid author's ID")
    
  } else {
    cat("Printing name of author:")
    cat(author_profile$name)
  }
}

author_check(id)

# Getting the publications data
# get_data <- function(id){}
  
publications <- scholar::get_publications(id)

# Getting the required fields into a df
df <- as.data.frame(publications)
  
# Viewing the top of our dataset
head(df)
  
# Writing search results to file
# write.csv(df, "scholar.csv")


# To do: merge results with other sources
# Wrap it up in a simple shiny app