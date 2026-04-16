-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: nicholascapetau.mysql.pythonanywhere-services.com    Database: nicholascapetau$elearning
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `post_id` int NOT NULL,
  `author_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'seperti ini',1,2,'2025-05-20 14:40:00'),(2,'baik pak, terima kasih',1,4,'2025-05-21 01:08:16'),(3,'jadi seperti ini\r\n',2,2,'2025-05-21 01:40:48'),(4,'kalo kayak gini gimana\r\n',2,3,'2025-06-09 04:30:53');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosen`
--

DROP TABLE IF EXISTS `dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dosen` (
  `id_dosen` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nip` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `departemen` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id_dosen`),
  UNIQUE KEY `nip` (`nip`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES (1,'Monica','000000','monikaja@gmail.com','None',2),(2,'Ananda Zahra','12345678','ananda@mail.com','PWK',6),(4,'blue','2302','bluettercup@gmail.com','Pertanian',8);
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasil_kuis`
--

DROP TABLE IF EXISTS `hasil_kuis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasil_kuis` (
  `id_hasil` int NOT NULL AUTO_INCREMENT,
  `id_kuis` int NOT NULL,
  `NIM` int NOT NULL,
  `nilai_total` decimal(5,2) DEFAULT NULL,
  `waktu_mulai` datetime DEFAULT NULL,
  `waktu_selesai` datetime DEFAULT NULL,
  `status` enum('sedang_dikerjakan','selesai','belum_dinilai','sudah_dinilai') COLLATE utf8mb4_general_ci DEFAULT 'sedang_dikerjakan',
  PRIMARY KEY (`id_hasil`),
  KEY `id_kuis` (`id_kuis`),
  KEY `id_mahasiswa` (`NIM`),
  CONSTRAINT `hasil_kuis_ibfk_1` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`) ON DELETE CASCADE,
  CONSTRAINT `hasil_kuis_ibfk_2` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasil_kuis`
--

LOCK TABLES `hasil_kuis` WRITE;
/*!40000 ALTER TABLE `hasil_kuis` DISABLE KEYS */;
INSERT INTO `hasil_kuis` VALUES (29,18,652319,90.00,'2025-06-08 21:39:26','2025-06-08 21:39:26','sudah_dinilai'),(30,20,652319,0.00,'2025-06-08 16:45:18','2025-06-08 16:45:18','sudah_dinilai'),(31,19,652319,NULL,'2025-06-09 04:30:28','2025-06-09 04:30:28','belum_dinilai'),(32,19,2147483647,NULL,'2025-06-09 08:07:51','2025-06-09 08:07:51','belum_dinilai'),(33,18,2147483647,NULL,'2025-06-09 08:08:45','2025-06-09 08:08:45','belum_dinilai');
/*!40000 ALTER TABLE `hasil_kuis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jawaban_mahasiswa`
--

DROP TABLE IF EXISTS `jawaban_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jawaban_mahasiswa` (
  `id_jawaban` int NOT NULL AUTO_INCREMENT,
  `id_pertanyaan` int NOT NULL,
  `id_mahasiswa` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Diisi dengan NIM Mahasiswa',
  `id_pilihan` int DEFAULT NULL COMMENT 'Diisi HANYA jika soal Pilihan Ganda',
  `jawaban_teks` text COLLATE utf8mb4_general_ci COMMENT 'Diisi HANYA jika soal Esai',
  `nilai` float DEFAULT NULL,
  `waktu_menjawab` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jawaban`),
  KEY `id_pertanyaan` (`id_pertanyaan`),
  KEY `id_mahasiswa` (`id_mahasiswa`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jawaban_mahasiswa`
--

LOCK TABLES `jawaban_mahasiswa` WRITE;
/*!40000 ALTER TABLE `jawaban_mahasiswa` DISABLE KEYS */;
INSERT INTO `jawaban_mahasiswa` VALUES (22,18,'652319',NULL,'plis',90,'2025-06-08 14:39:26'),(23,19,'652319',NULL,'bisa',80,'2025-06-08 14:39:26'),(24,26,'652319',13,NULL,100,'2025-06-08 14:39:26'),(25,28,'652319',NULL,NULL,0,'2025-06-08 16:45:18'),(26,27,'652319',NULL,'halo nikolas adiputra, semangat kuliah anjay bisa yuk bisa pasti bisa kok kuliahnya',NULL,'2025-06-09 04:30:28'),(27,27,'2147483647',NULL,'foto kluarga aja lah',NULL,'2025-06-09 08:07:51'),(28,18,'2147483647',NULL,'saya jg capek',NULL,'2025-06-09 08:08:45'),(29,19,'2147483647',NULL,'coba lgi pantang menyerahhh',NULL,'2025-06-09 08:08:45'),(30,26,'2147483647',13,NULL,100,'2025-06-09 08:08:45');
/*!40000 ALTER TABLE `jawaban_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas` (
  `id_kelas` int NOT NULL AUTO_INCREMENT,
  `id_dosen` int NOT NULL,
  `nama_kelas` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `kode_matkul` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_ajaran` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_kelas`),
  KEY `id_dosen` (`id_dosen`),
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (1,1,'Manajemen Data Informasi Lanjut','MDIL-01','Genap 2024/2025'),(2,1,'Data Warehouse','DWH-01','Genap 2024/2025');
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas_mahasiswa`
--

DROP TABLE IF EXISTS `kelas_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas_mahasiswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_kelas` int NOT NULL,
  `NIM` int NOT NULL,
  `tanggal_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_general_ci DEFAULT 'aktif',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_kelas_mahasiswa` (`id_kelas`,`NIM`),
  KEY `idx_kelas` (`id_kelas`),
  KEY `idx_nim` (`NIM`),
  CONSTRAINT `kelas_mahasiswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  CONSTRAINT `kelas_mahasiswa_ibfk_2` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas_mahasiswa`
--

LOCK TABLES `kelas_mahasiswa` WRITE;
/*!40000 ALTER TABLE `kelas_mahasiswa` DISABLE KEYS */;
INSERT INTO `kelas_mahasiswa` VALUES (1,1,652319,'2025-05-25 12:05:28','aktif'),(3,2,652319,'2025-06-09 07:21:52','aktif');
/*!40000 ALTER TABLE `kelas_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kuis`
--

DROP TABLE IF EXISTS `kuis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kuis` (
  `id_kuis` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_dosen` int NOT NULL,
  `tanggal_dibuat` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('aktif','nonaktif') COLLATE utf8mb4_general_ci DEFAULT 'aktif',
  `durasi` int DEFAULT '60',
  PRIMARY KEY (`id_kuis`),
  KEY `id_dosen` (`id_dosen`),
  CONSTRAINT `kuis_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kuis`
--

LOCK TABLES `kuis` WRITE;
/*!40000 ALTER TABLE `kuis` DISABLE KEYS */;
INSERT INTO `kuis` VALUES (18,'plis',1,'2025-06-08 16:43:48','aktif',30),(19,'kuis lagi',1,'2025-06-08 22:03:29','aktif',30),(20,'Pemrograman Dasar',1,'2025-06-08 16:42:47','aktif',30);
/*!40000 ALTER TABLE `kuis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_class`
--

DROP TABLE IF EXISTS `live_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `live_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_kelas` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_time` datetime NOT NULL,
  `duration` int NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `link` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_dosen` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `live_class_ibfk_1` (`id_kelas`),
  KEY `live_class_ibfk_2` (`id_dosen`),
  CONSTRAINT `live_class_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  CONSTRAINT `live_class_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_class`
--

LOCK TABLES `live_class` WRITE;
/*!40000 ALTER TABLE `live_class` DISABLE KEYS */;
INSERT INTO `live_class` VALUES (17,2,'Materi bab 3','2025-06-04 10:25:00',60,NULL,'https://us04web.zoom.us/j/74677373577?pwd=26XZJObDMXnGsoSzQ8JN9m8bOfY34V.1','2025-06-04 02:25:42',1),(18,2,'kelas 10','2025-06-08 14:30:00',60,NULL,'https://trisakti-ac-id.zoom.us/j/93942091493?pwd=4FvM14UZGvyn2zUl3A2Xoy94pfOqOq.1','2025-06-08 07:28:41',1),(20,1,'kelas 12','2025-06-10 10:00:00',60,NULL,'https://us04web.zoom.us/j/74677373577?pwd=26XZJObDMXnGsoSzQ8JN9m8bOfY34V.1','2025-06-08 07:32:16',1),(21,1,'coba','2025-06-08 18:30:00',60,'','https://trisakti-ac-id.zoom.us/j/93942091493?pwd=4FvM14UZGvyn2zUl3A2Xoy94pfOqOq.1','2025-06-08 11:17:45',1);
/*!40000 ALTER TABLE `live_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahasiswa` (
  `NIM` int NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_general_ci,
  `tanggal_lahir` date DEFAULT NULL,
  `jurusan` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `angkatan` int DEFAULT NULL,
  `no_hp` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`NIM`) USING BTREE,
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `NIM` (`NIM`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `NIM_2` (`NIM`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES (652319,'Nicholas Saputra','065002300019@std.trisakti.ac.id','Mahkota Mas. Tangerang',NULL,'Sistem Informasi','2025-05-25 11:57:34',3,2023,'081586591708'),(652321,'','',NULL,NULL,NULL,'2025-06-09 07:46:33',5,NULL,NULL),(2147483647,'nadhira anindita ralena','065002300021@std.trisakti.ac.id','Alamat Palsyuuu Kesana Kemari Membawa Alamat jeng jeng',NULL,'Sistem Informasi','2025-06-09 08:04:55',4,2023,'081319887296');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materi`
--

DROP TABLE IF EXISTS `materi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  `uploaded_by` int DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_kelas` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uploaded_by` (`uploaded_by`),
  KEY `id_kelas` (`id_kelas`),
  CONSTRAINT `materi_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`),
  CONSTRAINT `materi_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materi`
--

LOCK TABLES `materi` WRITE;
/*!40000 ALTER TABLE `materi` DISABLE KEYS */;
INSERT INTO `materi` VALUES (28,'materi 1','',2,'065002300019_-_Nicholas_Saputra_-_Modul_10_-_Keamanan_Komputasi_1.pdf',1,'2025-06-09 05:46:09','2025-06-09 05:46:09');
/*!40000 ALTER TABLE `materi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertanyaan_kuis`
--

DROP TABLE IF EXISTS `pertanyaan_kuis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pertanyaan_kuis` (
  `id_pertanyaan` int NOT NULL AUTO_INCREMENT,
  `id_kuis` int NOT NULL,
  `teks_pertanyaan` text COLLATE utf8mb4_general_ci NOT NULL,
  `jenis` enum('pilihan_ganda','essay') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_pertanyaan`),
  KEY `id_kuis` (`id_kuis`),
  CONSTRAINT `pertanyaan_kuis_ibfk_1` FOREIGN KEY (`id_kuis`) REFERENCES `kuis` (`id_kuis`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertanyaan_kuis`
--

LOCK TABLES `pertanyaan_kuis` WRITE;
/*!40000 ALTER TABLE `pertanyaan_kuis` DISABLE KEYS */;
INSERT INTO `pertanyaan_kuis` VALUES (18,18,'cape','essay'),(19,18,'coba','essay'),(26,18,'bisa','pilihan_ganda'),(27,19,'pofoapf','essay'),(28,20,'Buat lah source code yang outputnya menghasilkan \"Hello World\"','');
/*!40000 ALTER TABLE `pertanyaan_kuis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilihan_jawaban`
--

DROP TABLE IF EXISTS `pilihan_jawaban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilihan_jawaban` (
  `id_pilihan` int NOT NULL AUTO_INCREMENT,
  `id_pertanyaan` int NOT NULL,
  `teks_pilihan` text COLLATE utf8mb4_general_ci NOT NULL,
  `is_jawaban_benar` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_pilihan`),
  KEY `id_pertanyaan` (`id_pertanyaan`),
  CONSTRAINT `pilihan_jawaban_ibfk_1` FOREIGN KEY (`id_pertanyaan`) REFERENCES `pertanyaan_kuis` (`id_pertanyaan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilihan_jawaban`
--

LOCK TABLES `pilihan_jawaban` WRITE;
/*!40000 ALTER TABLE `pilihan_jawaban` DISABLE KEYS */;
INSERT INTO `pilihan_jawaban` VALUES (13,26,'ya',1),(14,26,'ga',0),(15,26,'ga',0),(16,26,'ga',0);
/*!40000 ALTER TABLE `pilihan_jawaban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_actions`
--

DROP TABLE IF EXISTS `post_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `action_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`user_id`,`action_type`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_actions_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_actions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_actions`
--

LOCK TABLES `post_actions` WRITE;
/*!40000 ALTER TABLE `post_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` int NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'ini bagaimana pak\r\n',3,'mahasiswa','2025-05-20 14:39:32'),(2,'ini jadinya bagaimana pak',3,'mahasiswa','2025-05-21 01:40:25'),(3,'hallo',4,'mahasiswa','2025-06-09 08:09:00'),(4,'dosen Agama Islam siapa ya klo di SI?\r\n',4,'mahasiswa','2025-06-09 08:09:49');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tugas`
--

DROP TABLE IF EXISTS `tugas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tugas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_general_ci NOT NULL,
  `due_date` date NOT NULL,
  `mahasiswa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mahasiswa_id` (`mahasiswa_id`),
  CONSTRAINT `tugas_ibfk_1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tugas`
--

LOCK TABLES `tugas` WRITE;
/*!40000 ALTER TABLE `tugas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tugas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('mahasiswa','dosen','admin') COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'mahasiswa1','abc','mahasiswa'),(2,'dosen1','123','dosen'),(3,'Nicholas','123','mahasiswa'),(4,'dira','dira23','mahasiswa'),(5,'Nadhira','dira123','mahasiswa'),(6,'bibibabbboo','123456','dosen'),(8,'bluettercup','123456','dosen'),(9,'admin_baru','password_rahasia','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-15  4:30:20
