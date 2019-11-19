cwd = getwd()
setwd("/pita/users/rotem/DB8/rotemfuns/")
files = list.files("R", full.names = T)

lapply(files, source)

setwd(cwd)

