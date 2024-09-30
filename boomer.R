# Boomer finder

anno_nascita <- 1959


if(anno_nascita > 1964){
  print("Non sei boomer")
}else if(anno_nascita < 1946){
  print("Non sei boomer")
}else{
  print("Sei boomer")
}


if(anno_nascita %in% 1946:1964){
  print("Sei boomer")
}else{
  print("Non sei boomer")
}



if(anno_nascita >= 1946 & anno_nascita <= 1964){
  print("Boomer alert!")
}else if(anno_nascita < 1946){
  print("Più vecchio dei booomer!")
}else{
  print("Non sei un boomer!")
}



# Input anni al posto dell'anno di nascita

anni <- 60
anno_nascita <- 2024-anni
