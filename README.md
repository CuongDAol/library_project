# 📚 Dự Án SQL: Hệ Thống Quản Lý Thư Viện
> Tác giả: **Bùi Mạnh Cường **  
> Thực hiện: Sinh viên  
> Email: buipg0801@gmail.com

Đây là một dự án thực hành SQL nhằm xây dựng hệ thống quản lý thư viện đơn giản. Dự án bao gồm thiết kế cơ sở dữ liệu, chèn dữ liệu mẫu và thực hiện các truy vấn từ cơ bản đến nâng cao.

## 📄 Nội Dung File

- `library_project.sql`: Chứa toàn bộ mã SQL để:
  - Tạo cơ sở dữ liệu và các bảng (`doc_gia`, `tac_gia`, `sach`, `the_loai`, `muon_tra`)
  - Thêm dữ liệu mẫu thực tế
  - Thực hiện các truy vấn dữ liệu (SELECT, JOIN, GROUP BY, HAVING...)

## 🧱 Các Bảng Cơ Bản

| Tên Bảng     | Mô Tả                          |
|--------------|---------------------------------|
| `doc_gia`    | Thông tin độc giả              |
| `tac_gia`    | Thông tin tác giả              |
| `the_loai`   | Thể loại sách                  |
| `sach`       | Thông tin chi tiết của sách    |
| `muon_tra`   | Lịch sử mượn – trả sách        |

## 🔍 Một Số Truy Vấn Tiêu Biểu

- Liệt kê các sách có giá > 50,000đ
- Thống kê số sách theo thể loại
- Tìm độc giả mượn nhiều sách nhất
- Danh sách sách chưa được trả
- Tổng tiền phạt của từng độc giả

## 🛠 Kỹ Năng Sử Dụng

- Thiết kế cơ sở dữ liệu quan hệ
- Ràng buộc khóa ngoại (foreign key)
- Tối ưu truy vấn với chỉ mục (index)
- Truy vấn kết hợp nhiều bảng (JOIN)
- Tổng hợp và thống kê với `GROUP BY`, `HAVING`, `COUNT`, `SUM`...

## ✅ Hướng Dẫn Sử Dụng

1. Mở file `library_project.sql` trong MySQL Workbench (hoặc công cụ tương đương)
2. Chạy toàn bộ script để tạo dữ liệu
3. Thực hiện các truy vấn mẫu để tìm hiểu, phân tích dữ liệu

---

