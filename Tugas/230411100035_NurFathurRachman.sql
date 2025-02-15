-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2025 at 06:02 AM
-- Server version: 8.0.39
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `basisdata_ii`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id_appointment` varchar(10) NOT NULL,
  `id_pasien` varchar(10) DEFAULT NULL,
  `id_dokter` varchar(10) DEFAULT NULL,
  `tanggal_appointment` date DEFAULT NULL,
  `jam_appointment` time DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asuransi`
--

CREATE TABLE `asuransi` (
  `id_asuransi` varchar(10) NOT NULL,
  `nama_asuransi` varchar(100) DEFAULT NULL,
  `nomor_polis` varchar(50) DEFAULT NULL,
  `kontak_asuransi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_resep`
--

CREATE TABLE `detail_resep` (
  `id_detail_resep` varchar(10) NOT NULL,
  `id_resep` varchar(10) DEFAULT NULL,
  `id_obat` varchar(10) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `aturan_pakai` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(10) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nama_dokter` varchar(100) DEFAULT NULL,
  `spesialisasi` varchar(50) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tarif_konsultasi` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_dokter`
--

CREATE TABLE `jadwal_dokter` (
  `id_jadwal` varchar(10) NOT NULL,
  `id_dokter` varchar(10) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` varchar(10) NOT NULL,
  `nama_obat` varchar(100) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `harga_unit` decimal(10,2) DEFAULT NULL,
  `stok_minimal` int DEFAULT NULL,
  `stok_tersedia` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(10) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `alamat` text,
  `no_telepon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `golongan_darah` varchar(3) DEFAULT NULL,
  `tanggal_registrasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pasien_asuransi`
--

CREATE TABLE `pasien_asuransi` (
  `id_pasien` varchar(10) NOT NULL,
  `id_asuransi` varchar(10) NOT NULL,
  `nomor_kartu` varchar(50) DEFAULT NULL,
  `tanggal_berlaku` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` varchar(10) NOT NULL,
  `id_rekam_medis` varchar(10) DEFAULT NULL,
  `tanggal_pembayaran` datetime DEFAULT NULL,
  `total_biaya` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` varchar(50) DEFAULT NULL,
  `status_pembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perawat`
--

CREATE TABLE `perawat` (
  `id_perawat` varchar(10) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nama_perawat` varchar(100) DEFAULT NULL,
  `departemen` varchar(50) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id_rekam_medis` varchar(10) NOT NULL,
  `id_pasien` varchar(10) DEFAULT NULL,
  `id_dokter` varchar(10) DEFAULT NULL,
  `tanggal_periksa` datetime DEFAULT NULL,
  `diagnosis` text,
  `catatan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `id_resep` varchar(10) NOT NULL,
  `id_rekam_medis` varchar(10) DEFAULT NULL,
  `tanggal_resep` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id_appointment`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `asuransi`
--
ALTER TABLE `asuransi`
  ADD PRIMARY KEY (`id_asuransi`);

--
-- Indexes for table `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD PRIMARY KEY (`id_detail_resep`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indexes for table `jadwal_dokter`
--
ALTER TABLE `jadwal_dokter`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indexes for table `pasien_asuransi`
--
ALTER TABLE `pasien_asuransi`
  ADD PRIMARY KEY (`id_pasien`,`id_asuransi`),
  ADD KEY `id_asuransi` (`id_asuransi`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_rekam_medis` (`id_rekam_medis`);

--
-- Indexes for table `perawat`
--
ALTER TABLE `perawat`
  ADD PRIMARY KEY (`id_perawat`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id_rekam_medis`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_rekam_medis` (`id_rekam_medis`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD CONSTRAINT `detail_resep_ibfk_1` FOREIGN KEY (`id_resep`) REFERENCES `resep` (`id_resep`),
  ADD CONSTRAINT `detail_resep_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);

--
-- Constraints for table `jadwal_dokter`
--
ALTER TABLE `jadwal_dokter`
  ADD CONSTRAINT `jadwal_dokter_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `pasien_asuransi`
--
ALTER TABLE `pasien_asuransi`
  ADD CONSTRAINT `pasien_asuransi_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `pasien_asuransi_ibfk_2` FOREIGN KEY (`id_asuransi`) REFERENCES `asuransi` (`id_asuransi`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_rekam_medis`) REFERENCES `rekam_medis` (`id_rekam_medis`);

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`id_rekam_medis`) REFERENCES `rekam_medis` (`id_rekam_medis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


A. Tabel Pasien (1NF)
```sql
CREATE TABLE Pasien (
    id_pasien VARCHAR(10) PRIMARY KEY,
    nik VARCHAR(16) UNIQUE,
    nama_lengkap VARCHAR(100),
    tanggal_lahir DATE,
    jenis_kelamin CHAR(1),
    alamat TEXT,
    no_telepon VARCHAR(15),
    email VARCHAR(100),
    golongan_darah VARCHAR(3),
    tanggal_registrasi DATE
);
```

B. Tabel Dokter (1NF)
```sql
CREATE TABLE Dokter (
    id_dokter VARCHAR(10) PRIMARY KEY,
    nip VARCHAR(20) UNIQUE,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(100),
    tarif_konsultasi DECIMAL(10,2)
);
```

C. Tabel Perawat (1NF)
```sql
CREATE TABLE Perawat (
    id_perawat VARCHAR(10) PRIMARY KEY,
    nip VARCHAR(20) UNIQUE,
    nama_perawat VARCHAR(100),
    departemen VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(100)
);
```

D. Tabel Jadwal_Dokter (2NF)
```sql
CREATE TABLE Jadwal_Dokter (
    id_jadwal VARCHAR(10) PRIMARY KEY,
    id_dokter VARCHAR(10),
    hari VARCHAR(10),
    jam_mulai TIME,
    jam_selesai TIME,
    FOREIGN KEY (id_dokter) REFERENCES Dokter(id_dokter)
);
```

E. Tabel Appointment (2NF)
```sql
CREATE TABLE Appointment (
    id_appointment VARCHAR(10) PRIMARY KEY,
    id_pasien VARCHAR(10),
    id_dokter VARCHAR(10),
    tanggal_appointment DATE,
    jam_appointment TIME,
    status VARCHAR(20),
    FOREIGN KEY (id_pasien) REFERENCES Pasien(id_pasien),
    FOREIGN KEY (id_dokter) REFERENCES Dokter(id_dokter)
);
```

F. Tabel Rekam_Medis (3NF)
```sql
CREATE TABLE Rekam_Medis (
    id_rekam_medis VARCHAR(10) PRIMARY KEY,
    id_pasien VARCHAR(10),
    id_dokter VARCHAR(10),
    tanggal_periksa DATETIME,
    diagnosis TEXT,
    catatan TEXT,
    FOREIGN KEY (id_pasien) REFERENCES Pasien(id_pasien),
    FOREIGN KEY (id_dokter) REFERENCES Dokter(id_dokter)
);
```

G. Tabel Obat (3NF)
```sql
CREATE TABLE Obat (
    id_obat VARCHAR(10) PRIMARY KEY,
    nama_obat VARCHAR(100),
    kategori VARCHAR(50),
    harga_unit DECIMAL(10,2),
    stok_minimal INT,
    stok_tersedia INT
);
```

H. Tabel Resep (3NF)
```sql
CREATE TABLE Resep (
    id_resep VARCHAR(10) PRIMARY KEY,
    id_rekam_medis VARCHAR(10),
    tanggal_resep DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_rekam_medis) REFERENCES Rekam_Medis(id_rekam_medis)
);
```

I. Tabel Detail_Resep (3NF)
```sql
CREATE TABLE Detail_Resep (
    id_detail_resep VARCHAR(10) PRIMARY KEY,
    id_resep VARCHAR(10),
    id_obat VARCHAR(10),
    jumlah INT,
    aturan_pakai TEXT,
    FOREIGN KEY (id_resep) REFERENCES Resep(id_resep),
    FOREIGN KEY (id_obat) REFERENCES Obat(id_obat)
);
```

J. Tabel Pembayaran (3NF)
```sql
CREATE TABLE Pembayaran (
    id_pembayaran VARCHAR(10) PRIMARY KEY,
    id_rekam_medis VARCHAR(10),
    tanggal_pembayaran DATETIME,
    total_biaya DECIMAL(10,2),
    metode_pembayaran VARCHAR(50),
    status_pembayaran VARCHAR(20),
    FOREIGN KEY (id_rekam_medis) REFERENCES Rekam_Medis(id_rekam_medis)
);
```

K. Tabel Asuransi (3NF)
```sql
CREATE TABLE Asuransi (
    id_asuransi VARCHAR(10) PRIMARY KEY,
    nama_asuransi VARCHAR(100),
    nomor_polis VARCHAR(50),
    kontak_asuransi VARCHAR(100)
);
```

L. Tabel Pasien_Asuransi (3NF)
```sql
CREATE TABLE Pasien_Asuransi (
    id_pasien VARCHAR(10),
    id_asuransi VARCHAR(10),
    nomor_kartu VARCHAR(50),
    tanggal_berlaku DATE,
    PRIMARY KEY (id_pasien, id_asuransi),
    FOREIGN KEY (id_pasien) REFERENCES Pasien(id_pasien),
    FOREIGN KEY (id_asuransi) REFERENCES Asuransi(id_asuransi)
);
```
