USE bookstore;

-- 문제 1
SELECT title 도서명, price 정가
FROM book
WHERE price > (SELECT AVG(price) FROM book)
order by price desc;

-- 문제 2
SELECT title 도서명, price 정가
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- 문제 3
SELECT title 도서명, stock 재고수량
FROM book
WHERE stock = (SELECT MIN(stock) FROM book);

-- 문제 4
SELECT title as 도서명, price AS 정가
FROM book
WHERE price > (SELECT MAX(price) FROM book WHERE book_id='BK001')
ORDER BY 정가 DESC;

-- 문제 5
SELECT book_id AS 도서코드, title AS 도서명
FROM book
WHERE book_id IN (SELECT book_id FROM book_order)
ORDER BY 도서코드;

-- 문제 6
SELECT book_id AS 도서코드, title AS 도서명
FROM book
WHERE book_id NOT IN (SELECT book_id FROM book_order)
ORDER BY 도서코드;

-- 문제 7
SELECT order_id as 주문번호, customer_name as 고객명, qty as 수량
FROM book_order
WHERE customer_name IN (SELECT customer_name FROM customer WHERE grade='VIP');

-- 문제 8
SELECT customer_id AS 고객코드, customer_name AS 고객명
FROM customer
WHERE customer_name NOT IN (SELECT customer_name FROM book_order);

-- 문제 9
SELECT book_id AS 도서코드, title AS 도서명
FROM book
WHERE book_id IN (SELECT book_id 
				  FROM book_order 
                  WHERE DATEDIFF(ship_date, request_date)>=3);

-- 문제 10
SELECT book_id AS 도서코드, title AS 도서명
FROM book
WHERE book_id IN(SELECT book_id
				 FROM book_order
                 GROUP BY book_id
                 HAVING SUM(qty)>=5)
ORDER BY 도서코드;

-- 문제 11
SELECT title AS 도서명, category AS 분야, price AS 정가
FROM book
WHERE price > ANY (SELECT price FROM book WHERE category='에세이')
ORDER BY 정가 DESC;

-- 문제 12
SELECT title AS 도서명, category AS 분야, price AS 정가
FROM book
WHERE price > ALL (SELECT price FROM book WHERE category='에세이')
ORDER BY 정가 DESC;

-- 문제 13
SELECT title AS 도서명, category AS 분야, stock as 재고수량
FROM book
WHERE stock < ALL (SELECT price FROM book WHERE category='IT')
ORDER BY 재고수량;

-- 문제 14


-- 문제 15


-- 문제 16


-- 문제 17


-- 문제 18
SELECT b1.title AS 도서명, b1.category AS 분야, b1.price AS 정가
FROM book b1
WHERE b1.price > (SELECT AVG(b2.price)
				  FROM book b2
                  WHERE b2.category=b1.category)
ORDER BY b1.category, b1.price desc;

SELECT b.title,  b.category, b.price
FROM book b
JOIN
(SELECT category, AVG(price) 평균정가
FROM book
GROUP BY category) c  ON b.category = c.category
WHERE b.price > 평균정가 order by b.category, b.price desc;

-- 문제 19


-- 문제 20


-- 문제 21


-- 문제 22


-- 문제 23


-- 문제 24


-- 문제 25


-- 문제 26


-- 문제 27


-- 문제 28


-- 문제 29


-- 문제 30

