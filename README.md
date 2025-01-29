![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)
![CRAN Version](https://img.shields.io/badge/CRAN-7.3.2-brightgreen)
![Open Issues](https://img.shields.io/badge/open%20issues-0-brightgreen)
![License](https://img.shields.io/badge/License-MIT-blue)

![WhatsApp Image 2025-01-29 at 20 55 45](https://github.com/user-attachments/assets/631a4512-912a-4fe1-bdea-929cadcf170c)


# pdrbuseR

`pdrbuseR` is an R package designed to calculate the Gross Regional Domestic Product (GRDP) or PDRB in Indonesia. It provides step-by-step guidance on how to calculate GRDP. As a disclaimer, this package is just the first pilot project and will be further developed.

## Installation

To install the `pdrbuseR` package, run the following code in your R script:

```R
# Install package from GitHub
devtools::install_github("jokoadenur/pdrbuseR")
```

> **Note:** If prompted to update certain packages (options like 1. All, 2. CRAN, etc.), simply press **ENTER** to skip. Wait until the installation process is complete and the message `DONE (pdrbuseR)` appears.

After installation, activate the package with the following code:

```R
# Activate the package
library(pdrbuseR)
```

## Usage

To calculate GRDP sequentially

```R
pdrbuser()
```

### Examples:

   ```R
   > library(pdrbuseR)
> pdrbuser()
       Id_Lapus                                            Nama_Lapus
    1         1                   Pertanian, Kehutanan, dan Perikanan
    2         2                           Pertambangan dan Penggalian
    3         3                                   Industri Pengolahan
    4         4               Pengadaan Listrik, Gas, dan Produksi Es
    5         5     Pengadaan Air, Pengelolaan Sampah, dan Daur Ulang
    6         6                                            Konstruksi
    7         7                          Perdagangan Besar dan Eceran
    8         8                          Transportasi dan Pergudangan
    9         9                  Penyediaan Akomodasi dan Makan Minum
    10       10                              Informasi dan Komunikasi
    11       11                            Jasa Keuangan dan Asuransi
    12       12                                           Real Estate
    13       13                                       Jasa Perusahaan
    14       14 Administrasi Pemerintahan, Pertahanan, Jaminan Sosial
    15       15                                       Jasa Pendidikan
    16       16                    Jasa Kesehatan dan Kegiatan Sosial
    17       17                                          Jasa Lainnya

    > Pilih 1 untuk ADHK atau 2 untuk ADHB: 1
    > Pilih Id_Lapus yang Akan Anda Hitung PDRB-nya: 5
    
     Pengadaan Air, Pengelolaan Sampah, dan Daur Ulang 
    Sumber Data:
    1. Air Terjual dari PDAM Kabupaten/Kota;
    2. Volume Sampah Terkelola dan Daur Ulang Sampah dari DLH Kabkot;
    
    Masukkan produksi Air dari PDAM (dalam m3): 5703919
    Masukkan Harga Air per m3 tahun dasar (dalam Rupiah): 3200
    Output dalam Jutaan Rp: (produksi air x harga) 18252.54 
    Masukkan Rasio Biaya Antara (cek dari Tabel Input-Output Provinsi Anda): 0.2615241561
    Nilai Biaya Antara dalam jutaan Rp: (output produksi air x rasio biaya antara) 4773.48 
    NTB dalam Jutaan Rp pengadaan air: (output produksi air - biaya antara) 13479.06 
    Masukkan Volume Sampah Terkelola dari DLH (dalam kg): 1660008
    Masukkan Harga Olah Sampah per kg tahun dasar (dalam Rupiah): 1500
    Output dalam Jutaan Rp: (volume sampah x harga) 2490.012 
    Masukkan Rasio Biaya Antara (cek dari Tabel Input-Output Provinsi Anda): 0.18227162
    Nilai Biaya Antara dalam jutaan Rp: (output sampah x rasio biaya sampah) 453.8585 
    NTB dalam Jutaan Rp pengelolaan sampah: (output sampah - biaya antara) 2036.153 
    NTB dalam Jutaan Rp daur ulang sampah: (1% dari NTB sampah terkelola) 20.36153 
    Jumlah Output Lapangan Usaha ini ADHK adalah:  20742.55 
    Total Biaya Antara Lapangan usaha ini ADHK adalah:  5227.339 
    Isikan Adjustment NTB ADHK, isikan 0 bila tidak: 0
    NTB ADHK Lapangan Usaha ini (dalam jutaan Rp) adalah:  15535.58
   ```
### Output Calculation:
  The result of this package is described as a data frame, which is displayed in the R Environment as the image below:
  ![image](https://github.com/user-attachments/assets/4182c37e-8e48-4b47-847c-7bfa083fd014)

