#' ggplot class theme with black lines and text
#' @importFrom ggplot2 theme theme_classic element_line element_text

#' @export

theme_rh =
  ggplot2::theme_classic() +
  ggplot2::theme(  axis.line = ggplot2::element_line(color = "black")
          , axis.text = ggplot2::element_text(color = "black"))

#' ggplot class theme with black lines and text
#' From Koundinya Desiraju
#' https://rpubs.com/Koundy/71792
#' @importFrom ggplot2 theme theme_classic element_line element_text

#' @export
theme_Publication <- function(base_size=14, base_family="helvetica") {
  library(grid)
  library(ggthemes)
  (theme_foundation(base_size=base_size, base_family=base_family)
    + ggplot2::theme(plot.title = ggplot2::element_text(face = "bold",
                                      size = rel(1.2), hjust = 0.5),
            text = ggplot2::element_text(),
            panel.background = ggplot2::element_rect(colour = NA),
            plot.background = ggplot2::element_rect(colour = NA),
            panel.border = ggplot2::element_rect(colour = NA),
            axis.title = ggplot2::element_text(face = "bold",size = rel(1)),
            axis.title.y = ggplot2::element_text(angle=90,vjust =2),
            axis.title.x = ggplot2::element_text(vjust = -0.2),
            axis.text = ggplot2::element_text(),
            axis.line = ggplot2::element_line(colour="black"),
            axis.ticks = ggplot2::element_line(),
            panel.grid.major = ggplot2::element_line(colour="#f0f0f0"),
            panel.grid.minor = ggplot2::element_blank(),
            legend.key = ggplot2::element_rect(colour = NA),
            legend.position = "bottom",
            legend.direction = "horizontal",
            legend.key.size= unit(0.2, "cm"),
            legend.margin = unit(0, "cm"),
            legend.title = ggplot2::element_text(face="italic"),
            plot.margin = unit(c(10,5,5,5),"mm"),
            # strip.background = ggplot2::element_rect(colour="#f0f0f0",fill="#f0f0f0"),
            strip.text = ggplot2::element_text(face="bold"), 
            strip.background = element_blank()
    ))

}

scale_fill_Publication <- function(...){
  library(scales)
  discrete_scale("fill","Publication",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}

scale_colour_Publication <- function(...){
  library(scales)
  discrete_scale("colour","Publication",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)

}
