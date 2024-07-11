# RGB to Hexadecimal Conversion Project

This repository contains the project files for converting RGB color codes to hexadecimal format using R. The project demonstrates various steps involved in generating, manipulating, and converting color codes efficiently.

## Project Overview

In this project, we:
1. Generate random RGB color codes.
2. Find quotients and remainders for RGB values.
3. Extract RGB values from formatted strings.
4. Convert RGB values to hexadecimal format.
5. Replace numeric values with hexadecimal characters.
6. Combine quotients and remainders to form final hex codes.

## Files in the Repository

- `part_a_script.R`: Contains all the R functions and code to convert RGB codes to hexadecimal.
- `project_report.docx`: Detailed report explaining each step of the project, including the code and its functionality.
- `README.md`: This file, providing an overview of the project and its contents.

## Functions Overview

### create_rgb
Generates random RGB color codes.

```r
create_rgb = function(n) {
  set.seed(100)
  rgb = vector("character", length = n)
  for (i in 1:n) {
    r = sample(0:255, 1)
    g = sample(0:255, 1)
    b = sample(0:255, 1)
    rgb[i] = paste("(", r, ",", g, ",", b, ")", sep = "")
  }
  return(rgb)
}
```
### find_quotient
Finds the quotient when dividing two numbers.

```
find_quotient = function(dividend, divisor) {
  floor(dividend / divisor)
}
```
### find_remainder
Finds the remainder when dividing two numbers.


```
find_remainder = function(dividend, divisor) {
  dividend - floor(dividend / divisor) * divisor
}
```

### extract_rgb
Extracts RGB values from formatted strings and returns a dataframe.

```
extract_rgb = function(color_code) {
  b = substr(color_code, 2, nchar(color_code) - 1)
  bb = unlist(strsplit(b, split = ","))
  df = data.frame(matrix(as.numeric(bb), nrow = length(b), byrow = T))
  colnames(df) = c("R", "G", "B")
  return(df)
}
```

### replace_10_16
Replaces numeric values 10 to 15 with corresponding hexadecimal characters.

```
replace_10_16 = function(a) {
  nums = 10:15
  for (i in 1:6) {
    nums = 10:15
    a = ifelse(a == nums[i], LETTERS[i], as.character(a))
  }
  return(a)
}
```

### hex_codes
Combines quotients and remainders to form hexadecimal color codes.

```
hex_codes = function(Q7a_quotient, Q7b_remainder) {
  m = matrix(paste0(Q7a_quotient, Q7b_remainder), nrow(Q7a_quotient), ncol(Q7a_quotient))
  hexs = c()
  for (i in 1:nrow(m)) {
    hexs[i] = paste0("#", paste(m[i, ], collapse = ""))
  }
  return(hexs)
}
```

### Usage
To use the functions, load the part_a_script.R file into your R environment and call the functions as needed. For example:

```
source("part_a_script.R")
Q1 = create_rgb(6)
Q1

Q4 = extract_rgb(Q1)
Q5a_quotient = apply(Q4, 2, find_quotient, 16)
Q5b_remainder = apply(Q4, 2, find_remainder, 16)
Q7a_quotient = replace_10_16(Q5a_quotient)
Q7b_remainder = replace_10_16(Q5b_remainder)
Q8 = hex_codes(Q7a_quotient, Q7b_remainder)
Q8
```

## Conclusion
This project provides a comprehensive solution for converting RGB color codes to hexadecimal format. It demonstrates important programming concepts such as string manipulation, data handling, and applying mathematical operations. The detailed report in project_report.docx explains each step of the process and the functions used.



