#' Read biom table from qza file.
#'
#' @param filepath Path of the qza file to be loaded
#' @return Return BIOM object (from fiomformat library) to specific \code{filepath} file.
#' @examples
#' read_biom_qzv("path\to\qiime\file\qzv")
#' @export

read_biom_qzv = function(filepath){
  # filepath = "/pita/users/rotem/DB8/rat/res/table-unfiltered.qza"
  library(tools)
  library(biomformat)
  source("/pita/users/rotem/scripts/extract.qiime.R")
  extract.qiime(filepath, "*biom")
  dirpath = file_path_sans_ext(filepath)
  biompath = list.files(dirpath, full.names = T)
  biom = read_biom(biompath)
  system(paste("rm -r", dirpath))
  biom
}
