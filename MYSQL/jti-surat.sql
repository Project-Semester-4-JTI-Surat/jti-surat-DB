-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 07, 2023 at 05:44 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jti-surat`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uuid` varchar(50) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `role_id` int NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_surat`
--

CREATE TABLE `detail_surat` (
  `id_surat` varchar(50) NOT NULL,
  `mahasiswa_id` varchar(9) NOT NULL,
  `surattanggal_pelaksanaan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `prodi_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat`
--

CREATE TABLE `jenis_surat` (
  `kode` varchar(8) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `koordinator`
--

CREATE TABLE `koordinator` (
  `kode` char(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `prodi_id` int NOT NULL,
  `jenis` char(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `uuid` varchar(50) NOT NULL,
  `nim` varchar(9) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `prodi_id` int NOT NULL,
  `password` varchar(100) NOT NULL,
  `alamat` text,
  `no_hp` varchar(15) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id` int NOT NULL,
  `keterangan` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `keterangan` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `info` enum('gagal','berhasil') NOT NULL DEFAULT 'gagal',
  `keterangan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `id` varchar(50) NOT NULL,
  `kode_surat` varchar(8) NOT NULL,
  `status_id` int NOT NULL,
  `dosen_id` varchar(20) NOT NULL,
  `kode_koordinator` char(10) NOT NULL,
  `nama_mitra` varchar(100) DEFAULT NULL,
  `alamat_mitra` text,
  `tanggal_dibuat` date DEFAULT NULL,
  `tanggal_pelaksanaan` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `judul_ta` varchar(150) DEFAULT NULL,
  `kebutuhan` varchar(100) DEFAULT NULL,
  `keterangan` text,
  `softfile_scan` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `detail_surat`
--
ALTER TABLE `detail_surat`
  ADD KEY `id_surat` (`id_surat`),
  ADD KEY `mahasiswa_id` (`mahasiswa_id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indexes for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `koordinator`
--
ALTER TABLE `koordinator`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keterangan` (`keterangan`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_surat` (`kode_surat`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `dosen_id` (`dosen_id`),
  ADD KEY `kode_koordinator` (`kode_koordinator`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FKadmin63973` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `detail_surat`
--
ALTER TABLE `detail_surat`
  ADD CONSTRAINT `FKdetail_sur592947` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`nim`),
  ADD CONSTRAINT `FKdetail_sur862264` FOREIGN KEY (`id_surat`) REFERENCES `surat` (`id`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `FKdosen407387` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`);

--
-- Constraints for table `koordinator`
--
ALTER TABLE `koordinator`
  ADD CONSTRAINT `FKkoordinato968822` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`);

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `FKmahasiswa236992` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`);

--
-- Constraints for table `surat`
--
ALTER TABLE `surat`
  ADD CONSTRAINT `FKsurat482557` FOREIGN KEY (`kode_surat`) REFERENCES `jenis_surat` (`kode`),
  ADD CONSTRAINT `FKsurat615454` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`id`),
  ADD CONSTRAINT `FKsurat733362` FOREIGN KEY (`kode_koordinator`) REFERENCES `koordinator` (`kode`),
  ADD CONSTRAINT `FKsurat94522` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
