
<!-- README.md is generated from README.Rmd. Please edit that file -->

# adventr

This package provides two functions:

- `read_advent`, which directly loads into your session the problem data
  of a specific day of the [Advent of Code](https://adventofcode.com/).
- `submit_advent`, which directly submit your solution to a specific
  problem

This will spare you some manipulations and reduce the pollution of your
download folder.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("benjaminguinaudeau/adventr")
```

## How to use?

Once you have initialized your cookie (see below), you can read the
problem data of any day using `read_advent`:

``` r
library(adventr)

read_advent(day = 2, year = 2022) %>%
  dplyr::glimpse()
#>  chr [1:2501] "A Z" "C Z" "C Z" "A Z" "C Y" "C Z" "A Z" "B Z" "A Z" "A Z" ...
```

``` r
# Submitting answer 265 to problem 2 of day 4
submit_advent(answer = 265, year = 2022, day = 4, level = 2)
```

## How does it work?

If you tried to read the data with the url, you have certainly noticed
the request was blocked. The website will only provide the data, if you
are logged in. To simulate a logged in request, we log in using a
browser and extract the identification cookie, which can then be
included in a a request.

### Get your cookie

1.  Navigate to the website with chrome.
2.  Open the developer tools.
3.  Open the tab ‘Application’
4.  You should see a table with a list of cookies. Find the cookie named
    “session” and copy-paste it into one of the two chunks below (As
    shown in the picutre)

![](example_cookie.png)

Cookies can be fed in two ways to the function. You can either specify
the `cookie` parameter as a string or set it in an environment variable
named `ADVENT_COOKIE`.

``` r
# cookie as an object in the session
cookie <- "<paste_your_cookie>"

read_advent(day = 1, cookie = cookie) %>%
  dplyr::glimpse()
```

``` r
# cookie as an environment variable
Sys.setenv("ADVENT_COOKIE" = "<paste_your_cookie>")

read_advent(day = 1) %>%
  dplyr::glimpse()
```

Once this is done, you can freely read problem data, without any further
manipulation.

### Day 1

``` r
read_advent(day = 1) %>%
  dplyr::glimpse()
#>  chr [1:2001] "143" "147" "150" "166" "180" "187" "188" "185" "199" "198" ...
```

``` r
# First problem of day 1
submit_advent(answer = 14, day = 1, level = 1)
# Second problem of day 1
submit_advent(answer = 78, day = 1, level = 2)
```

### Day 2

``` r
read_advent(day = 2) %>%
  dplyr::glimpse()
#>  chr [1:1001] "forward 3" "down 9" "forward 6" "down 3" "forward 8" ...
```
