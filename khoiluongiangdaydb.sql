-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th3 27, 2024 lúc 04:59 PM
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
CREATE DATABASE IF NOT EXISTS `quanly_khoiluong_giangday` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `quanly_khoiluong_giangday`;

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
-- Cấu trúc bảng cho bảng `chitiet_lophoc`
--

DROP TABLE IF EXISTS `chitiet_lophoc`;
CREATE TABLE IF NOT EXISTS `chitiet_lophoc` (
  `ma_lop_hoc` int NOT NULL AUTO_INCREMENT,
  `ten_lop_hoc` varchar(50) NOT NULL,
  `ma_nhom` int NOT NULL,
  `ma_lop` int NOT NULL,
  PRIMARY KEY (`ma_lop_hoc`),
  KEY `pk_lophoc_malophoc` (`ma_lop`)
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
  `ten_hocky` varchar(50) NOT NULL,
  `ngay_batdau` date DEFAULT NULL,
  `ngay_ketthuc` date DEFAULT NULL,
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
-- Cấu trúc bảng cho bảng `lich_giangday`
--

DROP TABLE IF EXISTS `lich_giangday`;
CREATE TABLE IF NOT EXISTS `lich_giangday` (
  `ma_lichday` int NOT NULL,
  `thu` int NOT NULL,
  `tiet_batdau` int NOT NULL,
  `so_tiet` int NOT NULL,
  `ten_phong` varchar(10) NOT NULL,
  `tiet_hoc` varchar(30) NOT NULL,
  `thoigian_hoc` date NOT NULL,
  `ngay_batdau` date NOT NULL,
  `ma_monhoc` varchar(20) NOT NULL,
  `ma_chitiet_lop` int NOT NULL,
  `ma_gv` varchar(20) NOT NULL,
  PRIMARY KEY (`ma_lichday`),
  KEY `pk_monhoc_mamonhoc` (`ma_monhoc`),
  KEY `pk_giangvien_lichday_magv` (`ma_gv`),
  KEY `pk_chitietlophoc_malophoc` (`ma_chitiet_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_hoc`
--

DROP TABLE IF EXISTS `lop_hoc`;
CREATE TABLE IF NOT EXISTS `lop_hoc` (
  `ma_lop` int NOT NULL AUTO_INCREMENT,
  `ten_lop` varchar(50) NOT NULL,
  `si_so` int NOT NULL,
  PRIMARY KEY (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_hoc`
--

DROP TABLE IF EXISTS `mon_hoc`;
CREATE TABLE IF NOT EXISTS `mon_hoc` (
  `ma_monhoc` varchar(20) NOT NULL,
  `ten_monhoc` varchar(100) NOT NULL,
  `sotiet` int NOT NULL,
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
-- Cấu trúc bảng cho bảng `thong_bao`
--

DROP TABLE IF EXISTS `thong_bao`;
CREATE TABLE IF NOT EXISTS `thong_bao` (
  `ma_thongbao` int NOT NULL,
  `ma_nguoinhan` int DEFAULT NULL,
  `noi_dung` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `thoigian_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ma_thongbao`),
  KEY `pk_taikhoan_thongbao_id` (`ma_nguoinhan`)
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
-- Các ràng buộc cho bảng `chitiet_lophoc`
--
ALTER TABLE `chitiet_lophoc`
  ADD CONSTRAINT `pk_lophoc_malophoc` FOREIGN KEY (`ma_lop`) REFERENCES `lop_hoc` (`ma_lop`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `khoiluong_giangday`
--
ALTER TABLE `khoiluong_giangday`
  ADD CONSTRAINT `pk_giangvien_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_hocky_mahocky` FOREIGN KEY (`ma_hocky`) REFERENCES `hoc_ky` (`ma_hocky`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `lich_giangday`
--
ALTER TABLE `lich_giangday`
  ADD CONSTRAINT `pk_chitietlophoc_malophoc` FOREIGN KEY (`ma_chitiet_lop`) REFERENCES `chitiet_lophoc` (`ma_lop_hoc`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_giangvien_lichday_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_monhoc_mamonhoc` FOREIGN KEY (`ma_monhoc`) REFERENCES `mon_hoc` (`ma_monhoc`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD CONSTRAINT `pk_giangvien_taikhoan_magv` FOREIGN KEY (`ma_gv`) REFERENCES `giang_vien` (`ma_gv`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `thong_bao`
--
ALTER TABLE `thong_bao`
  ADD CONSTRAINT `pk_taikhoan_thongbao_id` FOREIGN KEY (`ma_nguoinhan`) REFERENCES `tai_khoan` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
--
-- Cơ sở dữ liệu: `student_score`
--
CREATE DATABASE IF NOT EXISTS `student_score` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `student_score`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department_id` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_classes_department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `classes`
--

INSERT INTO `classes` (`id`, `name`, `department_id`) VALUES
(1, 'Lop thay vinh chieu thu 4 AI', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_departments_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Công nghệ thông tin', '2024-03-12 23:25:52.848', '2024-03-12 23:25:52.848', '2024-03-12 23:26:35.229'),
(2, 'Kinh tế', '2024-03-12 23:25:38.684', '2024-03-12 23:25:38.684', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` varchar(25) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_day` datetime(3) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `class_id` tinyint NOT NULL,
  `department_id` tinyint NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_students_email` (`email`),
  UNIQUE KEY `uni_students_phone` (`phone`),
  KEY `idx_students_class_id` (`class_id`),
  KEY `idx_students_department_id` (`department_id`),
  KEY `idx_students_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `birth_day`, `gender`, `email`, `phone`, `address`, `class_id`, `department_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('DH01004940', 'mai', 'phuong', '2014-03-19 00:50:55.000', 1, 'maivu@gmail.com', '0352008976', '', 1, 1, '2024-03-14 22:16:41.473', '2024-03-14 22:16:41.473', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `credits` bigint NOT NULL,
  `process_percentage` tinyint DEFAULT NULL,
  `midterm_percentage` tinyint NOT NULL,
  `final_percentage` tinyint NOT NULL,
  `department_id` tinyint NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_subjects_department_id` (`department_id`),
  KEY `idx_subjects_deleted_at` (`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `credits`, `process_percentage`, `midterm_percentage`, `final_percentage`, `department_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
('CS03012', 'Đồ án kinh tế học', 2, 1, 40, 60, 2, '2024-03-13 00:37:39.261', '2024-03-13 00:37:39.261', NULL),
('CS03014', 'Đồ án tin học', 2, 0, 40, 0, 1, '2024-03-12 23:26:20.662', '2024-03-12 23:26:20.662', NULL),
('CS178412', 'Đồ án kinh tế học 123 ', 2, 3, 40, 60, 2, '2024-03-13 01:43:29.557', '2024-03-13 01:43:29.557', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` varchar(25) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `birth_day` datetime(3) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `department_id` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_teachers_deleted_at` (`deleted_at`),
  KEY `idx_teachers_department_id` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `birth_day`, `email`, `phone`, `address`, `degree`, `created_at`, `updated_at`, `deleted_at`, `department_id`) VALUES
('test', 'test', '2014-03-19 00:50:55.000', 'a.nguyenvan.teacher.stu.edu.vn', '0344556677', 'pho 1 nguyen binh khiem 23 23 ', 'Thac si cong nghe thong tin', NULL, NULL, NULL, 2),
('test11', 'nguyen van a 1', '2014-02-19 00:50:55.000', '1nguyenvana@gmail.com', '03345678921', '891 vo gioi tru 1, kp 2 , q8 , tphcm', 'giao su 12', '2024-03-13 00:55:34.097', '2024-03-13 01:02:34.392', '2024-03-13 01:02:50.323', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `teacher_subjects`
--

DROP TABLE IF EXISTS `teacher_subjects`;
CREATE TABLE IF NOT EXISTS `teacher_subjects` (
  `teacher_id` varchar(25) NOT NULL,
  `subject_id` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_id`,`subject_id`),
  KEY `fk_teacher_subjects_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transcripts`
--

DROP TABLE IF EXISTS `transcripts`;
CREATE TABLE IF NOT EXISTS `transcripts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `process_score` double DEFAULT NULL,
  `midterm_score` double DEFAULT NULL,
  `final_score` double DEFAULT NULL,
  `subject_id` varchar(50) DEFAULT NULL,
  `student_id` varchar(25) DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_transcripts_subject_id` (`subject_id`),
  KEY `idx_transcripts_student_id` (`student_id`),
  KEY `idx_transcripts_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `transcripts`
--

INSERT INTO `transcripts` (`id`, `process_score`, `midterm_score`, `final_score`, `subject_id`, `student_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 10, 10, 'CS03012', 'DH01004940', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_users_user_name` (`user_name`),
  KEY `idx_users_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test', 'test', 'test', '$2a$11$NZ7nKav2giONO6xficW78.JjsWcZxTymgENLAMMCJBH3Qrqiic906', '2024-03-12 23:23:55.515', '2024-03-12 23:23:55.515', NULL);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `fk_departments_classes` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Các ràng buộc cho bảng `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_classes_students` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `fk_departments_students` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Các ràng buộc cho bảng `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_departments_subjects` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Các ràng buộc cho bảng `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_departments_teachers` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Các ràng buộc cho bảng `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD CONSTRAINT `fk_teacher_subjects_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `fk_teacher_subjects_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`);

--
-- Các ràng buộc cho bảng `transcripts`
--
ALTER TABLE `transcripts`
  ADD CONSTRAINT `fk_students_transcripts` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `fk_subjects_transcripts` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
