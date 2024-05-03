<?php

require_once __DIR__ . '/../model/MonHoc.php';
require_once __DIR__ . '/../DB/DBConnect.php';

class DanhSachMonHocController
{
    private $model;
    private $conn;

    public function __construct()
    {
        $this->conn = (new DBConnect())->getConnection();
        $this->model = new MonHoc($this->conn);
    }

    public function index()
    {
        $data = $this->model->getDSMH_Model();
        require_once __DIR__ . '/../view/danh_sach_mon_hoc.php';
    }

    public function addMonHoc()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $maMonHoc = $_POST['ma_monhoc'] ?? null;
            $tenMonHoc = $_POST['ten_monhoc'] ?? null;
            $loaiMonHoc = $_POST['loai_monhoc'] ?? null;

            $result = $this->model->addMonHoc($maMonHoc, $tenMonHoc, $loaiMonHoc);
            if ($result) {
                header("Location: ../controller/DanhSachMonHocController.php?action=index");
                exit;
            } else {
                echo "Thêm môn học thất bại!";
            }
        }
    }

    public function getMonHoc()
    {
        if (isset($_GET['ma_monhoc'])) {
            $maMonHoc = $_GET['ma_monhoc'] ?? null;
            $monHoc = $this->model->getMonHocByID($maMonHoc);
            require_once __DIR__ . '/../view/edit_mon_hoc_modal.php';
        } else {
            echo "Không tìm thấy mã môn học!";
        }
    }

    public function editMonHoc()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $maMonHoc = $_POST['ma_monhoc'];
            $tenMonHoc = $_POST['ten_monhoc'];
            $loaiMonHoc = $_POST['loai_monhoc'];

            $result = $this->model->editMonHoc($maMonHoc, $tenMonHoc, $loaiMonHoc);
            if ($result) {
                header("Location: ../controller/DanhSachMonHocController.php?action=index");
                exit;
            } else {
                echo "Sửa môn học thất bại!";
            }
        }
    }
}

if (isset($_GET['action'])) {
    $action = $_GET['action'] ?? null;
    $controller = new DanhSachMonHocController();

    switch ($action) {
        case 'index':
            $controller->index();
            break;
        case 'addMonHoc':
            $controller->addMonHoc();
            break;
        case 'getMonHoc':
            $controller->getMonHoc();
            break;
        case 'editMonHoc':
            $controller->editMonHoc();
            break;
        default:
            echo "Hành động không hợp lệ!";
            break;
    }
} else {
    echo "Không tìm thấy hành động!";
}

?>
