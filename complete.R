complete <- function (directory, id = 1:332) {
  
  rbind_clean_echantillon <- data.frame()

  
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
    ##print(clean_echantillon)
    
    vector <-c(monitor, nrow(clean_echantillon))
    print(vector)
    
    rbind_clean_echantillon <- rbind(rbind_clean_echantillon, vector)
    print(rbind_clean_echantillon)
  }
  
  colnames(rbind_clean_echantillon) <- c("id","nobs")
  rbind_clean_echantillon
  
}