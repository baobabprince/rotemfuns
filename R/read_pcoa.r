#' Read results of faith metrics from qzv file
#'
#' @param filepath Path of the qzv file to be loaded
#' @return Return alpha diversity as faith values for table as R data frame to specific \code{filepath} file.
#' @examples
#' read_biom_qzv("path\to\qiime\file\faith-pd----.qzv")
#' @export
read_faith_qzv = function(filepath){
  # filepath = "/pita/users/rotem/eyes/human/Feaces/res/core-metrics-results/faith-pd-correlation.qzv"
  # source("/pita/users/rotem/scripts/extract.qiime.R")
  filepath = tools::file_path_as_absolute(filepath)
  allfiles = unzip(zipfile = filepath, list = T)
  dirpath = tools::file_path_sans_ext(filepath)
  unzip(  filepath,
          files = allfiles$Name[grep(file.path("data","metadata.tsv"), allfiles$Name)]
          , exdir = dirpath, junkpaths = T)
  result_path = file.path(dirpath, "metadata.tsv")
  result = read.table(result_path, fill = T, header = T)
  system(paste("rm -r", dirpath))
  result
}

#' Read results of PCoA of core metrics files from qza file to an R object
#'
#' @param filepath Path of the qza file to be loaded
#' @return Return PCoA ordination table as R data frame to specific \code{filepath} file.
#' @examples
#' read_biom_qzv("path\to\qiime\file\some_measurment_file_pcoa_results.qzv")
#' @export

read_core_pcoa = function(filepath){
  # filepath = "/pita/users/rotem/DB8/rat/res/core-metrics-results/unweighted_unifrac_pcoa_results.qza"
  # source("/pita/users/rotem/scripts/extract.qiime.R")
  filepath = tools::file_path_as_absolute(filepath)
  extract.qiime(filepath, "*txt")
  dirpath = tools::file_path_sans_ext(filepath)
  file_loc = list.files(dirpath, full.names = T, pattern = "*txt")
  result = read.table(file_loc[1], skip = 9, fill = T, row.names = 1)
  system(paste("rm -r", dirpath))
  result = result[1:dim(result)[2]-1,]
  result$V2 = as.numeric(as.character(result$V2 ))
  result
}

