#' read_advent_of_code
#' @description Read problem data from the Advent of Code
#' @param day Numeric indicating which day needs to be read
#' @param cookie Not required if coookie set as an environment variable. A session cookie retrieved as shown in the readme.
#' @export
#' @examples
#' \dontrun{
#'# Feed your cookie as environment variable
#'Sys.setenv("ADVENT_COOKIE" = "<paste_your_cookie>")
#'read_advent_of_code(day = 1)
#'
#'# Feed the cookie as a parameter
#'cookie <- "<paste_your_cookie>"
#'read_advent_of_code(day = 1, cookie = cookie)
#' }

read_advent_of_code <- function(day = 1, cookie = NULL){
  if(is.null(cookie)){
    cookie <- Sys.getenv("ADVENT_COOKIE")
  }
  if(cookie == ""){
    stop("Unable to find cookie, please specify it in the function or save it as an environment variable using 'Sys.setenv('ADVENT_COOKIE'='<your cookie here>')")
  }

  req <- httr::GET(glue::glue('https://adventofcode.com/2020/day/{day}/input'),
                   httr::add_headers(.headers = c(
                     "user-agent" = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36",
                     "cookie" = paste0("session=", cookie)
                   )))

  if(req$status_code == 500){
    stop("Request was blocked, your cookie seems to be wrong.")
  }
  if(req$status_code == 404){
    stop("Please don't repeatedly request this endpoint before it unlocks! The calendar countdown is synchronized with the server time; the link will be enabled on the calendar the instant this puzzle becomes available.")
  }

  if(req$status_code != 200){
    stop("Request was blocked")
  }

  stringr::str_split(rawToChar(req[["content"]]), "\n")[[1]]
}
