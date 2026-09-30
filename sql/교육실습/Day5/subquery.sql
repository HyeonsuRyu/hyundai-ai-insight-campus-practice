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
SELECT customer_id AS 고객코드, customer_name AS 고객명
FROM customer as c
WHERE EXISTS (
    SELECT 1 FROM book_order AS o WHERE c.customer_name=o.customer_name
);

-- 문제 15
SELECT customer_id AS 고객코드, customer_name AS 고객명
FROM customer as c
WHERE NOT EXISTS (
    SELECT 1 FROM book_order AS o WHERE c.customer_name=o.customer_name
);

-- 문제 16
SELECT book_id AS 도서코드, title AS 도서명
FROM book AS b
WHERE EXISTS (
    SELECT 1 FROM book_order AS o WHERE b.book_id=o.book_id
);

-- 문제 17
SELECT book_id AS 도서코드, title AS 도서명
FROM book AS b
WHERE NOT EXISTS (
    SELECT 1 FROM book_order AS o WHERE b.book_id=o.book_id
);

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
SELECT b1.title AS 도서명, b1.category AS 분야, b1.stock AS 재고수량
FROM book b1
WHERE b1.stock = (SELECT MIN(b2.stock)
				  FROM book b2
                  WHERE b2.category=b1.category)
ORDER BY b1.category, b1.price desc;

-- 문제 20
SELECT title AS 도서명, price AS 정가, (SELECT ROUND(AVG(price), 0) FROM book) AS 전체평균가, price-(SELECT ROUND(AVG(price), 0) FROM book) AS 평균과의차이
FROM book
ORDER BY 평균과의차이 DESC;

-- 문제 21
SELECT 
    b.title AS 도서명
    , IFNULL((
        SELECT SUM(o.qty) FROM book_order as o WHERE o.book_id=b.book_id
    ), 0) AS 총주문수량
FROM book as b
ORDER BY 총주문수량 DESC;

-- 문제 22
SELECT
    c.customer_name AS 고객명
    , c.grade AS 등급
    , IFNULL((
        SELECT ROUND(SUM(o.qty*b.price*(1-b.discount_rate/100)), 0)
        FROM book as b
        JOIN book_order as o ON b.book_id=o.book_id
        WHERE c.customer_name = o.customer_name
    ), 0) AS 총결제금액
FROM customer as c
ORDER BY 총결제금액 DESC;

-- 문제 23
SELECT category AS 분야, avg_price AS 평균가
FROM (
    SELECT category, ROUND(AVG(price), 0) AS avg_price FROM book GROUP BY category
) AS t
WHERE avg_price >= 18000;


-- 문제 24
SELECT book_id AS 도서코드, sum_order AS 총주문수량
FROM(
    SELECT book_id, SUM(qty) AS sum_order FROM book_order GROUP BY book_id
) AS t
WHERE sum_order >= 5
ORDER BY 총주문수량 DESC;

-- 문제 25
SELECT b.title AS 도서명, t.sum_order AS 총주문수량
FROM(
    SELECT book_id, SUM(qty) AS sum_order FROM book_order GROUP BY book_id
) AS t
JOIN book as b ON t.book_id=b.book_id
ORDER BY 총주문수량 DESC;

-- 문제 26
SELECT title AS 도서명, category AS 분야, price AS 정가
FROM book
WHERE category IN (
    SELECT category FROM book GROUP BY category HAVING AVG(price) >= (SELECT AVG(price) FROM book)
)
ORDER BY 분야, 정가 DESC;

-- 문제 27
SELECT customer_id AS 고객코드, customer_name AS 고객명
FROM customer AS c
WHERE EXISTS (
    SELECT 1 FROM book_order AS o WHERE DATEDIFF(ship_date, request_date) >= 3 AND o.customer_name=c.customer_name
);

-- 문제 28
SELECT title AS 도서명, category AS 분야, price AS 정가
FROM book
WHERE (category, price) IN (
    SELECT category, MAX(price) FROM book GROUP BY category
)
ORDER BY 정가 DESC;

-- 문제 29
SELECT
    c.customer_name AS 고객명
    , (
        SELECT MAX(o.order_date) FROM book_order AS o WHERE c.customer_name=o.customer_name
    ) AS 최근주문일
FROM customer AS c
ORDER BY 최근주문일 DESC;

-- 문제 30
SELECT t.customer_name AS 고객명, t.total_price AS 총결제금액
FROM (SELECT
        c.customer_name
        , ROUND(SUM(o.qty*b.price*(1-b.discount_rate/100)), 0) AS total_price
    FROM book AS b
    JOIN book_order AS o ON b.book_id=o.book_id
    JOIN customer AS c ON c.customer_name=o.customer_name
    GROUP BY c.customer_name
    ) AS t
WHERE t.total_price >= (SELECT AVG(t2.total_price) FROM (SELECT
        c.customer_name
        , ROUND(SUM(o.qty*b.price*(1-b.discount_rate/100)), 0) AS total_price
    FROM book AS b
    JOIN book_order AS o ON b.book_id=o.book_id
    JOIN customer AS c ON c.customer_name=o.customer_name
    GROUP BY c.customer_name
    ) AS t2)
ORDER BY 총결제금액 DESC;