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


-- 문제 17


-- 문제 18


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

