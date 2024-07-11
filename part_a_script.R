#Q1
create_rgb = function(n) {
  set.seed(100)
  rgb = vector("character", length = n)
  for (i in 1:n) {
    r = sample(0:255, 1)
    g = sample(0:255, 1)
    b = sample(0:255, 1)
    
    # Format RGB code and store it in the vector
    rgb[i] = paste("(", r, ",", g, ",", b, ")", sep = "")
  }
  
  return(rgb)
}
Q1 = create_rgb(6)
Q1

#Q2
find_quotient = function(dividend,divisor){
  floor(dividend/divisor)
}
find_quotient(22,4)
#Q3
find_remainder = function(dividend,divisor){
  dividend - floor(dividend/divisor)*divisor
  # dividend %% divisor can be used as well, but this way is faster
}
find_remainder(17,10)

#Q4
extract_rgb = function(color_code){
  b = substr(color_code,2,nchar(color_code)-1)
  bb= unlist(strsplit(b,split = ","))
  df = data.frame(matrix(as.numeric(bb),nrow = length(b),byrow = T))
  colnames(df) = c("R","G","B")
  return(df)
}

Q4 = extract_rgb(Q1)
Q4

#Q5
Q5a_quotient = apply(Q4,2,find_quotient,16)
Q5b_remainder = apply(Q4,2,find_remainder,16)
Q4
Q5a_quotient
Q5b_remainder
#Q6
replace_10_16=function(a){
  nums= 10:15
  for (i in 1:6) {
    nums=10:15
    a = ifelse(a==nums[i],LETTERS[i],as.character(a))
  }
  return(a)
}
replace_10_16(c(12,15,6))

replace_10_16(c(3,4,5))

replace_10_16(c(13,15,10))

#Q7
Q5a_quotient
Q7a_quotient = replace_10_16(Q5a_quotient)
Q7a_quotient

Q5b_remainder
Q7b_remainder = replace_10_16(Q5b_remainder)
Q7b_remainder

#Q8

hex_codes = function(Q7a_quotient,Q7b_remainder){
  m = matrix(paste0(Q7a_quotient,Q7b_remainder),nrow(Q7a_quotient),ncol(Q7a_quotient))
  hexs = c()
  for (i in 1:nrow(m)) {
    hexs[i] = paste0("#",paste(m[i,],collapse = ""))
  }
  return(hexs)
}
Q8 = hex_codes(Q7a_quotient,Q7b_remainder)
Q1
Q8
