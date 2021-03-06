#load the memoised version of pheatmap
library(devtools)
source_url("https://raw.githubusercontent.com/apratap/apRs/master/expression_heatmap.R")

#gene expression heatmap logic
matrix_heatMap <- function(m, annotation = NA ,
                           clustering_distance_rows = "correlation",
                           clustering_distance_cols = "correlation",
                           cor_method="spearman",
                           clustering_method = "average",
                           scale = FALSE,...){
  if(nrow(m) <= 2){
    return(memoised_pheatmap(m, cluster_rows=FALSE,
                             scale="none",
                             annotation = annotation,
                             drawRowD = FALSE,
                             border_color = NA,...))
  }
  else{
    #do the clustering and heatmap
    #scaling genes across experiments
    if(scale == "TRUE"){
      m <- t(scale(t(m)))
    }
    memoised_pheatmap(m,
                      scale="none",
                      annotation = annotation,
                      clustering_distance_rows = clustering_distance_rows,
                      clustering_distance_cols = clustering_distance_cols,
                      clustering_method = clustering_method,
                      border_color = NA,
                      drawRowD = FALSE,
                      cor_method=cor_method,...)
  }
}
