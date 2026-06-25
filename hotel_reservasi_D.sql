-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_reservasi
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '115da410-3480-11f1-8c79-fc5cee85339b:1-788';

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `nama_tabel` varchar(50) NOT NULL,
  `operasi` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `id_record` varchar(20) NOT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  `waktu_log` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_in`
--

DROP TABLE IF EXISTS `check_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_in` (
  `id_checkin` varchar(7) NOT NULL,
  `waktu_checkin` datetime NOT NULL,
  `id_reservasi` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  PRIMARY KEY (`id_checkin`),
  UNIQUE KEY `uq_checkin_reservasi` (`id_reservasi`),
  KEY `fk_checkin_pegawai` (`id_pegawai`),
  CONSTRAINT `fk_checkin_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  CONSTRAINT `fk_checkin_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_in`
--

LOCK TABLES `check_in` WRITE;
/*!40000 ALTER TABLE `check_in` DISABLE KEYS */;
INSERT INTO `check_in` VALUES ('CI001','2026-06-05 13:00:00','R001','P001'),('CI002','2026-06-06 14:00:00','R002','P002'),('CI003','2026-06-10 13:15:00','R003','P001'),('CI004','2026-06-11 14:20:00','R004','P003'),('CI005','2026-06-15 13:30:00','R005','P004'),('CI006','2026-06-20 14:00:00','R006','P002'),('CI007','2026-06-25 14:30:00','R007','P001'),('CI008','2026-06-28 15:00:00','R008','P002'),('CI009','2026-07-01 15:30:00','R009','P001'),('CI010','2026-07-05 16:00:00','R010','P003'),('CI011','2026-07-08 16:30:00','R011','P004'),('CI012','2026-07-11 17:00:00','R012','P002'),('CI013','2026-07-14 17:30:00','R013','P001'),('CI014','2026-07-17 18:00:00','R014','P002'),('CI015','2026-07-20 18:30:00','R015','P001'),('CI016','2026-07-23 19:00:00','R016','P003'),('CI017','2026-07-26 19:30:00','R017','P004'),('CI018','2026-07-29 20:00:00','R018','P002'),('CI019','2026-08-01 20:30:00','R019','P001'),('CI020','2026-08-05 21:00:00','R020','P002');
/*!40000 ALTER TABLE `check_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_out`
--

DROP TABLE IF EXISTS `check_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_out` (
  `id_checkout` varchar(7) NOT NULL,
  `waktu_checkout` datetime NOT NULL,
  `id_reservasi` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  PRIMARY KEY (`id_checkout`),
  UNIQUE KEY `uq_checkout_reservasi` (`id_reservasi`),
  KEY `fk_checkout_pegawai` (`id_pegawai`),
  CONSTRAINT `fk_checkout_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  CONSTRAINT `fk_checkout_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_out`
--

LOCK TABLES `check_out` WRITE;
/*!40000 ALTER TABLE `check_out` DISABLE KEYS */;
INSERT INTO `check_out` VALUES ('CO001','2026-06-07 11:00:00','R001','P001'),('CO002','2026-06-08 11:30:00','R002','P002'),('CO003','2026-06-12 11:00:00','R003','P001'),('CO004','2026-06-13 11:15:00','R004','P003'),('CO005','2026-06-17 11:00:00','R005','P004'),('CO006','2026-06-22 11:00:00','R006','P002'),('CO007','2026-06-27 11:00:00','R007','P001'),('CO008','2026-06-30 11:00:00','R008','P002'),('CO009','2026-07-03 11:00:00','R009','P001'),('CO010','2026-07-07 11:00:00','R010','P003'),('CO011','2026-07-10 11:00:00','R011','P004'),('CO012','2026-07-13 11:00:00','R012','P002'),('CO013','2026-07-16 11:00:00','R013','P001'),('CO014','2026-07-19 11:00:00','R014','P002'),('CO015','2026-07-22 11:00:00','R015','P001'),('CO016','2026-07-25 11:00:00','R016','P003'),('CO017','2026-07-28 11:00:00','R017','P004'),('CO018','2026-07-31 11:00:00','R018','P002'),('CO019','2026-08-03 11:00:00','R019','P001'),('CO020','2026-08-07 11:00:00','R020','P002');
/*!40000 ALTER TABLE `check_out` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_checkout_update_kamar` AFTER INSERT ON `check_out` FOR EACH ROW BEGIN
    DECLARE v_id_kamar VARCHAR(5);
    DECLARE v_nama_tamu VARCHAR(100);
 
    -- Ambil id_kamar dari reservasi terkait
    SELECT r.id_kamar, tm.nama_tamu
    INTO   v_id_kamar, v_nama_tamu
    FROM   reservasi r
    JOIN   tamu tm ON r.id_tamu = tm.id_tamu
    WHERE  r.id_reservasi = NEW.id_reservasi;
 
    -- Update status kamar menjadi Tersedia
    UPDATE kamar
    SET    status_kamar = 'Tersedia'
    WHERE  id_kamar = v_id_kamar;
 
    -- Update status reservasi menjadi Selesai
    UPDATE reservasi
    SET    status_reservasi = 'Selesai'
    WHERE  id_reservasi = NEW.id_reservasi;
 
    -- Catat ke audit_log
    INSERT INTO audit_log (nama_tabel, operasi, id_record, keterangan)
    VALUES (
        'check_out',
        'INSERT',
        NEW.id_checkout,
        CONCAT(
            'Check-out ', NEW.id_checkout,
            ' | Reservasi: ', NEW.id_reservasi,
            ' | Tamu: ', v_nama_tamu,
            ' | Kamar ', v_id_kamar, ' -> Tersedia',
            ' | Waktu: ', NEW.waktu_checkout
        )
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fasilitas`
--

DROP TABLE IF EXISTS `fasilitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fasilitas` (
  `id_fasilitas` varchar(5) NOT NULL,
  `nama_fasilitas` varchar(100) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `deskripsi_fasilitas` varchar(200) DEFAULT NULL,
  `biaya` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_fasilitas`),
  UNIQUE KEY `uq_nama_fasilitas` (`nama_fasilitas`),
  CONSTRAINT `fasilitas_chk_1` CHECK ((`biaya` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fasilitas`
--

LOCK TABLES `fasilitas` WRITE;
/*!40000 ALTER TABLE `fasilitas` DISABLE KEYS */;
INSERT INTO `fasilitas` VALUES ('F001','WiFi','Internet','Akses internet gratis',0.00),('F002','Breakfast','Makanan','Sarapan pagi prasmanan',50000.00),('F003','Kolam Renang','Rekreasi','Akses kolam renang outdoor',0.00),('F004','Gym','Olahraga','Akses pusat kebugaran',0.00),('F005','Laundry','Layanan','Jasa cuci & setrika baju',30000.00);
/*!40000 ALTER TABLE `fasilitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kamar`
--

DROP TABLE IF EXISTS `kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kamar` (
  `id_kamar` varchar(5) NOT NULL,
  `nomor_kamar` varchar(10) NOT NULL,
  `lantai` tinyint NOT NULL,
  `status_kamar` enum('Tersedia','Terisi','Dipesan','Maintenance') NOT NULL DEFAULT 'Tersedia',
  `id_tipe` varchar(5) NOT NULL,
  PRIMARY KEY (`id_kamar`),
  KEY `idx_kamar_tipe` (`id_tipe`),
  CONSTRAINT `fk_kamar_tipe` FOREIGN KEY (`id_tipe`) REFERENCES `tipe_kamar` (`id_tipe`),
  CONSTRAINT `kamar_chk_1` CHECK ((`lantai` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kamar`
--

LOCK TABLES `kamar` WRITE;
/*!40000 ALTER TABLE `kamar` DISABLE KEYS */;
INSERT INTO `kamar` VALUES ('K001','101',1,'Terisi','T001'),('K002','102',1,'Terisi','T001'),('K003','103',1,'Dipesan','T001'),('K004','201',2,'Terisi','T002'),('K005','202',2,'Terisi','T002'),('K006','203',2,'Dipesan','T002'),('K007','301',3,'Terisi','T003'),('K008','302',3,'Dipesan','T003'),('K009','401',4,'Terisi','T004'),('K010','501',5,'Dipesan','T005'),('K017','509',5,'Terisi','T005'),('K024','123',1,'Terisi','T001'),('K031','456',4,'Terisi','T004'),('K038','222',2,'Terisi','T002'),('K045','104',1,'Dipesan','T001'),('K052','105',1,'Terisi','T001'),('K059','106',1,'Dipesan','T001'),('K066','306',3,'Dipesan','T003'),('K073','506',5,'Dipesan','T005'),('K080','408',4,'Dipesan','T004');
/*!40000 ALTER TABLE `kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pegawai` (
  `id_pegawai` varchar(5) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES ('P001','Ahmad Fauzi','Resepsionis','081300000001'),('P002','Yuni Astuti','Resepsionis','081300000002'),('P003','Dedi Saputra','Supervisor','081300000003'),('P004','Rika Maharani','Front Office','081300000004');
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(7) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `jumlah_bayar` decimal(12,2) NOT NULL,
  `metode_bayar` enum('Transfer','QRIS','Cash','Kartu Kredit') NOT NULL,
  `status_bayar` enum('Lunas','Pending','Gagal','Refund') NOT NULL DEFAULT 'Pending',
  `referensi` varchar(20) DEFAULT NULL,
  `id_reservasi` varchar(5) NOT NULL,
  PRIMARY KEY (`id_pembayaran`),
  UNIQUE KEY `uq_pembayaran_reservasi` (`id_reservasi`),
  CONSTRAINT `fk_pembayaran_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`),
  CONSTRAINT `pembayaran_chk_1` CHECK ((`jumlah_bayar` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
INSERT INTO `pembayaran` VALUES ('PB001','2026-06-01',700000.00,'Transfer','Lunas','TRF001','R001'),('PB002','2026-06-02',1100000.00,'QRIS','Lunas','QR001','R002'),('PB003','2026-06-03',1400000.00,'Transfer','Lunas','TRF003','R003'),('PB004','2026-06-04',700000.00,'Cash','Lunas','CASH004','R004'),('PB005','2026-06-05',1900000.00,'Transfer','Lunas','TRF005','R005'),('PB006','2026-06-06',1100000.00,'QRIS','Lunas','QR006','R006'),('PB007','2026-06-07',550000.00,'Transfer','Lunas','TRF007','R007'),('PB008','2026-06-08',700000.00,'Transfer','Lunas','TRF008','R008'),('PB009','2026-06-09',350000.00,'Cash','Lunas','CASH009','R009'),('PB010','2026-06-10',1500000.00,'Transfer','Lunas','TRF010','R010'),('PB011','2026-06-11',700000.00,'Transfer','Lunas','TRF011','R011'),('PB012','2026-06-12',1100000.00,'QRIS','Lunas','QR012','R012'),('PB013','2026-06-13',1400000.00,'Transfer','Lunas','TRF013','R013'),('PB014','2026-06-14',700000.00,'Cash','Lunas','CASH014','R014'),('PB015','2026-06-15',1900000.00,'Transfer','Lunas','TRF015','R015'),('PB016','2026-06-16',1100000.00,'QRIS','Lunas','QR016','R016'),('PB017','2026-06-17',1100000.00,'Transfer','Lunas','TRF017','R017'),('PB018','2026-06-18',1400000.00,'Transfer','Lunas','TRF018','R018'),('PB019','2026-06-19',700000.00,'Cash','Lunas','CASH019','R019'),('PB020','2026-06-20',3000000.00,'Transfer','Lunas','TRF020','R020');
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservasi`
--

DROP TABLE IF EXISTS `reservasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservasi` (
  `id_reservasi` varchar(5) NOT NULL,
  `tanggal_pesan` date NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `jumlah_tamu` tinyint NOT NULL,
  `status_reservasi` enum('Dipesan','Check-In','Selesai','Batal') NOT NULL DEFAULT 'Dipesan',
  `id_tamu` varchar(7) NOT NULL,
  `id_kamar` varchar(5) NOT NULL,
  PRIMARY KEY (`id_reservasi`),
  KEY `fk_reservasi_tamu` (`id_tamu`),
  KEY `fk_reservasi_kamar` (`id_kamar`),
  CONSTRAINT `fk_reservasi_kamar` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`),
  CONSTRAINT `fk_reservasi_tamu` FOREIGN KEY (`id_tamu`) REFERENCES `tamu` (`id_tamu`),
  CONSTRAINT `chk_tanggal_reservasi` CHECK ((`check_out` > `check_in`)),
  CONSTRAINT `reservasi_chk_1` CHECK ((`jumlah_tamu` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservasi`
--

LOCK TABLES `reservasi` WRITE;
/*!40000 ALTER TABLE `reservasi` DISABLE KEYS */;
INSERT INTO `reservasi` VALUES ('R001','2026-06-01','2026-06-05','2026-06-07',2,'Selesai','TM001','K001'),('R002','2026-06-02','2026-06-06','2026-06-08',2,'Selesai','TM002','K004'),('R003','2026-06-03','2026-06-10','2026-06-12',3,'Selesai','TM003','K007'),('R004','2026-06-04','2026-06-11','2026-06-13',2,'Selesai','TM004','K002'),('R005','2026-06-05','2026-06-15','2026-06-17',4,'Selesai','TM005','K009'),('R006','2026-06-06','2026-06-20','2026-06-22',2,'Selesai','TM006','K005'),('R007','2026-06-07','2026-06-25','2026-06-27',2,'Dipesan','TM007','K006'),('R008','2026-06-08','2026-06-28','2026-06-30',3,'Dipesan','TM008','K008'),('R009','2026-06-09','2026-07-01','2026-07-03',2,'Dipesan','TM009','K003'),('R010','2026-06-10','2026-07-05','2026-07-07',4,'Dipesan','TM010','K010'),('R011','2026-06-11','2026-07-08','2026-07-10',2,'Selesai','TM011','K017'),('R012','2026-06-12','2026-07-11','2026-07-13',2,'Selesai','TM012','K024'),('R013','2026-06-13','2026-07-14','2026-07-16',3,'Selesai','TM013','K031'),('R014','2026-06-14','2026-07-17','2026-07-19',2,'Selesai','TM014','K038'),('R015','2026-06-15','2026-07-20','2026-07-22',4,'Selesai','TM015','K045'),('R016','2026-06-16','2026-07-23','2026-07-25',2,'Selesai','TM016','K052'),('R017','2026-06-17','2026-07-26','2026-07-28',2,'Dipesan','TM017','K059'),('R018','2026-06-18','2026-07-29','2026-07-31',3,'Dipesan','TM018','K066'),('R019','2026-06-19','2026-08-01','2026-08-03',2,'Dipesan','TM019','K073'),('R020','2026-06-20','2026-08-05','2026-08-07',4,'Selesai','TM020','K080'),('R021','2026-06-25','2026-09-01','2026-09-04',2,'Dipesan','TM003','K045');
/*!40000 ALTER TABLE `reservasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamu`
--

DROP TABLE IF EXISTS `tamu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tamu` (
  `id_tamu` varchar(7) NOT NULL,
  `nama_tamu` varchar(100) NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `jenis_identitas` enum('KTP','SIM','Passport') NOT NULL DEFAULT 'KTP',
  `no_identitas` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tamu`),
  UNIQUE KEY `uq_tamu_identitas` (`jenis_identitas`,`no_identitas`),
  UNIQUE KEY `uq_tamu_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamu`
--

LOCK TABLES `tamu` WRITE;
/*!40000 ALTER TABLE `tamu` DISABLE KEYS */;
INSERT INTO `tamu` VALUES ('TM001','Budi Santoso','Jakarta','081234567801','budi@gmail.com','KTP','3171111111111110'),('TM002','Siti Aminah','Bandung','081234567802','siti@gmail.com','KTP','3272222222222220'),('TM003','Andi Wijaya','Semarang','081234567803','andi@gmail.com','KTP','3373333333333330'),('TM004','Rina Putri','Yogyakarta','081234567804','rina@gmail.com','KTP','3474444444444440'),('TM005','Dimas Pratama','Surabaya','081234567805','dimas@gmail.com','KTP','3575555555555550'),('TM006','Dewi Lestari','Solo','081234567806','dewi@gmail.com','KTP','3376666666666660'),('TM007','Fajar Nugroho','Malang','081234567807','fajar@gmail.com','KTP','3577777777777770'),('TM008','Maya Sari','Bogor','081234567808','maya@gmail.com','KTP','3278888888888880'),('TM009','Rizki Akbar','Bekasi','081234567809','rizki@gmail.com','KTP','3179999999999990'),('TM010','Nanda Putri','Purwokerto','081234567810','nanda@gmail.com','KTP','3300000000000000'),('TM011','Hendra Kusuma','Medan','081234567811','hendra@gmail.com','KTP','1271111111111110'),('TM012','Laila Fitriani','Palembang','081234567812','laila@gmail.com','KTP','1672222222222220'),('TM013','Yusuf Maulana','Makassar','081234567813','yusuf@gmail.com','KTP','7373333333333330'),('TM014','Putri Ayu','Denpasar','081234567814','putri@gmail.com','KTP','5174444444444440'),('TM015','Galih Saputra','Pekanbaru','081234567815','galih@gmail.com','KTP','1475555555555550'),('TM016','Anisa Rahma','Padang','081234567816','anisa@gmail.com','KTP','1376666666666660'),('TM017','Reza Pratama','Balikpapan','081234567817','reza@gmail.com','SIM','6477777777777770'),('TM018','Cindy Oktavia','Banjarmasin','081234567818','cindy@gmail.com','KTP','6378888888888880'),('TM019','Farhan Akbar','Manado','081234567819','farhan@gmail.com','KTP','7179999999999990'),('TM020','Salsabila Putri','Pontianak','081234567820','salsa@gmail.com','KTP','6100000000000000');
/*!40000 ALTER TABLE `tamu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipe_kamar`
--

DROP TABLE IF EXISTS `tipe_kamar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipe_kamar` (
  `id_tipe` varchar(5) NOT NULL,
  `nama_tipe` varchar(50) NOT NULL,
  `kapasitas` tinyint NOT NULL,
  `deskripsi_tipe` varchar(200) DEFAULT NULL,
  `harga_dasar` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_tipe`),
  UNIQUE KEY `uq_nama_tipe` (`nama_tipe`),
  CONSTRAINT `tipe_kamar_chk_1` CHECK ((`kapasitas` > 0)),
  CONSTRAINT `tipe_kamar_chk_2` CHECK ((`harga_dasar` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipe_kamar`
--

LOCK TABLES `tipe_kamar` WRITE;
/*!40000 ALTER TABLE `tipe_kamar` DISABLE KEYS */;
INSERT INTO `tipe_kamar` VALUES ('T001','Standard',2,'Kamar standar dengan fasilitas dasar',350000.00),('T002','Deluxe',2,'Kamar deluxe dengan pemandangan kota',550000.00),('T003','Superior',3,'Kamar superior luas untuk 3 tamu',700000.00),('T004','Family',4,'Kamar keluarga dengan 2 tempat tidur',950000.00),('T005','Suite',4,'Kamar suite mewah dengan ruang tamu',1500000.00);
/*!40000 ALTER TABLE `tipe_kamar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulasan`
--

DROP TABLE IF EXISTS `ulasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulasan` (
  `id_ulasan` varchar(5) NOT NULL,
  `tanggal_ulasan` date NOT NULL,
  `rating` tinyint NOT NULL,
  `komentar` varchar(500) DEFAULT NULL,
  `id_reservasi` varchar(5) NOT NULL,
  PRIMARY KEY (`id_ulasan`),
  UNIQUE KEY `uq_ulasan_reservasi` (`id_reservasi`),
  CONSTRAINT `fk_ulasan_reservasi` FOREIGN KEY (`id_reservasi`) REFERENCES `reservasi` (`id_reservasi`),
  CONSTRAINT `ulasan_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulasan`
--

LOCK TABLES `ulasan` WRITE;
/*!40000 ALTER TABLE `ulasan` DISABLE KEYS */;
INSERT INTO `ulasan` VALUES ('U001','2026-06-07',5,'Sangat puas, kamar bersih dan nyaman','R001'),('U002','2026-06-08',4,'Kamar nyaman, pelayanan ramah','R002'),('U003','2026-06-12',5,'Fasilitas lengkap, pasti balik lagi','R003'),('U004','2026-06-13',4,'Pelayanan baik, lokasi strategis','R004'),('U005','2026-06-17',5,'Cocok untuk keluarga, anak-anak senang','R005'),('U006','2026-06-22',4,'Bersih dan rapi, sarapan enak','R006'),('U007','2026-06-27',4,'Sangat puas dengan fasilitas gym','R007'),('U008','2026-06-30',5,'Kamar nyaman dan luas','R008'),('U009','2026-07-03',4,'Fasilitas lengkap, WiFi kencang','R009'),('U010','2026-07-07',5,'Pelayanan terbaik, kamar mewah','R010'),('U011','2026-07-10',4,'Cocok untuk keluarga, kolam renang bagus','R011'),('U012','2026-07-13',4,'Bersih dan rapi, harga terjangkau','R012'),('U013','2026-07-16',5,'Sangat puas, akan merekomendasikan','R013'),('U014','2026-07-19',4,'Kamar nyaman, dekat pusat kota','R014'),('U015','2026-07-22',5,'Fasilitas lengkap dan modern','R015'),('U016','2026-07-25',4,'Pelayanan baik dan profesional','R016'),('U017','2026-07-28',3,'Cukup hemat untuk budget traveler','R017'),('U018','2026-07-31',3,'Harga murah, fasilitas standar','R018'),('U019','2026-08-03',4,'Bagus dan nyaman untuk pasangan','R019'),('U020','2026-08-07',5,'Sangat rapi, layanan prima','R020');
/*!40000 ALTER TABLE `ulasan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_reservasi_lengkap`
--

DROP TABLE IF EXISTS `v_reservasi_lengkap`;
/*!50001 DROP VIEW IF EXISTS `v_reservasi_lengkap`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_reservasi_lengkap` AS SELECT 
 1 AS `id_reservasi`,
 1 AS `tanggal_pesan`,
 1 AS `check_in`,
 1 AS `check_out`,
 1 AS `lama_menginap`,
 1 AS `jumlah_tamu`,
 1 AS `status_reservasi`,
 1 AS `id_tamu`,
 1 AS `nama_tamu`,
 1 AS `hp_tamu`,
 1 AS `email_tamu`,
 1 AS `nomor_kamar`,
 1 AS `lantai`,
 1 AS `nama_tipe`,
 1 AS `kapasitas`,
 1 AS `harga_dasar`,
 1 AS `id_pembayaran`,
 1 AS `jumlah_bayar`,
 1 AS `metode_bayar`,
 1 AS `status_bayar`,
 1 AS `tagihan_normal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_statistik_kamar`
--

DROP TABLE IF EXISTS `v_statistik_kamar`;
/*!50001 DROP VIEW IF EXISTS `v_statistik_kamar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_statistik_kamar` AS SELECT 
 1 AS `id_tipe`,
 1 AS `nama_tipe`,
 1 AS `kapasitas`,
 1 AS `harga_dasar`,
 1 AS `total_reservasi`,
 1 AS `total_pendapatan`,
 1 AS `rata_pendapatan_per_res`,
 1 AS `rata_rating`,
 1 AS `jumlah_ulasan`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'hotel_reservasi'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_hitung_total_tagihan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_hitung_total_tagihan`(p_id_reservasi VARCHAR(5)) RETURNS decimal(12,2)
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE v_harga_dasar DECIMAL(12,2);
    DECLARE v_lama INT;
    DECLARE v_total DECIMAL(12,2);

    SELECT
        t.harga_dasar,
        DATEDIFF(r.check_out, r.check_in)
    INTO v_harga_dasar, v_lama
    FROM reservasi r
    JOIN kamar k ON r.id_kamar = k.id_kamar
    JOIN tipe_kamar t ON k.id_tipe = t.id_tipe
    WHERE r.id_reservasi = p_id_reservasi;

    SET v_total = v_lama * v_harga_dasar;

    RETURN v_total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_buat_reservasi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_buat_reservasi`(
    IN p_id_reservasi VARCHAR(5),
    IN p_id_tamu VARCHAR(7),
    IN p_id_kamar VARCHAR(5),
    IN p_check_in DATE,
    IN p_check_out DATE,
    IN p_jumlah_tamu TINYINT
)
BEGIN
    -- Insert reservasi baru
    INSERT INTO reservasi
        (id_reservasi, tanggal_pesan, check_in, check_out,
         jumlah_tamu, status_reservasi, id_tamu, id_kamar)
    VALUES
        (p_id_reservasi, CURDATE(), p_check_in, p_check_out,
         p_jumlah_tamu, 'Dipesan', p_id_tamu, p_id_kamar);

    -- Update status kamar menjadi Dipesan
    UPDATE kamar -- Mengupdate tabel
    SET status_kamar = 'Dipesan' -- Mengubah status kamar setelah ada yang reservasi
    WHERE id_kamar = p_id_kamar; -- Hanya kamar yang dipilih

    SELECT CONCAT('Reservasi ', p_id_reservasi, ' berhasil dibuat.') AS hasil; -- CONCAT untuk menggabungkan teks (Reservasi R021 berhasil dibuat)
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_reservasi_lengkap`
--

/*!50001 DROP VIEW IF EXISTS `v_reservasi_lengkap`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_reservasi_lengkap` AS select `r`.`id_reservasi` AS `id_reservasi`,`r`.`tanggal_pesan` AS `tanggal_pesan`,`r`.`check_in` AS `check_in`,`r`.`check_out` AS `check_out`,(to_days(`r`.`check_out`) - to_days(`r`.`check_in`)) AS `lama_menginap`,`r`.`jumlah_tamu` AS `jumlah_tamu`,`r`.`status_reservasi` AS `status_reservasi`,`tm`.`id_tamu` AS `id_tamu`,`tm`.`nama_tamu` AS `nama_tamu`,`tm`.`no_hp` AS `hp_tamu`,`tm`.`email` AS `email_tamu`,`k`.`nomor_kamar` AS `nomor_kamar`,`k`.`lantai` AS `lantai`,`t`.`nama_tipe` AS `nama_tipe`,`t`.`kapasitas` AS `kapasitas`,`t`.`harga_dasar` AS `harga_dasar`,`pb`.`id_pembayaran` AS `id_pembayaran`,`pb`.`jumlah_bayar` AS `jumlah_bayar`,`pb`.`metode_bayar` AS `metode_bayar`,`pb`.`status_bayar` AS `status_bayar`,((to_days(`r`.`check_out`) - to_days(`r`.`check_in`)) * `t`.`harga_dasar`) AS `tagihan_normal` from ((((`reservasi` `r` join `tamu` `tm` on((`r`.`id_tamu` = `tm`.`id_tamu`))) join `kamar` `k` on((`r`.`id_kamar` = `k`.`id_kamar`))) join `tipe_kamar` `t` on((`k`.`id_tipe` = `t`.`id_tipe`))) left join `pembayaran` `pb` on((`r`.`id_reservasi` = `pb`.`id_reservasi`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_statistik_kamar`
--

/*!50001 DROP VIEW IF EXISTS `v_statistik_kamar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_statistik_kamar` AS select `t`.`id_tipe` AS `id_tipe`,`t`.`nama_tipe` AS `nama_tipe`,`t`.`kapasitas` AS `kapasitas`,`t`.`harga_dasar` AS `harga_dasar`,count(distinct `r`.`id_reservasi`) AS `total_reservasi`,sum(`pb`.`jumlah_bayar`) AS `total_pendapatan`,round(avg(`pb`.`jumlah_bayar`),0) AS `rata_pendapatan_per_res`,round(avg(`u`.`rating`),2) AS `rata_rating`,count(distinct `u`.`id_ulasan`) AS `jumlah_ulasan` from ((((`tipe_kamar` `t` left join `kamar` `k` on((`t`.`id_tipe` = `k`.`id_tipe`))) left join `reservasi` `r` on((`k`.`id_kamar` = `r`.`id_kamar`))) left join `pembayaran` `pb` on((`r`.`id_reservasi` = `pb`.`id_reservasi`))) left join `ulasan` `u` on((`r`.`id_reservasi` = `u`.`id_reservasi`))) group by `t`.`id_tipe`,`t`.`nama_tipe`,`t`.`kapasitas`,`t`.`harga_dasar` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-25 13:13:08
