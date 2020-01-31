library(hexSticker)
library(ggplot2)

#-------
# params
#-------
{
  bgcol <- "white"
  bordercol <- "gray23"
  mcol1 <- "red"
  mcol2 <- "green"
  
  titleval <- "recount\nmethylation"
  txtcol <- "gray23"
  urlval <- "recount.bio"
  urlcol <- "gray23"
  
  stickerfn = "remeth_hexsticker.png"
}

#---------------
# ggplot2 m logo
#---------------
# version 1
{
  rmhm <- data.frame(colfill = c(rep(c(NA, 1, 1, 1, 0, 0, 0, NA), 2), NA, 1, 1, 1),
                    row = rep(seq(1, 4, 1), 5),
                    col = rep(seq(1, 5, 1), each = 4),
                    stringsAsFactors = F)
  rmhm$row  <- factor(rmhm$row, levels = rev(order(unique(rmhm$row))))
  
  p <- ggplot(rmhm, aes(col, row)) + 
    geom_tile(aes(fill = colfill, alpha = 1/10, width = 1, height = 1), colour = "white") + 
    scale_fill_gradient(low = mcol1, high = mcol2, 
                        na.value = bgcol)
  
  p <- p + theme(axis.line=element_blank(),axis.text.x=element_blank(),
                 axis.text.y=element_blank(),axis.ticks=element_blank(),
                 axis.title.x=element_blank(),
                 axis.title.y=element_blank(),legend.position="none",
                 panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
                 panel.grid.minor=element_blank(),plot.background=element_blank()) +
    scale_x_discrete(expand=c(0,0)) +
    scale_y_discrete(expand=c(0,0))
}

# version 2
{
  dfp  <- data.frame(barnum = seq(1, 5, 1), 
                   minval = c(-1, 0, -1, 0, -1), 
                   valend = c(2, 3, 2, 3, 2))
  
  p <- ggplot(dfp) +
    geom_segment(aes(x = barnum, xend = barnum, 
                     y = minval, yend = valend,
                     alpha = 1/10),
                 color = c("green", "red", "green", "red", "green"),
                 size = 8) +
    xlim(-0.5, 5.5) +
    theme(axis.line=element_blank(), axis.text.x=element_blank(),
          axis.text.y=element_blank(), axis.ticks=element_blank(),
          axis.title.x=element_blank(),
          axis.title.y=element_blank(), legend.position="none",
          panel.background=element_blank(), 
          panel.border=element_blank(), panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(), plot.background=element_blank())
}

#---------------------
# make the hex sticker
#---------------------
{
  sticker(p, package = titleval,
          s_x = 0.87, s_y = 1, s_width = 1.8, s_height = 1.4,
          p_x = 1, p_y = 1.05, p_color = txtcol, p_size = 7,
          filename = stickerfn,
          h_fill = bgcol, h_color = bordercol,
          url = urlval, u_x = 1, u_y = 0.1, u_color = urlcol,
          u_size = 3,
          white_around_sticker = FALSE) 
}




