#' Return jaccard index for two lists
#'
#' @param x first list
#' @param y second list
#' @return the jaccard index for the lists
#' @examples
#' jaccard(c("a","b","c"), c("a","c","d","e"))
#' @export

jaccard = function(x,y) {
  length(intersect(x,y)) / length(union(x,y))
}

