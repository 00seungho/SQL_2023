--집합 연산자: 합집합(union), 차집합(minus), 교집합(intersect)
--차집합 연산자 사용
--주문을 진행하지 않은 고객의 이름
select name from customer;

select distinct custid from orders;

select name from customer
where custid in(select custid from orders);

select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);

--집합 연산자 사용하지 않은 경우
select name from customer
where custid not in(select distinct custid from orders);

-- EXISTS : 서브쿼리의 결과가 존재하는 경우에 true
-- 주문이 있는 고객의 이름과 주소를 출력하시오.
-- in 연산자 사용한 경우(수행 명령을 가장 적게 사용)
select name, address from customer
where custid in(select distinct custid from orders); 
--동등 조인과 중복 행 제거
select name, address from customer c, orders o
where c.custid = o.orderid;
--EXISTS 사용한 경우
select name, address from customer c
where exists(select * from orders o 
where c.custid = o.custid);

--5)박지성이 구매한 도서의 출판사 수
select count(distinct publisher) as "출판사 수"
from customer, orders , book 
where customer.custid = orders.custid
  and orders.bookid = book.bookid
  and customer.name = '박지성';
--6)박지성이 구매한 도서의 이름,가격, 정가와 판매가격 차이
select bookname,price,saleprice-price as "정가와판매가격차이"
from customer, orders, book
where customer.custid = orders.custid
  and orders.bookid = book.bookid
  and customer.name = '박지성';
--7)박지성이 구매하지 않은 도서의 이름
 select bookname from book
 minus
 select bookname from book,customer,orders 
 where
  customer.custid = orders.custid
  and orders.bookid = book.bookid
  and customer.name = '박지성'; 
--8)주문하지 않은 고객의 이름(부속질의 사용)
select name from customer                                                                    
where custid not in(select distinct custid from orders);
--9)주문금액의 총액과 주문의 평균 금액
select sum(saleprice) as "주문금액총액",avg(saleprice) as "주문금액평균" from orders,book;
--10)고객의 이름과 고객별 구매액
select name,sum(saleprice) as "고객별구매액" from book,customer,orders
where customer.custid = orders.custid
group by name;
--11)고객의 이름과 고객이 구매한 도서 목록
select name,bookname from book,customer,orders
where customer.custid = orders.custid
      and book.bookid = orders.bookid;
--12)도서의 가격(Book 테이블) 과 판매가격(Orders 테이블) 의 차이가 가장 많은 주문
  select * from orders, book 
  where orders.bookid = book.bookid   
  and (price-saleprice) = (select max(price-saleprice) from orders, book 
  where orders.bookid = book.bookid);
--13)도서 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
   select name from book b,orders o,customer c
   where b.bookid = o.bookid
   and c.custid = o.custid
   group by name having
   avg(saleprice) <= (select avg(saleprice) from orders o,customer c
   where c.custid = o.custid);
   
   --DDL(Data Defination Langusge):데이터 정의어
   --create table/alter table/drop table
   --테이블 생성 연습1
create table newbook1(
bookid number,
bookname varchar2(20),
publisher varchar2(20),
price number
);
--테이블 생성연습 2
--primary key 설정 방법 1
create table newbook2(
bookid number,
bookname varchar2(20),
publisher varchar2(20),
price number,
primary key (bookid)
);

--primary key 설정 방법 2
create table newbook3(
bookid number primary key,
bookname varchar2(20),
publisher varchar2(20),
price number
);

-- bookname 컬럼: null값 가질 수 없음
-- publisher 컬럼: 동일한 값을 가질 수 없음
-- price 컬럼: 가격이 입력되어 있지 않으면, 기본값을 10000으로하고 입력될 때는 1000초과로 함
-- bookname, publisher 컬럼을 복합키로 설정
create table newbook4(
bookid number,
bookname varchar2(20) not null,
publisher varchar2(20) unique,
price number default 10000 check(price >= 1000),
primary key (bookname, publisher)
);
