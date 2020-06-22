#' return short version of bacteria name
#'
#' @param Taxon full taxonomical data include bacteria and empty sub divisions
#' @examples
#' short_bacteria_name("k__Bacteria; p__Cyanobacteria; c__Chloroplast; o__Streptophyta; f__; g__; s__")
#' [1] " p__Cyanobacteria c__Chloroplast o__Streptophyta"
#' @export

short_bacteria_name = function(Taxon) {
  split_taxonomy = strsplit(as.character(Taxon), split = ";")[[1]]
  short_taxonomy = split_taxonomy[nchar(split_taxonomy) > 4]
  # remove bacteria prefix
  paste(short_taxonomy[2:length(short_taxonomy)], collapse = "")
  }
