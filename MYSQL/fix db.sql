-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2023 at 08:54 PM
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
  `prodi_id` int NOT NULL,
  `role_id` int NOT NULL,
  `change_password` enum('true','false') NOT NULL DEFAULT 'false',
  `password` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uuid`, `username`, `nama`, `prodi_id`, `role_id`, `change_password`, `password`, `no_hp`, `created_at`, `updated_at`) VALUES
('1d7c01b3-07f5-430e-9efa-503c8687c1b1', 'adminjti2', 'Indriana Rahmawati', 1, 1, 'false', '$2y$10$bG7nC/6KcvdoIcmrJl/quumilHjAJwkpWtHQ0RE6hN0xR82GBPFd6', '082331504590', '2023-04-08 02:21:14', '2023-04-08 02:21:14'),
('7e231caf-2cf2-4dd6-a320-0b5005a69f83', 'super2', 'SuperAdmin2', 2, 2, 'false', '$2y$10$HeiTvse.HLdq8aMHfkmxi.fRmJGNBv..3dxuiHKxaVa73Fc9bufnq', '6208122255966', '2023-04-08 02:24:20', '2023-04-08 02:24:20'),
('ecae0d90-b6bb-498d-84a8-3e707dd8dffc', 'adigans123', 'Muhammad Adi Saputro', 1, 1, 'true', '$2y$10$O1EyX2jfB.LjTFsnSw5E8.hdE.xWZmrc7uqQ1S8/0Nksy88qtfUHi', '081890768905', '2023-04-08 03:09:17', '2023-04-08 05:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `surat_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nim` varchar(9) DEFAULT NULL,
  `prodi_id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_hp` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`surat_id`, `nim`, `prodi_id`, `nama`, `no_hp`, `created_at`, `updated_at`) VALUES
('3d5d9f7d-d2d8-463f-ba66-32250e396af1', 'E41210759', 1, 'Muhammad Adi Saputro', '085748314069', '2023-04-11 19:03:49', '2023-04-11 19:03:49');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `prodi_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`uuid`, `nip`, `nama`, `prodi_id`, `created_at`, `updated_at`) VALUES
('5ca75274-78bb-4c81-976a-e019219e152c', '199408122019031013', 'Mukhamad Angga Gumilang, S. Pd., M. Eng.', 1, '2023-04-07 16:34:55', '2023-04-07 16:34:55'),
('a734c173-00f6-401f-9a0a-310c41f32d43', '197810112005012002', 'Elly Antika, ST, M.Kom', 1, '2023-04-09 00:35:56', '2023-04-09 00:35:56');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat`
--

CREATE TABLE `jenis_surat` (
  `kode` varchar(8) NOT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_surat`
--

