<?php
require_once "../DB/DBConnect.php";
require_once "../model/User.php";

require_once __DIR__ . '/../Helper/ConfigHelper.php';
require_once  HELPER_PATH . 'ResponseHelper.php';
session_start();
class UserController
{
  private $model;

  private $conn;
  private $responseHelper;

  public function __construct()
  {
    $this->conn = (new DBConnect())->getConnection();
    $this->model = new User($this->conn);
    $this->responseHelper = new ResponseHelper();
  }
  public function login()
  {
    $this->checkLoginInfo();
    $this->getUser();
  }

  //Kiem tra TK va MK
  private function checkLoginInfo()
  {
    $username = isset($_POST["username"]) ? $_POST["username"] : "";
    $password = isset($_POST["password"]) ? $_POST["password"] : "";
    if ($username == "") {
      $_SESSION["thongbao"] = "Tài khoản hoặc mật khẩu không đúng";
      header("Location: ../index.php");
      exit();
    }
    if ($password == "") {
      $_SESSION["thongbao"] = "Tài khoản hoặc mật khẩu không đúng";
      header("Location: ../index.php");
      exit();
    }
    if (strlen($username) < 10  && strlen($username) > 15) {
      $_SESSION["thongbao"] = "Tài khoản hoặc mật khẩu không đúng";
      header("Location: ../index.php");
      exit();
    }
    if (strlen($password) >= 10  && strlen($password) <= 15) {
      if (preg_match('/[A-Z]/', $password) && preg_match('/[^\w]/', $password)) {
        return true;
      } else {
        $_SESSION["thongbao"] = "Tài khoản hoặc mật khẩu không đúng";
        header("Location: ../index.php");
        exit();
      }
    } else {
      $_SESSION["thongbao"] = "Tài khoản hoặc mật khẩu không đúng";
      header("Location: ../index.php");
      exit();
    }
  }

  //Lay thong tin user
  private function getUser()
  {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $password = md5($password);
    $user = $this->model->selectUserID('tai_khoan', '*', 'username = ? AND password = ?', [$username, $password]);
    if ($user) {
      if ($user['is_active'] == 0) {
        $_SESSION["thongbao"] = "Tài khoản đã bị khóa";
        header("Location: ../view/login.php");
        exit();
      }

      if ($user['role'] == 'admin') {
        $_SESSION['id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role'];
        $_SESSION['login'] = true;
        header("Location: ../view/admin/layout-admin.php");
        exit();
      } elseif ($user['role'] == 'user' && $user['ma_gv'] !== null) {
        $_SESSION['id'] = $user['id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['role'] = $user['role'];
        $_SESSION['ma_gv'] = $user['ma_gv'];
        $_SESSION['login'] = true;
        header("Location: ../view/thong-ke-canhan.php");
        exit();
      } else {
        $_SESSION['thongbao'] = 'Tài khoản hoặc mật khẩu không đúng';
        header("Location: ../view/login.php");
        exit();
      }
    } else {
      $_SESSION['thongbao'] = 'Tài khoản hoặc mật khẩu không đúng';
      header("Location: ../view/login.php");
      exit();
    }
  }
  public function changePassword()
  {
    $id = $_POST['id'];
    $newPassword = $_POST['newPassword'];
    $oldPassword = $_POST['oldPassword'];
    $re_new_password = $_POST['re_new_password'];

    if ($newPassword == "" || $oldPassword == "" || $re_new_password == "") {
      $message = "Vui lòng nhập đầy đủ thông tin";
    } elseif (strlen($oldPassword) < 10 || strlen($oldPassword) > 30) {
      $message = "Mật khẩu cũ không đúng";
    } elseif (strlen($newPassword) < 10 || strlen($newPassword) > 30) {
      $message = "Mật khẩu mới không đúng";
    } elseif (strlen($re_new_password) < 10 || strlen($re_new_password) > 30) {
      $message = "Mật khẩu nhập lại không đúng";
    } elseif (!preg_match('/[A-Z]/', $newPassword) || !preg_match('/[^\w]/', $newPassword)) {
      $message = "Mật khẩu mới phải có ít nhất một chữ hoa và một ký tự đặc biệt";
    } elseif ($newPassword == $oldPassword) {
      $message = "Mật khẩu mới không được trùng với mật khẩu cũ";
    } elseif ($newPassword != $re_new_password) {
      $message = "Mật khẩu nhập lại không đúng";
    }
    if (isset($message)) {
      $_SESSION["thongbao"] = $message;
      header("Location: ../view/change-password.php");

      exit();
    } else {
      $table = 'tai_khoan';
      $data = [
        'password' => md5($newPassword),
      ];
      $condition = 'id = ?';
      $result = $this->model->update($table, $data, $condition, $id);
      if ($result) {
        header("Location: ../../index.php");
        exit();
      } else {
        $_SESSION["thongbao"] = "Mật khẩu cũ không đúng";
        header("Location: ../view/change-password.php");
        exit();
      }
    }
  }

  public function changePasswordUser()
  {
    $id = $_POST['id'];
    $newPassword = $_POST['newPassword'];
    $oldPassword = $_POST['oldPassword'];
    $re_new_password = $_POST['re_new_password'];

    if ($newPassword == "" || $oldPassword == "" || $re_new_password == "") {
      $message = "Vui lòng nhập đầy đủ thông tin";
    } elseif (strlen($oldPassword) < 10 || strlen($oldPassword) > 30) {
      $message = "Mật khẩu cũ không đúng";
    } elseif (strlen($newPassword) < 10 || strlen($newPassword) > 30) {
      $message = "Mật khẩu mới không đúng";
    } elseif (strlen($re_new_password) < 10 || strlen($re_new_password) > 30) {
      $message = "Mật khẩu nhập lại không đúng";
    } elseif (!preg_match('/[A-Z]/', $newPassword) || !preg_match('/[^\w]/', $newPassword)) {
      $message = "Mật khẩu mới phải có ít nhất một chữ hoa và một ký tự đặc biệt";
    } elseif ($newPassword == $oldPassword) {
      $message = "Mật khẩu mới không được trùng với mật khẩu cũ";
    } elseif ($newPassword != $re_new_password) {
      $message = "Mật khẩu nhập lại không đúng";
    }
    if (isset($message)) {
      $_SESSION["thongbao"] = $message;
      header("Location: ../view/change-password-user.php");

      exit();
    } else {
      $table = 'tai_khoan';
      $data = [
        'password' => md5($newPassword),
      ];
      $condition = 'id = ?';
      $result = $this->model->update($table, $data, $condition, $id);
      if ($result) {
        header("Location: ../../index.php");
        exit();
      } else {
        $_SESSION["thongbao"] = "Mật khẩu cũ không đúng";
        header("Location: ../view/change-password-user.php");
        exit();
      }
    }
  }


  public function getAccountbyMagv()
  {
    $ma_gv = $_SESSION['ma_gv'] ?? null;
    $data = $this->model->getAccountByMagv($ma_gv);
    return $this->responseHelper->Response(true, "Lấy dữ liệu thành công!", $data);
  }
}
$userController = new UserController();
$action = isset($_GET['action']) ? $_GET['action'] : '';
switch ($action) {
  case 'login':
    $userController->login();
    break;
  case 'changePassword':
    $userController->changePassword();
    break;
  case 'changePasswordUser':
    $userController->changePasswordUser();
    break;
  case 'getAccountbyMagv':
    $userController->getAccountbyMagv();
    break;
  default:
    echo "Action không tồn tại!";
    break;
}
