-- 문제 1
select o.order_id as 주문번호, o.customer_name as 고객명, b.title as 도셔명, o.qty as 수량
from book as b inner join book_order as o
on b.book_id=o.book_id;

-- 문제 2
select o.order_id as 주문번호, o.customer_name as 고객명, b.title as 도셔명, b.price as 정가
from book as b inner join book_order as o
on b.book_id=o.book_id;

-- 문제 3
select o.order_id as 주문번호, o.customer_name as 고객명, b.title as 도셔명, b.category as 분야
from book as b inner join book_order as o
on b.book_id=o.book_id
where b.category='IT';

-- 문제 4
select o.order_id as 주문번호, b.title as 도셔명, o.qty as 수량, round(o.qty*b.price*(1-b.discount_rate/100), 0) as 결제금액
from book as b inner join book_order as o
on b.book_id=o.book_id;

-- 문제 5
select o.order_id as 주문번호, b.title as 도셔명, o.qty as 수량, round(o.qty*b.price*(1-b.discount_rate/100), 0) as 결제금액
from book as b inner join book_order as o
on b.book_id=o.book_id
order by 결제금액 desc;

-- 문제 6
select o.order_id as 주문번호, o.customer_name as 고객명, c.grade as 등급, o.qty as 수량
from book_order as o inner join customer as c
on c.customer_name=o.customer_name;

-- 문제 7
select o.order_id as 주문번호, o.customer_name as 고객명, c.grade as 등급, o.qty as 수량
from book_order as o inner join customer as c
on c.customer_name=o.customer_name
where c.grade='VIP';

-- 문제 8
select o.customer_name as 고객명, c.grade as 등급, b.title as 도서명, b.category as 분야, o.qty as 수량
from book_order as o inner join customer as c
on c.customer_name=o.customer_name
inner join book as b
on b.book_id = o.book_id;

-- 문제 9
select o.customer_name as 고객명, b.title as 도서명, b.category as 분야
from book_order as o inner join customer as c
on c.customer_name=o.customer_name
inner join book as b
on b.book_id = o.book_id
where c.grade='VIP' and b.category='IT';

-- 문제 10
select o.customer_name as 고객명, b.title as 도서명, round(o.qty*b.price*(1-b.discount_rate/100), 0) as 결제금액
from book_order as o inner join customer as c
on c.customer_name=o.customer_name
inner join book as b
on b.book_id = o.book_id
order by 결제금액 desc;

-- 문제 11
select b.book_id as 도서코드, b.title as 도셔명
from book as b
left join book_order as o
on b.book_id=o.book_id
where o.order_id is null;

-- 문제 12
select c.customer_id as 고객코드, c.customer_name
from customer as c
left join book_order as o
on c.customer_name=o.customer_name
where o.order_id is null;

-- 문제 13
SELECT b.title AS 도서명, COUNT(o.order_id) AS 주문건수
FROM book AS b
LEFT JOIN book_order AS o
ON b.book_id=o.book_id
GROUP BY 도서명
ORDER BY 주문건수;

-- 문제 14
SELECT b.title AS 도서명, 
	CASE
		WHEN SUM(o.qty) IS NULL THEN 0
        ELSE SUM(o.qty)
	END AS 주문수량
FROM book AS b
LEFT JOIN book_order AS o
ON b.book_id=o.book_id
GROUP BY 도서명
HAVING 주문수량=0
ORDER BY 주문수량;

-- 문제 15
SELECT b.category AS 분야, sum(o.qty) AS 총주문수량
FROM book AS b
INNER JOIN book_order as o
ON b.book_id=o.book_id
GROUP BY b.book_id
ORDER BY 총주문수량 desc;

-- 문제 16
SELECT b.category AS 분야, sum(o.qty) AS 총주문수량
FROM book AS b
INNER JOIN book_order as o
ON b.book_id=o.book_id
GROUP BY b.book_id
HAVING 총주문수량>=5
ORDER BY 총주문수량 desc;

-- 문제 17
SELECT c.customer_name AS 고객명, ROUND(SUM(o.qty*b.price*(1-b.discount_rate/100)), 0) AS 총결제금액
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY c.customer_name
ORDER BY 총결제금액 DESC;

