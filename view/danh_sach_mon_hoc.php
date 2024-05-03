<?php
$content = '

<!-- Modal thêm môn học -->
<div class="modal fade" id="addMonHocModal" tabindex="-1" role="dialog" aria-labelledby="addMonHocModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addMonHocModalLabel">Thêm môn học mới</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addMonHocForm" method="post" action="../controller/DanhSachMonHocController.php?action=addMonHoc">
                    <div class="mb-3">
                        <label for="ma_monhoc" class="form-label">Mã môn học</label>
                        <input type="text" class="form-control" id="ma_monhoc" name="ma_monhoc" required>
                    </div>
                    <div class="mb-3">
                        <label for="ten_monhoc" class="form-label">Tên môn học</label>
                        <input type="text" class="form-control" id="ten_monhoc" name="ten_monhoc" required>
                    </div>
                    <div class="mb-3">
                        <label for="loai_monhoc" class="form-label">Loại môn học</label>
                        <input type="text" class="form-control" id="loai_monhoc" name="loai_monhoc" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Thêm môn học</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal sửa môn học -->
<div class="modal fade" id="editMonHocModal" tabindex="-1" role="dialog" aria-labelledby="editMonHocModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editMonHocModalLabel">Sửa thông tin môn học</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editMonHocForm" method="post" action="../controller/DanhSachMonHocController.php?action=editMonHoc">
                    <div class="mb-3">
                        <label for="ma_monhoc_edit" class="form-label">Mã môn học</label>
                        <input type="text" class="form-control" id="ma_monhoc_edit" name="ma_monhoc" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="ten_monhoc_edit" class="form-label">Tên môn học</label>
                        <input type="text" class="form-control" id="ten_monhoc_edit" name="ten_monhoc" required>
                    </div>
                    <div class="mb-3">
                        <label for="loai_monhoc_edit" class="form-label">Loại môn học</label>
                        <input type="text" class="form-control" id="loai_monhoc_edit" name="loai_monhoc" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Cập nhật môn học</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary"> Danh sách môn học</h6>
    </div>
    <div class="card-body">
        <div class="mb-3">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addMonHocModal">Thêm môn học</button>
        </div>
        <div class="table-responsive">
            <table id="monhocTable" class="table table-borderless table-hover">
                <thead>
                    <tr>
                        <th class="text-center">Mã môn học</th>
                        <th class="text-center">Tên môn học</th>
                        <th class="text-center">Loại môn học</th>
                        <th class="text-center">Thao tác</th>
                    </tr>
                </thead>
                <tbody>';
if (isset($data)) {
    foreach ($data as $item) {
        $content .= '
                    <tr>
                        <td class="text-center font-weight-bold ma_monhoc">' . $item['ma_monhoc'] . '</td>
                        <td class="text-center">' . $item['ten_monhoc'] . '</td>
                        <td class="text-center">' . $item['loai_monhoc'] . '</td>
                        <td class="text-center">
                            <button type="button" class="btn btn-primary" onclick="openEditModal(\'' . $item['ma_monhoc'] . '\', \'' . $item['ten_monhoc'] . '\', \'' . $item['loai_monhoc'] . '\')">Sửa</button>
                        </td>
                    </tr>';
    }
} else {
    $content .= '
                    <tr>
                        <td class="text-center" colspan="4">Không có dữ liệu</td>
                    </tr>';
}
$content .= '
                </tbody>
            </table>
        </div>
    </div>
</div>';
// Include file layout-admin.php
include '../view/admin/layout-admin.php';
?>

<script>
    function openEditModal(maMonHoc, tenMonHoc, loaiMonHoc) {
        // Đặt giá trị cho các trường input trong modal
        document.getElementById('ma_monhoc_edit').value = maMonHoc;
        document.getElementById('ten_monhoc_edit').value = tenMonHoc;
        document.getElementById('loai_monhoc_edit').value = loaiMonHoc;

        // Mở modal sửa môn học
        var editMonHocModal = new bootstrap.Modal(document.getElementById('editMonHocModal'));
        editMonHocModal.show();
    }
</script>
