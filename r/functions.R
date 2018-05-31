# Function to merge more than two dataframes
multiMerge <- function(lsDF, bFullJoin){
    mergedData <- Reduce(
      function(x,y) {
        merge(x,y, all=bFullJoin)
      }, 
      lsDF
    )
  return(mergedData)
}