namescrub
=========

The goal of namescrub is to streamline workflows for preprocessing names. Specifically, `preprocess_name` removes stopwords from the character strings (or vector) being applied to it. Some common stopwords have been assigned as defaults, but this can be overridden by specifying your own stopwords. The function is Regex-compatible, meaning that you can designate whether you want the stopword to be removed only if it is the first or last word.

Example
-------

A simple example:

``` r
names <- c("Ms. Juliana Crain", "Mr. John Smith", "Mr. Joe Blake", "Mr. Frank Frink", "Mrs. Helen Smith", "Ms. Nicole Dormer", "Mrs. Michiko Tagomi", "Dr. Josef Mengele", "Mr. Ed McCarthy")
preproc_name(names)
#> [1] "JULIANA CRAIN"  "JOHN SMITH"     "JOE BLAKE"      "FRANK FRINK"   
#> [5] "HELEN SMITH"    "NICOLE DORMER"  "MICHIKO TAGOMI" "JOSEF MENGELE" 
#> [9] "ED MCCARTHY"
```

Changing the stopwords can enable `preproc_name` to do more than just people's names:

``` r
names2 <- c("APPLE INC.", "INTEL CORPORATION", "AMERICAN AIRLINES", "HERCULES COMPANY", "FEDEX CO.")
preproc_name(names2, stopwords=c(" INC$", "CORPORATION", "COMPANY", " CO$"))
#> [1] "APPLE"             "INTEL"             "AMERICAN AIRLINES"
#> [4] "HERCULES"          "FEDEX"
```
