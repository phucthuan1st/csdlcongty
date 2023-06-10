CONNECT COMPANY_PUBLIC/astrongpassword@localhost:1521/COMPANY;

-- xem cai dat chinh sach RBAC tai dong 248

CREATE TABLE NHANVIEN (
    MANV     VARCHAR2(10),
    TENNV    VARCHAR2(100),
    PHAI     VARCHAR2(10),
    NGAYSINH DATE,
    DIACHI   VARCHAR2(200),
    SODT     VARCHAR2(20),
    LUONG    NUMBER,
    PHUCAP   NUMBER,
    VAITRO   VARCHAR2(50),
    MANQL    VARCHAR2(10),
    PHG      VARCHAR2(10),
    CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
);

CREATE TABLE PHONGBAN (
    MAPB   VARCHAR2(10),
    TENPB  VARCHAR2(100),
    TRPHG  VARCHAR2(10),
    CONSTRAINT PK_PHONGBAN PRIMARY KEY (MAPB)
);

CREATE TABLE DEAN (
    MADA    VARCHAR2(10),
    TENDA   VARCHAR2(100),
    NGAYBD  DATE,
    PHONG   VARCHAR2(10),
    CONSTRAINT PK_DEAN PRIMARY KEY (MADA)
);

CREATE TABLE PHANCONG (
    MANV      VARCHAR2(10),
    MADA      VARCHAR2(10),
    THOIGIAN  DATE,
    CONSTRAINT PK_PHANCONG PRIMARY KEY (MANV, MADA)
);

-- ten DN la MANV, mat khau duoc ma hoa SHA-1
CREATE TABLE DANGNHAP (
    MANV     VARCHAR2(10),
    SALT     VARCHAR2(20),
    MATKHAU  VARCHAR2(40),
    CONSTRAINT PK_DANGNHAP PRIMARY KEY (MANV),
    CONSTRAINT FK_DANGNHAP_NHANVIEN FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV)
);


--------------------------------------------------------------------------
-- record cho bang PHONGBAN
INSERT INTO PHONGBAN (MAPB, TENPB, TRPHG)
VALUES ('PB001', 'Phòng A', 'NV002');

INSERT INTO PHONGBAN (MAPB, TENPB, TRPHG)
VALUES ('PB002', 'Phòng B', 'NV003');

INSERT INTO PHONGBAN (MAPB, TENPB, TRPHG)
VALUES ('PB003', 'Phòng C', 'NV005');

INSERT INTO PHONGBAN (MAPB, TENPB, TRPHG)
VALUES ('PB004', 'Phòng D', 'NV003');

INSERT INTO PHONGBAN (MAPB, TENPB, TRPHG)
VALUES ('PB005', 'Phòng E', 'NV004');

SELECT * FROM PHONGBAN;
-- --------------------------------------------------------------------------

