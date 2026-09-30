CREATE DATABASE IF NOT EXISTS bookmaru_lab CHAR SET utf8mb4 COLLATE utf8mb4_general_ci;
USE bookmaru_lab;

-- 문제 1
CREATE TABLE publisher (
    pub_id      CHAR(3),
    pub_name    VARCHAR(30),
    city        VARCHAR(20)
);
DESC publisher;

-- 문제 2
INSERT INTO publisher VALUES
    ('P01', '한빛북스', '서울'),
    ('P02', '길벗플러스', '서울'),
    ('P03', '위키출판', '파주'),
    ('P01', '한빛북스(중복)', '서울');
SELECT * FROM publisher;

-- 문제 3
SELECT * FROM publisher WHERE pub_name='한빛북스(중복)';
DELETE FROM publisher WHERE pub_name='한빛북스(중복)';
SELECT * FROM publisher;

ALTER TABLE publisher ADD CONSTRAINT publisher_pk PRIMARY KEY (pub_id);
DESC publisher;

ALTER TABLE publisher MODIFY pub_name VARCHAR(30) NOT NULL;
DESC publisher;

INSERT INTO publisher VALUES ('P01', '다른출판', '부산');

-- 문제 4
CREATE TABLE book (
    book_id     CHAR(5)     PRIMARY KEY,
    title       VARCHAR(50) NOT NULL,
    category    VARCHAR(20) NOT NULL,
    price       INT         NOT NULL,
    stock       INT         NOT NULL DEFAULT 0,
    pub_id      CHAR(3),
    CONSTRAINT  chk_book_price  CHECK (price >= 0),
    CONSTRAINT  chk_book_stock  CHECK (stock >= 0),
    CONSTRAINT  fk_book_pub     FOREIGN KEY (pub_id) REFERENCES publisher (pub_id)
);
SELECT constraint_name AS constraint_name
     , constraint_type AS constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'bookmaru_lab'
  AND table_name = 'book'
ORDER BY constraint_name;
DESC book;

-- 문제 5
CREATE TABLE customer (
    cust_id    CHAR(3)      PRIMARY KEY,
    cust_name  VARCHAR(20)  NOT NULL,
    email      VARCHAR(50),
    grade      VARCHAR(10)  NOT NULL DEFAULT '일반',
    mileage    INT          NOT NULL DEFAULT 0,
    CONSTRAINT uq_customer_email    UNIQUE (email),
    CONSTRAINT chk_customer_grade   CHECK (grade IN ('일반', 'VIP')),
    CONSTRAINT chk_customer_mileage CHECK (mileage >= 0)
);
DESC customer;

-- 문제 6
CREATE TABLE book_order (
    order_id    INT       PRIMARY KEY AUTO_INCREMENT,
    cust_id     CHAR(3)   NOT NULL,
    book_id     CHAR(5)   NOT NULL,
    qty         INT       NOT NULL,
    order_date  DATE      NOT NULL,
    CONSTRAINT chk_order_qty CHECK (qty >= 1),
    CONSTRAINT fk_order_cust FOREIGN KEY (cust_id) REFERENCES customer (cust_id),
    CONSTRAINT fk_order_book FOREIGN KEY (book_id) REFERENCES book (book_id)
);
DESC book_order;

-- 문제 7
/*
| 문장 | 에러 코드 | 원인 |
| --- | --- | --- |
| ① | 3819 | book.price가 0미만, chk_book_price 위배 |
| ② | 1452 | 외래키를 존재하지 않는 값으로 수정 |
| ③ | 3819 | customer.grade를 도메인에 없는 값으로 설정 |
| ④ | 1364 | cust_name은 기본값이 없는데 기본값으로 설정하도록 기대됨 |
*/

-- 문제 8
ALTER TABLE customer ADD COLUMN phone VARCHAR(10);
ALTER TABLE customer MODIFY COLUMN phone VARCHAR(20);
ALTER TABLE customer CHANGE COLUMN phone phone_no VARCHAR(20);
ALTER TABLE customer ADD CONSTRAINT uq_customer_phone UNIQUE (phone_no);
ALTER TABLE customer DROP INDEX uq_customer_phone;

DESC customer;

-- 문제 9
ALTER TABLE book ADD COLUMN price_vat INT AS (ROUND(price * 1.1)) STORED;
CREATE TABLE book_backup LIKE book;
RENAME TABLE book_backup TO book_archive;
DROP TABLE book_archive;

SHOW TABLES;
DESC book;

-- 문제 10
INSERT INTO book (book_id, title, category, price, stock, pub_id) VALUES
('BK001', '처음 배우는 MySQL', 'IT', 25000, 12, 'P01'),
('BK002', '파이썬 데이터 분석 입문', 'IT', 27000, 10, 'P01'),
('BK003', '자바스크립트 실전 가이드', 'IT', 30000, 8, 'P02'),
('BK004', '클린 코드의 기술', 'IT', 28000, 6, 'P02'),
('BK007', '달러구트 꿈 백화점', '소설', 13800, 5, 'P03'),
('BK008', '미드나잇 라이브러리', '소설', 15000, 9, 'P03');

