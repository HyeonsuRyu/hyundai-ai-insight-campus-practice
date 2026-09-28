USE bookstore;

-- 문제 1
SELECT * FROM BOOK;

-- 문제 2
SELECT title AS 도서명, author AS 저자명, price AS 판매가
FROM BOOK;

-- 문제 3
SELECT title AS 도서명, price AS 정가,
discount_rate AS 할인율, price*(1-discount_rate/100) AS 할인가
FROM BOOK;

-- 문제 4
SELECT title AS 도서명, author AS 저자명, price AS 정가
FROM book
WHERE price >= 20000;

-- 문제 5
SELECT *
FROM book
WHERE category='IT';

-- 문제 6
SELECT title AS 도서명, publisher as 출판사
FROM book
WHERE publisher <> '비즈니스북스';

-- 문제 7
SELECT title AS 도서명, stock AS 재고수량
FROM book
WHERE stock<10
ORDER BY stock;

-- 문제 8
SELECT title AS 도서명, price AS 정가
FROM book
WHERE CATEGORY='에세이'
ORDER BY 2 DESC;

-- 문제 9
SELECT DISTINCT category AS 분야
FROM book
ORDER BY category;

-- 문제 10
SELECT title AS 도서명, author AS 저자명, price*(1-discount_rate/100) AS '추천가'
FROM book
WHERE stock>=5 AND price*(1-discount_rate/100) <= 15000
ORDER BY 추천가;