#' Fungsi untuk Menghitung PDRB Berdasarkan Lapangan Usaha
#'
#' Fungsi ini memungkinkan pengguna untuk memilih lapangan usaha tertentu dan menghitung Produk Domestik Regional Bruto (PDRB) berdasarkan harga dasar konstan (ADHK) atau harga dasar berlaku (ADHB).
#'
#' @import utils
#' @importFrom utils View
#' @export

globalVariables(c("View"))

pdrbuser <- function() {
  sektor <- data.frame(
    Id_Lapus = 1:17,
    Nama_Lapus = c(
      "Pertanian, Kehutanan, dan Perikanan", "Pertambangan dan Penggalian", "Industri Pengolahan",
      "Pengadaan Listrik, Gas, dan Produksi Es", "Pengadaan Air, Pengelolaan Sampah, dan Daur Ulang", "Konstruksi",
      "Perdagangan Besar dan Eceran", "Transportasi dan Pergudangan", "Penyediaan Akomodasi dan Makan Minum",
      "Informasi dan Komunikasi", "Jasa Keuangan dan Asuransi", "Real Estate", "Jasa Perusahaan",
      "Administrasi Pemerintahan, Pertahanan, Jaminan Sosial", "Jasa Pendidikan", "Jasa Kesehatan dan Kegiatan Sosial",
      "Jasa Lainnya"
    )
  )
  print(sektor)

  opsi <- as.integer(readline("Pilih 1 untuk ADHK atau 2 untuk ADHB: "))
  if (!(opsi %in% c(1, 2))) {
    print("Pilihan tidak valid. Selesai.")
    return(invisible(NULL))
  }

  id_lapus <- as.integer(readline("Pilih Id_Lapus yang Akan Anda Hitung PDRB-nya: "))

  if (opsi == 1) {
    if (id_lapus == 5) {
      nama_pilihan <- sektor$Nama_Lapus[sektor$Id_Lapus == id_lapus]
      cat("\n", nama_pilihan, "\n")
      cat("Sumber Data:\n")
      cat("1. Air Terjual dari PDAM Kabupaten/Kota;\n")
      cat("2. Volume Sampah Terkelola dan Daur Ulang Sampah dari DLH Kabkot;\n")

      air_produksi <- as.numeric(readline("Masukkan produksi Air dari PDAM (dalam m3): "))
      harga_air <- as.numeric(readline("Masukkan Harga Air per m3 tahun dasar (dalam Rupiah): "))
      output_air <- air_produksi * harga_air / 1000000
      cat("Output dalam Jutaan Rp: (produksi air x harga)", output_air, "\n")

      rasio_biaya_air <- as.numeric(readline("Masukkan Rasio Biaya Antara (cek dari Tabel Input-Output Provinsi Anda): "))
      biaya_antara_air <- output_air * rasio_biaya_air
      cat("Nilai Biaya Antara dalam jutaan Rp: (output produksi air x rasio biaya antara)", biaya_antara_air, "\n")
      ntb_air <- output_air - biaya_antara_air
      cat("NTB dalam Jutaan Rp pengadaan air: (output produksi air - biaya antara)", ntb_air, "\n")

      sampah_volume <- as.numeric(readline("Masukkan Volume Sampah Terkelola dari DLH (dalam kg): "))
      harga_sampah <- as.numeric(readline("Masukkan Harga Olah Sampah per kg tahun dasar (dalam Rupiah): "))
      output_sampah <- sampah_volume * harga_sampah / 1000000
      cat("Output dalam Jutaan Rp: (volume sampah x harga)", output_sampah, "\n")

      rasio_biaya_sampah <- as.numeric(readline("Masukkan Rasio Biaya Antara (cek dari Tabel Input-Output Provinsi Anda): "))
      biaya_antara_sampah <- output_sampah * rasio_biaya_sampah
      cat("Nilai Biaya Antara dalam jutaan Rp: (output sampah x rasio biaya sampah)", biaya_antara_sampah, "\n")
      ntb_sampah <- output_sampah - biaya_antara_sampah
      cat("NTB dalam Jutaan Rp pengelolaan sampah: (output sampah - biaya antara)", ntb_sampah, "\n")
      ntb_daur_ulang <- 0.01 * ntb_sampah
      cat("NTB dalam Jutaan Rp daur ulang sampah: (1% dari NTB sampah terkelola)", ntb_daur_ulang, "\n")

      total_output <- output_air + output_sampah
      total_biaya_antara <- biaya_antara_air + biaya_antara_sampah
      cat("Jumlah Output Lapangan Usaha ini ADHK adalah: ", total_output, "\n")
      cat("Total Biaya Antara Lapangan usaha ini ADHK adalah: ", total_biaya_antara, "\n")

      adjustment_ntb <- as.numeric(readline("Isikan Adjustment NTB ADHK, isikan 0 bila tidak: "))
      ntb_total <- ntb_air + ntb_sampah + ntb_daur_ulang + adjustment_ntb
      cat("NTB ADHK Lapangan Usaha ini (dalam jutaan Rp) adalah: ", ntb_total, "\n")

      hasil <- data.frame(
        Tipe = ifelse(opsi == 1, "ADHK", "ADHB"),
        Id_Lapus = id_lapus,
        Nama_Lapus = nama_pilihan,
        Output_Air = output_air,
        Biaya_Antara_Air = biaya_antara_air,
        NTB_Air = ntb_air,
        Output_Sampah = output_sampah,
        Biaya_Antara_Sampah = biaya_antara_sampah,
        NTB_Sampah = ntb_sampah,
        NTB_Daur_Ulang = ntb_daur_ulang,
        Total_Output = total_output,
        Total_Biaya_Antara = total_biaya_antara,
        Adjustment_NTB = adjustment_ntb,
        NTB_Total = ntb_total
      )

      View(hasil)
      assign("pdrbadhk_lapus5", hasil, envir = .GlobalEnv)

    } else if (id_lapus == 6) {
      konstruksi_adhk()
    } else {
      print("Selesai")
    }
  } else if (opsi == 2) {
    if (id_lapus == 5) {
      nama_pilihan <- sektor$Nama_Lapus[sektor$Id_Lapus == id_lapus]
      cat("\n", nama_pilihan, "\n")
      cat("Sumber Data:\n")
      cat("1. Air Terjual dari PDAM Kabupaten/Kota;\n")
      cat("2. Volume Sampah Terkelola dan Daur Ulang Sampah dari DLH Kabkot;\n")

      air_produksi <- as.numeric(readline("Masukkan produksi Air dari PDAM (dalam m3): "))
      harga_air <- as.numeric(readline("Masukkan Indeks Harga Produsen (IHP) tahun dasar (dalam Rupiah): "))
      output_air <- air_produksi * harga_air / 1000000
      cat("Output dalam Jutaan Rp: (produksi air x IHP)", output_air, "\n")

      rasio_biaya_air <- as.numeric(readline("Masukkan Rasio Biaya Antara (cek dari Tabel Input-Output Provinsi Anda): "))
      biaya_antara_air <- output_air * rasio_biaya_air
      cat("Nilai Biaya Antara dalam jutaan Rp: (output produksi air x rasio biaya antara)", biaya_antara_air, "\n")
      ntb_air <- output_air - biaya_antara_air
      cat("NTB dalam Jutaan Rp pengadaan air: (output produksi air - biaya antara)", ntb_air, "\n")

      sampah_volume <- as.numeric(readline("Masukkan Volume Sampah Terkelola dari DLH (dalam kg): "))
      harga_sampah <- as.numeric(readline("Masukkan Indeks Harga Produsen tahun dasar (dalam Rupiah): "))
      output_sampah <- sampah_volume * harga_sampah / 1000000
      cat("Output dalam Jutaan Rp: (volume sampah x IHP)", output_sampah, "\n")

      rasio_biaya_sampah <- as.numeric(readline("Masukkan Rasio Biaya Antara (cek dari Tabel Input-Output Provinsi Anda): "))
      biaya_antara_sampah <- output_sampah * rasio_biaya_sampah
      cat("Nilai Biaya Antara dalam jutaan Rp: (output sampah x rasio biaya sampah)", biaya_antara_sampah, "\n")
      ntb_sampah <- output_sampah - biaya_antara_sampah
      cat("NTB dalam Jutaan Rp pengelolaan sampah: (output sampah - biaya antara)", ntb_sampah, "\n")
      ntb_daur_ulang <- 0.01 * ntb_sampah
      cat("NTB dalam Jutaan Rp daur ulang sampah: (1% dari NTB sampah terkelola)", ntb_daur_ulang, "\n")

      total_output <- output_air + output_sampah
      total_biaya_antara <- biaya_antara_air + biaya_antara_sampah
      cat("Jumlah Output Lapangan Usaha ini ADHB adalah: ", total_output, "\n")
      cat("Total Biaya Antara Lapangan usaha ini ADHB adalah: ", total_biaya_antara, "\n")

      adjustment_ntb <- as.numeric(readline("Isikan Adjustment NTB ADHB, isikan 0 bila tidak: "))
      ntb_total <- ntb_air + ntb_sampah + ntb_daur_ulang + adjustment_ntb
      cat("NTB ADHB Lapangan Usaha ini (dalam jutaan Rp) adalah: ", ntb_total, "\n")

      hasil <- data.frame(
        Tipe = ifelse(opsi == 1, "ADHK", "ADHB"),
        Id_Lapus = id_lapus,
        Nama_Lapus = nama_pilihan,
        Output_Air = output_air,
        Biaya_Antara_Air = biaya_antara_air,
        NTB_Air = ntb_air,
        Output_Sampah = output_sampah,
        Biaya_Antara_Sampah = biaya_antara_sampah,
        NTB_Sampah = ntb_sampah,
        NTB_Daur_Ulang = ntb_daur_ulang,
        Total_Output = total_output,
        Total_Biaya_Antara = total_biaya_antara,
        Adjustment_NTB = adjustment_ntb,
        NTB_Total = ntb_total
      )

      View(hasil)
      assign("pdrbadhb_lapus5", hasil, envir = .GlobalEnv)
    } else if (id_lapus == 6) {
      konstruksi_adhb()
    } else {
      print("Selesai")
    }
  }
}
