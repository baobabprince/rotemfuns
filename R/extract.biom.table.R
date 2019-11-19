#' extract biom table in qiime file (qza) and convert it to tsv format.
#' The output of the conversion will be in the original folder.
#'
#' @param filepath Path of the qza of the biom table to be converted
#' @examples
#' extract.biom.table("path\to\qiime\file\qza")
#' @export

extract.biom.table = function(filepath) {
  # filepath = "/pita/users/rotem/firsttry/res/table.qza"
  library(tools)
  library(tibble)
  library(filesstrings)
  dir_name = file_path_sans_ext(filepath)
  qiime.cmd = paste("qiime tools export --input-path"
                    , filepath
                    , "--output-path"
                    , dir_name)
  system(qiime.cmd)

  # since the name of the qiime export isn't set it take the last created file.
  #  potentially can cause problems!
  latest_file_changed =
    dir_name %>%
    dir(full.names = T) %>%
    file.info() %>%
    rownames_to_column() %>%
    top_n(1, ctime)

  biom.cmd = paste(  "biom convert -i", latest_file_changed[1,1]
                     , "-o", paste0(file_path_sans_ext(filepath), ".tsv")
                     , "--to-tsv")
  system(biom.cmd)
}
