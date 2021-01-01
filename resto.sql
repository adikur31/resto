-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jan 2021 pada 14.14
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id_restoran` int(11) NOT NULL,
  `id_bahan_baku` int(11) NOT NULL,
  `nama_bahan_baku` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_bahan`
--

CREATE TABLE `data_bahan` (
  `id_bahan` int(11) NOT NULL,
  `id_restoran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_bahan` varchar(25) NOT NULL,
  `stock` int(5) NOT NULL,
  `satuan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_menu`
--

CREATE TABLE `data_menu` (
  `id_menu` int(11) NOT NULL,
  `id_restoran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_menu` varchar(25) NOT NULL,
  `tipe` varchar(25) NOT NULL,
  `harga` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_resep`
--

CREATE TABLE `data_resep` (
  `id_resto` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_bahan` int(11) NOT NULL,
  `jumlah_bahan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_restoran`
--

CREATE TABLE `data_restoran` (
  `id_restoran` int(11) NOT NULL,
  `nama_resto` varchar(10) NOT NULL,
  `alamat_resto` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_restoran`
--

INSERT INTO `data_restoran` (`id_restoran`, `nama_resto`, `alamat_resto`, `status`) VALUES
(1, 'nmresto', 'jl gresik', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_super_admin`
--

CREATE TABLE `data_super_admin` (
  `id_akun` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` int(5) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_menu`
--

CREATE TABLE `detail_menu` (
  `id_detail_menu` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_menu`
--

INSERT INTO `detail_menu` (`id_detail_menu`, `id_role`, `id_menu`) VALUES
(226, 2, 1),
(227, 2, 14),
(228, 2, 15),
(237, 1, 1),
(238, 1, 2),
(239, 1, 7),
(240, 1, 8),
(241, 1, 14),
(242, 1, 15),
(245, 3, 1),
(246, 3, 14),
(247, 3, 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_role`
--

CREATE TABLE `detail_role` (
  `id_detail_role` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_role`
--

INSERT INTO `detail_role` (`id_detail_role`, `id_user`, `id_role`) VALUES
(31, 3, 1),
(32, 13, 1),
(33, 13, 2),
(34, 14, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_dapur`
--

CREATE TABLE `list_dapur` (
  `id_restoran` int(5) NOT NULL,
  `no_meja` int(5) NOT NULL,
  `menu1` int(5) NOT NULL,
  `jumlah1` int(5) NOT NULL,
  `menu2` int(5) NOT NULL,
  `jumlah2` int(5) NOT NULL,
  `menu3` int(5) NOT NULL,
  `jumlah3` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `link` varchar(100) NOT NULL,
  `id_parent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `menu`, `icon`, `link`, `id_parent`) VALUES
(1, 'Dashboard', 'fas fa-fw fa-tachometer-alt', 'admin/dashboard', 0),
(2, 'Data User', 'fas fa-fw fa-users', 'admin/user', 0),
(3, 'Data Role', 'fas fa-fw fa-user-tag', 'admin/role', 0),
(7, 'Menu', 'fa fa-align-justify', 'admin/menu', 0),
(8, 'Akses Menu', 'fa fa-tasks', 'admin/detail_menu', 0),
(14, 'Profile Saya', 'fas fa-fw fa-user', 'admin/profile', 0),
(15, 'Ganti Password', 'fas fa-fw fa-key', 'admin/profile/changepassword', 0),
(16, 'Rekomendasi Sekolah', 'fa fa-university', 'admin/rekomendasi_sekolah', 0),
(19, 'Menu Makanan', 'fa fa-plus', 'admin/menu_makanan', 0),
(20, 'Profile Restoran', 'fa fa-home', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_minuman`
--

CREATE TABLE `menu_minuman` (
  `id_restoran` int(5) NOT NULL,
  `id_minuman` int(5) NOT NULL,
  `nama_minuman` varchar(25) NOT NULL,
  `harga` int(15) NOT NULL,
  `bahan1` int(5) NOT NULL,
  `jumlah1` int(5) NOT NULL,
  `bahan2` int(5) NOT NULL,
  `jumlah2` int(5) NOT NULL,
  `bahan3` int(5) NOT NULL,
  `jumlah3` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nama_restoran`
--

CREATE TABLE `nama_restoran` (
  `id_restoran` int(5) NOT NULL,
  `nama_restoran` varchar(25) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nama_pemilik` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_restoran` int(5) NOT NULL,
  `no_transaksi` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `no_meja` int(3) NOT NULL,
  `harga` int(15) NOT NULL,
  `subtotal` int(15) NOT NULL,
  `total_harga` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_restoran` int(5) NOT NULL,
  `no_transaksi` int(5) NOT NULL,
  `tanggal` date NOT NULL,
  `nama_customer` varchar(25) NOT NULL,
  `no_meja` int(2) NOT NULL,
  `menu1` int(5) NOT NULL,
  `jumlah1` int(5) NOT NULL,
  `menu2` int(5) NOT NULL,
  `jumlah2` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `role`) VALUES
(1, 'admin'),
(2, 'Kasir'),
(3, 'waiters');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_restoran` int(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_restoran`, `nama`, `foto`, `username`, `password`) VALUES
(3, 0, 'admin', '00852c00d4b02529b12f8323d3309435.jpg', 'admin', '$2y$10$2AlEejxa0eJKChWNYTok1OrMDXT5oIHEAbxSGdFTWtQWheMt4RM7.'),
(6, 0, 'tes', 'default.jpg', 'tes', '$2y$10$wuI4lWt8ZFuzA59rjtxPsu8l.QIl920ekVIH9LIWSXKhSvbUyX0dO'),
(13, 0, 'adi kurniawan', 'default.jpg', 'adi', '$2y$10$6iFGo70Jh9T6FY2R/rQKCOkCFmAJoPlhXBkQsCkc5Z3HswZFEbcJK'),
(14, 1, 'tesres', 'default.jpg', 'tesres', '$2y$10$vbk41wJVK0YiW9gOliku8Ow.cHjQbORppXgAoPh4mlU2l7eRIMAsa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id_restoran`),
  ADD UNIQUE KEY `id_bahan_baku` (`id_bahan_baku`);

--
-- Indeks untuk tabel `data_bahan`
--
ALTER TABLE `data_bahan`
  ADD PRIMARY KEY (`id_bahan`),
  ADD KEY `id_restoran` (`id_restoran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `data_menu`
--
ALTER TABLE `data_menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_restoran` (`id_restoran`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `data_resep`
--
ALTER TABLE `data_resep`
  ADD PRIMARY KEY (`id_resto`);

--
-- Indeks untuk tabel `data_restoran`
--
ALTER TABLE `data_restoran`
  ADD PRIMARY KEY (`id_restoran`);

--
-- Indeks untuk tabel `data_super_admin`
--
ALTER TABLE `data_super_admin`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indeks untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD PRIMARY KEY (`id_detail_menu`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  ADD PRIMARY KEY (`id_detail_role`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id_restoran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_bahan`
--
ALTER TABLE `data_bahan`
  MODIFY `id_bahan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_menu`
--
ALTER TABLE `data_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_resep`
--
ALTER TABLE `data_resep`
  MODIFY `id_resto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `data_restoran`
--
ALTER TABLE `data_restoran`
  MODIFY `id_restoran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `data_super_admin`
--
ALTER TABLE `data_super_admin`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  MODIFY `id_detail_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  MODIFY `id_detail_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD CONSTRAINT `detail_menu_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`),
  ADD CONSTRAINT `detail_menu_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Ketidakleluasaan untuk tabel `detail_role`
--
ALTER TABLE `detail_role`
  ADD CONSTRAINT `detail_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
