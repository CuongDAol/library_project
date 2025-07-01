create database thu_vien;
use thu_vien;
/* Tạo bảng độc giả bao gồm các trường dữ liệu : 
Mã độc giả,họ tên,ngày sinh,địa chỉ,email,số điện thoại ngày đăng ký,hạn thẻ,trạng thái */

create table doc_gia(
ma_doc_gia int auto_increment primary key,
ho_ten varchar(100) not null,
ngay_sinh date,
dia_chi varchar(200),
email varchar(100) unique,
so_dien_thoai varchar(15),
ngay_dang_ky date not null,
han_the date,
trang_thai enum('Hoạt Động','Đã khóa','Hết hạn')
	default 'Hoạt động'
);

select *from doc_gia;
-- Tạo bảng tác giả 
create table tac_gia(
ma_tac_gia int auto_increment primary key,
ho_ten varchar(100) not null,
ngay_sinh date,
quoc_tich varchar(50),
gioi_thieu text
);
select*from tac_gia;
-- Tạo bảng thể loại
create table the_loai(
ma_the_loai int auto_increment primary key,
ten_the_loai varchar(50) not null,
mo_ta text
);
select *from the_loai;

-- Tạo bảng sách 
create table sach(
ma_sach int auto_increment primary key,
tieu_de varchar(200) not null,
ma_tac_gia int,
ma_the_loai int,
nha_xuat_ban varchar(100),
nam_xuat_ban int,
so_trang int,
gia_bia decimal(10,2),
so_luong_con int default 0,
tom_tat text,
foreign key(ma_tac_gia)
references tac_gia(ma_tac_gia),
foreign key(ma_the_loai) references the_loai(ma_the_loai)
);
select*from sach;

-- tạo bảng mượn trả
create table muon_tra(
ma_muon_tra int auto_increment primary key,
ma_doc_gia int,
ma_sach int,
ngay_muon date not null,
ngay_hen_tra date not null,
ngay_tra date,
tien_phat decimal(10,2)
default 0,
ghi_chu text,
foreign key(ma_doc_gia) references doc_gia(ma_doc_gia),
foreign key(ma_sach) references sach(ma_sach)
);
select*from muon_tra;

-- Tạo chỉ mục 
-- Tạo chỉ mục cho các cột thường xuyên tìm kiếm 
create index idx_doc_gia_ho_ten on doc_gia(ho_ten);

create index idx_sach_tieu_de on sach(tieu_de);

-- Tạo chỉ mục cho các cột tham gia join 
create index idx_muon_tra_ma_doc_gia on muon_tra(ma_doc_gia);

create index idx_muon_tra_ma_sach on muon_tra(ma_sach);


-- Tiến hành import dữ liệu vào database
-- Thêm dữ liệu vào bảng độc giả 
INSERT INTO doc_gia 
(ho_ten, ngay_sinh, dia_chi, email, so_dien_thoai, 
 ngay_dang_ky, han_the, trang_thai)
VALUES
('Nguyễn Văn An', '1990-05-15', 'Hà Nội', 
 'an.nguyen@example.com', '0901234567', 
 '2022-01-10', '2023-01-10', 'Hoạt động'),
('Trần Thị Bình', '1985-11-20', 'Hồ Chí Minh', 
 'binh.tran@example.com', '0912345678', 
 '2022-02-15', '2023-02-15', 'Hoạt động'),
('Lê Văn Cường', '1995-03-25', 'Đà Nẵng', 
 'cuong.le@example.com', '0923456789', 
 '2022-03-20', '2023-03-20', 'Hoạt động'),
('Phạm Thị Dung', '1988-07-30', 'Hải Phòng', 
 'dung.pham@example.com', '0934567890', 
 '2022-04-25', '2022-10-25', 'Hết hạn'),
('Hoàng Văn Em', '1992-09-12', 'Cần Thơ', 
 'em.hoang@example.com', '0945678901', 
 '2022-05-30', '2023-05-30', 'Đã khóa');
 select *from doc_gia;
 
 -- Thêm dữ liệu vào bảng tác giả
 INSERT INTO tac_gia 
(ho_ten, ngay_sinh, quoc_tich, gioi_thieu)
VALUES
('Nguyễn Nhật Ánh', '1955-05-07', 'Việt Nam', 
 'Nhà văn nổi tiếng với nhiều tác phẩm văn học thiếu nhi'),
('Paulo Coelho', '1947-08-24', 'Brazil', 
 'Tác giả của "Nhà giả kim" và nhiều tiểu thuyết nổi tiếng khác'),
('J.K. Rowling', '1965-07-31', 'Anh', 
 'Tác giả bộ truyện Harry Potter'),
('Haruki Murakami', '1949-01-12', 'Nhật Bản', 
 'Nhà văn với phong cách siêu thực đặc trưng'),
