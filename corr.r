corr <- function(directory, threshold = 0) {
  result <- vector()
  id <- 1:332
  
  for (monitor in id){
    
    ## create File name by concaten directory, monitor with format on 3 char, and .csv suffix
    fichier <- paste(directory,paste(formatC(monitor, width=3, flag="0"),"csv",sep="."),sep="/")
    ##print(fichier) 
    
    ## read csv file 
    echantillon <- read.csv(fichier)
    ##print("echantillon")
    ##print(nrow(echantillon))
    ##print(ncol(echantillon))
    
    good <- complete.cases(echantillon)
    clean_echantillon <- echantillon[good,]
    ##head(clean_echantillon)
    
    if (nrow(clean_echantillon) > threshold){
      result <- c(result, cor(clean_echantillon$sulfate, clean_echantillon$nitrate))
      
    }
    
  }
  
result
}