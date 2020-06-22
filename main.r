cwd = getwd()
setwd("/pita/users/rotem/bin/rotemfuns/")
files = list.files("R", full.names = T)

lapply(files, source)

setwd(cwd)

