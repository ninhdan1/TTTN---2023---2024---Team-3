-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 05, 2024 lúc 04:46 PM
-- Phiên bản máy phục vụ: 8.2.0
-- Phiên bản PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanly_khoiluong_giangday`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bao_cao`
--

DROP TABLE IF EXISTS `bao_cao`;
CREATE TABLE IF NOT EXISTS `bao_cao` (
  `ma_baocao` int NOT NULL AUTO_INCREMENT,
  `ma_gv` varchar(20) NOT NULL,
  `thongtin_chinhsua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `trang_thai` enum('DaXuLy','ChuaXuLy') NOT NULL DEFAULT 'ChuaXuLy',
  `thoigian_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `thoigian_xuly` timestamp NOT NULL,
  PRIMARY KEY (`ma_baocao`),
  KEY `ph_giangvien_baocao_magv` (`ma_gv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giang_vien`
--

DROP TABLE IF EXISTS `giang_vien`;
CREATE TABLE IF NOT EXISTS `giang_vien` (
  `ma_gv` varchar(20) NOT NULL,
  `ho_lot_gv` varchar(50) NOT NULL,
  `ten_gv` varchar(50) NOT NULL,
  PRIMARY KEY (`ma_gv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoc_ky`
--

DROP TABLE IF EXISTS `hoc_ky`;
CREATE TABLE IF NOT EXISTS `hoc_ky` (
  `ma_hocky` int NOT NULL,
  `ten_hocky` enum('1,3,5,7','2,4,6,8') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nam_hoc` varchar(30) NOT NULL,
  PRIMARY KEY (`ma_hocky`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoiluong_giangday`
--

DROP TABLE IF EXISTS `khoiluong_giangday`;
CREATE TABLE IF NOT EXISTS `khoiluong_giangday` (
  `ma_khoiluong` int NOT NULL,
  `ma_gv` varchar(20) NOT NULL,
  `ma_hocky` int NOT NULL,
  `so_tietday` int DEFAULT NULL,
  `so_monday` int DEFAULT NULL,
  `so_lopday` int DEFAULT NULL,
  `so_sinhvienday` int DEFAULT NULL,
  `so_doan` int DEFAULT NULL,
  PRIMARY KEY (`ma_khoiluong`),
  KEY `pk_hocky_mahocky` (`ma_hocky`),
  KEY `pk_giangvien_magv` (`ma_gv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

DROP TABLE IF EXISTS `lop`;
CREATE TABLE IF NOT EXISTS `lop` (
  `ma_lop` int NOT NULL AUTO_INCREMENT,
  `ten_lop` varchar(50) NOT NULL,
  `si_so` int NOT NULL,
  PRIMARY KEY (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_monhoc`
--

DROP TABLE IF EXISTS `lop_monhoc`;
CREATE TABLE IF NOT EXISTS `lop_monhoc` (
  `ma_lichday` int NOT NULL,
  `thu` int NOT NULL,
  `tiet_batdau` int NOT NULL,
  `so_tiet` int NOT NULL,
  `so_tietmonhoc` int NOT NULL,
  `si_solop` int NOT NULL,
  `ma_lophoc` varchar(30) NOT NULL,
  `ten_phong` varchar(10) NOT NULL,
  `tiet_hoc` varchar(30) NOT NULL,
  `thoigian_hoc` date NOT NULL,
  `ngay_batdau` date NOT NULL,
  `ma_monhoc` varchar(20) NOT NULL,
  `ma_gv` varchar(20) NOT NULL,
  `ma_hk` int NOT NULL,
  `ma_lop` int NOT NULL,
  PRIMARY KEY (`ma_lichday`),
  KEY `pk_monhoc_mamonhoc` (`ma_monhoc`),
  KEY `pk_giangvien_lichday_magv` (`ma_gv`),
  KEY `pk_hocky_mahk` (`ma_hk`),
  KEY `pk_lop_malop` (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_hoc`
--

DROP TABLE IF EXISTS `mon_hoc`;
CREATE TABLE IF NOT EXISTS `mon_hoc` (
  `ma_monhoc` varchar(20) NOT NULL,
  `ten_monhoc` varchar(100) NOT NULL,
  `loai_monhoc` enum('lt_pm','pm','doan') DEFAULT NULL,
  PRIMARY KEY (`ma_monhoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
CREATE TABLE IF NOT EXISTS `tai_khoan` (
  `id` int NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `ma_gv` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_username` (`username`),
  UNIQUE KEY `uc_magv` (`ma_gv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao_taikhoan`
--

DROP TABLE IF EXISTS `thongbao_taikhoan`;
CREATE TABLE IF NOT EXISTS `thongbao_taikhoan` (
  `id` int NOT NULL,
  `ma_taikhoan` int NOT NULL,
  `ma_thongbao` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_taikhoan` (`ma_taikhoan`),
  KEY `pk_thongbao` (`ma_thongbao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao`
--

DROP TABLE IF EXISTS `thong_bao`;
CREATE TABLE IF NOT EXISTS `thong_bao` (
  `ma_thongbao` int NOT NULL,
  `tieu_de` varchar(255) NOT NULL,
  `noi_dung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `thoigian_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ma_thongbao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bao_cao`
--
ALTER TABLE `bao_cao`
  ADD CONSTRAINT `ph_giangvien_baocao_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `khoiluong_giangday`
--
ALTER TABLE `khoiluong_giangday`
  ADD CONSTRAINT `pk_giangvien_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_hocky_mahocky` FOREIGN KEY (`ma_hocky`) REFERENCES `hoc_ky` (`ma_hocky`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `lop_monhoc`
--
ALTER TABLE `lop_monhoc`
  ADD CONSTRAINT `pk_giangvien_lichday_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_hocky_mahk` FOREIGN KEY (`ma_hk`) REFERENCES `hoc_ky` (`ma_hocky`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_lop_malop` FOREIGN KEY (`ma_lop`) REFERENCES `lop` (`ma_lop`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_monhoc_mamonhoc` FOREIGN KEY (`ma_monhoc`) REFERENCES `mon_hoc` (`ma_monhoc`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD CONSTRAINT `pk_giangvien_taikhoan_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `thongbao_taikhoan`
--
ALTER TABLE `thongbao_taikhoan`
  ADD CONSTRAINT `pk_taikhoan` FOREIGN KEY (`ma_taikhoan`) REFERENCES `tai_khoan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_thongbao` FOREIGN KEY (`ma_thongbao`) REFERENCES `thong_bao` (`ma_thongbao`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
