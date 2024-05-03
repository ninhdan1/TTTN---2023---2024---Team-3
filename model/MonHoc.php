<?php

require_once __DIR__ . '/../model/SQLQueries.php';

class MonHoc
{
    private $conn;
    private $SQLQueries;

    public function __construct($conn)
    {
        $this->conn = $conn;
        $this->SQLQueries = new SQLQueries($this->conn);
    }

    public function getDSMH_Model()
    {
        $query = "SELECT * FROM mon_hoc";
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    public function addMonHoc($maMonHoc, $tenMonHoc, $loaiMonHoc)
    {
        try {
            $sql = "INSERT INTO mon_hoc (ma_monhoc, ten_monhoc, loai_monhoc) VALUES (?, ?, ?)";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([$maMonHoc, $tenMonHoc, $loaiMonHoc]);
            return true;    
        } catch (PDOException $e) {
            echo "Lỗi cơ sở dữ liệu: " . $e->getMessage();
            return false;
        }
    }

    public function editMonHoc($maMonHoc, $tenMonHoc, $loaiMonHoc)
    {
        try {
            $sql = "UPDATE mon_hoc SET ten_monhoc = ?, loai_monhoc = ? WHERE ma_monhoc = ?";
            $stmt = $this->conn->prepare($sql);
            $stmt->execute([$tenMonHoc, $loaiMonHoc, $maMonHoc]);
            return true;
        } catch (PDOException $e) {
            echo "Lỗi cơ sở dữ liệu: " . $e->getMessage();
            return false;
        }
    }
}
?>
