USE bookstore;

INSERT INTO book_order VALUES
('O011','BK006','서준호',2,'2025-08-14','2025-08-18','2025-08-19'),
('O012','BK009','한소연',1,'2025-08-15','2025-08-19','2025-08-20'),
('O013','BK001','김도윤',3,'2025-08-16','2025-08-20','2025-08-21'),
('O014','BK010','박지훈',2,'2025-08-17','2025-08-21','2025-08-27'),
('O015','BK003','정하늘',1,'2025-08-18','2025-08-22','2025-08-23'),
('O016','BK006','이수민',4,'2025-08-19','2025-08-23','2025-08-24');

-- 문제 1
SELECT COUNT(*) AS 전체도서수
FROM book;

-- 문제 2
SELECT COUNT(DISTINCT category) AS 분야수
FROM book;

-- 문제 3
SELECT COUNT(*) AS IT도서수
FROM book
WHERE category='IT'
GROUP BY category;

-- 문제 4
SELECT SUM(stock) AS 전체재고수량
FROM book;

-- 문제 5
SELECT SUM(stock) AS 재고부족합계
FROM book
WHERE stock<10;

-- 문제 6
SELECT ROUND(AVG(price), 0) AS 평균정가
FROM book;

-- 문제 7
SELECT MAX(price) AS 최고가, MIN(price) AS 최저가
FROM book;

-- 문제 8
SELECT SUM(price*stock) AS 재고자산총액
FROM book;

-- 문제 9
SELECT category AS 분야, COUNT(*) AS 도서수
FROM book
GROUP BY category;

-- 문제 10
SELECT category AS 분야, ROUND(AVG(price), 0) AS 평균정가
FROM book
GROUP BY category
ORDER BY 평균정가 DESC;

-- 문제 11
SELECT category AS 분야, SUM(stock) AS 재고합계
FROM book
GROUP BY category
ORDER BY 재고합계 DESC;

-- 문제 12
SELECT category AS 분야, MAX(price)-MIN(price) AS 가격격차
FROM book
GROUP BY category
ORDER BY 가격격차 DESC;

-- 문제 13
SELECT publisher AS 출판사, COUNT(*) AS 출간도서수
FROM book
GROUP BY publisher
HAVING 출간도서수>=2
ORDER BY 출간도서수 DESC;

-- 문제 14
SELECT category AS 분야, ROUND(AVG(price), 0) AS 평균정가
FROM book
GROUP BY category
HAVING 평균정가>=18000
ORDER BY 평균정가 DESC;

-- 문제 15
SELECT category AS 분야, FLOOR(AVG(stock)) AS 평균재고
FROM book
WHERE stock>=5
GROUP BY category
HAVING 평균재고>=20;

-- 문제 16
SELECT category AS 분야, COUNT(*) AS 도서수
FROM book
GROUP BY category
HAVING 도서수=1;

-- 문제 17
SELECT
	CASE
		WHEN price<15000 THEN '저가'
        WHEN price<=25000 THEN '중가'
        ELSE '고가'
    END AS 가격대,
    COUNT(*) AS 도서수,
    ROUND(AVG(stock), 0) AS 평균재고
FROM book
GROUP BY 가격대
ORDER BY 도서수 DESC;

-- 문제 18
SELECT COUNT(*) as 전체주문건수, SUM(qty) AS 총주문수량
FROM book_order;

-- 문제 19
SELECT book_id AS 도서코드, COUNT(*) AS 주문건수, SUM(qty) AS 총주문수량
FROM book_order
GROUP BY book_id
HAVING 주문건수>=2
ORDER BY 총주문수량 DESC;

-- 문제 20
SELECT
	customer_name AS 고객명,
    COUNT(*) AS 주문건수,
	ROUND(AVG(DATEDIFF(ship_date, order_date)), 0) AS 평균배송소요일
FROM book_order
GROUP BY customer_name
HAVING 평균배송소요일>5
ORDER BY 평균배송소요일 DESC;