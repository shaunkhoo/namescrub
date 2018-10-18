#' Pre-processes names for further analysis
#'
#' @param names A string or character vector of names.
#' @param stopwords A vector of stopwords to remove from the names. Takes in Regex as well.
#' @return The character vector with the stopwords in \code{stopwords} removed.
#' @examples
#' persons <- c("Mr. John Smith", "Mrs. Helen Smith", "Ms. Juliana Crain")
#' stopwords1 <- c("Mr", "Mrs", "Ms")
#' preproc_name(persons, stopwords=stopwords1)
#' @import dplyr
#' @import stringr
#' @export

preproc_name <- function(names, stopwords=c("^MRS ", "^MR ", "^MISS ", "^DR ", "^MS ", " JR$", " SR$", " MD$")) {
  names1 <- names %>%
    str_replace_all("[[:punct:]]", "") %>%
    toupper()
  stopwords_cleaned <- stopwords %>%
    str_replace_all(".", "") %>%
    str_replace_all(",", "") %>%
    toupper()
  for (item in stopwords_cleaned) {
    names1 <- gsub(item, "", names1)
  }
  names2 <- trimws(names1, which="both")
  return(names2)
}