-- record cho bang NHANVIEN
INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV001', 'John Smith', 'Male', TO_DATE('1990-01-15', 'YYYY-MM-DD'), '123 Main St', '1234567890', 5000, 1000, 'Nhân viên', 'NV004', 'PB001');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV002', 'Emily Johnson', 'Female', TO_DATE('1992-05-22', 'YYYY-MM-DD'), '456 Elm St', '5678901234', 6000, 1500, 'QL trực tiếp', 'NV003', 'PB002');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV003', 'William Davis', 'Male', TO_DATE('1987-08-10', 'YYYY-MM-DD'), '789 Oak St', '9876543210', 7000, 2000, 'Trưởng phòng', 'NV004', 'PB001');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV004', 'Olivia Wilson', 'Female', TO_DATE('1991-03-17', 'YYYY-MM-DD'), '234 Elm St', '1234567890', 5500, 1200, 'Tài chính', 'NV002', 'PB001');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV005', 'James Brown', 'Male', TO_DATE('1994-12-03', 'YYYY-MM-DD'), '567 Pine St', '5678901234', 4800, 950, 'Nhân sự', 'NV003', 'PB002');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV006', 'Emma Martinez', 'Female', TO_DATE('1993-07-28', 'YYYY-MM-DD'), '890 Oak St', '9876543210', 6500, 1400, 'Trưởng đề án', 'NV004', 'PB001');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV007', 'Michael Johnson', 'Male', TO_DATE('1989-04-05', 'YYYY-MM-DD'), '123 Main St', '1234567890', 5200, 1100, 'Ban giám đốc', 'NV002', 'PB003');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV008', 'Sophia Davis', 'Female', TO_DATE('1992-09-18', 'YYYY-MM-DD'), '456 Elm St', '5678901234', 6000, 1500, 'Nhân viên', 'NV003', 'PB003');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV009', 'Alexander Wilson', 'Male', TO_DATE('1988-02-12', 'YYYY-MM-DD'), '789 Oak St', '9876543210', 7000, 2000, 'QL trực tiếp', 'NV004', 'PB004');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV010', 'Isabella Smith', 'Female', TO_DATE('1993-11-07', 'YYYY-MM-DD'), '234 Elm St', '1234567890', 5500, 1200, 'Trưởng phòng', 'NV002', 'PB005');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV011', 'Mia Johnson', 'Female', TO_DATE('1990-06-25', 'YYYY-MM-DD'), '567 Pine St', '5678901234', 4800, 950, 'Nhân viên', 'NV005', 'PB003');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV012', 'Benjamin Davis', 'Male', TO_DATE('1991-09-14', 'YYYY-MM-DD'), '890 Oak St', '9876543210', 5500, 1200, 'QL trực tiếp', 'NV003', 'PB004');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV013', 'Charlotte Wilson', 'Female', TO_DATE('1994-02-28', 'YYYY-MM-DD'), '123 Elm St', '1234567890', 6000, 1500, 'Trưởng phòng', 'NV004', 'PB005');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV014', 'Henry Martinez', 'Male', TO_DATE('1992-07-11', 'YYYY-MM-DD'), '456 Oak St', '5678901234', 7000, 2000, 'Tài chính', 'NV002', 'PB003');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV015', 'Amelia Smith', 'Female', TO_DATE('1993-10-19', 'YYYY-MM-DD'), '789 Pine St', '9876543210', 5200, 1100, 'Nhân sự', 'NV003', 'PB004');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV016', 'Daniel Johnson', 'Male', TO_DATE('1991-05-07', 'YYYY-MM-DD'), '234 Elm St', '1234567890', 6500, 1400, 'Trưởng đề án', 'NV004', 'PB005');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV017', 'Sophia Davis', 'Female', TO_DATE('1990-08-22', 'YYYY-MM-DD'), '567 Oak St', '5678901234', 4800, 950, 'Nhân viên', 'NV005', 'PB003');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV018', 'Alexander Wilson', 'Male', TO_DATE('1994-01-05', 'YYYY-MM-DD'), '890 Pine St', '9876543210', 5500, 1200, 'QL trực tiếp', 'NV003', 'PB004');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV019', 'Isabella Smith', 'Female', TO_DATE('1992-06-18', 'YYYY-MM-DD'), '123 Elm St', '1234567890', 6000, 1500, 'Trưởng phòng', 'NV004', 'PB005');

INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP, VAITRO, MANQL, PHG)
VALUES ('NV020', 'William Davis', 'Male', TO_DATE('1993-09-14', 'YYYY-MM-DD'), '456 Oak St', '5678901234', 7000, 2000, 'Tài chính', 'NV002', 'PB003');

SELECT * FROM NHANVIEN;
-- ----------------------------------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------------------------------
-- record for DEAN
INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA001', 'Dean 1', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 'PB001');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA002', 'Dean 2', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 'PB002');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA003', 'Dean 3', TO_DATE('2022-03-01', 'YYYY-MM-DD'), 'PB003');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA004', 'Dean 4', TO_DATE('2022-04-01', 'YYYY-MM-DD'), 'PB004');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA005', 'Dean 5', TO_DATE('2022-05-01', 'YYYY-MM-DD'), 'PB005');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA006', 'Dean 6', TO_DATE('2022-06-01', 'YYYY-MM-DD'), 'PB001');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA007', 'Dean 7', TO_DATE('2022-07-01', 'YYYY-MM-DD'), 'PB002');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA008', 'Dean 8', TO_DATE('2022-08-01', 'YYYY-MM-DD'), 'PB003');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA009', 'Dean 9', TO_DATE('2022-09-01', 'YYYY-MM-DD'), 'PB004');

