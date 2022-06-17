CREATE DATABASE midterm_CSDL;
CREATE TABLE GiangVien(
	GV# VARCHAR(10) NOT NULL PRIMARY KEY,
	HoTen NVARCHAR(30),
	NamSinh INT,
	DiaChi NVARCHAR(50)
)

INSERT INTO Giangvien
VALUES
  ('GV001','Wade Foley',1953,'584-9675 Ultricies'),
  ('GV002','Grace Potts',1989,'P.O. Box 480, 148 Risus'),
  ('GV003','Odessa Vinson',1960,'7987 Laoreet, Rd.'),
  ('GV004','Gloria Underwood',1991,'Ap #534-2946 Augue'),
  ('GV005','Brett Guy',1979,'731-1588 Urna. St.'),
  ('GV006','Ariel Moran',1989,'Ap #337-6610 Est Av.'),
  ('GV007','Maxwell Brock',1963,'174-9963 Sem. Avenue'),
  ('GV008','Jermaine Bell',1993,'Ap #289-5611 Eu Ave'),
  ('GV009','Silas Hyde',1966,'Ap #932-1316 Dictum Av.'),
  ('GV010','Lucy Trevino',1977,'P.O. Box 226, 3551 Et Av.'),
  ('GV011',N'Lê Văn A',1953,N'Hà Nội'),
  ('GV012',N'Nguyễn Văn B',1989,N'Nam Định');

