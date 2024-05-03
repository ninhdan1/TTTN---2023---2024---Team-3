<?php
require_once __DIR__ . '/../../DB/DBConnect.php';
require_once __DIR__ . '/../../model/User.php';
session_start();
if (!isset($_SESSION['login'])) {
    header("Location: ../login.php");
    exit();
}
$conn = new DBConnect();
$model = new User($conn->getConnection());
$userModel = $model->getTeacherNoUser();
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
                            <p>Thêm tài khoản</p>
                        </div>
                    </div>
                    <div id="password-form">
                        <form action="../../controller/UserController.php?action=insert" method="post">

                            <label for="username">Nhập tài khoản</label>
                            <input type="text" name="username" id="username" value="<?= isset($firstrow['ma_gv']) ? $firstrow['ma_gv'] : '' ?>"><br>
                            <p class="error-p">
                                <?php
                                if (isset($_SESSION["error_username"])) {
                                    echo $_SESSION["error_username"];
                                    unset($_SESSION["error_username"]);
                                }
                                ?>
                            </p>
                            <label for="password">Nhập mật khẩu</label>
                            <input type="password" name="password" id="password"><br>
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
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select><br>
                            <label for="">Trạng thái hoạt động</label>
                            <select name="status" id="status">
                                <option value="1">Hoạt động</option>
                                <option value="0">Không hoạt động</option>
                            </select><br>
                            <label for="giangvien">Giảng viên</label>
                            <select name="giangvien" id="giangvien" <?php echo $_SESSION['khoa']?>>
                                <option value="">Vui lòng chọn giảng viên</option>
                                <?php
                                foreach ($userModel as $user) {
                                ?>
                                    <option value="<?php echo $user['ma_gv'] ?>">
                                        <?php echo $user['ho_lot_gv'] . ' ' . $user['ten_gv']; ?></option>
                                <?php
                                }
                                ?>
                            </select>
                            <p class="error-p">
                                <?php
                                if (isset($_SESSION["thongbao"])) {
                                    echo $_SESSION["thongbao"];
                                    unset($_SESSION["thongbao"]);
                                }
                                ?>
                            </p>
                            <br>
                            <button type="submit" name="submit" id="loginButton" class="btn btn-primary">Thêm</button>
                            <?php

                            ?>
                        </form>
                       <script src="../../js/them_tk.js"></script>
                        <script>
                            document.addEventListener("click", function() {
                                const giangvienSelect = document.getElementById("giangvien");
                                const usernameInput = document.getElementById("username");
                                giangvienSelect.addEventListener("change", function() {
                                    usernameInput.value = this.value;
                                });
                            });
                        </script>
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