INSERT INTO DEAN (MADA, TENDA, NGAYBD, PHONG)
VALUES ('DA010', 'Dean 10', TO_DATE('2022-10-01', 'YYYY-MM-DD'), 'PB005');

SELECT * FROM DEAN;
-- --------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------
-- record for PHANCONG
INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV001', 'DA001', TO_DATE('2022-01-05', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV002', 'DA001', TO_DATE('2022-01-10', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV003', 'DA002', TO_DATE('2022-02-07', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV004', 'DA002', TO_DATE('2022-02-15', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV005', 'DA003', TO_DATE('2022-03-10', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV006', 'DA003', TO_DATE('2022-03-18', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV007', 'DA004', TO_DATE('2022-04-05', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV008', 'DA004', TO_DATE('2022-04-12', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV009', 'DA005', TO_DATE('2022-05-15', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV010', 'DA005', TO_DATE('2022-05-20', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV011', 'DA006', TO_DATE('2022-06-05', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV012', 'DA006', TO_DATE('2022-06-10', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV013', 'DA007', TO_DATE('2022-07-07', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV014', 'DA007', TO_DATE('2022-07-15', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV015', 'DA008', TO_DATE('2022-08-10', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV016', 'DA008', TO_DATE('2022-08-18', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV017', 'DA009', TO_DATE('2022-09-05', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV018', 'DA009', TO_DATE('2022-09-12', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV019', 'DA010', TO_DATE('2022-10-15', 'YYYY-MM-DD'));

INSERT INTO PHANCONG (MANV, MADA, THOIGIAN)
VALUES ('NV020', 'DA010', TO_DATE('2022-10-20', 'YYYY-MM-DD'));

SELECT * FROM PHANCONG;
-- -----------------------------------------------------------------------------------------------------

-- Add the foreign key constraint FK_NHANVIEN_NHANVIEN
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_NHANVIEN
FOREIGN KEY (MANQL) REFERENCES NHANVIEN (MANV);

-- Add the foreign key constraint FK_NHANVIEN_PHONG
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_PHONG
FOREIGN KEY (PHG) REFERENCES PHONGBAN (MAPB);

-- Add the foreign key constraint FK_PHONGBAN_NHANVIEN
ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PHONGBAN_NHANVIEN
FOREIGN KEY (TRPHG) REFERENCES NHANVIEN (MANV);

-- Add the foreign key constraint FK_PHANCONG_NHANVIEN
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_NHANVIEN
FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV);

-- Add the foreign key constraint FK_PHANCONG_DEAN
ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_DEAN
FOREIGN KEY (MADA) REFERENCES DEAN (MADA);

-- Add the foreign key constraint FK_DEAN_PHONGBAN
ALTER TABLE DEAN
ADD CONSTRAINT FK_DEAN_PHONGBAN
FOREIGN KEY (PHONG) REFERENCES PHONGBAN (MAPB);

COMMIT;

/* =========== CAI DAT CO CHE RBAC ============= */
-- Tạo role "Nhân viên":
SET SERVEROUTPUT ON

DECLARE
  v_service_name VARCHAR2(100);
BEGIN
  SELECT SYS_CONTEXT('USERENV', 'SERVICE_NAME') INTO v_service_name FROM DUAL;
  DBMS_OUTPUT.PUT_LINE('Service Name: ' || v_service_name);
END;
/

CREATE ROLE NHAN_VIEN;
GRANT SELECT ON NHANVIEN TO NHAN_VIEN;
GRANT SELECT ON PHANCONG TO NHAN_VIEN;
GRANT UPDATE (NGAYSINH, DIACHI, SODT) ON NHANVIEN TO NHAN_VIEN;
GRANT SELECT ON PHONGBAN TO NHAN_VIEN;
GRANT SELECT ON DEAN TO NHAN_VIEN;
