#' @export

qzvtozip = function(filename) {
  # args = commandArgs(trailingOnly=TRUE)
  # filename = args[1]
  # filename = "../rat/res/core-metrics-results/bray_curtis_emperor.qzv"
  shortname = tools::file_path_sans_ext(basename(filename))
  ziplist = unzip(filename, list = T)$Name
  files.to.extract = grep("data/", ziplist, value = T)
  unzip(filename, files = files.to.extract, exdir = "temp")
  dir.create(shortname)
  system(paste("mv", paste0("temp/",dirname(files.to.extract)[1], "/*"), shortname))
  system(paste("rm -r temp"))
  zip(paste0(shortname, ".zip"), shortname)
}
