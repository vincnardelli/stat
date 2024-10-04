data <- read.csv("dati_sanitari.csv")
conta_sovrappeso <- 0
conta_obeso_1 <- 0
conta_obeso_2 <- 0
conta_obeso_3 <- 0

for(i in 1:nrow(data)){
  cat(i, "\n")
  peso <- data$peso[i]
  altezza <- data$altezza[i]
  
  
  BMI <- peso/altezza^2
  
  if(BMI < 16){
    classificazione <- "Grave magrezza"
  }else if(BMI < 18.5){
    classificazione <- "Sottopeso"
  }else if(BMI < 25){
    classificazione <- "Normopeso"
  }else if(BMI < 30){
    classificazione <- "Sovrappeso"
    conta_sovrappeso <- conta_sovrappeso + 1
  }else if(BMI < 35){
    classificazione <- "Obeso classe 1"
    conta_obeso_1 <- conta_obeso_1 + 1
  }else if(BMI < 40){
    classificazione <- "Obeso classe 2"
    conta_obeso_2 <- conta_obeso_2 + 1
  }else{
    classificazione <- "Obeso classe 3"
    conta_obeso_3 <- conta_obeso_3 + 1
  }
}

conta_sovrappeso/nrow(data)*100
conta_obeso_1/nrow(data)*100
conta_obeso_2/nrow(data)*100
conta_obeso_3/nrow(data)*100
