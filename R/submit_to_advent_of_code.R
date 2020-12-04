#' submit_to_advent_of_code
#' @description Submit your answer to the Advent of Code
#' @param answer Answer to the problem
#' @param day Numeric indicating which day needs to be read
#' @param level Numeric indicating the problem to be solved. 1 for the first daily problem and 2 for the second one.
#' @param cookie Not required if coookie set as an environment variable. A session cookie retrieved as shown in the readme.
#' @export
#' @examples
#' \dontrun{
#'# Feed your cookie as environment variable
#'Sys.setenv("ADVENT_COOKIE" = "<paste_your_cookie>")
#'submit_to_advent_of_code(answer = 25, day = 1, level = 1)
#'
#'# Feed the cookie as a parameter
#'cookie <- "<paste_your_cookie>"
#'read_advent_of_code(answer = 25, day = 1, level = 1, cookie = cookie)
#' }

submit_to_advent_of_code <- function(answer, day, level, cookie = NULL){
  if(is.null(cookie)){
    cookie <- Sys.getenv("ADVENT_COOKIE")
  }
  if(cookie == ""){
    stop("Unable to find cookie, please specify it in the function or save it as an environment variable using 'Sys.setenv('ADVENT_COOKIE'='<your cookie here>')")
  }

  res <- httr::POST(
    glue::glue("https://adventofcode.com/2020/day/{day}/answer"),
    httr::add_headers(
      .headers = c(
        'user-agent' = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36',
        'cookie' = paste0("session=", cookie)
      )),
    body = list(level = level, answer = answer),
    encode = "form"
  )

  xml2::read_html(rawToChar(res$content)) %>%
    rvest::html_nodes("p") %>%
    rvest::html_text() %>%
    str_remove("\\[.*?\\]$")

}
