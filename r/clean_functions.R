# Function to merge more than two dataframes
multimerge <- function(df_list, bInner_join){
    merged_data <- Reduce(
      function(x,y) {
        merge(x,y, all=bInner_join)
      }, 
      df_list
    )
  return(merged_data)
}