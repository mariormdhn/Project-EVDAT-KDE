# Project-EVDAT-KDE

# KDE Analysis on RNA-Seq VST Data

Project ini bertujuan untuk membandingkan beberapa metode Kernel Density Estimation (KDE) pada data RNA-Seq setelah transformasi log2.

## Dataset
Dataset yang digunakan:
- fibrosis_smoc2_rawcounts.csv

Kolom yang dianalisis:
- smoc2_normal3

## Metode yang Digunakan

### Transformasi Data
Data count ditransformasi menggunakan:

```r
log2(x + 1)
```

### Kernel Density Estimation (KDE)

Metode bandwidth yang dibandingkan:
- NRD0 (Silverman)
- UCV
- BCV
- Sheather-Jones (SJ)

Kernel yang digunakan: Gaussian

## Library R

```r
library(gglpot2)
```

## Contoh Kode

```r
density_sj <- density(vst_values, bw = "SJ")

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

```

## Hasil Analisis

Perbandingan bandwidth menunjukkan bahwa:
- bandwidth kecil menghasilkan kurva lebih detail
- bandwidth besar menghasilkan kurva lebih smooth

Untuk data ini visualisasi yang lebih jelas adalah bandwith dengan silverman dan BCV.

## Author

Mario Ilham Ramadhan
