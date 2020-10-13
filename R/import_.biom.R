#' convert biom to tsv file in rotem user on server
#'
#' @param biom_path path to input biom file to convert.
#' @param tsv_path path to output tsv file
#' @examples
#' convert_biom("/pita/pub/data/16S_DBs/processed/16S_DB1-11_merged/feature-table.biom", "file.tsv")
#' @export
convert_biom = function(biom_path, tsv_path = "biom.tsv"){
  parameter = "--to-tsv"
  biom_program = "/pita/users/rotem/miniconda3/bin/biom"
  cmd = paste(biom_program, "convert -i", biom_path, "-o", tsv_path, parameter)
  system(cmd)
}

#' import biom file to R object
#'
#' @param biom_path path to input biom file to be imported.
#' @examples
#' read_biom("/pita/pub/data/16S_DBs/processed/16S_DB1-11_merged/feature-table.biom")
#' @export
read_biom = function(biom_path){
  tsv_path = "biom.tsv"
  convert_biom(biom_path, tsv_path)
  biom = read.csv(tsv_path, header = T, skip = 1, sep = "\t")
  file.remove(tsv_path)
  return(biom)
}

#' read big biom file and return only biom with the specific samples.
#' also remove empty features <1
#'
#' @param biom_path path to input biom file to be imported.
#' @examples
#' biom_specific_samples("/pita/pub/data/16S_DBs/processed/16S_DB1-11_merged/feature-table.biom", "DB1.001")
#' @export
biom_specific_samples = function(biom_path, samples) {
  biom = read_biom(biom_path)
  colnums = na.omit(match(as.character(samples), names(biom)))

  filtered_biom = biom[,c(1,colnums)]
  filtered_biom = tibble::column_to_rownames(names(filtered_biom)[1])

  dplyr::distinct(filtered_biom, .keep_all = T)
}
