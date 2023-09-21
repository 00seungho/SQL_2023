--마당 서점에서 다음의 심화된 질문에 대해 SQL문 작성
--박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름


select name from
customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name not like '박지성'
and publisher in(select publisher from customer cs, orders os, book bs
where cs.custid=os.custid and os.bookid=bs.bookid
and name like '박지성');
--두개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select name from customer cm
where (select count(distinct publisher) from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid
and name like cm.name) >=2;
--전체 고객의 30%이상이 구매한 도서
select bookname from book bm
where (select count(b.bookid ) from book b, orders o
where b.bookid=o.bookid and b.bookid = bm.bookid) >= (select count(*) from customer) *0.3; 

-- 새로운 도서('스포츠세계', '대한미디어',10000원)이 마당서점에 입고되었다. 삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보시오
insert into Book (bookid, bookname, Publisher, Price)
values (11, '스포츠 세계', '대한미디어', 10000);

--'데이원'에서 출판한 도서를 삭제해야 한다.
delete Book
where publisher = '데이원';

-- '부자나라'에서 출판한 도서를 삭제하시오
delete from book
where publisher='부자나라'; 
    
-- '해냄'에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인 생각해보자
delete from book    
where publisher='해냄';

-- 출판사 대    한미디어가 대한출판사로 이름을 바꾸었다.
update book
set publisher='대한출판사'
where publisher='대한미디어';

-- 78과 -78의 절댓값을 구하시오
select abs(-78), abs(+78)
from Dual;
-- 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오
select round(4.875, 1)
from Dual;
-- 고객별 평균 주문 금액을 배 원 단위로 반올림한 값을 구하시오
select custid "고객번호", round(sum(saleprice)/count(*), -2) "평균 금액"
from orders
group by customer;

-- abs: 절댓값 구하는 함수       
-- 78과 -78의 절댓값을 구하시오
select abs(-78), abs(+78)
from Dual;
-- 4.875를 소수 첫째 자리까지 반올림한 값을 구하시오
select round(4.875, 1)
from Dual;
-- 고객별 평균 주문 금액을 배 원 단위로 반올림한 값을 구하시오
select custid "고객번호", round(sum(saleprice)/count(*), -2) "평균 금액"
from orders
group by custid;
--도서명에 '과학'이 포함된 도서를 '수학'으로 변경하여 출력하시오
--기본값 설정을 바꾸면 안됩니다
select bookid, replace(bookname, '과학', '수학') bookname, publisher, price from book;
--도서명에 '과학'이 포함된 도서를 '수학'으로 변경하여 도서정보를 출력하시오.
--실제 book테이블의 원본데이터를 변경하면 안됨.
select bookid, replace(bookname, '과학', '수학') bookname, publisher, price from book;
select * from book;

--출판사가 '해냄'인 도서명의 글자수와 바이트수를 출력하시오.
select bookname "도서명", length(bookname) 글자수, lengthb(bookname) 바이트수 from book
where publisher like '해냄';

--고객 중에서 같은 성씨를 가진 사람이 몇명인지 성씨별 인원수를 출력하시오.
select substr(name,1,1)"성씨", count(*) "인원수" from customer
group by substr(name,1,1);

-- 서점의 주문확정일은 주문일로부터 10일 후이다. 주문번호, 주문일, 주문확정일을 출력하시오.
select orderid 주문번호, orderdate 주문일, orderdate+10 주문확정일
from orders;

--2023년 8월 28일에 주문 받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오
select orderid 주문번호, orederdate 주문일,custid 고객번호, orders.orderdate 주문확정일
from orders
where orders.orderdate =to_date('20230828', 'yyyymmdd');

--2023년 8월 28일에 주문 받은 주문번호, 주문일, 고객명, 도서묭를 모두 출력하시오
--단 주문일은 yyyy 년 mm월 mm일과 같은 format로 나타내야됨
select orderid 주문번호,to_char(orderdate, 'yyyy"년"mm"월"dd"일"') 주문일, name 고객명, bookname 도서명
from orders, book, customer
where orderdate = to_date('20230828','yyyymmdd') 
and orders.bookid = book.bookid 
and orders.custid = customer.custid;

--2023년 2월 14일에 주문 받은 주문번호, 주문일, 고객명, 도서명를 모두 출력하시오.
--단, 주문일은 "yyyy년 mm월 dd일"과 같은 format으로 표시하시오.
select orderid 주문번호,to_char( orderdate, 'yyyy-mm-dd') 주문일, name 고객명, bookname 도서명
from orders o ,book b, customer c
where o.bookid = b.bookid and c.custid = o.custid and  orderdate = to_date('20230214','yyyymmdd');

--DB 서버에 설정된 날짜와 시간 요일을 출력하시오.
--실제 반환된 날짜와 형식을 지정한(년도 4자리/월2자리/날짜2자리 간략한 요일 , 시:분:초) 날짜와 시간 2가지를 모두 출력하시오.
select sysdate 원래반환된값, to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') 지정형식날짜및시간 from dual;