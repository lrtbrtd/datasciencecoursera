pollutantmean <- function (repertoire, pollutant, id=1:332){
  
  rbind_echantillon <- data.frame()
  
  for (monitor in id){
    
    ## create File name by concaten directory, monitor with format on 3 char, and .csv suffix
    fichier <- paste(repertoire,paste(formatC(monitor, width=3, flag="0"),"csv",sep="."),sep="/")
    ## print(fichier) 
    
    ## read csv file 
    echantillon <- read.csv(fichier)
    ##print("echantillon")
    ##print(nrow(echantillon))
    
    rbind_echantillon <- rbind(echantillon,rbind_echantillon)
    ##print(nrow(rbind_echantillon))
  }

  if (pollutant == "nitrate"){
    mean(rbind_echantillon$nitrate, na.rm=T)
  }
  else{
    mean(rbind_echantillon$sulfate, na.rm=T)
  }
}
##MA1 = mtcars
##MA2 = mtcars
##MA3 = mtcars
##MA100 = mtcars

##MA = do.call("cbind", lapply(ls(pattern = "MA\\d"), get))