-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 08:24 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.2.24

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
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id_restoran` int(5) NOT NULL,
  `id_bahan_baku` int(5) NOT NULL,
  `nama_bahan_baku` varchar(50) NOT NULL,
  `harga` int(20) NOT NULL,
  `stock` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_bahan`
--

CREATE TABLE `data_bahan` (
  `id_bahan` int(5) NOT NULL,
  `id_restoran` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `nama_bahan` varchar(25) NOT NULL,
  `stock` int(5) NOT NULL,
  `satuan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_menu`
--

CREATE TABLE `data_menu` (
  `id_menu` int(5) NOT NULL,
  `id_restoran` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `nama_menu` varchar(25) NOT NULL,
  `tipe` varchar(25) NOT NULL,
  `harga` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_resep`
--

CREATE TABLE `data_resep` (
  `id_resto` int(5) NOT NULL,
  `id_menu` int(5) NOT NULL,
  `id_bahan` int(5) NOT NULL,
  `jumlah_bahan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_restoran`
--

CREATE TABLE `data_restoran` (
  `id_restoran` int(5) NOT NULL,
  `nama_resto` varchar(10) NOT NULL,
  `alamat_resto` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `data_super_admin`
--

CREATE TABLE `data_super_admin` (
  `id_akun` int(5) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` int(5) NOT NULL,
  `nama_lengkap` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_menu`
--

CREATE TABLE `detail_menu` (
  `id_detail_menu` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_menu`
--

INSERT INTO `detail_menu` (`id_detail_menu`, `id_role`, `id_menu`) VALUES
(226, 2, 1),
(227, 2, 14),
(228, 2, 15),
(229, 1, 1),
(230, 1, 2),
(231, 1, 3),
(232, 1, 7),
(233, 1, 8),
(234, 1, 14),
(235, 1, 15),
(236, 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `detail_role`
--

CREATE TABLE `detail_role` (
  `id_detail_role` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_role`
--

INSERT INTO `detail_role` (`id_detail_role`, `id_user`, `id_role`) VALUES
(31, 3, 1),
(32, 13, 1),
(33, 13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`) VALUES
(2, 'fasilitas'),
(3, 'biaya'),
(4, 'akreditasi');

-- --------------------------------------------------------

--
-- Table structure for table `list_dapur`
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
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `menu` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `link` varchar(100) NOT NULL,
  `id_parent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
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
(19, 'Menu Makanan', 'fa fa-plus', 'admin/menu_makanan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_minuman`
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
-- Table structure for table `nama_restoran`
--

CREATE TABLE `nama_restoran` (
  `id_restoran` int(5) NOT NULL,
  `nama_restoran` varchar(25) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nama_pemilik` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
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
-- Table structure for table `pemesanan`
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
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id_role`, `role`) VALUES
(1, 'admin'),
(2, 'Kasir'),
(3, 'waiters');

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(100) NOT NULL,
  `nama_kepala_sekolah` varchar(100) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `latitude` float NOT NULL,
  `longtitude` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`id_sekolah`, `nama_sekolah`, `nama_kepala_sekolah`, `alamat_sekolah`, `no_telepon`, `latitude`, `longtitude`) VALUES
(0, 'j', 'j', 'j', 'j', -7.25792, 112.737),
(2, 'Champlin, Crist and McLaughlin', 'Ms. Serena Morissette', '53188 Peter Ville', '1-950-055-6576', -7.3914, 112.752),
(5, 'Ferry PLC', 'Dr. Kaylah Schultz', '24959 Tressa Port Suite 690', '1-021-493-1222', -7.33185, 112.63),
(7, 'Murphy and Sons', 'Angus Dickinson', '597 Ortiz Islands Suite 957', '1-914-218-2943x14528', -7.35991, 112.609),
(15, 'Pagac-Bashirian', 'Kaycee Boyer', '46733 Madonna Meadows Suite 900', '01168918555', -7.28934, 112.601),
(16, 'Schimmel, Stoltenberg and Kuhic', 'Lesley Rowe', '812 Zemlak Parks', '194.801.2675', -7.10637, 112.687),
(17, 'Turcotte and Sons', 'Samson Herman V', '3862 Nolan Locks', '(585)375-2848x790', -7.39916, 112.649),
(20, 'Herzog and Sons', 'Prof. Eloise Collins', '900 Marks Overpass Suite 591', '839.610.9789x919', -7.21376, 112.735),
(22, 'Rath-Von', 'Joshuah O\'Connell', '3345 Schmidt Estates', '(945)049-2034x2762', -7.19302, 112.785),
(30, 'Rolfson-Becker', 'Jarvis Nikolaus', '790 Lind Crescent Apt. 346', '+49(9)8282370012', -7.29846, 112.758),
(31, 'Ernser, McKenzie and Cummerata', 'Juwan Tromp', '658 Graham Square', '067.125.7610', -7.39141, 112.708),
(36, 'Dooley, Balistreri and Block', 'Lamont Sipes', '9734 Arlie Viaduct Suite 528', '(042)987-4552', -7.3808, 112.721),
(37, 'Murray-Frami', 'Ms. Alison Weissnat I', '1531 Toy Fields', '428.051.3426x20936', -7.19152, 112.74),
(43, 'Pollich, Windler and Nader', 'Maia Muller', '89448 Reese Common', '845.615.2564x823', -7.22994, 112.648),
(49, 'Wolff PLC', 'Kirsten Lowe MD', '48164 Barrows Haven Suite 020', '(281)820-0533', -7.10223, 112.683),
(52, 'Langworth, Ullrich and Mayert', 'Elvis Weissnat', '19439 Daryl Springs Apt. 593', '499.075.4313', -7.33112, 112.754),
(55, 'Bashirian Ltd', 'Adan Purdy', '8460 Heather Wells', '1-161-334-2592', -7.20175, 112.736),
(59, 'Leuschke Ltd', 'Lyda Block', '553 Alford Fields', '(971)943-0150x81293', -7.29963, 112.639),
(60, 'Effertz, Shanahan and Heidenreich', 'Pete Carroll', '2489 Marquardt Fall Apt. 582', '1-317-268-7581x9681', -7.11377, 112.696),
(64, 'Johnston Inc', 'Kari Keebler MD', '571 Koss Route Apt. 614', '(267)208-7990', -7.15781, 112.657),
(66, 'Rice-Mueller', 'Norma Kris Sr.', '91523 Vicenta Lock Suite 355', '921.153.3706x196', -7.11301, 112.68),
(69, 'Hoppe and Sons', 'Kendra Larkin', '202 Jacobi Points', '231-686-7623x575', -7.22689, 112.74),
(77, 'Koss-Osinski', 'Alysa Bartell V', '2297 Kuvalis Plains Apt. 512', '+82(1)7739456951', -7.15118, 112.761),
(82, 'O\'Keefe, Harber and Fadel', 'Mrs. Natalia Morissette', '82399 Block Islands Apt. 702', '+58(0)0205297143', -7.14968, 112.652),
(86, 'Oberbrunner and Sons', 'Miss Dasia Lemke II', '6252 Feil Mountains Suite 920', '143.322.1313', -7.35046, 112.695),
(90, 'Price, Friesen and Grant', 'Mrs. Cydney Boyle V', '1291 Kacie Cape Apt. 661', '(194)445-7076', -7.10776, 112.608),
(95, 'Erdman, Gutkowski and Gerhold', 'Mackenzie Maggio DVM', '05604 Corwin River Apt. 444', '979-311-2515x07596', -7.25127, 112.76),
(97, 'Zulauf LLC', 'Bianka Feeney', '247 Mozelle Summit', '489.649.6458x5176', -7.1128, 112.666),
(103, 'Considine LLC', 'Aryanna Simonis', '79932 Ciara Station', '435-175-2963', -7.28751, 112.796),
(109, 'Kilback, Zieme and Leannon', 'Drake Ward', '632 Stoltenberg Village', '+37(9)9786743558', -7.35649, 112.76),
(113, 'Stiedemann, Harvey and Jacobson', 'Kiel Monahan', '8600 Hegmann Stravenue Suite 749', '(230)428-1968x505', -7.13164, 112.607),
(124, 'Kemmer-Bergnaum', 'Anita Adams', '5161 Frami Estate', '(248)048-8656', -7.39564, 112.72),
(126, 'Little, Franecki and O\'Reilly', 'Orrin Anderson PhD', '709 Smitham Pike Apt. 157', '+67(5)9590517494', -7.30041, 112.702),
(139, 'Tromp, Stanton and Brown', 'Amira Wilkinson', '9010 Hoeger Corner', '679-127-3781x13115', -7.34308, 112.61),
(144, 'Glover-Morar', 'Rosella Oberbrunner', '75082 Burnice Spring Apt. 219', '(441)312-0333x94945', -7.23633, 112.79),
(145, 'Runolfsdottir, Reichert and Maggio', 'Prof. Bradford Zieme', '82830 Israel Key', '814.197.7485x492', -7.18149, 112.689),
(150, 'Daugherty, Jenkins and Hermiston', 'Krystel Lehner', '6778 Thad View Suite 370', '1-306-320-7791', -7.24185, 112.696),
(152, 'Ratke-Fay', 'Alvina Fahey', '474 Hettinger Turnpike Suite 130', '(059)791-5337x70749', -7.20497, 112.627),
(157, 'Pagac, White and Turcotte', 'Dannie Beatty', '59811 Joe Rest', '381-828-3202x35756', -7.24736, 112.717),
(162, 'Mills and Sons', 'Melyna Gutkowski PhD', '237 Zula Square', '(747)442-1375x27541', -7.27058, 112.617),
(172, 'Gutkowski-D\'Amore', 'Amiya Gerlach', '83569 Daniella Falls', '1-303-571-1421x2193', -7.36921, 112.767),
(175, 'Stamm-Boehm', 'Ari Lueilwitz', '6720 Natalie Circle Apt. 083', '619.751.8577', -7.22247, 112.654),
(178, 'O\'Reilly and Sons', 'Verna Feest', '88504 Sophia Avenue Suite 694', '+53(9)8761992383', -7.16641, 112.738),
(187, 'Halvorson, Kutch and VonRueden', 'Reuben Graham', '33769 Heller Centers Suite 142', '130.327.5763', -7.27678, 112.65),
(188, 'Kirlin-Baumbach', 'Dr. Sadie Schamberger', '62385 Kertzmann Terrace', '511.100.0263', -7.24486, 112.679),
(191, 'Paucek-Weber', 'Dr. Nestor Shanahan', '5127 West Oval', '448.270.5573x77905', -7.3771, 112.714),
(199, 'Nader Inc', 'Karianne Kovacek', '35531 Vance Hill Apt. 359', '+18(6)1320709288', -7.29695, 112.638),
(205, 'Hauck-Cartwright', 'Cayla Wyman', '2186 Kenton Square', '959.466.1178', -7.2071, 112.798),
(215, 'Lehner Group', 'Mireya Collier', '33591 Guiseppe Lane', '1-699-140-7040', -7.11569, 112.647),
(225, 'Cruickshank-Cummerata', 'Stephon Pacocha I', '6819 Pacocha Hill Apt. 729', '(712)263-7768x76897', -7.39029, 112.689),
(229, 'Towne Inc', 'Myah O\'Kon', '2094 Brandy Ridge', '+63(3)7110414777', -7.29345, 112.676),
(232, 'Sipes and Sons', 'Ladarius Jenkins', '654 Flatley Path Apt. 309', '612.274.2079x178', -7.16914, 112.631),
(235, 'Bernhard Ltd', 'Prof. Sage Baumbach DVM', '7983 Pietro Crossing', '+17(0)4542997333', -7.39114, 112.66),
(239, 'Rolfson Ltd', 'Elian Pagac', '04207 Monte Corners Suite 956', '332.815.4107x890', -7.13279, 112.647),
(240, 'Casper, Nikolaus and O\'Connell', 'Kamren Gerhold', '402 Stanley Roads', '264.438.9670', -7.39633, 112.674),
(251, 'Gutmann Inc', 'Mertie Legros', '64255 Russel Port Suite 183', '06011463499', -7.11615, 112.609),
(252, 'Glover-Metz', 'Tristin Halvorson', '27991 Fahey Cliffs Apt. 939', '06223914618', -7.31389, 112.725),
(254, 'Pagac, Dach and Schmeler', 'Craig Rowe', '79299 Kaylie Points Apt. 068', '1-169-043-8731x958', -7.21274, 112.695),
(257, 'Heathcote, Schuster and Tromp', 'Wilton Fahey', '419 Gutkowski Drives Suite 170', '249-024-7082x961', -7.17568, 112.739),
(260, 'Schimmel, Beatty and Dach', 'Abe Hoeger', '12284 Gillian Port', '+13(8)2054252480', -7.26224, 112.64),
(263, 'Casper Group', 'Prof. Georgiana Abshire', '5083 Graham Viaduct', '341-986-4841', -7.14254, 112.734),
(276, 'Collier, Emard and Greenfelder', 'Eloy Beer', '417 Pfannerstill Port Apt. 150', '300.150.4689', -7.20418, 112.766),
(280, 'Robel, Emard and Corwin', 'Torrey Marquardt', '776 Shanny Mill Suite 612', '1-666-216-2482x68432', -7.29435, 112.661),
(287, 'Koepp, Dickinson and McKenzie', 'Mike Friesen', '2004 Ryleigh Fork', '(141)916-4675x9241', -7.18202, 112.641),
(290, 'Doyle, Padberg and Champlin', 'Hiram Dare', '229 Trantow Trafficway Suite 666', '276-078-8824x597', -7.36341, 112.777),
(293, 'Schaden, Heidenreich and Konopelski', 'Hiram Larkin III', '0580 Milton Street Apt. 610', '(100)824-2398x19430', -7.34791, 112.635),
(295, 'Murazik LLC', 'Miss Julie Orn Jr.', '3988 Stacey Mission', '779-368-9304x489', -7.3804, 112.6),
(296, 'Strosin, Collier and Jones', 'Selina Lakin', '229 Cleta Common Apt. 814', '729-210-8142', -7.24736, 112.642),
(311, 'Jones, Schimmel and Kutch', 'Quinton Kunze V', '47949 Oberbrunner Creek', '405.597.0921x84021', -7.10114, 112.611),
(317, 'Eichmann, Huels and Wunsch', 'Prof. Carmel Kling', '8994 Madalyn Street Apt. 536', '(018)334-2279', -7.27503, 112.672),
(321, 'Leffler Group', 'Olaf Reilly Jr.', '464 Kallie Forges', '+60(8)1762745555', -7.25261, 112.686),
(335, 'Swaniawski, Mayer and Lueilwitz', 'Prof. Ulices Veum IV', '88073 Sister Keys Apt. 003', '739.523.6060x7423', -7.17698, 112.709),
(339, 'Lindgren-Zemlak', 'Nathanial Schoen', '12733 Robel Trail Apt. 718', '(662)598-4866x2062', -7.22294, 112.709),
(341, 'Sporer-Hettinger', 'Betty Hammes', '59137 Maggio Underpass', '(115)346-4857x2296', -7.16618, 112.649),
(349, 'Jacobs LLC', 'Una Hyatt', '246 Rachelle Lane Suite 535', '(718)441-1965x707', -7.39771, 112.667),
(358, 'Hansen-Weimann', 'Etha Botsford', '0925 Stark Path', '475.992.9254', -7.14368, 112.617),
(360, 'Nader-Wilkinson', 'Prof. Grayce Goodwin', '3169 Ritchie Gateway', '(967)378-5262x8355', -7.27225, 112.748),
(361, 'Harber, Treutel and Erdman', 'Aiden Ondricka', '21804 Barney Squares', '052.809.0331x7008', -7.35765, 112.658),
(368, 'Ernser-McDermott', 'Bryon Hartmann', '0595 Braxton Fields Suite 604', '1-334-565-5722x77108', -7.19746, 112.769),
(373, 'Rath-Haley', 'Providenci McClure', '668 Ruecker Valleys', '(886)906-0692x46645', -7.39133, 112.661),
(379, 'Reilly, Parker and Balistreri', 'Mrs. Opal Lemke III', '85687 Connelly Fields', '393.285.1250x348', -7.35916, 112.791),
(387, 'Frami, Collins and Kassulke', 'Ara Spencer', '4999 Zieme Plaza Suite 529', '848.718.4416', -7.18602, 112.642),
(388, 'Torp Ltd', 'Savanah Hand', '290 Margarette Burgs', '(785)675-2231x6082', -7.11245, 112.676),
(389, 'Crooks-Windler', 'Kaylie Koepp', '8965 Eleanora Inlet Suite 093', '(208)680-0974', -7.11891, 112.799),
(393, 'Hegmann LLC', 'Darrell Walter', '92700 Murray Dam Apt. 197', '07853364312', -7.26081, 112.736),
(398, 'Smith PLC', 'Mr. Boyd Cummings II', '27334 Elnora Rest Apt. 870', '(570)925-3264x79207', -7.16257, 112.719),
(408, 'Balistreri, Zulauf and Rempel', 'Juston Kunde PhD', '7761 Dannie Lights', '06449663556', -7.19121, 112.612),
(421, 'Volkman-Hegmann', 'Sherwood Gutkowski', '096 Darius Valley', '1-192-293-2956', -7.33633, 112.786),
(425, 'Nolan-Feeney', 'Irma Harvey', '3206 Raleigh Ville Apt. 218', '600.604.6725x7265', -7.16951, 112.699),
(426, 'Cartwright Inc', 'Gilda Kassulke', '731 Kunze Stream', '1-045-173-8273', -7.13076, 112.674),
(428, 'Moen, Weimann and Reichel', 'Dr. Glenda Von', '99917 Maximus Parkways', '(330)487-8659x85815', -7.1846, 112.799),
(429, 'Mayert-Wiza', 'Thora Feil', '971 Fisher Throughway', '+69(8)7819598790', -7.20718, 112.717),
(444, 'Keeling PLC', 'Ines Boyer', '62159 Hirthe Forest Suite 269', '1-586-045-7666', -7.11282, 112.659),
(454, 'Gerlach, Kovacek and Conroy', 'Brain Smith', '81628 Simonis Trace Apt. 236', '447-592-0486', -7.29016, 112.712),
(461, 'Larkin-Hoppe', 'Elsie Wuckert IV', '958 Pagac Neck', '911-791-6604', -7.35837, 112.776),
(464, 'Trantow PLC', 'Prof. Noemi Brown', '6538 Kathryne Ports Suite 258', '907-136-7281', -7.30122, 112.79),
(468, 'Kihn LLC', 'Chanel Emard', '28077 Swift Pass', '253-878-3530', -7.13849, 112.701),
(485, 'Goodwin, Feest and Donnelly', 'Jammie Conroy III', '2986 Carroll Freeway Apt. 303', '1-023-613-5456x7844', -7.17313, 112.773),
(495, 'Rath-Huel', 'Rashad Erdman III', '341 Kristy Station Apt. 948', '(831)079-4408x52535', -7.38827, 112.621),
(496, 'Kozey and Sons', 'Dr. Barton Lubowitz MD', '65679 Davis Loaf Apt. 147', '920.713.6512', -7.27007, 112.662),
(497, 'Bechtelar LLC', 'Mr. Neil O\'Keefe', '68931 Hackett Mountains Apt. 887', '+42(5)0934314930', -7.25937, 112.775);

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_restoran`, `nama`, `foto`, `username`, `password`) VALUES
(3, 0, 'admin', '00852c00d4b02529b12f8323d3309435.jpg', 'admin', '$2y$10$2AlEejxa0eJKChWNYTok1OrMDXT5oIHEAbxSGdFTWtQWheMt4RM7.'),
(6, 0, 'tes', 'default.jpg', 'tes', '$2y$10$wuI4lWt8ZFuzA59rjtxPsu8l.QIl920ekVIH9LIWSXKhSvbUyX0dO'),
(13, 0, 'adi kurniawan', 'default.jpg', 'adi', '$2y$10$6iFGo70Jh9T6FY2R/rQKCOkCFmAJoPlhXBkQsCkc5Z3HswZFEbcJK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD PRIMARY KEY (`id_detail_menu`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `detail_role`
--
ALTER TABLE `detail_role`
  ADD PRIMARY KEY (`id_detail_role`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_menu`
--
ALTER TABLE `detail_menu`
  MODIFY `id_detail_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `detail_role`
--
ALTER TABLE `detail_role`
  MODIFY `id_detail_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD CONSTRAINT `detail_menu_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`),
  ADD CONSTRAINT `detail_menu_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Constraints for table `detail_role`
--
ALTER TABLE `detail_role`
  ADD CONSTRAINT `detail_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
