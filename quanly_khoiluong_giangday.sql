-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th5 03, 2024 lúc 08:50 PM
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
  `tieu_de` varchar(255) DEFAULT NULL,
  `thongtin_chinhsua` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `thoigian_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ma_baocao`),
  KEY `ph_giangvien_baocao_magv` (`ma_gv`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `bao_cao`
--

INSERT INTO `bao_cao` (`ma_baocao`, `ma_gv`, `tieu_de`, `thongtin_chinhsua`, `thoigian_tao`) VALUES
(1, 'THCH_D0006', 'Tui gui 1 tin', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, ', '2024-04-30 07:32:57'),
(2, 'THCH_D0006', 'Tui gui 2 tin', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, co', '2024-04-30 08:18:58'),
(3, 'THCH_D0006', 'Tui gui 3 tin', 'ection 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi archit', '2024-04-30 08:24:20'),
(4, 'THCH_D0006', 'Tui gui 4 tin', 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"', '2024-04-30 08:29:57'),
(5, 'THCH_D0006', 'nihdan 2', 'Nguyễn 1 Khánh Quốc Vân Vân ... Mây Mấy', '2024-04-30 08:30:25');

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

--
-- Đang đổ dữ liệu cho bảng `giang_vien`
--

INSERT INTO `giang_vien` (`ma_gv`, `ho_lot_gv`, `ten_gv`) VALUES
('1', 'Trần Trọng', 'Phát'),
('2', 'Ninh', 'Dan'),
('THCH_D0001', 'Bùi Nhật', 'Bằng'),
('THCH_D0002', 'Trần', 'Khánh'),
('THCH_D0006', 'Trần', 'Quang'),
('THCH_D0007', 'Trần', 'Demo'),
('THCH_D0022', 'Trần', 'Viên'),
('THCH_D0023', 'Vinh', 'Van'),
('THCH_GV001', 'Nguyen', 'Minh'),
('THCH_GV002', 'Tran', 'Anh'),
('THCH_GV003', 'Le', 'Trung'),
('THCH_GV004', 'Pham', 'Linh'),
('THCH_GV005', 'Nguyen', 'Long'),
('THCH_GV007', 'Nguyen', 'Long Van');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoc_ky`
--

DROP TABLE IF EXISTS `hoc_ky`;
CREATE TABLE IF NOT EXISTS `hoc_ky` (
  `ma_hocky` int NOT NULL AUTO_INCREMENT,
  `ten_hocky` enum('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nam_hoc` int NOT NULL,
  PRIMARY KEY (`ma_hocky`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `hoc_ky`
--

INSERT INTO `hoc_ky` (`ma_hocky`, `ten_hocky`, `nam_hoc`) VALUES
(122, '1', 2024),
(123, '2', 2024),
(126, '3', 2024),
(127, '1', 2025),
(128, '2', 2025);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoiluong_giangday`
--

DROP TABLE IF EXISTS `khoiluong_giangday`;
CREATE TABLE IF NOT EXISTS `khoiluong_giangday` (
  `ma_khoiluong` int NOT NULL AUTO_INCREMENT,
  `ma_gv` varchar(20) NOT NULL,
  `ma_hocky` int NOT NULL,
  `so_tietday` int DEFAULT NULL,
  `so_monday` int DEFAULT NULL,
  `so_lopday` int DEFAULT NULL,
  `so_sinhvienday` int DEFAULT NULL,
  `so_doan` int DEFAULT NULL,
  `xac_nhan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ma_khoiluong`),
  KEY `pk_giangvien_magv` (`ma_gv`),
  KEY `pk_hocky_mahky` (`ma_hocky`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `khoiluong_giangday`
--

INSERT INTO `khoiluong_giangday` (`ma_khoiluong`, `ma_gv`, `ma_hocky`, `so_tietday`, `so_monday`, `so_lopday`, `so_sinhvienday`, `so_doan`, `xac_nhan`) VALUES
(1, 'THCH_D0006', 122, 220, 1, 5, 401, 0, 1),
(2, 'THCH_D0007', 123, 45, 1, 1, 86, 0, 0),
(3, 'THCH_D0006', 126, 225, 1, 5, 400, 0, 0),
(4, 'THCH_D0002', 126, 45, 1, 1, 77, 0, 0),
(5, 'THCH_D0006', 123, 225, 1, 5, 400, 0, 0),
(6, 'THCH_D0002', 123, 90, 1, 1, 154, 0, 0),
(7, 'THCH_D0002', 122, 45, 1, 1, 77, 0, 0),
(8, 'THCH_D0022', 122, 45, 1, 1, 77, 0, 0),
(9, 'THCH_GV001', 122, 30, 1, 1, 25, 0, 0),
(10, 'THCH_GV002', 122, 45, 1, 1, 20, 0, 0),
(11, 'THCH_GV003', 122, 30, 1, 1, 15, 0, 0),
(12, 'THCH_GV004', 122, 45, 1, 1, 30, 0, 0),
(13, 'THCH_GV005', 122, 30, 1, 1, 35, 0, 0),
(38, 'THCH_GV007', 122, 30, 1, 1, 35, 0, 0),
(39, 'THCH_D0006', 127, 180, 1, 4, 319, 0, 0),
(40, 'THCH_GV001', 127, 30, 1, 1, 25, 0, 0),
(41, 'THCH_GV002', 127, 45, 1, 1, 20, 0, 0),
(42, 'THCH_GV003', 127, 30, 1, 1, 15, 1, 0),
(43, 'THCH_GV004', 127, 45, 1, 1, 30, 0, 0),
(44, 'THCH_GV007', 127, 30, 1, 1, 35, 0, 0),
(45, 'THCH_D0007', 128, 45, 1, 1, 81, 0, 0),
(46, 'THCH_D0006', 128, 180, 1, 4, 319, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

DROP TABLE IF EXISTS `lop`;
CREATE TABLE IF NOT EXISTS `lop` (
  `ma_lop` varchar(20) NOT NULL,
  `si_so` int NOT NULL,
  PRIMARY KEY (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`ma_lop`, `si_so`) VALUES
('D19_TH', 67),
('D20_TH', 60);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_monhoc`
--

DROP TABLE IF EXISTS `lop_monhoc`;
CREATE TABLE IF NOT EXISTS `lop_monhoc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ma_lopmonhoc` int NOT NULL,
  `thu` int NOT NULL,
  `tiet_batdau` int NOT NULL,
  `so_tiet` int NOT NULL,
  `so_tietmonhoc` int NOT NULL,
  `si_solop` int NOT NULL,
  `ma_lophoc` varchar(30) NOT NULL,
  `ten_phong` varchar(10) NOT NULL,
  `tiet_hoc` varchar(30) NOT NULL,
  `thoigian_hoc` varchar(50) NOT NULL,
  `ngay_batdau` date NOT NULL,
  `ma_monhoc` varchar(20) NOT NULL,
  `ma_gv` varchar(20) NOT NULL,
  `ma_hk` int NOT NULL,
  `ma_lop` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_monhoc_mamonhoc` (`ma_monhoc`),
  KEY `pk_giangvien_lichday_magv` (`ma_gv`),
  KEY `pk_lop_malop` (`ma_lop`),
  KEY `pk_hocky_mahk` (`ma_hk`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `lop_monhoc`
--

INSERT INTO `lop_monhoc` (`id`, `ma_lopmonhoc`, `thu`, `tiet_batdau`, `so_tiet`, `so_tietmonhoc`, `si_solop`, `ma_lophoc`, `ten_phong`, `tiet_hoc`, `thoigian_hoc`, `ngay_batdau`, `ma_monhoc`, `ma_gv`, `ma_hk`, `ma_lop`) VALUES
(6, 806, 6, 7, 3, 40, 82, 'D19_TH-1\r\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 122, 'D19_TH'),
(7, 805, 6, 10, 3, 45, 83, 'D19_TH-2\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 122, 'D19_TH'),
(8, 813, 4, 5, 2, 30, 15, 'D20_TH-3\n', 'C303', '------789------', '07/09/22-20/12/22', '2022-09-05', 'CS34567', 'THCH_GV003', 122, 'D20_TH'),
(9, 807, 7, 7, 3, 45, 78, 'D19_TH-3\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 122, 'D19_TH'),
(10, 809, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 122, 'D19_TH'),
(11, 802, 6, 7, 3, 45, 86, 'D19_TH-1\n', 'C608', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0007', 123, 'D19_TH'),
(12, 805, 6, 10, 3, 45, 83, 'D19_TH-2\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 123, 'D19_TH'),
(13, 813, 7, 4, 3, 45, 81, 'D19_TH-5\n', 'C603', '---456---------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 123, 'D19_TH'),
(14, 807, 7, 7, 3, 45, 78, 'D19_TH-3\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 123, 'D19_TH'),
(15, 809, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 123, 'D19_TH'),
(26, 803, 6, 7, 3, 45, 81, 'D19_TH-1\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 126, 'D19_TH'),
(27, 805, 6, 10, 3, 45, 83, 'D19_TH-2\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 126, 'D19_TH'),
(28, 813, 7, 4, 3, 45, 81, 'D19_TH-5\n', 'C603', '---456---------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 126, 'D19_TH'),
(29, 807, 7, 7, 3, 45, 78, 'D19_TH-3\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 126, 'D19_TH'),
(30, 809, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 126, 'D19_TH'),
(31, 803, 6, 7, 3, 45, 81, 'D19_TH-1\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 127, 'D19_TH'),
(32, 805, 6, 10, 3, 45, 83, 'D19_TH-2\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 127, 'D19_TH'),
(33, 813, 4, 5, 2, 30, 15, 'D20_TH-3\n', 'C303', '------789------', '07/09/22-20/12/22', '2022-09-05', 'CS34567', 'THCH_GV003', 127, 'D20_TH'),
(34, 807, 7, 7, 3, 45, 78, 'D19_TH-3\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 127, 'D19_TH'),
(35, 809, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 127, 'D19_TH'),
(36, 803, 6, 7, 3, 45, 81, 'D19_TH-1\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 122, 'D19_TH'),
(37, 810, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0002', 126, 'D19_TH'),
(38, 803, 6, 7, 3, 45, 81, 'D19_TH-1\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 123, 'D19_TH'),
(39, 810, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0002', 123, 'D19_TH'),
(40, 811, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0002', 123, 'D19_TH'),
(41, 810, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0002', 122, 'D19_TH'),
(42, 811, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0022', 122, 'D19_TH'),
(43, 820, 2, 4, 2, 30, 25, 'D20_TH-1\n', 'A101', '---123---------', '05/09/22-18/12/22', '2022-09-05', 'CS12345', 'THCH_GV001', 122, 'D20_TH'),
(45, 814, 5, 2, 3, 45, 30, 'D20_TH-3\n', 'D404', '---------012---', '08/09/22-21/12/22', '2022-09-05', 'CS45678', 'THCH_GV004', 122, 'D20_TH'),
(46, 875, 6, 7, 2, 30, 35, 'D20_TH-4\n', 'C304', '---456---------', '09/09/22-22/12/22', '2022-09-05', 'CS56282', 'THCH_GV007', 122, 'D20_TH'),
(59, 820, 2, 4, 2, 30, 25, 'D20_TH-1\n', 'A101', '---123---------', '05/09/22-18/12/22', '2022-09-05', 'CS12345', 'THCH_GV001', 127, 'D20_TH'),
(60, 812, 3, 3, 3, 45, 20, 'D20_TH-2\n', 'B202', '---------456---', '06/09/22-19/12/22', '2022-09-05', 'CS23456	', 'THCH_GV002', 127, 'D20_TH'),
(61, 814, 5, 2, 3, 45, 30, 'D20_TH-3\n', 'D404', '---------012---', '08/09/22-21/12/22', '2022-09-05', 'CS45678', 'THCH_GV004', 127, 'D20_TH'),
(62, 875, 6, 7, 2, 30, 35, 'D20_TH-4\n', 'C304', '---456---------', '09/09/22-22/12/22', '2022-09-05', 'CS56282', 'THCH_GV007', 127, 'D20_TH'),
(63, 803, 6, 7, 3, 45, 81, 'D19_TH-1\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0007', 128, 'D19_TH'),
(64, 805, 6, 10, 3, 45, 83, 'D19_TH-2\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 128, 'D19_TH'),
(65, 813, 7, 4, 3, 45, 81, 'D19_TH-5\n', 'C603', '---456---------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 128, 'D19_TH'),
(66, 807, 7, 7, 3, 45, 78, 'D19_TH-3\n', 'C603', '------789------', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 128, 'D19_TH'),
(67, 809, 7, 10, 3, 45, 77, 'D19_TH-4\n', 'C605', '---------012---', '05/09/22-18/12/22', '2022-09-05', 'CS09010', 'THCH_D0006', 128, 'D19_TH');

--
-- Bẫy `lop_monhoc`
--
DROP TRIGGER IF EXISTS `update_khoiluong_giangday_after_insert`;
DELIMITER $$
CREATE TRIGGER `update_khoiluong_giangday_after_insert` AFTER INSERT ON `lop_monhoc` FOR EACH ROW BEGIN

INSERT INTO khoiluong_giangday (ma_gv, ma_hocky, so_tietday, so_monday, so_lopday, so_sinhvienday, so_doan)
    SELECT 
        NEW.ma_gv,
        NEW.ma_hk,
        0 AS so_tietday, -- Initial value
        0 AS so_monday,  -- Initial value
        0 AS so_lopday,  -- Initial value
        0 AS so_sinhvienday,  -- Initial value
        0 AS so_doan   -- Initial value
    FROM 
        dual
    WHERE NOT EXISTS (
        SELECT 1 
        FROM khoiluong_giangday 
        WHERE ma_gv = NEW.ma_gv AND ma_hocky = NEW.ma_hk
    );


    UPDATE khoiluong_giangday AS kg
    INNER JOIN (
        SELECT 
            lm.ma_gv,
            lm.ma_hk,
            SUM(lm.so_tietmonhoc) AS so_tietday,
            COUNT(DISTINCT lm.ma_monhoc) AS so_monday,
            COUNT(DISTINCT lm.ma_lophoc) AS so_lopday,
            SUM(lm.si_solop) AS so_sinhvienday,
            COUNT(DISTINCT CASE WHEN lm.ma_monhoc IN (SELECT ma_monhoc FROM mon_hoc WHERE loai_monhoc = 'doan') THEN lm.ma_lophoc END) AS so_doan
        FROM 
            lop_monhoc AS lm
        WHERE 
            lm.ma_hk = NEW.ma_hk
        GROUP BY 
            lm.ma_gv, lm.ma_hk
    ) AS new_data ON kg.ma_gv = new_data.ma_gv AND kg.ma_hocky = new_data.ma_hk
    SET 
        kg.so_tietday = new_data.so_tietday,
        kg.so_monday = new_data.so_monday,
        kg.so_lopday = new_data.so_lopday,
        kg.so_sinhvienday = new_data.so_sinhvienday,
        kg.so_doan = new_data.so_doan;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_khoiluong_giangday_after_update`;
DELIMITER $$
CREATE TRIGGER `update_khoiluong_giangday_after_update` AFTER UPDATE ON `lop_monhoc` FOR EACH ROW BEGIN

	 INSERT INTO khoiluong_giangday (ma_gv, ma_hocky, so_tietday, so_monday, so_lopday, so_sinhvienday, so_doan)
    SELECT 
        NEW.ma_gv,
        NEW.ma_hk,
        0 AS so_tietday, -- Initial value
        0 AS so_monday,  -- Initial value
        0 AS so_lopday,  -- Initial value
        0 AS so_sinhvienday,  -- Initial value
        0 AS so_doan   -- Initial value
    FROM 
        dual
    WHERE NOT EXISTS (
        SELECT 1 
        FROM khoiluong_giangday 
        WHERE ma_gv = NEW.ma_gv AND ma_hocky = NEW.ma_hk
    );


    UPDATE khoiluong_giangday AS kg
    INNER JOIN (
        SELECT 
             lm.ma_gv,
            lm.ma_hk,
            SUM(lm.so_tietmonhoc) AS so_tietday,
            COUNT(DISTINCT lm.ma_monhoc) AS so_monday,
            COUNT(DISTINCT lm.ma_lophoc) AS so_lopday,
            SUM(lm.si_solop) AS so_sinhvienday,
            COUNT(DISTINCT CASE WHEN lm.ma_monhoc IN (SELECT ma_monhoc FROM mon_hoc WHERE loai_monhoc = 'doan') THEN lm.ma_lophoc END) AS so_doan
        FROM 
            lop_monhoc AS lm
        WHERE 
            lm.ma_hk = NEW.ma_hk
        GROUP BY 
            lm.ma_gv, lm.ma_hk
    ) AS new_data ON kg.ma_gv = new_data.ma_gv AND kg.ma_hocky = new_data.ma_hk
    SET 
        kg.so_tietday = new_data.so_tietday,
        kg.so_monday = new_data.so_monday,
        kg.so_lopday = new_data.so_lopday,
        kg.so_sinhvienday = new_data.so_sinhvienday,
        kg.so_doan = new_data.so_doan;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_hoc`
--

DROP TABLE IF EXISTS `mon_hoc`;
CREATE TABLE IF NOT EXISTS `mon_hoc` (
  `ma_monhoc` varchar(20) NOT NULL,
  `ten_monhoc` varchar(100) NOT NULL,
  `loai_monhoc` enum('lt_pm','pm','doan') DEFAULT NULL,
  `hoc_ky_monhoc` enum('1','2','3','4','5','6','7','8') DEFAULT NULL,
  PRIMARY KEY (`ma_monhoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `mon_hoc`
--

INSERT INTO `mon_hoc` (`ma_monhoc`, `ten_monhoc`, `loai_monhoc`, `hoc_ky_monhoc`) VALUES
('CS09010', 'Phân tích thiết kế hệ thống thông tin', 'pm', ''),
('CS090101', 'Kỹ thuật lập trình', 'doan', ''),
('CS090102', 'Kỹ thuật lập trình2', 'lt_pm', '1'),
('CS12345', 'Introduction to Programming', 'pm', '1'),
('CS23456	', 'Data Structures and Algorithms', 'lt_pm', '8'),
('CS34567', 'Software Engineering', 'pm', '2'),
('CS45678', 'Database Management Systems', 'lt_pm', '5'),
('CS56282', 'Artificial Intelligence Aphe12', 'lt_pm', ''),
('CS56781', 'Artificial Intelligence222', 'lt_pm', ''),
('CS56782', 'Artificial Intelligence', 'lt_pm', '4'),
('CS56789', 'Artificial Intelligence', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
CREATE TABLE IF NOT EXISTS `tai_khoan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `ma_gv` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_username` (`username`),
  UNIQUE KEY `uc_magv` (`ma_gv`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `tai_khoan`
--

INSERT INTO `tai_khoan` (`id`, `username`, `password`, `role`, `is_active`, `ma_gv`) VALUES
(1, 'trantrongphat', 'fb4e33e1c80f781a7d7c5740208944e2', 'admin', 1, '1'),
(2, 'ninhdanvippro', 'ebb16727cabc689dfb477b9cd29e33e5', 'user', 1, '2'),
(23, 'b24_3272040111', 'ebb16727cabc689dfb477b9cd29e33e5', 'user', 1, NULL),
(25, 'THCH_D00232', 'ebb16727cabc689dfb477b9cd29e33e5', 'user', 1, NULL),
(27, 'THCH_D0001', 'ebb16727cabc689dfb477b9cd29e33e5', 'user', 0, 'THCH_D0001'),
(28, 'THCH_D0006', 'ebb16727cabc689dfb477b9cd29e33e5', 'user', 1, 'THCH_D0006');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongbao_giangvien`
--

DROP TABLE IF EXISTS `thongbao_giangvien`;
CREATE TABLE IF NOT EXISTS `thongbao_giangvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_gv` varchar(20) NOT NULL,
  `ma_thongbao` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_thongbao_matb` (`ma_thongbao`),
  KEY `pk_gianvien_magv` (`ma_gv`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `thongbao_giangvien`
--

INSERT INTO `thongbao_giangvien` (`id`, `ma_gv`, `ma_thongbao`) VALUES
(1, '2', 1),
(2, '2', 2),
(3, 'THCH_D0006', 2),
(4, '2', 3),
(5, 'THCH_D0006', 3),
(6, '2', 4),
(7, 'THCH_D0006', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_bao`
--

DROP TABLE IF EXISTS `thong_bao`;
CREATE TABLE IF NOT EXISTS `thong_bao` (
  `ma_thongbao` int NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(255) NOT NULL,
  `noi_dung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tac_gia` varchar(50) NOT NULL,
  `thoigian_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ma_thongbao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_bao`
--

INSERT INTO `thong_bao` (`ma_thongbao`, `tieu_de`, `noi_dung`, `tac_gia`, `thoigian_tao`) VALUES
(1, 'Thông báo số 1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', 'trantrongphat', '2024-04-30 14:11:56'),
(2, 'Thông báo số 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'trantrongphat', '2024-04-30 14:12:31'),
(3, 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"', 'trantrongphat', '2024-05-01 15:35:12'),
(4, 'nihdan 2', 'dấd', 'trantrongphat', '2024-05-03 07:10:44');

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
  ADD CONSTRAINT `pk_hocky_mahky` FOREIGN KEY (`ma_hocky`) REFERENCES `hoc_ky` (`ma_hocky`) ON DELETE RESTRICT ON UPDATE RESTRICT;

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
-- Các ràng buộc cho bảng `thongbao_giangvien`
--
ALTER TABLE `thongbao_giangvien`
  ADD CONSTRAINT `pk_gianvien_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_thongbao_matb` FOREIGN KEY (`ma_thongbao`) REFERENCES `thong_bao` (`ma_thongbao`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
