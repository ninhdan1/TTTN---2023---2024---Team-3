<?php
require_once __DIR__ . '/../../DB/DBConnect.php';
require_once __DIR__ . '/../../model/User.php';
session_start();
if (!isset($_SESSION['login'])) {
    header("Location: ../login.php");
    exit();
}
$conn = (new DBConnect())->getConnection();
$user = new User($conn);
$id = $_GET['id'];
$table = "tai_khoan";
$columns = "*";
$condition = "id = ?";
$user = $user->selectUserID($table, $columns, $condition, [$id]);
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Custom fonts for this template-->
    <link href="../../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/them_sua.css">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php include "../components/sidebar.php"; ?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <?php include "../components/header.php"; ?>
                <!-- End of Topbar -->
                <a href="qly_taikhoan.php" class="btn btn-primary" style="position: relative; top: -10px; float: left; margin-left: 10px;">Trở lại</a>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div>
                        <div class="pass-text">
                            <p>Sửa tài khoản</p>
                        </div>
                    </div>
                    <div id="password-form">
                        <form action="../../controller/UserController.php?action=update" method="post">
                            <label for="username">Nhập tài khoản</label>
                            <input type="hidden" name="id" value="<?= $user['id'] ?>">
                            <p class="error-p">
                                <?php
                                if (isset($_SESSION["error_username"])) {
                                    echo $_SESSION["error_username"];
                                    unset($_SESSION["error_username"]);
                                }
                                ?>
                            </p>
                            <input type="text" name="username" id="username" value="<?= $user['username'] ?>"><br>
                            <label for="password">Nhập mật khẩu</label>
                            <input type="password" name="password" id="password" value="<?= $user['password'] ?>"><br>
                            <p class="error-p">
                                <?php
                                if (isset($_SESSION["error_password"])) {
                                    echo $_SESSION["error_password"];
                                    unset($_SESSION["error_password"]);
                                }
                                ?>
                            </p>
                            <label for="role">Chọn quyền</label>
                            <select name="role" id="role">
                                <option value="admin" <?php if ($user['role'] == 'admin') echo "selected" ?>>Admin</option>
                                <option value="user" <?php if ($user['role'] == 'user') echo "selected" ?>>User</option>
                            </select><br>
                            <label for="">Trạng thái hoạt động</label>
                            <select name="status" id="status">
                                <option value="1" <?php if ($user['is_active'] == 1) echo "selected" ?>>Hoạt động</option>
                                <option value="0" <?php if ($user['is_active'] == 0) echo "selected" ?>>Không hoạt động</option>
                            </select><br>
                            <input type="hidden" name="giangvien" value="<?= $user['ma_gv'] ?>">
                            <label for="giangvien">Giảng viên</label>
                            <select name="giangvien_disabled" id="giangvien" disabled>
                                <?php
                                $conn = (new DBConnect())->getConnection();
                                $userModel = new User($conn);
                                $teachers = $userModel->selectUser('giang_vien', '*');
                                foreach ($teachers as $teacher) {
                                    $selected = ($teacher['ma_gv'] == $user['ma_gv']) ? "selected" : "";
                                ?>
                                    <option value="<?= $teacher['ma_gv'] ?>" <?= $selected ?>>
                                        <?= $teacher['ten_gv'] ?>
                                    </option>
                                <?php
                                }
                                ?>
                            </select><br>
                            <button type="submit" name="submit" class="btn btn-primary" id="loginButton">Cập nhật</button>
                        </form>
                        <script src="../../js/login.js"></script>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <?php include "../components/footer.php"; ?>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="../../logout.php">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

</body>

</html>