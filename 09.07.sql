--동등조인 (Equi join)
--여러개의 테이블을 연결할 때 특정 컬럼의 값이 같은 행들만 검색할 때 사요ㅗㅇ

--고객과 고객의 주문에 관한 데이터를 모두 출력하시오
select * from customer, orders
where customer.custid = orders.custid;

--고객과 고객의 주문에 관한 데이터를 모두 고객번호순으로 출력하시오
select * from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

--고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
select name, saleprice 
from customer c, orders o
where c.custid = o.custid;

-- 고객이름별로 주문한 모든 도서의 총판매액을 구하고 고객이름순으로 정렬하시오
select name, sum(saleprice) from customer, orders
where customer.custid = orders.custid 
group by name
order by name;

--고객의 이름과 주문한 도서의 이름을 구하시오.
-- 3개의 테이블에 대한 EQ조인(동등조인) 하는 예제
select name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

--도서 가격이 16000원인 도서를 주문한 고객이름과 도서이름을 출력하시오
select name,bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and price = 18000;

--외부조인(Outer Join) 
--동등조인을 하게되면 값이 동등하지 않은 행은 무시되지만
--외부조인을 하게되면 기준이 되는 테이블의 값이 동등하지 않은 데이터 형도 포함해서 출력해준다.

--도서를 구매하지 않은 고객도 포함하여 고객이름과 주문한 도서의 판매가격을 출력하시오.
select name, saleprice
from customer c left outer join orders o
                 on c.custid = o.custid;
            
--sub Query(부속 질의)
--Main Query 내에 있는 Query



--도서가격이 가장 비싼 가격
select max(price) from book;

-- 도서가격이 가장 비싼 도서이름을 출력하시오.
select bookname from book
where price = (select max(price) from book);

--도서 가격이 가장 싼 도서의 이름과 가격을 출력하시오
select bookname,price from book
where price = (select min(price) from book);

--도서를 구매한 적이 있는 고객의 이름을 검색하시오.
select name from customer
where custid in (select distinct custid from orders);
--sub 쿼리: 주문한적이있는 고객번호들
select DISTINCT custid from orders;

--나무수 에서 출판한 도서를 구매한 고객의 이름을 출력하시오
select name from customer;
select bookid,bookname from book
where publisher = '나무수';
--나무수 에서 출판한 도서를 구매한 사람
select distinct custid from orders;
select name from customer
where custid in(select distinct custid from orders
                where bookid in (select bookid from book where publisher = '나무수'));

