﻿CREATE DATABASE QLBH_2021
USE QLBH_2021

SET DATEFORMAT DMY

---------------------------------------------
-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)

---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
-----------------------------------------------------
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.

SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC';

--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP FROM SANPHAM
WHERE DVT = 'CAY'
UNION 
SELECT MASP, TENSP FROM SANPHAM
WHERE DVT = 'QUYEN';

--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết 
--thúc là “01”.
SELECT MASP, TENSP FROM SANPHAM
WHERE MASP LIKE 'B%01';

--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 
--đến 40.000.

SELECT MASP, TENSP FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
	AND GIA BETWEEN 30000 AND 40000;

--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản 
--xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP FROM SANPHAM
WHERE (NUOCSX = 'TRUNG QUOC' OR NUOCSX = 'THAI LAN')
	AND GIA BETWEEN 30000 AND 40000

--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD = '1/1/2007'
UNION
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD = '2/1/2007'

--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và 
--trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC

--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

SELECT KH.MAKH, HOTEN
FROM KHACHHANG KH JOIN HOADON HD
	ON KH.MAKH = HD.MAKH
WHERE NGHD = '1/1/2007'

--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 
--28/10/2006.
SELECT SOHD, TRIGIA
FROM HOADON HD JOIN NHANVIEN NV
	ON HD.MANV = NV.MANV
WHERE HOTEN = 'NGUYEN VAN B'
	AND NGHD = '10/28/2006'

--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” 
--mua trong tháng 10/2006.

SELECT SP.MASP, TENSP
FROM (((KHACHHANG KH JOIN HOADON HD
	ON KH.MAKH = HD.MAKH ) JOIN CTHD 
	ON HD.SOHD = CTHD.SOHD ) JOIN SANPHAM SP
	ON CTHD.MASP = SP.MASP )
WHERE KH.HOTEN = 'NGUYEN VAN AN'
	AND (MONTH (NGHD) = 10 AND YEAR(NGHD) = 2006)



--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT SOHD
FROM CTHD 
WHERE MASP = 'BB01' OR MASP = 'BB02'

--12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm 
--mua với số lượng từ 10 đến 20.
SELECT SOHD
FROM CTHD 
WHERE MASP = 'BB01' OR MASP = 'BB02'
	AND SL BETWEEN 10 AND 20

--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản 
--phẩm mua với số lượng từ 10 đến 20.

SELECT SOHD
FROM CTHD 
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
INTERSECT 
SELECT SOHD
FROM CTHD 
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản 
--phẩm được bán ra trong ngày 1/1/2007.

SELECT SP.MASP, TENSP 
FROM (SANPHAM SP LEFT JOIN CTHD ON SP.MASP = CTHD.MASP )
		LEFT JOIN HOADON HD ON CTHD.SOHD = HD.SOHD
WHERE NUOCSX = 'Trung Quoc'
	OR NGHD = '1/1/2007';
--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.

SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT DISTINCT MASP FROM CTHD)
--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.

SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP 
					FROM HOADON HD JOIN CTHD
					ON HD.SOHD = CTHD.SOHD 
					WHERE YEAR(NGHD) = 2006);
--17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán 
--được trong năm 2006.

SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
	AND NOT EXISTS (SELECT DISTINCT CTHD.MASP
					FROM CTHD JOIN HOADON HD
					ON SANPHAM.MASP = CTHD.MASP 
					WHERE HD.SOHD = CTHD.SOHD
					AND YEAR(NGHD) = 2006);

--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.

SELECT HD.SOHD 
FROM HOADON HD
WHERE NOT EXISTS(SELECT *
					FROM SANPHAM SP
					WHERE NUOCSX = 'SINGAPORE'
					AND NOT EXISTS(SELECT * 
										FROM CTHD C
										WHERE C.SOHD = HD.SOHD
										AND C.MASP = SP.MASP))


--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản 
--xuất.


--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*)
FROM HOADON HD
WHERE MAKH NOT IN(SELECT MAKH
					FROM KHACHHANG KH
					WHERE KH.MAKH = HD.MAKH)
--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.

SELECT COUNT(DISTINCT MASP)
FROM CTHD JOIN HOADON HD
ON CTHD.SOHD = HD.SOHD
WHERE YEAR(NGHD) = 2006

--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?

SELECT MAX(TRIGIA) AS MAX, MIN(TRIGIA) AS MIN
FROM HOADON

--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?

SELECT AVG(TRIGIA) TB
FROM HOADON

--24. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006

--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.

SELECT SOHD
FROM HOADON
WHERE TRIGIA = (SELECT MAX(TRIGIA)
				FROM HOADON)

--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT HOTEN
FROM KHACHHANG KH JOIN HOADON HD
ON KH.MAKH = HD.MAKH 
AND SOHD = (SELECT SOHD
			FROM HOADON
			WHERE TRIGIA = (SELECT MAX(TRIGIA)
							FROM HOADON))
--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm 
--dần.
SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC

--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao 
--nhất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (SELECT DISTINCT TOP 3 GIA
			  FROM SANPHAM
			  ORDER BY GIA DESC)
--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 
--trong 3 mức giá cao nhất (của tất cả các sản phẩm).

SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'THAI LAN' AND GIA IN (SELECT DISTINCT TOP 3 GIA
										FROM SANPHAM
										ORDER BY GIA DESC)
--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 
--trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).

SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (SELECT DISTINCT TOP 3 GIA
										FROM SANPHAM
										WHERE NUOCSX = 'TRUNG QUOC'
										ORDER BY GIA DESC)

--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).

SELECT TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC

--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(DISTINCT MASP)
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'

--33. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSOSANPHAM
FROM SANPHAM
GROUP BY NUOCSX

--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.

SELECT NUOCSX, MAX(GIA) AS MAX, MIN(GIA) AS MIN, AVG(GIA) AS AVG
FROM SANPHAM
GROUP BY NUOCSX

--35. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
GROUP BY NGHD

--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.

SELECT MASP, COUNT(DISTINCT MASP) AS TONGSO
FROM SANPHAM
WHERE MASP IN(SELECT MASP
				FROM CTHD JOIN HOADON HD
				ON CTHD.SOHD = HD.SOHD
				WHERE MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006)
GROUP BY MASP

--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)

--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
				FROM CTHD
				WHERE SL >= 4)

--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT *
FROM HOADON
WHERE SOHD IN(SELECT SOHD
				FROM CTHD JOIN SANPHAM SP
				ON CTHD.MASP = SP.MASP
				WHERE NUOCSX = 'VIET NAM' AND SL >= 3)
--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.

SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE MAKH = (SELECT TOP 1 MAKH
				FROM HOADON
				GROUP BY MAKH
				ORDER BY COUNT(DISTINCT SOHD) DESC)

--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?

SELECT TOP 1 MONTH(NGHD) AS THANG_DOANHSO_MAX
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC

--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP = (SELECT TOP 1 MASP
FROM CTHD
GROUP BY MASP
ORDER BY SUM(SL) ASC)

--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
--44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.