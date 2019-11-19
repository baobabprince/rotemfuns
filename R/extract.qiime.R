#' extract qiime files by a specific file extension
#'
#' @param filepath Path of the qza/v file to be extract
#' @param extension File extension to unzipped from filepath. format \code{'*csv'}.
#' @return Extracted files with \code{extension} in the qiime \code{filepath} file.
#' @examples
#' extract.qiime("path\to\qiime\file\qzv", extension = "*csv")
#' @export

extract.qiime = function (filepath, extension) {
  library(tools)
  library(filesstrings)
  shortname = file_path_sans_ext(filepath)
  dir.create(shortname)
  tozip = unzip(filepath, exdir = shortname, list = T)[,1]
  unzip(  filepath
          , exdir = shortname
          , files = tozip[grepl(pattern = extension, tozip)]
          , overwrite = T)

  unzipped = list.files(  path = shortname
                          , pattern = extension
                          , full.names = T
                          , recursive = T
                          , include.dirs = T)

  system(paste("mv", unzipped, shortname))
  # file.move(files = unzipped, destinations = shortname, overwrite = TRUE)
  system("find . -type d -empty -delete")
}


# filepath = "/pita/users/rotem/firsttry/res/taxonomy.qzv"
# extension = "*tsv"
