-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2024 at 02:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `idDokter` varchar(10) NOT NULL,
  `nmDokter` varchar(100) DEFAULT NULL,
  `spesialis` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `noTelp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`idDokter`, `nmDokter`, `spesialis`, `alamat`, `noTelp`) VALUES
('D001', 'Dr. Ahmad Fauzi', 'Dokter Umum', 'Jl. Melati No. 12, Jakarta', '021-5551234'),
('D002', 'Dr. Siti Aisyah', 'Dokter Gigi', 'Jl. Mawar No. 10, Jakarta', '021-5555678'),
('D003', 'Dr. Budi Santoso', 'Dokter Spesialis Anak', 'Jl. Kenanga No. 25, Jakarta', '021-5559012'),
('D004', 'Dr. Rina Pratiwi', 'Dokter Kandungan', 'Jl. Cempaka No. 5, Jakarta', '021-5553456'),
('D005', 'Dr. Joko Nugroho', 'Dokter Spesialis Jantung', 'Jl. Anggrek No. 8, Jakarta', '021-5557890');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `idKunjungan` int(11) NOT NULL,
  `idPasien` varchar(10) DEFAULT NULL,
  `idDokter` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keluhan` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`idKunjungan`, `idPasien`, `idDokter`, `tanggal`, `keluhan`, `diagnosis`) VALUES
(6, 'P001', 'D001', '2024-10-01', 'Sakit kepala dan demam', 'Flu biasa'),
(7, 'P002', 'D002', '2024-10-02', 'Sakit gigi', 'Karies gigi'),
(8, 'P003', 'D003', '2024-10-03', 'Batuk dan pilek', 'Infeksi saluran pernapasan'),
(9, 'P004', 'D004', '2024-10-04', 'Nyeri perut', 'Radang usus buntu'),
(10, 'P005', 'D005', '2024-10-05', 'Jantung berdebar-debar', 'Gangguan irama jantung');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `idPasien` varchar(50) NOT NULL,
  `nmPasien` varchar(50) NOT NULL,
  `jk` char(15) NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`idPasien`, `nmPasien`, `jk`, `alamat`) VALUES
('P001', 'Setiawan', 'Laki-laki', 'Padang'),
('P002', 'Udin', 'Laki-laki', 'Tegal'),
('P003', 'Dika', 'Laki-laki', 'Jakarta Timur'),
('P004', 'Sari', 'Perempuan', 'Cilegon'),
('P005', 'Seli', 'Perempuan', 'Jakarta Selatan'),
('Pasien195', 'Setiawan', 'Laki-laki', 'Padang'),
('Pasien196', 'Udin', 'Laki-laki', 'Tegal'),
('Pasien197', 'Dika', 'Laki-laki', 'Jakarta Timur'),
('Pasien198', 'Sari', 'Perempuan', 'Cilegon'),
('Pasien199', 'Seli', 'Perempuan', 'Jakarta Selatan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`idDokter`);

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`idKunjungan`),
  ADD KEY `idPasien` (`idPasien`),
  ADD KEY `idDokter` (`idDokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idPasien`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `idKunjungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`idPasien`) REFERENCES `pasien` (`idPasien`),
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`idDokter`) REFERENCES `dokter` (`idDokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
