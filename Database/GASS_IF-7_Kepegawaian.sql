-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Agu 2022 pada 09.31
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `GASS_IF-7_Kepegawaian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_jabatan`
--

CREATE TABLE `data_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(120) NOT NULL,
  `gaji_pokok` varchar(50) NOT NULL,
  `tj_transport` varchar(50) NOT NULL,
  `uang_makan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_jabatan`
--

INSERT INTO `data_jabatan` (`id_jabatan`, `nama_jabatan`, `gaji_pokok`, `tj_transport`, `uang_makan`) VALUES
(1, 'HRD', '5000000', '600000', '400000'),
(2, 'Staff Marketing', '2000000', '300000', '200000'),
(3, 'Admin', '2200000', '350000', '200000'),
(4, 'Sales', '2500000', '350000', '200000'),
(7, 'Supervisor', '2500000', '350000', '200000');

--
-- Trigger `data_jabatan`
--
DELIMITER $$
CREATE TRIGGER `batas_uangnya_insert` BEFORE INSERT ON `data_jabatan` FOR EACH ROW BEGIN
		IF NEW.gaji_pokok <0 THEN 
        	SET NEW.gaji_pokok = 0;
        ELSEIF NEW.tj_transport <0 THEN
        	SET NEW.tj_transport = 0;
        ELSEIF NEW.uang_makan <0 THEN
        	SET NEW.uang_makan = 0;
        END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `batas_uangnya_update` BEFORE UPDATE ON `data_jabatan` FOR EACH ROW BEGIN
		IF NEW.gaji_pokok <0 THEN 
        	SET NEW.gaji_pokok = 0;
        ELSEIF NEW.tj_transport <0 THEN
        	SET NEW.tj_transport = 0;
        ELSEIF NEW.uang_makan <0 THEN
        	SET NEW.uang_makan = 0;
        END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `log_jabatan` AFTER UPDATE ON `data_jabatan` FOR EACH ROW BEGIN
	
	INSERT INTO log_jabatan SET
        id_jabatan = old.id_jabatan,
        nama_jabatan_update = new.nama_jabatan,
        gaji_update = new.gaji_pokok,
        tj_transport_update = new.tj_transport,
        uang_makan_update = new.uang_makan;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kehadiran`
--

