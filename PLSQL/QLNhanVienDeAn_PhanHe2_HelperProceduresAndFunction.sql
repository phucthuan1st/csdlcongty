CONNECT COMPANY_PUBLIC/astrongpassword@localhost:1521/COMPANY;

/*
    Check connection availability
*/
SET SERVEROUTPUT ON

DECLARE
  v_service_name VARCHAR2(100);
BEGIN
  SELECT SYS_CONTEXT('USERENV', 'SERVICE_NAME') INTO v_service_name FROM DUAL;
  DBMS_OUTPUT.PUT_LINE('Service Name: ' || v_service_name);
END;
/

-- Procedure to insert a record into the NHANVIEN table
CREATE OR REPLACE PROCEDURE INSERT_NHANVIEN_RECORD(
    p_MANV     IN VARCHAR2,
    p_TENNV    IN VARCHAR2,
    p_PHAI     IN VARCHAR2,
    p_NGAYSINH IN DATE,
    p_DIACHI   IN VARCHAR2,
    p_SODT     IN VARCHAR2,
    p_LUONG    IN VARCHAR2,
    p_PHUCAP   IN VARCHAR2,
    p_VAITRO   IN VARCHAR2,
    p_MANQL    IN VARCHAR2,
    p_PHG      IN VARCHAR2
) AS
BEGIN
    INSERT INTO NHANVIEN (MANV, TENNV, PHAI, NGAYSINH, DIACHI, SODT, LUONG, PHUCAP , MANQL, PHG)
    VALUES (p_MANV, p_TENNV, p_PHAI, p_NGAYSINH, p_DIACHI, p_SODT, p_LUONG, p_PHUCAP, p_MANQL, p_PHG);
    
    INSERT INTO VAITRO_NHANVIEN (MANV, VAITRO)
    VALUES (p_MANV, p_VAITRO);
    
    INSERT INTO NHANVIEN_PHONG (MANV, PHG)
    VALUES (p_MANV, p_PHG);
    
    create_user(p_MANV, 'password');
    
    IF p_VAITRO = 'Nhân viên' THEN
        EXECUTE IMMEDIATE 'GRANT NHAN_VIEN TO ' || p_MANV;
    ELSIF p_VAITRO = 'QL trực tiếp' THEN
        EXECUTE IMMEDIATE 'GRANT QL_TRUC_TIEP TO ' || p_MANV;
    ELSIF p_VAITRO = 'Trưởng phòng' THEN
        EXECUTE IMMEDIATE 'GRANT TRUONG_PHONG TO ' || p_MANV;
    ELSIF p_VAITRO = 'Tài chính' THEN
        EXECUTE IMMEDIATE 'GRANT TAI_CHINH TO ' || p_MANV;
    ELSIF p_VAITRO = 'Nhân sự' THEN
        EXECUTE IMMEDIATE 'GRANT NHAN_SU TO ' || p_MANV;
    ELSIF p_VAITRO = 'Trưởng đề án' THEN
        EXECUTE IMMEDIATE 'GRANT TRUONG_DEAN TO ' || p_MANV;
    ELSE 
        ROLLBACK;
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Handle the exception or log the error
        DBMS_OUTPUT.PUT_LINE('Error inserting NHANVIEN record: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Create a procedure to insert a record into DANGNHAP
CREATE OR REPLACE PROCEDURE INSERT_LUUTRU_RECORD(
  p_MANV IN LUUTRU.MANV%TYPE,
  p_SECRET_KEY IN LUUTRU.SECRET_KEY%TYPE
) AS
BEGIN
  INSERT INTO LUUTRU (MANV, SECRET_KEY)
  VALUES (p_MANV, p_SECRET_KEY);
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Record inserted successfully.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error inserting record: ' || SQLERRM);
    ROLLBACK;
END;
/

-- vô hiệu hóa các policy hiện có
CREATE OR REPLACE PROCEDURE DROP_EXISTS_POLICY
AS
  v_sql VARCHAR2(4000);
BEGIN
  FOR p IN (SELECT OBJECT_NAME, POLICY_NAME, ENABLE
            FROM USER_POLICIES
            ORDER BY POLICY_NAME ASC)
  LOOP
    IF p.ENABLE = 'YES' THEN
      v_sql := 'BEGIN
                  DBMS_RLS.DROP_POLICY(
                    object_schema => ''' || 'COMPANY_PUBLIC' || ''',
                    object_name => ''' || p.OBJECT_NAME || ''',
                    policy_name => ''' || p.POLICY_NAME || '''
                  );
                END;';
      DBMS_OUTPUT.PUT_LINE(v_sql);
      EXECUTE IMMEDIATE v_sql;
    END IF;
  END LOOP;
END;
/


COMMIT;