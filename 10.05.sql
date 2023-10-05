--고객번호, 주소, 총판매액이 고객번호별로 묶어서출력되게 하는 수행문
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

-- 고객별 평균 판매 가격을 출력
select c.name, s
from (select custid, avg(saleprice)s
        from orders
        group by custid) o, customer c
where c.custid = o.custid;

-- 고객번호가 3 이하인 고객의 판매금액 합계
select SUM(saleprice) "total"
from Orders od
where exists (select *
                from Customer cs
                where custid <= 3 and cs.custid = od.custid);   
                
select * from book
where bookname like '%과학%';

create view v_book
as select * from book
where bookname like '%과학%';

select * from customer
where address like '%서울%'
;

create view vw_customer
as select * from customer
where address like '%서울%'
;

select * from vw_customer;


--주문테이블에서 고객이름, 도서이름을 바로 확인 할 수 있는 뷰를 생성한 후,
--김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력 하시오.
create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.custid,o.bookid, bookname, saleprice, orderdate
from orders o, customer c, book b
where o.custid= c.custid and o.bookid = b.bookid;

select * from vw_orders;

drop view vw_orders;

select orderid, bookname, saleprice
from vw_orders  
where name='김연아';

--기존의 뷰를 수정한다
CREATE OR REPLACE VIEw vw_customer(custid, name, address)
as select custid, name, address
from customer 
where address like '%영국%';

select * from customer;
select * from vw_customer;

--뷰를 삭제한다
drop view vw_customer;


--판매가격이 20000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오.
-- highorders 뷰 생성
CREATE VIEW highorders(bookid, bookname,name,publisher)as
SELECT o.bookid, b.bookname, c.name AS name, b.publisher
FROM orders o, customer c, book b
WHERE o.saleprice >= 20000 and o.custid = c.custid and o.bookid = b.bookid;

drop view highorders;
select * from highorders;
--생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL문을 작성하시오.
select bookname,name
from highorders;
--highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오 삭제 후 (2)번 SQL문을 다시 수행하시오.
CREATE or REPLACE VIEW highorders(bookid, bookname,name,publisher)as
SELECT o.bookid, b.bookname, c.name AS name, b.publisher
FROM orders o, customer c, book b
WHERE o.saleprice >= 20000 and o.custid = c.custid and o.bookid = b.bookid;

select bookname,name
from highorders;

exec INSERTBOOK(15,'스포츠과학','마당과학서적',25000);

select * from book;

exec INSERTORUPDATE(14,'아침명상','마당과학서점',30000);
select * from book;

SET SERVEROUTPUT ON;
DECLARE 
    averagerVal NUMBER;
BEGIN 
    AVGRAGEPRICE(averagerVal);
    DBMS_OUTPUT.PUT_LINE('도서평균가격: ' || round(averagerVal));
END;