INSERT INTO book (book_id, title, category, price, stock, pub_id) VALUES
('BK009', '아주 작은 습관의 힘', '자기계발', 16800, DEFAULT, 'P02');

SELECT * FROM book;

-- 문제 11
INSERT INTO customer (cust_id, cust_name, email, grade, mileage) VALUES
('C01', '김도윤', 'doyun@bookmaru.kr', 'VIP', 2500),
('C02', '이수민', 'sumin@bookmaru.kr', DEFAULT, 300),
('C03', '박지훈', 'jihun@bookmaru.kr', 'VIP', 2000),
('C04', '최유진', 'yujin@bookmaru.kr', DEFAULT, 800),
('C11', '이하늘', 'haneul@bookmaru.kr', DEFAULT, DEFAULT),
('C12', '정민준', 'minjun@bookmaru.kr', 'VIP', 1200);

SELECT * FROM customer;

-- 문제 12
INSERT INTO book_order (cust_id, book_id, qty, order_date) VALUES
('C01', 'BK001', 2, '2025-08-01'),
('C01', 'BK003', 1, '2025-08-05'),
('C02', 'BK002', 1, '2025-08-06'),
('C03', 'BK001', 3, '2025-08-10'),
('C03', 'BK004', 1, '2025-08-12'),
('C04', 'BK007', 2, '2025-08-15'),
('C12', 'BK008', 1, '2025-08-18'),
('C01', 'BK009', 4, '2025-08-20');

SELECT * FROM book_order ORDER BY order_id;

-- 문제 13
SELECT * FROM book;

UPDATE book SET price = price * 1.1 WHERE category = 'IT';

UPDATE book SET stock = stock + 20 WHERE book_id = 'BK009';

SELECT book_id, title, price, price_vat, stock FROM book ORDER BY book_id;

-- 문제 14
SELECT * FROM book_order ORDER BY order_date DESC LIMIT 1;

DELETE FROM book_order ORDER BY order_date DESC LIMIT 1;

SELECT * FROM book_order ORDER BY order_id;

-- 문제 15
INSERT INTO book (book_id, title, category, price, stock, pub_id)
VALUES ('BK003', '자바스크립트 실전 가이드', 'IT', 34000, 15, 'P02')
ON DUPLICATE KEY UPDATE price = VALUES(price), stock = VALUES(stock);

INSERT INTO book (book_id, title, category, price, stock, pub_id)
VALUES ('BK010', 'SQL 첫걸음', 'IT', 22000, 30, 'P01')
ON DUPLICATE KEY UPDATE price = VALUES(price), stock = VALUES(stock);

SELECT book_id, title, price, price_vat, stock FROM book WHERE book_id IN ('BK003', 'BK010');

-- 문제 16
CREATE TABLE customer_summary (
    cust_id         CHAR(3)     PRIMARY KEY,
    cust_name       VARCHAR(20),
    order_cnt       INT,
    total_qty       INT,
    last_order_date DATE
);

INSERT INTO customer_summary (cust_id, cust_name, order_cnt, total_qty, last_order_date)
SELECT 
    c.cust_id
    , c.cust_name
    , COUNT(o.order_id)
    , IFNULL(SUM(o.qty), 0)
    , MAX(o.order_date)
FROM customer AS c
LEFT JOIN book_order AS o ON c.cust_id = o.cust_id
GROUP BY c.cust_id, c.cust_name;

SELECT * FROM customer_summary ORDER BY cust_id;

-- 문제 17
UPDATE customer SET mileage = mileage + 1000 WHERE cust_id IN (SELECT cust_id FROM book_order);

UPDATE customer
SET mileage = (
    SELECT t.avg_mileage
    FROM (SELECT ROUND(AVG(mileage), 0) AS avg_mileage
    FROM customer) AS t)
WHERE cust_id = 'C12';

SELECT cust_id, cust_name, mileage FROM customer ORDER BY cust_id;

-- 문제 18
CREATE TABLE mileage_grade
(
  grade_name   VARCHAR(10) PRIMARY KEY
 , min_mileage  INT NOT NULL
 , max_mileage  INT NOT NULL
);
 
INSERT INTO mileage_grade
VALUES ('일반', 0, 1999)
     , ('VIP', 2000, 999999);

UPDATE customer AS c
INNER JOIN mileage_grade AS g ON c.mileage BETWEEN g.min_mileage AND g.max_mileage
SET c.grade = g.grade_name;

SELECT cust_id, cust_name, mileage, grade FROM customer ORDER BY cust_id;


-- 문제 19
SELECT * FROM customer WHERE cust_id NOT IN (SELECT cust_id FROM book_order);

DELETE FROM customer WHERE cust_id NOT IN (SELECT cust_id FROM book_order);

SELECT cust_id, cust_name, grade FROM customer ORDER BY cust_id;

-- 문제 20
SELECT o.*
FROM book_order AS o
INNER JOIN book AS b ON o.book_id = b.book_id
WHERE b.pub_id = 'P03';

DELETE o
FROM book_order AS o
INNER JOIN book AS b ON o.book_id = b.book_id
WHERE b.pub_id = 'P03';

SELECT * FROM book_order ORDER BY order_id;