('Tô Hoài', '1920-09-27', 'Việt Nam', 
 'Nhà văn nổi tiếng với tác phẩm "Dế Mèn phiêu lưu ký"');
 select *from tac_gia;
 
 -- Thêm dữ liệu vào bảng thể loại
 INSERT INTO tac_gia 
(ho_ten, ngay_sinh, quoc_tich, gioi_thieu)
VALUES
('Nguyễn Nhật Ánh', '1955-05-07', 'Việt Nam', 
 'Nhà văn nổi tiếng với nhiều tác phẩm văn học thiếu nhi'),
('Paulo Coelho', '1947-08-24', 'Brazil', 
 'Tác giả của "Nhà giả kim" và nhiều tiểu thuyết nổi tiếng khác'),
('J.K. Rowling', '1965-07-31', 'Anh', 
 'Tác giả bộ truyện Harry Potter'),
('Haruki Murakami', '1949-01-12', 'Nhật Bản', 
 'Nhà văn với phong cách siêu thực đặc trưng'),
('Tô Hoài', '1920-09-27', 'Việt Nam', 
 'Nhà văn nổi tiếng với tác phẩm "Dế Mèn phiêu lưu ký"');

-- Thêm Dữ Liệu Vào Bảng Thể Loại

INSERT INTO the_loai 
(ten_the_loai, mo_ta)
VALUES
('Tiểu thuyết', 'Tác phẩm văn xuôi có tính chất hư cấu'),
('Khoa học viễn tưởng', 'Thể loại dựa trên những giả thuyết khoa học'),
('Văn học thiếu nhi', 'Sách dành cho độc giả trẻ em'),
('Trinh thám', 'Thể loại tập trung vào việc giải quyết các vụ án'),
('Kỹ năng sống', 'Sách hướng dẫn phát triển các kỹ năng cá nhân');
select*from the_loai;

-- Thêm dữ liệu vào bảng sách
INSERT INTO sach 
(tieu_de, ma_tac_gia, ma_the_loai, nha_xuat_ban, 
 nam_xuat_ban, so_trang, gia_bia, so_luong_con, tom_tat)
VALUES
('Cho tôi xin một vé đi tuổi thơ', 1, 3, 'NXB Trẻ', 
 2008, 208, 45000, 10, 'Tác phẩm nổi tiếng về tuổi thơ'),
('Nhà giả kim', 2, 1, 'NXB Văn học', 
 2013, 227, 65000, 5, 'Câu chuyện về hành trình đi tìm kho báu'),
('Harry Potter và Hòn đá Phù thủy', 3, 2, 'NXB Trẻ', 
 2016, 366, 100000, 8, 'Phần đầu tiên của bộ truyện Harry Potter'),
('Rừng Na Uy', 4, 1, 'NXB Hội Nhà Văn', 
 2006, 420, 90000, 3, 'Tiểu thuyết về tình yêu và mất mát'),
('Dế Mèn phiêu lưu ký', 5, 3, 'NXB Kim Đồng', 
 2016, 144, 30000, 15, 'Câu chuyện về cuộc phiêu lưu của chú Dế Mèn'),
('Biên niên ký chim vặn dây cót', 4, 2, 'NXB Hội Nhà Văn', 
 2019, 680, 150000, 2, 'Tiểu thuyết về thế giới song song'),
('Kính vạn hoa', 1, 3, 'NXB Trẻ', 
 2010, 250, 55000, 7, 'Bộ truyện về tuổi học trò'),
('Bí mật của một thiên tài', 2, 5, 'NXB Lao Động', 
 2018, 320, 85000, 4, 'Sách về phát triển bản thân');
 select*from sach;
 
 -- Thêm dữ liệu vào bảng mượn trả
 
 INSERT INTO muon_tra 
(ma_doc_gia, ma_sach, ngay_muon, ngay_hen_tra, 
 ngay_tra, tien_phat, ghi_chu)
VALUES
(1, 3, '2022-06-10', '2022-06-24', '2022-06-22', 0, 
 'Trả đúng hạn'),
(2, 1, '2022-06-15', '2022-06-29', '2022-07-05', 12000, 
 'Trả trễ 6 ngày'),
(3, 5, '2022-07-01', '2022-07-15', '2022-07-15', 0, 
 'Trả đúng hạn'),
(1, 7, '2022-07-10', '2022-07-24', '2022-07-20', 0, 
 'Trả đúng hạn'),
(2, 4, '2022-07-20', '2022-08-03', NULL, 0, 
 'Chưa trả sách'),
(3, 2, '2022-08-01', '2022-08-15', '2022-08-10', 0, 
 'Trả đúng hạn'),
(4, 6, '2022-08-05', '2022-08-19', '2022-08-25', 12000, 
 'Trả trễ 6 ngày'),
