#' extract taxonomy file from qiime and return it as a table, splited to taxonomic groups
#' @param filepath Path of the qza of the taxonomy file to be converted
#' @examples
#' extract.biom.table("path\to\qiime\res\taxonony.qza")
#' @importFrom stringr str_split
#' @importFrom plyr rbind.fill
#' @export

read_taxonomy = function(filepath){
  # filepath = "/pita/users/rotem/DB8/human/res/taxonomy.qza"
  tempdir = dirname(unzip(filepath, list = T)[1,]$Name)
  toextract = file.path(tempdir, "data", "taxonomy.tsv")
  unzip(filepath, files = toextract, junkpaths = T)
  temp = read.csv("taxonomy.tsv", sep = "\t", row.names = 1)
  file.remove("taxonomy.tsv")
  temp_split = lapply(lapply(str_split(temp$Taxon, ";"), t), data.frame) %>%
    rbind.fill()
  cbind(temp, temp_split)
}
