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