CREATE TABLE `data_kehadiran` (
  `id_kehadiran` int(11) NOT NULL,
  `bulan` varchar(15) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `hadir` int(11) NOT NULL,
  `sakit` int(11) NOT NULL,
  `alpha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_kehadiran`
--

INSERT INTO `data_kehadiran` (`id_kehadiran`, `bulan`, `nik`, `nama_pegawai`, `jenis_kelamin`, `nama_jabatan`, `hadir`, `sakit`, `alpha`) VALUES
(1, '012021', '0987654321', 'Dodi', 'Laki-Laki', 'Staff Marketing', 24, 0, 0),
(2, '012021', '123456789', 'Fauzi', 'Laki-Laki', 'Admin', 22, 0, 1),
(3, '072022', '0987654321', 'Dodi', 'Laki-Laki', 'Staff Marketing', 25, 3, 1),
(4, '072022', '123456789', 'Fauzi', 'Laki-Laki', 'Admin', 26, 2, 0),
(5, '072022', '987654321', 'Indah Sari', 'Perempuan', 'Sales', 27, 0, 2),
(6, '072022', '998765432', 'laila ratna', 'Perempuan', 'Staff Marketing', 25, 0, 1),
(7, '072022', '9987654322', 'rizkia nugraha', 'Laki-Laki', 'HRD', 29, 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(32) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `hak_akses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_pegawai`
--

INSERT INTO `data_pegawai` (`id_pegawai`, `nik`, `nama_pegawai`, `username`, `password`, `jenis_kelamin`, `jabatan`, `tanggal_masuk`, `status`, `photo`, `hak_akses`) VALUES
(1, '123456789', 'Fauzi', 'fauzi', '21232f297a57a5a743894a0e4a801fc3', 'Laki-Laki', 'Admin', '2020-12-26', 'Karyawan Tetap', 'pegawai-210101-a7ca89f5fc.png', 1),
(2, '0987654321', 'Dodi', 'dodi', '202cb962ac59075b964b07152d234b70', 'Laki-Laki', 'Staff Marketing', '2021-01-02', 'Karyawan Tidak Tetap', 'pegawai-210101-9847084dc8.png', 2),
(4, '987654321', 'Indah Sari', 'indah', '7363a0d0604902af7b70b271a0b96480', 'Perempuan', 'Sales', '2022-08-05', 'Karyawan Tidak Tetap', 'pegawai-220805-7f518e623e.png', 2),
(5, '998765432', 'laila ratna', 'laila', '7363a0d0604902af7b70b271a0b96480', 'Perempuan', 'Staff Marketing', '2022-08-01', 'Karyawan Tetap', 'pegawai-220805-957d036235.png', 2),
(6, '9987654322', 'rizkia nugraha', 'rizki', '21232f297a57a5a743894a0e4a801fc3', 'Laki-Laki', 'HRD', '2020-08-01', 'Karyawan Tetap', 'pegawai-220805-2ebbaa1bad.png', 1);

--
-- Trigger `data_pegawai`
--
DELIMITER $$
CREATE TRIGGER `log_ganti_pass` AFTER UPDATE ON `data_pegawai` FOR EACH ROW BEGIN
	
	INSERT INTO log_ganti_pass SET
        id_pegawai = old.id_pegawai,
        nama_pegawai = old.nama_pegawai,
        username= old.username,
        password_dulu = old.password,
        password_baru = new.password;
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hak_akses`
--

CREATE TABLE `hak_akses` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `hak_akses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hak_akses`
--

INSERT INTO `hak_akses` (`id`, `keterangan`, `hak_akses`) VALUES
(1, 'admin', 1),
(2, 'pegawai', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_ganti_pass`
--

CREATE TABLE `log_ganti_pass` (
  `no` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_dulu` varchar(20) NOT NULL,
  `password_baru` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_ganti_pass`
--

INSERT INTO `log_ganti_pass` (`no`, `id_pegawai`, `nama_pegawai`, `username`, `password_dulu`, `password_baru`) VALUES
(1, 1, 'Fauzi', 'fauzi', '21232f297a57a5a74389', 'c81936ebf3574183bc77'),
(4, 1, 'Fauzi', 'fauzi', 'c81936ebf3574183bc77', '21232f297a57a5a74389'),
(5, 1, 'Fauzi', 'fauzi', '21232f297a57a5a74389', '8d8e0b644a38d517c477'),
(6, 2, 'Dodi', 'dodi', 'dc82a0e0107a31ba5d13', '8b6bc5d8046c8466359d'),
(7, 1, 'Fauzi', 'fauzi', '8d8e0b644a38d517c477', '21232f297a57a5a74389'),
(8, 2, 'Dodi', 'dodi', '8b6bc5d8046c8466359d', '202cb962ac59075b964b'),
(9, 4, 'Indah Sari', 'indah', '202cb962ac59075b964b', '7363a0d0604902af7b70');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_jabatan`
--

CREATE TABLE `log_jabatan` (
  `no` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan_update` varchar(50) NOT NULL,
  `gaji_update` varchar(50) NOT NULL,
  `tj_transport_update` varchar(50) NOT NULL,
  `uang_makan_update` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_jabatan`
--

INSERT INTO `log_jabatan` (`no`, `id_jabatan`, `nama_jabatan_update`, `gaji_update`, `tj_transport_update`, `uang_makan_update`) VALUES
(5, 7, 'Supervisor', '2500000', '350000', '200000'),
(6, 1, 'HRD', '5000000', '600000', '400000'),
(7, 2, 'Staff Marketing', '2000000', '300000', '200000'),
(8, 3, 'Admin', '2200000', '350000', '200000'),
(9, 4, 'Sales', '2500000', '350000', '200000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_potongan_gaji`
--

CREATE TABLE `log_potongan_gaji` (
  `no` int(11) NOT NULL,
  `potongan_dulu` varchar(50) NOT NULL,
  `potongan_baru` varchar(50) NOT NULL,
  `jml_potongan_dulu` int(11) NOT NULL,
  `jml_potongan_baru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_potongan_gaji`
--

INSERT INTO `log_potongan_gaji` (`no`, `potongan_dulu`, `potongan_baru`, `jml_potongan_dulu`, `jml_potongan_baru`) VALUES
(10, 'Alpha', 'Alpha', 100000, 250000),
(11, 'Sakit', 'Sakit', 25000, 0),
(12, 'Izin Acara Keluarga', 'Izin Acara Keluarga', 50000, 100000),
(13, 'Izin Tidak Jelas', 'Izin Tidak Jelas', 100000, 250000),
(14, 'Izin Menunaikan Ibadah', 'Izin Menunaikan Ibadah', 50000, 50000),
(15, 'Izin Menunaikan Ibadah', 'Izin Menunaikan Ibadah', 50000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `potongan_gaji`
--

CREATE TABLE `potongan_gaji` (
  `id` int(11) NOT NULL,
  `potongan` varchar(120) NOT NULL,
  `jml_potongan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `potongan_gaji`
--

INSERT INTO `potongan_gaji` (`id`, `potongan`, `jml_potongan`) VALUES
(1, 'Alpha', 250000),
(2, 'Sakit', 0),
(3, 'Izin Acara Keluarga', 100000),
(4, 'Izin Tidak Jelas', 250000),
(5, 'Izin Menunaikan Ibadah', 0);

--
-- Trigger `potongan_gaji`
--
DELIMITER $$
CREATE TRIGGER `log_potongan_gaji` AFTER UPDATE ON `potongan_gaji` FOR EACH ROW BEGIN
	
	INSERT INTO log_potongan_gaji SET
        potongan_dulu = old.potongan,
        potongan_baru = new.potongan,
        jml_potongan_dulu = old.jml_potongan,
        jml_potongan_baru = new.jml_potongan;
    
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_jabatan`
--
ALTER TABLE `data_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `data_kehadiran`
--
ALTER TABLE `data_kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`);

--
-- Indeks untuk tabel `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_ganti_pass`
--
ALTER TABLE `log_ganti_pass`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `log_jabatan`
--
ALTER TABLE `log_jabatan`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `log_potongan_gaji`
--
ALTER TABLE `log_potongan_gaji`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `potongan_gaji`
--
ALTER TABLE `potongan_gaji`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_jabatan`
--
ALTER TABLE `data_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `data_kehadiran`
--
ALTER TABLE `data_kehadiran`
  MODIFY `id_kehadiran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `data_pegawai`
--
ALTER TABLE `data_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `hak_akses`
--
ALTER TABLE `hak_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log_ganti_pass`
--
ALTER TABLE `log_ganti_pass`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `log_jabatan`
--
ALTER TABLE `log_jabatan`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `log_potongan_gaji`
--
ALTER TABLE `log_potongan_gaji`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `potongan_gaji`
--
ALTER TABLE `potongan_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
