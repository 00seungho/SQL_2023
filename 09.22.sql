--15를 절대값으로 변경 : 15
Select ABS(-15)
from dual;

--소수를 올림해 정수로 반환 :16
select ceil(15.7)
from dual;

--코사인 반환 : -0.9999999999999999999999999999999999
select cos(3.14159)
from dual;

--소수를 내림해 반환 : 15
select floor(15.7)
from dual;  

--왼쪽이 밑인 로그를 계산 :2
select log(10,100)
from dual;  

--왼쪽 수를 오른쪽 수로 나누고 나머지를 반환 : 3
select mod(11,4)
from dual; 

--오른쪽이 지수의 승으로 거듭제곱 : 9
select power(3,2)
from dual; 

--숫자 반올림 :16
select round(15.7) from dual;
--숫자의 부호 반환 :-1
select sign(-15) from dual;
--정수 부분만 반환 :15
select trunc(15.7) from dual;
--아스키 코드 값을 반환 :C
select chr(67) from dual;
--문자열을 이어붙임:HAPPYBirthday
select concat('HAPPY','Birthday') from dual;
--문자열을 소문자로:birthday
select lower('Birthday') from dual;
--문자열을 왼쪽으로 패딩 :*.*.*.*.*Page 1
select lpad('Page 1', 15, '*.') from dual;
--문자열의 왼쪽부터 지정한 문자 제거 : Page 1
select ltrim('Page 1','ae') from dual;
--1번인자로 문자열, 2번인자로 바뀔 문자, 3번문자로 바꿀 문자 넣음: BLACK
select replace('JACK', 'J', 'BL') from dual;
--문자열을 오른쪽으로 패딩 :Page 1*.*.*.*.*
select rpad('Page 1', 15, '*.') from dual;
--오른쪽 끝에서부터 문자열 제거 : Page 1 
select rtrim('Page 1', 'ae') from dual;
--2번째 인자부터 3번째 인자의 갯수만큼 선택해서 출력:CDEF
select substr('ABCDEFG',3,4) from dual;
--왼쪽 0을 없앰 : AA00
select trim(LEADING 0 FROM '00AA00') from dual;

--문자열을 대문자로 변환 : BIRTHDAY
select upper('Birthday') from dual;
--문자의 아스키 코드 반환 :65
select ascii('A') from dual;
--or 문자열을 세번째 부터 시작해 최대 두번 검색 :14
select instr('CORPORATE FLOOR','OR',3,2) from dual;
--문자열의 길이를 반환 : 8
select length('Birthday') from dual;
--날자에 1월을 더한값을 반환 : 14/06/21
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;
--현재 개월의 마지막 날을 반환 : 23/09/30
select last_day(sysdate) from dual;

select next_day(sysdate, 'Thu') from dual;
--오늘 날자를 반올림해서 반환 :23/09/22
select round(sysdate) from dual;
--오늘 날자를 반환 :23/09/22
select sysdate from dual;
--오늘 날자를 문자로 반환 :23/09/22
select to_char(sysdate) from dual;
--123을 문자로 반환:123
select to_char(123) from dual;
--문자형 12/05/2014를 date 타입으로 변환해 출력
select to_date('12 05 2014', 'DD MM YYYY') from dual;
--문자열 12.3을 숫자로 반환해 출력:12.3
select to_number('12.3') from dual;
--첫번째인자와 두번째 인자를 비교해 값이 같으면 3번째인자, 아니면 4번째 인자 반환: aa
select decode(1,1,'aa','bb') from dual;
--첫번째 인자와 두번째 인자가 같으면 Null 반환, 이외의 경우엔 첫번째 인자를 반환:123
select nullif(123,345) from dual;
--첫번째 값이 널 값이라면 두번째 인자로 표시 : 123
select nvl(null, 123) from dual;

--고객의 이름과 전화번호를 출력하시오. (더ㅏㄴ 전화번호가 없는 고객은 연락처 없음으로 표시)
select name 이름, phone 전화번호 from customer;
select name 이름,nvl(phone, '연락처없음') 전화번호 from customer;

--고객 목록에서 연번, 고객번호, 이름, 전화번호를 앞의 도명만 출력하시오.
select rownum 순번, custid, name,phone from customer
where rownum <= 2;

--mybook 생성
create table Mybook(
    bookid number not null PRIMARY key,
    price number
);
--데이터 삽입
insert into Mybook VALUES(1,10000);
insert into Mybook VALUES(2,20000);
insert into Mybook(bookid) VALUES(3);

--my 북의 모든 컬럼 표시
select *
from mybook;

--my 북의 모든 컬럼 표시, 널값은 0으로표시
select bookid,NVL(price,0)
from mybook;

--my 북의 null 컬럼만 표시
select *
from mybook
where price is null;

--my 북의 모든 컬럼 표시
select *
from mybook
where price="";

--my 북의 모든 컬럼 에서 price 를 100추가해 표시, null은 값이 없어 연산안됨
select bookid, price+100
from mybook;

--my 북의 값과 개수를 표시, null 값은 포함되지 않음
select sum(price),AVG(price),Count(*)
from mybook;

--my 북의 평균과 총합 값 표시, 널값은 포함x

select sum(price),AVG(price)
from mybook;


-- 1  "book" 테이블의 모든 데이터를 반환
select * from book;
-- 2 "book" 테이블에서 처음 5개의 행만 선택
select * from book
where rownum <= 5;
-- 3  "book" 테이블에서 처음 5개의 행을 선택하고 "price" 열을 기준으로 오름차순으로 정렬
select * from book
where rownum <= 5
order by price;
-- 4  "book" 테이블의 모든 행을 "price" 열을 기준으로 정렬한 다음, 그 결과에서 처음 5개의 행만 선택
select * from (select*from book order by price)b
where rownum <= 5;
-- 5 3이랑 같음
select * from (select*from book where rownum <= 5)b
order by price;
-- 6  "book" 테이블에서 처음 5개의 행을 선택하고, 그 결과를 "price" 열을 기준으로 오름차순으로 정렬
select *
from (select * from book where rownum <=5 order by price)b;
-- 평균 판매금액 이하의 주문에 대해 주문번호와 판매금액을 출력하시오
select orderid 주문번호, saleprice 판매금액 from orders;
select avg(saleprice) from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

--각 고객의 평균판매금액보다 큰 금액의 주문 내역에대해서만 주문번호, 고객번호, 판매금액을 출력하시오
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid);

--서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오
select sum(saleprice) 총판매금액 from orders;
--서울에 거주하는 사람의 고객번호
select custid from customer
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in(select custid from customer
where address like '%서울%');

--서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오
select sum(saleprice) 총판매금액 from orders
where custid not in(select custid from customer
where address like '%서울%');


--3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액 from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice > all(select saleprice from orders where custid=3);

select saleprice from orders where custid=3;

--서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.(단 exist 연산자 사용)
select sum(saleprice) 총판매금액 from orders mo
where exists(
    select * from customer c
    where address like '%서울%' and mo.custid=c.custid);
--고객별 판매금액의 합계를 출력하시오.(고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

--고객별 판매금액의 합계를 출력하시오.(고객명, 판매합계)
select (select name from customer c
        where c.custid=o.custid)고객명, sum(saleprice) 판매합계 from orders o, customer c
group by o.custid;
--주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);


--고객번호, 주소, 총판매액이 고객번호별로 묶어서출력되게 하는 수행문
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

--고객번호, 주소, 총판매액이 고객번호별로 묶어서출력되게 하는 수행문
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;