CREATE TABLE SinhVien (
    
    [SV#] INTEGER PRIMARY KEY,
    [TenSV] NVARCHAR(30) NULL,
    [NgaySinh] DATE NULL,
    [QueQuan] NVARCHAR(20) NULL,
    [Lop] VARCHAR(20) NULL,
);

INSERT INTO SinhVien (SV#,TenSV,NgaySinh,QueQuan,Lop)
VALUES
  (1,N'Tamekah Nguyễn','1-Sep-1990','Berlin','12B'),
  (2,N'Pascale Nguyễn','25-May-1990','Yogyakarta','3C'),
  (3,N'Valentine Nguyễn','29-Aug-1996','Abergele','4D'),
  (4,N'Rinah Nguyễn','19-May-1999','Kalisz','4C'),
  (5,N'Moses Nguyễn','24-Aug-1994','Catemu','5B'),
  (6,N'Ava Nguyễn','2-Apr-1997','Châteauroux','6Z'),
  (7,N'Katelyn Kỳ','18-Nov-1988','Whakatane','8H'),
  (8,N'Naida Nguyễn','19-Feb-1994','Torrevecchia Teatina','6J'),
  (9,N'Dorian Nguyễn','11-Jan-1993','Whyalla','4D'),
  (10,N'Melvin Nguyễn','10-Oct-1993','Piedecuesta','8D'),
  (11,N'Lamar Nguyễn','12-Aug-1994','Port Harcourt','9C'),
  (12,N'Chancellor Nguyễn','12-Mar-1991','Uruapan','7A'),
  (13,N'Jena Nguyễn','25-Mar-2001','Hammerfest','8B'),
  (14,N'Quynn Nguyễn','22-Apr-1996','Navojoa','8B'),
  (15,N'Jin Nguyễn','24-Sep-1998','Shillong','4D'),
  (16,N'Nguyễn Xuân Dũng','1-Sep-1990',N'Hà Nam','12B'),
  (17,N'Ngô Đình N','25-May-1990',N'Phú Yên','3C'),
  (18,N'Nguyễn Trọng P','29-Aug-1996',N'Cà Mau','4D'),
  (19,N'Lê Đình C','19-May-1999',N'Hải Phòng','C'),
  (20,N'Nguyễn Văn Nam','29-Aug-1996',N'Bắc Giang','4D');

CREATE TABLE DETAI (
      DT# INT PRIMARY KEY,
      TenDT NVARCHAR(50),
      TheLoai NVARCHAR(20)
);

INSERT INTO [DETAI] (DT#,TenDT,TheLoai)
VALUES
  (1,'Nec Inc.','Literary'),
  (2,'Elit Pharetra Ut Incorporated','Al'),
  (3,'Sapien LLC','BigData'),
  (4,'Varius Et Incorporated','Literary'),
  (5,'Nulla Eget Metus Incorporated','Al'),
  (6,'Quisque Varius Associates','Nihonnobunka'),
  (7,'Sodales Mauris Associates','Mathematic'),
  (8,'Lorem Eget Industries','IT'),
  (9,'Nec Quam Ltd','Nihonnobunka'),
  (10,'Lectus Incorporated','IT'),
  (11,'Nec ABC Inc.',N'Ứng dụng'),
  (12,'Pharetra Ut Incorporated',N'Ứng dụng');

CREATE TABLE HuongDan (
    [GV#] VARCHAR(10) NOT NULL,
    [DT#] INTEGER NOT NULL,
    [SV#] INTEGER NOT NULL,
    [NamThucHien] INTEGER NULL,
    [KetQua] FLOAT NOT NULL,
);

ALTER TABLE HuongDan
ADD CONSTRAINT GV#
 FOREIGN KEY (GV#)
 REFERENCES GiangVien (GV#);

ALTER TABLE HuongDan
ADD CONSTRAINT DT#
 FOREIGN KEY (DT#)
 REFERENCES DeTai (DT#);

ALTER TABLE HuongDan
ADD CONSTRAINT SV#
 FOREIGN KEY (SV#)
 REFERENCES SinhVien (SV#);

INSERT INTO [HuongDan] (GV#,DT#,SV#,NamThucHien,KetQua)
VALUES
  ('GV008',9,1,1944,6.5),
  ('GV002',6,1,1975,6.5),
  ('GV006',8,4,1962,7.5),
  ('GV001',3,5,1989,8.0),
  ('GV008',5,7,2010,5.0),
  ('GV005',5,3,1905,10),
  ('GV009',9,10,2005,4.5),
  ('GV002',7,11,1978,8.5),
  ('GV009',5,11,2012,9.5),
  ('GV004',1,10,2013,7.5),
  ('GV003',6,4,1949,3.0),
  ('GV005',8,8,2009,2.0),
  ('GV001',8,7,1903,5.5),
  ('GV007',1,4,1909,6.5),
  ('GV005',6,11,1981,7.5),
  ('GV002',4,7,1933,9.0),
  ('GV009',4,14,1923,10.0),
  ('GV005',5,5,1963,3.0),
  ('GV003',6,10,1952,9.0),
  ('GV002',2,2,1903,6.5),
  ('GV012',8,20,1944,6.5),
  ('GV011',6,20,1975,6.5),
  ('GV012',8,19,1962,7.5),
  ('GV001',3,15,1989,8.0);

--Yêu cầu 2:
/*Thông tin giảng viên có mã GV001*/
SELECT * FROM GiangVien
WHERE GV# = 'GV001';

/*Số đề tài thuộc thể loại ứng dụng*/
SELECT COUNT(TheLoai)
FROM DeTai
WHERE TheLoai = N'Ứng dụng';

 /*ĐƯA RA ĐỀ NÀY CHƯA CÓ SINH VIÊN NÀO THỰC HIỆN*/
  SELECT TenDT FROM DeTai
  EXCEPT
  SELECT TenDT FROM DeTai, HuongDan WHERE DeTai.DT# = HuongDan.DT#;

  /*THAY ĐỔI NGÀY SINH CHÍNH XÁC CHO NGUYỄN XUÂN DŨNG*/
  INSERT INTO SinhVien(SV#,TenSV,NgaySinh,QueQuan,Lop) VALUES (20,N'Nguyễn Xuân Dũng','12-12-1991',N'Hà Nam','12B')
  UPDATE SinhVien
  SET NgaySinh = '12-11-1991' WHERE TenSV = N'Nguyễn Xuân Dũng' AND QueQuan = N'Hà Nam';

/*Vì lý do khách quan, sinh viên : "Nguyễn Văn Nam", quê quán "Bắc Giang" đã xin thôi học.Hãy xoá toàn bộ thông tin liên quan đến sinh viên này.*/
 DELETE  FROM [HuongDan]
   WHERE SV# IN
   (SELECT SinhVien.SV# FROM SinhVien JOIN HuongDan ON SinhVien.SV# = HuongDan.SV#
   WHERE SinhVien.TenSV =N'Nguyễn Văn Nam' AND SinhVien.QueQuan=N'Bắc Giang');

   DELETE FROM [SinhVien]
   WHERE TenSV=N'Nguyễn Văn Nam' AND QueQuan=N'Bắc Giang';


/*Tạo view để đưa ra các thông tin về đề tài hướng dẫn sinh viên của các giảng viên.*/
 CREATE VIEW detaihuongdan AS
SELECT DeTai.DT#,DeTai.TenDT, DeTai.TheLoai,HuongDan.NamThucHien
FROM DeTai JOIN HuongDan ON DeTai.DT#= HuongDan.DT#;

SELECT * FROM detaihuongdan;

/* Sử dụng view vừa tạo cho biết thông tin các đề tài hướng dẫn năm 2022.*/
INSERT INTO [HuongDan] (GV#,DT#,SV#,NamThucHien,KetQua)
VALUES
  ('GV003',9,1,2022,6.5),
  ('GV001',6,1,1975,6.5);

 SELECT *
 FROM detaihuongdan
 WHERE  detaihuongdan.NamThucHien = '2022';

