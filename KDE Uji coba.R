# Load library
library(ggplot2)
library(tidyr)

# Import data
fibrosis_data <- read.csv("fibrosis_smoc2_rawcounts.csv",
  row.names = 1
)

# Ambil kolom
data_col <- fibrosis_data[, "smoc2_normal3", drop = FALSE]

# Transformasi log2
vst_values <- log2(data_col[,1] + 1)


dens_nrd0 <- density(vst_values, bw = "nrd0")
dens_ucv  <- density(vst_values, bw = "ucv")
dens_bcv  <- density(vst_values, bw = "bcv")
dens_sj   <- density(vst_values, bw = "SJ")

# NRD0 / Silverman
plot(
  dens_nrd0,
  col = "blue",
  lwd = 2,
  main = paste(
    "KDE - Silverman\nBandwidth =",
    round(dens_nrd0$bw, 4)
  ),
  xlab = "Nilai VST",
  ylab = "Density"
)

# UCV
plot(
  dens_ucv,
  col = "red",
  lwd = 2,
  main = paste(
    "KDE - UCV\nBandwidth =",
    round(dens_ucv$bw, 4)
  ),
  xlab = "Nilai VST",
  ylab = "Density"
)

# BCV
plot(
  dens_bcv,
  col = "green",
  lwd = 2,
  main = paste(
    "KDE - BCV\nBandwidth =",
    round(dens_bcv$bw, 4)
  ),
  xlab = "Nilai VST",
  ylab = "Density"
)

# SJ
plot(
  dens_sj,
  col = "purple",
  lwd = 2,
  main = paste(
    "KDE - SJ\nBandwidth =",
    round(dens_sj$bw, 4)
  ),
  xlab = "Nilai VST",
  ylab = "Density"
)