(1, 8, '2022-08-15', '2022-08-29', NULL, 0, 
 'Chưa trả sách');
 select *from muon_tra;
 
 
 -- Thực hành các truy vấn cơ bản 
 -- Liệt kê tất cả các độc giả
 select*from doc_gia;
 
 -- Liệt kê tất cả sách 
 select*from sach;
 
 -- Lấy thông tin chi tiết về sách 
 select ma_sach,tieu_de,nha_xuat_ban,nam_xuat_ban,gia_bia,so_luong_con from sach;
 
 -- Lọc dữ liệu với where
 
 -- Tìm sách có giá trên 50.000 đ 
 select tieu_de,nha_xuat_ban,gia_bia from sach where gia_bia>50000;
 
 -- Tìm độc giả có trạng thái 'Hoạt Động'
 select ho_ten,email,so_dien_thoai from doc_gia where trang_thai='Hoạt động';
 -- Tìm sách xuất bản sau năm 2010
 select tieu_de,nha_xuat_ban,nam_xuat_ban from sach where nam_xuat_ban>2010;
 
 -- Sắp xếp kết quả
 
 -- Sắp xếp theo giá giảm dần 
 select tieu_de,nha_xuat_ban,gia_bia from sach order by gia_bia desc;
 
 -- Sắp xếp độc giả theo ngày đăng ký 
 
 select ho_ten,ngay_dang_ky,han_the from doc_gia order by ngay_dang_ky ;
 
 -- Giới hạn kết quả
 -- Lấy 3 cuốn sách có giá cao nhất
 
select tieu_de,nha_xuat_ban,gia_bia from sach order by gia_bia desc limit 3;
-- Lấy 5 độc giả đăng ký gần đây nhất 
select ho_ten,ngay_dang_ky,han_the from doc_gia order by ngay_dang_ky desc limit 5;

-- Thực hành :Truy vấn nâng cao 
-- Truy vấn với join 
-- Lấy thông tin sách kèm tên tác giả
select s.ma_sach,s.tieu_de,t.ho_ten as tac_gia,s.nha_xuat_ban,s.nam_xuat_ban
from sach s join 
tac_gia t on s.ma_tac_gia =t.ma_tac_gia;

-- Lấy thông tin sách kèm thể loại
select s.ma_sach,s.tieu_de,tl.ten_the_loai,s.nha_xuat_ban,s.nam_xuat_ban from sach s
join the_loai tl on s.ma_the_loai =tl.ma_the_loai;

-- Truy vấn lịch sử mượn trả 
-- Lấy thông tin chi tiết về việc mượn trả 
select mt.ma_muon_tra,dg.ho_ten as ten_doc_gia,
s.tieu_de as ten_sach,
mt.ngay_muon,mt.ngay_hen_tra,mt.ngay_tra,mt.tien_phat
from muon_tra mt
join doc_gia dg on mt.ma_doc_gia=dg.ma_doc_gia
join sach s on mt.ma_sach=s.ma_sach;

-- Tìm tất cả các sách đang được mượn(Chưa trả)

select dg.ho_ten as ten_doc_gia,s.tieu_de as ten_sach,
mt.ngay_muon,mt.ngay_hen_tra from muon_tra mt
join doc_gia dg on mt.ma_doc_gia=dg.ma_doc_gia
join sach s on mt.ma_sach=s.ma_sach
where mt.ngay_tra is null;

-- Truy vấn với hàm tổng hợp 
-- Đếm số khách theo thể loại
select tl.ten_the_loai,count(s.ma_sach) as so_luong_sach from sach s
join the_loai tl on s.ma_the_loai=tl.ma_the_loai
group by tl.ten_the_loai
order by so_luong_sach desc;

-- Tính tổng tiền phạt theo độc giả 
select dg.ho_ten,sum(mt.tien_phat) as tong_tien_phat
from muon_tra mt 
join doc_gia dg on mt.ma_doc_gia=dg.ma_doc_gia
group by dg.ma_doc_gia,dg.ho_ten
having sum(mt.tien_phat)>0;

-- Truy vấn các hàm phức tạp
-- Thống kê số lượt mượn sách theo tác giả 
select dg.ho_ten as ten_tac_gia,
count(mt.ma_muon_tra) as so_luot_muon
from doc_gia dg
join muon_tra mt on dg.ma_doc_gia=mt.ma_doc_gia
group by dg.ma_doc_gia,dg.ho_ten
order by so_luot_muon desc
limit 1;

-- Tìm độc giả mượn nhiều sách nhất
select dg.ho_ten,count(mt.ma_muon_tra) as so_luot_muon
from doc_gia dg
join muon_tra mt on dg.ma_doc_gia=mt.ma_doc_gia 
group by dg.ma_doc_gia,dg.ho_ten
order by so_luot_muon desc
limit 1;