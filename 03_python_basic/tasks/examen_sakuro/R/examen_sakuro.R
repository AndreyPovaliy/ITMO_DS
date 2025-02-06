setwd("./03_python_basic/lesson_1/examen_sakuro/R/")
input_data <- read.table(file = "examen_input.txt", sep = ",")

is_possible <- function(n_a, n_b) {
  if ((n_a == 0 || n_a %% 2 != 0) && (n_b == 0 || n_b %% 2 != 0)){
    print("NO")
  }else if((n_a%%6 == 0 && n_b*2%%2 == 0)||(n_a %% 2 == 0 && n_b * 2 %% 6 == 0)) {
    print("YES")
  } else {
    print("YES")
  }
}

cycles <-  input_data$V1[1]

for(i in 1:cycles+1){
  n_a <- input_data$V1[i]
  n_b <- input_data$V2[i]
  print(paste("Round №:",i-1))
  print(n_a)
  print(n_b)
  
  is_possible(n_a,n_b)
}

setwd("~/Documents/Education/ITMO_DS/ITMO_DS")
