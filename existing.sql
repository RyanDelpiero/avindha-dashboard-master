/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.32-MariaDB : Database - avindha_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`avindha_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `avindha_db`;

/*Table structure for table `test_cases` */

DROP TABLE IF EXISTS `test_cases`;

CREATE TABLE `test_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `result` enum('Passed','Failed','Pending') DEFAULT 'Passed',
  `severity` varchar(30) DEFAULT 'Minor',
  `service_provider` varchar(50) DEFAULT '',
  `phone` varchar(30) DEFAULT '',
  `layanan` varchar(100) DEFAULT '',
  `tier` varchar(20) DEFAULT '',
  `menu_category` varchar(100) DEFAULT '',
  `capability` varchar(100) DEFAULT '',
  `step` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `propose` text DEFAULT NULL,
  `evidence_type` varchar(20) DEFAULT NULL,
  `evidence_name` varchar(255) DEFAULT NULL,
  `evidence_data` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `test_cases` */

insert  into `test_cases`(`id`,`module`,`date`,`result`,`severity`,`service_provider`,`phone`,`layanan`,`tier`,`menu_category`,`capability`,`step`,`detail`,`description`,`propose`,`evidence_type`,`evidence_name`,`evidence_data`,`created_at`,`updated_at`) values 
(8,'grapari-indihome','2026-08-12','Passed','Minor','','','','','','Pasang Baru','1. Pasang Baru 2. Daftar Indihome 3. Pilih Alamat (cek ketersediaan jaringan) 4. Pilih Paket 5. Isi Data Diri 6. Kirim OTP 7. Input Kode OTP 8. Upload KTP dan isi alamat 9. Konfirmasi Pesanan 10. Jadwalkan Pemasangan	\n','','','',NULL,NULL,NULL,'2026-08-12 11:33:13','2026-08-12 11:33:13'),
(9,'grapari-indihome','2026-08-10','Pending','Minor','','','','','','Lacak Proses Permintaan','1. Masukkan Order id (pasang baru / pindah alamat atau yg lainnya)','','','',NULL,NULL,NULL,'2026-08-12 11:33:53','2026-08-12 11:35:18'),
(10,'grapari-indihome','2026-08-12','Passed','Minor','','','','','','Cek & Bayar Tagihan IndiHome','1. Klik Cek & Bayar Tagihan IndiHome 2. Masukkan Nomor Pelanggan 3. Verifikasi 4. Muncul Total Tagihan 5. Pilih Metode Pembayaran','','','',NULL,NULL,NULL,'2026-08-12 11:35:35','2026-08-12 11:35:35'),
(11,'grapari-indihome','2026-08-12','Passed','Minor','','','','','','Berhenti Langganan Sementara','1. Klik Button Hentikan Sementara','','','',NULL,NULL,NULL,'2026-08-12 11:35:47','2026-08-12 11:35:47'),
(12,'grapari-indihome','2026-08-12','Passed','Minor','','','','','','Lanjutkan Langganan','1. Klik Button Lanjutkan Langganan','','','',NULL,NULL,NULL,'2026-08-12 11:36:44','2026-08-12 11:36:44'),
(13,'grapari-indihome','2026-08-11','Passed','Minor','','','','','','Cek Kondisi Jaringan IndiHome','1. Klik button Cek Kondisi Jaringan Saya 2. Jika jaringan masih terkendala, bisa langsung melakukan restart modem 3. Terdapat juga FAQ yang mungkin membantu kendala pelanggan','','','',NULL,NULL,NULL,'2026-08-12 11:37:16','2026-08-12 11:37:16'),
(14,'grapari-mobile','2026-08-12','Passed','Minor','','','','','','Beli Kartu Perdana','1. Klik button \"Beli Kartu Perdana\" 2. Klik button \"Pesan Kartu Perdana\" 2.1 Klik button \"Lacak Pesanan Kartu Perdana\" 2.2 Cek Status Pesanan\" 3. Klik button \"Pesan Kartu Perdana Sekarang\" 4. Pilih Jenis Kartu \"Prabayar / Pascabayar\" 4.1 Pilih, \"Prabayar\" 4.2 Pilih, \"Pascabayar\"','','','',NULL,NULL,NULL,'2026-08-12 11:39:37','2026-08-12 11:39:37'),
(15,'grapari-mobile','2026-08-11','Passed','Minor','','','','','','Beli eSIM Telkomsel','- esim simpati -> pilih paket -> konfirmasi email -> bayar paket -> konfirmasi metode pembayaran -> pembayaran berhasil\n- esim roamax -> cari negara tujuan -> pilih paket -> konfirmasi email -> bayar paket -> konfirmasi metode pembayaran -> pembayaran berhasil\n','','','',NULL,NULL,NULL,'2026-08-12 11:41:27','2026-08-12 11:41:27'),
(16,'grapari-mobile','2026-08-10','Failed','Minor','','','','','','Perbaikan Data Profile','1. Pilih otentikasi, \"Telkomsel / Indihome / Orbit\" 2. Input kode OTP 3. Ubah Data yang diinginkan','','terdapat red box information terkait dengan sedang terkendalanya menu, dan diarahkan ke grapari','propose : takedown menu untuk sementara waktu',NULL,NULL,NULL,'2026-08-12 11:42:19','2026-08-12 11:42:19'),
(17,'grapari-mobile','2026-08-12','Passed','Minor','','','','','','Beralih ke Halo','1. Beralih ke Halo Sekarang 2. Lihat Status Migrasi Anda	','','','',NULL,NULL,NULL,'2026-08-12 11:42:53','2026-08-12 11:42:53'),
(18,'grapari-mobile','2026-08-12','Passed','Minor','','','','','','Cek Nomor 4G Anda','1. Cek Nomor 4G Anda 2. Klik Button \"Cek\" 3. Input Nomor 4. Input Kode OTP 5. Muncul Hasil Diagnosa perangkat	\n','','','',NULL,NULL,NULL,'2026-08-12 11:44:01','2026-08-12 11:44:01'),
(19,'grapari-mobile','2026-08-12','Pending','Minor','','','','','','Lacak Pesanan Kartu','1. Ganti Kartu 1.1 Lacak Peanan Kartu 1.2 Masukkan kode order ID 2. Pembelian Kartu (Prabayar / Halo) 2.1 Lacak Peanan Kartu 2.2 Masukkan kode order ID	\n','','no test data','',NULL,NULL,NULL,'2026-08-12 11:44:51','2026-08-12 11:44:51'),
(20,'grapari-mobile','2026-08-12','Passed','Minor','','','','','','Ganti Kartu/ Migrasi ke 4G','ganti kartu','','temporery closed','',NULL,NULL,NULL,'2026-08-12 11:46:14','2026-08-12 11:46:14'),
(21,'ivr','2026-08-20','Failed','Minor','Telkomsel','081319865318','Prabayar','Reguler','1. Pembelian Paket','','0. Berbicara dengan Officer','0. Berbicara dengan Officer','not ready','',NULL,NULL,NULL,'2026-08-20 12:12:57','2026-08-20 12:12:57'),
(22,'ivr','2026-08-18','Passed','Minor','Telkomsel','081319865318','Prabayar','Reguler','2. Informasi Nomor PUK','','Masukkan NIK KTP > Verified > Informasi Nomor PUK Diterima > Isi Survey (Nilai 1-5) OK','Masukkan NIK KTP > Verified > Informasi Nomor PUK Diterima > Isi Survey (Nilai 1-5) OK','','',NULL,NULL,NULL,'2026-08-20 12:14:08','2026-08-20 12:14:36'),
(23,'ivr','2026-08-16','Failed','Minor','Telkomsel','081319865318','Prabayar','Reguler','3. Informasi Ganti Kartu','','Informasi Ganti Kartu OK > 0. Berbicara dengan Officer','Informasi Ganti Kartu OK > 0. Berbicara dengan Officer','announcement IVR untuk terhubung ke agent  msih bahasa, kemudian info dari agent tidak ada flagging languagenya','',NULL,NULL,NULL,'2026-08-20 12:15:16','2026-08-20 12:15:35'),
(24,'ivr','2026-08-15','Failed','Minor','Telkomsel','081319865318','Prabayar','Reguler','4. Keluhan','','1. Keluhan Tidak Bisa Internet > Refresh Network OK > 0. Berbicara dengan Officer','1. Keluhan Tidak Bisa Internet > Refresh Network OK > 0. Berbicara dengan Officer','announcement IVR untuk terhubung ke agent  msih bahasa, kemudian info dari agent tidak ada flagging languagenya','',NULL,NULL,NULL,'2026-08-20 12:16:59','2026-08-20 12:16:59'),
(25,'ivr','2026-08-20','Failed','Minor','Telkomsel','08111110709','Halo','Priority','0. Berbicara dengan Officer','','0. Berbicara dengan Officer','0. Berbicara dengan Officer','pelanggan priority harusnya direct to agent','',NULL,NULL,NULL,'2026-08-20 14:56:25','2026-08-20 14:56:25'),
(26,'ivr','2026-08-21','Passed','Minor','Telkomsel','081319865318','Prabayar','Reguler','Press 1 Pembelian Paket','','Internet Super Seru > Aktivasi Berhasil','Internet Super Seru > Aktivasi Berhasil','','',NULL,NULL,NULL,'2026-08-21 14:54:37','2026-08-21 14:54:37'),
(27,'ivr','2026-08-20','Passed','Minor','Telkomsel','081319865318','Prabayar','Reguler','Press 1 Pembelian Paket','','Perpanjangan Masa Aktif > Aktivasi Berhasil','Perpanjangan Masa Aktif > Aktivasi Berhasil','','',NULL,NULL,NULL,'2026-08-21 14:55:11','2026-08-21 14:55:11'),
(28,'ivr','2026-08-21','Passed','Minor','Telkomsel','','Prabayar','Reguler','Press 1 Pembelian Paket','','RoaMAX Umroh 10GB 17 Hari > Aktivasi Berhasil','RoaMAX Umroh 10GB 17 Hari > Aktivasi Berhasil','','',NULL,NULL,NULL,'2026-08-21 14:55:31','2026-08-21 14:55:31'),
(29,'ivr','2026-08-21','Passed','Minor','Telkomsel','','Prabayar','Reguler','Press 2 Informasi Nomor PUK','','Masukkan NIK KTP > Verified > Informasi Nomor PUK Diterima','Masukkan NIK KTP > Verified > Informasi Nomor PUK Diterima','','',NULL,NULL,NULL,'2026-08-21 15:01:55','2026-08-21 15:01:55'),
(30,'ivr','2026-08-21','Passed','Minor','Telkomsel','','Prabayar','Reguler','Press 3 Informasi Ganti Kartu','','Informasi Ganti Kartu OK > Press 0 Berbicara dengan Officer','Informasi Ganti Kartu OK > Press 0 Berbicara dengan Officer','','',NULL,NULL,NULL,'2026-08-21 15:09:49','2026-08-21 15:09:49'),
(31,'ivr','2026-08-21','Passed','Minor','Telkomsel','','Prabayar','Reguler','Press 4 Keluhan','','','','','',NULL,NULL,NULL,'2026-08-21 15:39:29','2026-08-21 15:39:29'),
(32,'ivr','2026-08-20','Passed','Minor','Telkomsel','','Prabayar','Reguler','Press 4 Keluhan','','','','','',NULL,NULL,NULL,'2026-08-21 15:39:52','2026-08-21 15:39:52'),
(33,'grapari-mobile','2026-08-31','Passed','Minor','','','','','','Beli Kartu Perdana','Passed, sudah sampai step terakhir untuk payment','','','',NULL,NULL,NULL,'2026-08-31 11:08:39','2026-08-31 11:08:39'),
(34,'grapari-mobile','2026-08-31','Passed','Minor','','','','','','Beli eSIM Telkomsel','Berhasil sampai step akhir payment','','','',NULL,NULL,NULL,'2026-08-31 11:11:05','2026-08-31 11:11:05'),
(35,'grapari-mobile','2026-08-31','Passed','Minor','','','','','','Cek & Bayar Tagihan Halo','pengecekan dilakukan dengan nomor Halo yang sudah bayar tagihan','','','',NULL,NULL,NULL,'2026-08-31 11:14:12','2026-08-31 11:14:12'),
(36,'grapari-mobile','2026-08-31','Failed','Minor','','','','','','Perbaikan Data Profile','sudah otentikasi','','Masih terdapat informasi di redbox bahwa perbaikan data profil hanya dapat dilakukan di GraPARI.','Apabila perbaikan profil tidak bisa dilakukan melalui GraPARI Online (GoL), sebaiknya menu tersebut di take down terlebih dahulu agar tidak terjadi miss leading pelanggan.',NULL,NULL,NULL,'2026-08-31 11:20:58','2026-08-31 11:20:58'),
(37,'grapari-mobile','2026-08-31','Passed','Minor','','','','','','Beralih ke Halo','sudah sesuai sampai step terakhir','','','',NULL,NULL,NULL,'2026-08-31 11:25:54','2026-08-31 11:25:54'),
(38,'grapari-mobile','2026-08-31','Pending','Minor','','','','','','Lacak Pesanan Kartu','tidak ada sampel nomor untuk pelacakan nomor pembelian','','','',NULL,NULL,NULL,'2026-08-31 11:26:43','2026-08-31 11:26:43'),
(39,'grapari-mobile','2026-08-31','Passed','Minor','','','','','','Ganti Kartu/ Migrasi ke 4G','temporary closed','','','',NULL,NULL,NULL,'2026-08-31 11:27:59','2026-08-31 11:27:59'),
(40,'grapari-indihome','2026-08-31','Passed','Minor','','','','','','Pasang Baru','sudah berhasil sampai step terakhir, TA sudah konfirmasi pemasangan','','','',NULL,NULL,NULL,'2026-08-31 11:39:08','2026-08-31 11:39:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