-- 문제 18
SELECT c.customer_name AS 고객명, ROUND(SUM(o.qty*b.price*(1-b.discount_rate/100)), 0) AS 총결제금액
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY c.customer_name
HAVING 총결제금액>=50000
ORDER BY 총결제금액 DESC;

-- 문제 19
SELECT b.publisher AS 출판사, SUM(o.qty) AS 판매수량합계
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
GROUP BY b.publisher
ORDER BY 판매수량합계 DESC;

-- 문제 20
SELECT c.grade AS 등급, COUNT(*) AS 총주문건수, SUM(o.qty) AS 총주문수량
FROM book_order AS o
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY c.grade;

-- 문제 21
SELECT
    CONCAT(CASE WEEKDAY(order_date)
        WHEN 0 THEN '월'
        WHEN 1 THEN '화'
        WHEN 2 THEN '수'
        WHEN 3 THEN '목'
        WHEN 4 THEN '금'
        WHEN 5 THEN '토'
        WHEN 6 THEN '일'
    END, '요일') AS 주문요일
    , COUNT(*) AS 주문건수
FROM book_order
GROUP BY 주문요일
ORDER BY 주문건수 DESC;

-- 문제 22
SELECT
    CASE
        WHEN b.price < 15000 THEN '저가'
        WHEN b.price <= 25000 THEN '중가'
        ELSE '고가'
    END AS 가격대
    , COUNT(*) AS 주문건수
FROM book as b
JOIN book_order AS o ON b.book_id=o.book_id
GROUP BY 가격대
ORDER BY 주문건수 DESC;

-- 문제 23
SELECT c.grade AS 등급, ROUND(AVG(o.qty*b.price*(1-b.discount_rate/100)), 0) AS 평균결제금액
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY c.grade;

-- 문제 24
SELECT c.customer_name AS 고객명, b.title AS 도서명, DATEDIFF(o.ship_date, o.request_date) AS 지연일수
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
WHERE DATEDIFF(o.ship_date, o.request_date) >= 3
ORDER BY 지연일수 DESC;

-- 문제 25
SELECT b.title AS 도서명, SUM(b.stock) AS 재고수량, CASE WHEN SUM(o.qty) IS NULL THEN 0 ELSE SUM(o.qty) END AS 총판매수량
FROM book AS b
LEFT JOIN book_order AS o
ON b.book_id=o.book_id
GROUP BY 도서명
HAVING 총판매수량=0
ORDER BY 재고수량 DESC;

-- 문제 26
SELECT c.customer_name AS 고객명, COUNT(DISTINCT b.category) AS 구매분야수
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY 고객명
ORDER BY 구매분야수 DESC;

-- 문제 27
SELECT c.customer_name AS 고객명, COUNT(DISTINCT b.category) AS 구매분야수
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY 고객명
HAVING 구매분야수 >= 2
ORDER BY 구매분야수 DESC;

-- 문제 28
SELECT
    c.customer_name AS 고객명
    , c.grade AS 등급
    , COUNT(*) AS 총주문건수
    , ROUND(SUM(o.qty*b.price*(1-b.discount_rate/100)), 0) AS 총결제금액
    , ROUND(AVG(o.qty*b.price*(1-b.discount_rate/100)), 0) AS 평균결제금액
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY 고객명, 등급
ORDER BY 총결제금액 DESC;

-- 문제 29
SELECT SUM(b.stock * b.price) AS 미판매재고자산
FROM book as b
LEFT JOIN book_order as o ON b.book_id=o.book_id
WHERE o.order_id IS NULL;


-- 문제 30
SELECT c.grade AS 등급, b.category AS 분야, ROUND(SUM(o.qty*b.price*(1-b.discount_rate/100)), 0) AS 총결제금액
FROM book AS b
JOIN book_order AS o ON b.book_id=o.book_id
JOIN customer AS c ON o.customer_name=c.customer_name
GROUP BY 등급, 분야
ORDER BY grade, 총결제금액 DESC;