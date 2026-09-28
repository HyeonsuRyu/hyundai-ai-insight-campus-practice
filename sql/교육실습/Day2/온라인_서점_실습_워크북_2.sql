USE bookstore;

-- 문제1
SELECT title as '원본_도서명', CASE WHEN char_length(title)>6 THEN concat(LEFT(title, 6), '...') ELSE title END AS '줄인_도서명'
FROM book;

-- 문제2
SELECT concat(left(book_id, 2), '_', right(book_id, 3)) AS '도서코드_신규'
FROM book;

-- 문제3
SELECT concat(left(author, 1), repeat("*", char_length(author)-1)) as ‘저자_마스킹’
from book;

-- 문제4
select title as '도서명', price as '정가', truncate(price*(1-discount_rate/100), -2) as '실판매가'
from book;

-- 문제5
select title as '도서명', stock as '재고수량', 
case
	when stock<5 then '품절임박'
    when stock>=30 then '충분'
    else '보통'
end as '재고등급'
from book;

-- 문제6
SELECT
	category AS '분야',
	title AS '도서명',
	price AS '정가',
    CASE
		WHEN price<15000 THEN '저가'
        WHEN price<=25000 THEN '중가'
        ELSE '고가'
    END AS '가격대'
FROM book
ORDER BY category, price DESC;

-- 문제7
SELECT
	title AS 도서명,
    pub_date AS 출간일,
    QUARTER(pub_date) AS 출간_분기,
    MONTHNAME(pub_date) AS 출간_월,
    CONCAT(CASE WEEKDAY(pub_date)
		WHEN 0 THEN '월'
        WHEN 1 THEN '화'
        WHEN 2 THEN '수'
        WHEN 3 THEN '목'
        WHEN 4 THEN '금'
        WHEN 5 THEN '토'
        WHEN 6 THEN '일'
	END, "요일") AS 출간_요일
FROM book;

-- 문제8
SELECT title AS 도서명, pub_date AS 출간일, DATEDIFF(NOW(), pub_date) AS 경과일수
FROM book
WHERE DATEDIFF(NOW(), pub_date) >= 1000
ORDER BY 경과일수 DESC;

-- 문제9
SELECT
	title AS 도서명,
	pub_date AS 출간일,
    ADDDATE(pub_date, 1000) AS '출간1000일_기념일'
FROM BOOK
ORDER BY pub_date;

-- 문제10
SELECT
	order_id AS 주문번호,
    book_id AS 도서코드,
    customer_name AS 고객명,
    request_date AS 요청일,
    ship_date AS 발송일,
    DATEDIFF(ship_date, request_date) AS 지연일수,
    IF(DATEDIFF(ship_date, request_date) >= 3, '지연', NULL) AS 배송상태
FROM book_order
WHERE DATEDIFF(ship_date, request_date) >= 3
ORDER BY 지연일수 DESC;