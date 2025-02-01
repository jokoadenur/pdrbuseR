#' Lapus Konstruksi - ADHB
#'
#' Fungsi ini menjalankan alur penghitungan PDRB ADHB menurut lapangan usaha konstruksi.
#'
#' @export
#'
#' @examples
#' konstruksi_adhb()

konstruksi_adhb <- function() {
  cat("\nKONSTRUKSI\n")
  cat("Kegiatan Konstruksi terdiri atas konstruksi umum dan khusus Gedung dan bangunan sipil baik berupa pekerjaan baru, perbaikan, penambahan, dan perubahan, pendirian fabrikasi bangunan di lokasi suatu proyek, konstruksi yang bersifat sementara, termasuk juga rehabilitasi bangunan Gedung dan bangunan sipil, persewaan peralatan konstruksi dengan operatornya, serta work in progress seperti konstruksi proyek multiyear.\n\n")
  cat("Pendekatan Konstruksi kabkot: PMTB Bangunan atau metode secara langsung \n")
  cat("Sumber Data:\n")
  cat("1. Pemerintah: Realisasi APBN Bangunan, Realisasi APBD Bangunan, Realisasi APBDes Bangunan, dan Realisasi APBD Provinsi Bangunan dari BPKAD;\n")
  cat("2. Swasta: PMA Bangunan, PMDN Bangunan, Perkiraan Nilai Bangunan IMB-PBG;\n")
  cat("3. Rumah Tangga: Perkiraan Nilai Bangunan IMB-PBG;\n")
  cat("4. IHPB Konstruksi level Provinsi;\n")
  cat("5. Rasio NTB Konstruksi dari Tabel I-O Provinsi;\n")
  cat("6. Rasio PMTB Bangunan\n\n")

  nilai_bangunan <- as.numeric(readline("Masukkan Perkiraan Nilai Bangunan/Output (Luas Bangunan x Harga Bangunan per m2) hasil Pendataan PMTB Kuesioner IMB-PBG (dalam Jutaan Rp): ")) #input 1
  cat("Output Konstruksi Rumah Tangga adalah: ", nilai_bangunan, "\n\n")

  nilai_pma <- as.numeric(readline("Masukkan Nilai/Output Penanaman Modal Asing (PMA) dari isian Kuesioner PMTB LKPM (PMA x Nilai Tukar Rupiah terhadap Dolar dalam Jutaan Rp): ")) #input 2
  nilai_pmdn <- as.numeric(readline("Masukkan Nilai/Output Penanaman Modal Dalam Negeri (PMDN) dari isian Kuesioner PMTB LKPM (dalam Jutaan Rp): ")) #input 3
  nilai_ibmpbg <- as.numeric(readline("Masukkan Nilai/Output Taksiran Bangunan yang mengajukan Izin IBM-PBG (dalam Jutaan Rp): ")) #input 4
  cat("Output Konstruksi Swasta adalah: ", nilai_pma+nilai_pmdn+nilai_ibmpbg, "\n\n")

  nilai_apbn_kppn <- as.numeric(readline("Masukkan Realisasi Belanja Modal Bangunan APBN dari KPPN (dalam Jutaan Rp): ")) #input 5
  nilai_apbd_lpse <- as.numeric(readline("Masukkan Realisasi Belanja Modal Bangunan APBD Prov didekati dari realisasi Proyek Lelang di situs LPSE (dalam Jutaan Rp): ")) #input 6
  nilai_apbd_bpkad <- as.numeric(readline("Masukkan Realisasi Belanja Modal Bangunan APBD dari BPK/BPKAD (dalam Jutaan Rp): ")) #input 7
  nilai_apbdes_dpmd <- as.numeric(readline("Masukkan Realisasi Belanja Modal Bangunan APBDes dari DPMD (dalam Jutaan Rp): ")) #input 8
  cat("Output Konstruksi Pemerintah adalah: ", nilai_apbn_kppn+nilai_apbd_lpse+nilai_apbd_bpkad+nilai_apbdes_dpmd, "\n\n")

  rasio_konstruksi <- as.numeric(readline("Masukkan Rasio Konstruksi (Realisasi Belanja Modal bangunan APBN/APBN Total): ")) #input 9
  rasio_bangunan <- as.numeric(readline("Masukkan Rasio Bangunan untuk Konstruksi Swasta (mengikuti rasio bangunan dari PMTB): ")) #input 10
  ihpb_konstruksi <- as.numeric(readline("Masukkan Indeks Konstruksi Nasional dengan tahun dasar 2010, (tahun dasar Indeks Konstruksi Nasinal 2005=100, 2010=100, dan 2018=100): ")) #input 11
  pendapatan_konstruksi <- as.numeric(readline("Masukkan Pendapatan Konstruksi Indonesia (cek Publikasi Konstruksi Indonesia): ")) #input 12
  ntb_t <- as.numeric(readline("Masukkan NTB Konstruksi Indonesia tahun ini (t) (cek Publikasi Konstruksi Indonesia): ")) #input 13
  ntb_t_1 <- as.numeric(readline("Masukkan NTB Konstruksi Indonesia tahun sebelumnya (t-1) (cek Publikasi Konstruksi Indonesia): ")) #input 14
  cat("Rasio NTB Konstruksi Indonesia adalah: ", ntb_t/pendapatan_konstruksi, "\n")
  cat("Laju NTB Konstruksi Indonesia adalah: ", ntb_t/ntb_t_1*100-100, "\n\n")

  rasio_ntb_konstruksi <- as.numeric(readline("Masukkan Rasio NTB Konstruksi Provinsi Anda dari Tabel I-O 2016 (Rasio Konstruksi SE2016 x Laju NTB Konstruksi Indonesia: ")) #input 15
  output_adhb <- nilai_bangunan + nilai_pma + nilai_pmdn + nilai_ibmpbg + nilai_apbn_kppn + nilai_apbd_lpse + nilai_apbd_bpkad + nilai_apbdes_dpmd
  ntb_konstruksi_adhb <- output_adhb*rasio_ntb_konstruksi/100
  cat("Output Konstruksi Total ADHB adalah: ", output_adhb, "\n")
  cat("NTB Konstruksi Total ADHB adalah: ", ntb_konstruksi_adhb, "\n\n")

  # output_adhk <- output_adhb/ihpb_konstruksi
  # ntb_konstruksi_adhk <- output_adhb/ihpb_konstruksi*rasio_ntb_konstruksi/100
  # cat("Output Konstruksi Total ADHK adalah: ", output_adhk, "\n")
  # cat("NTB Konstruksi Total ADHK adalah: ", ntb_konstruksi_adhk, "\n")

  adjustment_ntb <- as.numeric(readline("Isikan Adjustment NTB ADHB, isikan 0 bila tidak: "))
  ntb_total <- ntb_konstruksi_adhb + adjustment_ntb
  cat("NTB ADHB Lapangan Usaha ini (dalam jutaan Rp) adalah: ", ntb_total, "\n")

  hasil <- data.frame(
    #Tipe = ifelse(opsi == 1, "ADHK", "ADHB"),
    #Id_Lapus = id_lapus,
    #Nama_Lapus = nama_pilihan,
    Tipe = "ADHB",
    Id_Lapus = 6,
    Nama_Lapus = "Konstruksi",
    Output_Konstruksi = output_adhb,
    Adjustment_NTB = adjustment_ntb,
    NTB_Total = ntb_total
  )

  View(hasil)
  assign("pdrbadhb_lapus6", hasil, envir = .GlobalEnv)

}
