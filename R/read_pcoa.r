#' Read results of PCoA of core metrics files from qza file to an R object
#'
#' @param filepath Path of the qza file to be loaded
#' @return Return PCoA ordination table as R data frame to specific \code{filepath} file.
#' @examples
#' read_biom_qzv("path\to\qiime\file\some_measurment_file_pcoa_results.qzv")
#' @export

read_core_pcoa = function(filepath){
  # filepath = "/pita/users/rotem/DB8/rat/res/core-metrics-results/unweighted_unifrac_pcoa_results.qza"
  source("/pita/users/rotem/scripts/extract.qiime.R")
  extract.qiime(filepath, "*txt")
  dirpath = tools::file_path_sans_ext(filepath)
  file_loc = list.files(dirpath, full.names = T)
  result = read.table(file_loc[1], skip = 9, fill = T)
  system(paste("rm -r", dirpath))
  result = result[1:dim(result)[2]-1,]
  result$V2 = as.numeric(as.character(result$V2 ))
  result
}