INSERT INTO `jenis_surat` (`kode`, `keterangan`, `created_at`, `updated_at`) VALUES
('MK', 'Mata Kuliah', '2023-04-09 00:12:46', '2023-04-09 00:12:46'),
('OP', 'Observasi Penelitian', '2023-04-09 00:15:11', '2023-04-09 00:15:11'),
('PP', 'Pengajuan PKL', '2023-04-09 00:14:10', '2023-04-09 00:14:10'),
('TA', 'Tugas Akhir', '2023-04-08 01:28:31', '2023-04-08 01:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `koordinator`
--

CREATE TABLE `koordinator` (
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `kode_surat` varchar(8) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `prodi_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `koordinator`
--

INSERT INTO `koordinator` (`uuid`, `nama`, `no_hp`, `kode_surat`, `email`, `prodi_id`, `created_at`, `updated_at`) VALUES
('18bfab4b-b84a-4209-b91d-2a2da914c742', 'M. Angga Gumilang, S. Pd., M. Eng.', '085156168675', 'TA', 'angga.gumilang@polije.ac.id', 1, '2023-04-08 01:32:13', '2023-04-08 01:32:13'),
('77d65832-8319-49a3-8358-4f1d6d02219d', 'dummy', '12345678910', 'TA', 'dummy@gmail.com', 1, '2023-04-08 23:08:48', '2023-04-08 23:08:48');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`uuid`, `nim`, `nama`, `email`, `prodi_id`, `password`, `alamat`, `no_hp`, `tanggal_lahir`, `created_at`, `updated_at`) VALUES
('ff76e353-2def-4b8d-88a5-27be7cc6160f', 'E41210759', 'Muhammad Adi Saputro', 'muhammadxxz7@gmail.com', 1, '$2y$10$uajQ9n4q.mmxiy3jjBQkOutzDAFGOmh.QlWv9wTjOTwetylBp/EX6', 'Tanggul - Jember', '085748314069', '2023-05-21', '2023-04-09 19:26:45', '2023-04-09 19:26:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'muhammadxxz7@gmail.com', '1b1da816-908a-48e1-861f-302c483b0dc7', '2023-04-11 16:39:27'),
(2, 'muhammadxxz7@gmail.com', '84838b51-6cff-4c95-b300-50f97a75649e', '2023-04-11 16:41:15'),
(3, 'muhammadxxz7@gmail.com', 'f6bb864d-a275-48b8-9c66-c399a1b4f825', '2023-04-11 16:42:42'),
(4, 'muhammadxxz7@gmail.com', '8bf5ef62-6f3d-489c-8f54-73cb36c77ac8', '2023-04-11 16:45:54'),
(5, 'muhammadxxz7@gmail.com', '6a6abb17-ba2c-4e5f-a05a-61995419749b', '2023-04-11 17:11:29'),
(6, 'muhammadxxz7@gmail.com', '2080af12-9d63-4ea0-ba54-6b4c30b8faad', '2023-04-11 17:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id` int NOT NULL,
  `keterangan` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'TIF Reguler', '2023-04-07 15:43:57', '2023-04-07 15:43:57'),
(2, 'All', '2023-04-08 02:23:10', '2023-04-08 02:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `keterangan` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2023-04-06 23:41:34', '2023-04-06 23:41:34'),
(2, 'Super Admin', '2023-04-06 23:42:43', '2023-04-06 23:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `info` enum('gagal','berhasil') NOT NULL DEFAULT 'gagal',
  `keterangan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `info`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'berhasil', 'Selesai', '2023-04-09 02:32:58', '2023-04-09 02:32:58'),
(2, 'berhasil', 'Menunggu', '2023-04-09 02:33:18', '2023-04-09 02:33:18'),
(3, 'berhasil', 'Diproses', '2023-04-09 02:33:45', '2023-04-09 02:33:45'),
(4, 'berhasil', 'Dapat Diambil', '2023-04-09 02:35:31', '2023-04-09 02:35:31'),
(5, 'gagal', 'Ditolak', '2023-04-09 02:36:05', '2023-04-09 02:36:05');

-- --------------------------------------------------------

--
-- Table structure for table `surat`
--

CREATE TABLE `surat` (
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_surat` varchar(8) NOT NULL,
  `status_id` int DEFAULT '2',
  `dosen_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_koordinator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_mitra` varchar(100) DEFAULT NULL,
  `alamat_mitra` text,
  `tanggal_dibuat` date DEFAULT NULL,
  `tanggal_pelaksanaan` date NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `judul_ta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kebutuhan` enum('Eksternal','Internal') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` text,
  `softfile_scan` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surat`
--

INSERT INTO `surat` (`uuid`, `kode_surat`, `status_id`, `dosen_id`, `kode_koordinator`, `nama_mitra`, `alamat_mitra`, `tanggal_dibuat`, `tanggal_pelaksanaan`, `tanggal_selesai`, `judul_ta`, `kebutuhan`, `keterangan`, `softfile_scan`, `created_at`, `updated_at`) VALUES
('3d5d9f7d-d2d8-463f-ba66-32250e396af1', 'TA', 2, '5ca75274-78bb-4c81-976a-e019219e152c', '18bfab4b-b84a-4209-b91d-2a2da914c742', 'tesss', 'tesss alamat', '2023-04-02', '2023-04-02', '2023-04-25', NULL, 'Eksternal', 'tes keterangan', NULL, '2023-04-11 19:03:49', '2023-04-11 19:03:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD KEY `prodi_id` (`prodi_id`),
  ADD KEY `id` (`surat_id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`uuid`),
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
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `prodi_id` (`prodi_id`),
  ADD KEY `kode_surat` (`kode_surat`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`uuid`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat`
--
ALTER TABLE `surat`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `kode_surat` (`kode_surat`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `dosen_id` (`dosen_id`),
  ADD KEY `kode_koordinator` (`kode_koordinator`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKadmin63973` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anggota_ibfk_2` FOREIGN KEY (`surat_id`) REFERENCES `surat` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `FKdosen407387` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`);

--
-- Constraints for table `koordinator`
--
ALTER TABLE `koordinator`
  ADD CONSTRAINT `FKkoordinato968822` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`id`),
  ADD CONSTRAINT `koordinator_ibfk_1` FOREIGN KEY (`kode_surat`) REFERENCES `jenis_surat` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `FKsurat94522` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `surat_ibfk_2` FOREIGN KEY (`kode_koordinator`) REFERENCES `koordinator` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `surat_ibfk_3` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
