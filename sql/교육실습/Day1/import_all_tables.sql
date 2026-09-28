-- ===================================================================
-- Hyundai DB 전체 테이블 CSV Import 스크립트
-- secure_file_priv 경로 확인 완료: /var/lib/mysql-files/
--
-- [실행 전 준비사항]
--   1) 아래 7개 UTF-8 CSV 파일을 반드시 이 폴더 안에 복사해 넣어주세요.
--        /var/lib/mysql-files/
--      넣어야 할 파일: customer_workbench.csv, department_workbench.csv, employee_workbench.csv,
--        product_workbench.csv, mileagegrade_workbench.csv, order_workbench.csv, orderdetail_workbench.csv
--   2) 실행 전에 각 테이블 컬럼 순서를 한번 확인해보세요 (특히 사원/제품/부서/주문세부).
--        DESCRIBE 사원;  DESCRIBE 제품;  DESCRIBE 부서;  DESCRIBE 주문세부;
--      CSV 헤더 순서와 다르면 아래 괄호 안 컬럼 순서를 맞게 수정해야 합니다.
-- ===================================================================

USE HYUNDAI;
show variables like 'secure_file_priv';
-- 외래키(FK) 제약조건 때문에 테이블 넣는 순서가 꼬이는 걸 막기 위해
-- 잠깐 FK 체크를 꺼두고, 데이터를 다 넣은 뒤 다시 켭니다.
SET FOREIGN_KEY_CHECKS = 0;

-- 

-- 1) 부서 (다른 테이블이 참조하지 않는 기본 테이블) ------------------
LOAD DATA INFILE '/var/lib/mysql-files/department_workbench.csv'
INTO TABLE 부서
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(부서번호, 부서명);

-- 2) 사원 (부서번호, 상사번호를 참조) ---------------------------------
LOAD DATA INFILE '/var/lib/mysql-files/employee_workbench.csv'
INTO TABLE 사원
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(사원번호, 이름, 영문이름, 직위, 성별, 생일, 입사일, 주소, 도시, 지역, 집전화, 상사번호, 부서번호);

-- 3) 고객 --------------------------------------------------------------
LOAD DATA INFILE '/var/lib/mysql-files/customer_workbench.csv'
INTO TABLE 고객
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(고객번호, 고객회사명, 담당자명, 담당자직위, 주소, 도시, 지역, 전화번호, 마일리지);

-- 4) 제품 --------------------------------------------------------------
LOAD DATA INFILE '/var/lib/mysql-files/product_workbench.csv'
INTO TABLE 제품
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(제품번호, 제품명, 포장단위, 단가, 재고);

-- 5) 마일리지등급 -------------------------------------------------------
LOAD DATA INFILE '/var/lib/mysql-files/mileagegrade_workbench.csv'
INTO TABLE 마일리지등급
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(등급명, 하한마일리지, 상한마일리지);

-- 6) 주문 (고객번호, 사원번호를 참조) ------------------------------------
LOAD DATA INFILE '/var/lib/mysql-files/order_workbench.csv'
INTO TABLE 주문
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(주문번호, 고객번호, 사원번호, 주문일, 요청일, 발송일);

-- 7) 주문세부 (주문번호, 제품번호를 참조) ---------------------------------
LOAD DATA INFILE '/var/lib/mysql-files/orderdetail_workbench.csv'
INTO TABLE 주문세부
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(주문번호, 제품번호, 단가, 주문수량, 할인율);

-- FK 체크 다시 켜기
SET FOREIGN_KEY_CHECKS = 1;

-- ===================================================================
-- 검증: 각 테이블에 몇 건씩 들어갔는지 한번에 확인
-- ===================================================================
SELECT '부서' AS 테이블명, COUNT(*) AS 행수 FROM 부서
UNION ALL SELECT '사원', COUNT(*) FROM 사원
UNION ALL SELECT '고객', COUNT(*) FROM 고객
UNION ALL SELECT '제품', COUNT(*) FROM 제품
UNION ALL SELECT '마일리지등급', COUNT(*) FROM 마일리지등급
UNION ALL SELECT '주문', COUNT(*) FROM 주문
UNION ALL SELECT '주문세부', COUNT(*) FROM 주문세부;