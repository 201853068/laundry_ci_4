-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 15 Des 2020 pada 12.36
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `items`
--

CREATE TABLE `items` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaksi_id` int(11) UNSIGNED NOT NULL,
  `nama_item` varchar(128) NOT NULL,
  `jumlah` float NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `items`
--

INSERT INTO `items` (`id`, `transaksi_id`, `nama_item`, `jumlah`, `satuan`, `harga`) VALUES
(1, 1, 'PAKAIAN', 1, 'kg', 10000),
(2, 1, 'KARPET', 1, 'pcs', 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id`, `nama`) VALUES
(1, 'cuci bersih'),
(2, 'cuci 1 hari'),
(3, 'cuci express'),
(4, 'setrika'),
(5, 'laundry'),
(6, 'laundry 1 hari'),
(7, 'laundry express');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `type` varchar(30) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `name`, `display_name`, `type`, `url`, `icon`, `is_active`) VALUES
(1, 'dashboard', 'Dashboard', 'static', 'dashboard', 'fas fa-fw fa-home', 1),
(2, 'roles', 'Roles', 'static', 'roles', 'fas fa-fw fa-user-tag', 1),
(3, 'tools', 'Tools', 'dynamic', NULL, 'fas fa-fw fa-cogs', 1),
(4, 'users', 'Users', 'static', 'users', 'fas fa-fw fa-users', 1),
(5, 'transactions', 'Transactions', 'dynamic', NULL, 'fas fa-fw fa-tasks', 1),
(6, 'cash-flow', 'Cash Flow', 'dynamic', NULL, 'fas fa-fw fa-cash-register', 1),
(7, 'reports', 'Reports', 'dynamic', NULL, 'fas fa-fw fa-book', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_roles`
--

CREATE TABLE `menu_roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_roles`
--

INSERT INTO `menu_roles` (`id`, `menu_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 1, 2),
(9, 5, 2),
(10, 6, 2),
(11, 1, 3),
(12, 5, 3),
(13, 6, 3),
(14, 7, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaksi_masuk_id` int(11) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(128) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(128) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `display_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`) VALUES
(1, 'administrator', 'Administrator'),
(2, 'user', 'User'),
(3, 'owner', 'Owner');

-- --------------------------------------------------------

--
-- Struktur dari tabel `submenu`
--

CREATE TABLE `submenu` (
  `id` int(11) UNSIGNED NOT NULL,
  `menu_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `submenu`
--

INSERT INTO `submenu` (`id`, `menu_id`, `name`, `display_name`, `url`, `is_active`) VALUES
(1, 3, 'access', 'Access', 'tools/access', 1),
(2, 3, 'menu', 'Menu', 'tools/menu', 1),
(3, 3, 'submenu', 'Submenu', 'tools/submenu', 1),
(4, 5, 'transaksi-masuk', 'Transaksi Masuk', 'transactions/transaksi-masuk', 1),
(5, 5, 'transaksi-pengambilan', 'Transaksi Pengambilan', 'transactions/transaksi-pengambilan', 1),
(6, 6, 'pemasukan', 'Pemasukan', 'cash-flow/pemasukan', 1),
(7, 6, 'pengeluaran', 'Pengeluaran', 'cash-flow/pengeluaran', 1),
(8, 7, 'report-transaksi-masuk', 'Report Transaksi Masuk', 'reports/transaksi-masuk', 1),
(9, 7, 'report-transaksi-pengambilan', 'Report Pengambilan', 'reports/transaksi-pengambilan', 1),
(10, 7, 'report-pemasukan', 'Report Pemasukan', 'reports/pemasukan', 1),
(11, 7, 'report-pengeluaran', 'Report Pengeluaran', 'reports/pengeluaran', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_masuk`
--

CREATE TABLE `transaksi_masuk` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(128) NOT NULL,
  `layanan_id` int(11) UNSIGNED NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `total_harga` int(11) NOT NULL,
  `jumlah_item` int(5) NOT NULL,
  `lunas` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `user_creator` varchar(30) NOT NULL,
  `user_editor` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_pengambilan`
--

CREATE TABLE `transaksi_pengambilan` (
  `id` int(11) UNSIGNED NOT NULL,
  `transaksi_masuk_id` int(11) UNSIGNED NOT NULL,
  `tgl_ambil` date NOT NULL,
  `user_creator` varchar(30) NOT NULL,
  `user_editor` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `role_id` int(11) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `display_name`, `email`, `phone`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Admin', NULL, NULL, '$2y$10$TxKt3OUUMnB3CMvghyo2TemQJygaG/qdKmi7XwF4YqbndvApLyz8W', '2020-12-15 09:58:43', '2020-12-15 09:58:43'),
(2, 2, 'op', 'OP', NULL, NULL, '$2y$10$vuBFYBxfaOfFzjB7KKJLLeJ.quxAia0dQAEDBH51WQKVVwR8b.U9G', '2020-12-15 09:58:43', '2020-12-15 09:58:43'),
(3, 3, 'owner', 'Owner', NULL, NULL, '$2y$10$IdRuIuGFz5w8d8DG.Ep.zeUHKDhSoRS8qoF2/IXgrhBh.hGK/2C5.', '2020-12-15 09:58:43', '2020-12-15 09:58:43');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_transaksi_id_foreign` (`transaksi_id`);

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_roles`
--
ALTER TABLE `menu_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_roles_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_roles_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemasukan_transaksi_masuk_id_foreign` (`transaksi_masuk_id`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `submenu`
--
ALTER TABLE `submenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submenu_menu_id_foreign` (`menu_id`);

--
-- Indeks untuk tabel `transaksi_masuk`
--
ALTER TABLE `transaksi_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_masuk_layanan_id_foreign` (`layanan_id`);

--
-- Indeks untuk tabel `transaksi_pengambilan`
--
ALTER TABLE `transaksi_pengambilan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_pengambilan_transaksi_masuk_id_foreign` (`transaksi_masuk_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `menu_roles`
--
ALTER TABLE `menu_roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `submenu`
--
ALTER TABLE `submenu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `transaksi_masuk`
--
ALTER TABLE `transaksi_masuk`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `transaksi_pengambilan`
--
ALTER TABLE `transaksi_pengambilan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_transaksi_id_foreign` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_roles`
--
ALTER TABLE `menu_roles`
  ADD CONSTRAINT `menu_roles_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD CONSTRAINT `pemasukan_transaksi_masuk_id_foreign` FOREIGN KEY (`transaksi_masuk_id`) REFERENCES `transaksi_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `submenu`
--
ALTER TABLE `submenu`
  ADD CONSTRAINT `submenu_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_masuk`
--
ALTER TABLE `transaksi_masuk`
  ADD CONSTRAINT `transaksi_masuk_layanan_id_foreign` FOREIGN KEY (`layanan_id`) REFERENCES `layanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_pengambilan`
--
ALTER TABLE `transaksi_pengambilan`
  ADD CONSTRAINT `transaksi_pengambilan_transaksi_masuk_id_foreign` FOREIGN KEY (`transaksi_masuk_id`) REFERENCES `transaksi_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
