--DDL(Data Defination Language): 데이터 정의어


--고객정보(newcustomer table)
--custid, name, address, phone
create table newcustomer(
    custid number primary key,
    name VARCHAR2(40), 
    --varchar 와 varchar2 의 차이는 저장공간을 공백으로 채우냐, 들어간 값만 채우냐의 차이가 있다
    address VARCHAR2(40),
    phone VARCHAR2(30)
);

--orderid(primary key), custid(not null, newcustomer custid 참조해서 외래키, 연쇄삭제), 
--bookid(not null, newbook1 bookid 참조해서 외래키, 연쇄삭제), 
--saleprice
--orderdate(date형)
create table NewOrders(
    orderid NUMBER PRIMARY KEY,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate date,
    FOREIGN KEY(custid) REFERENCES newcustomer(custid) on DELETE cascade,
    FOREIGN KEY(bookid) REFERENCES newbook3(bookid) on DELETE cascade
);

--Alter 문
--이미 생성된 테이블의 구조를 변경할 때 사용
--add(추가), drop(삭제), modify(수정)

--기존의 newbook1 테이블을 삭제하고 새 테이블 작성
drop table newbook1;

create table newbook1(
    bookid number,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price number
);

--isbn 컬럼 추가
alter table newbook1
add isbn VARCHAR2(13);
--isbn 컬럼의 자료형 변경
alter table newbook1
modify isbn number;
--isbn 컬럼 삭제
alter table newbook1
drop COLUMN isbn;

--bookname 컬럼의 varchar2(30) not null 제약조건 변경
alter table newbook1
modify bookname VARCHAR2(30) not null;

--bookid 컬럼에 not null 제약조건 추가
alter table newbook1
modify bookid number not null;
--bookid 컬럼의 기본키 추가
alter table newbook1
add primary key(bookid);

--테이블 삭제
drop table neworders;
drop table newcustomer;
drop table newbook4;
drop table newbook3;
drop table newbook2;


--DML(select, insert(데이터삽입), update(데이터수정), delete(데이터삭제))
--insert 1번: 속성리스트 생략
insert into book
    values(11, '소프트웨어공학', '한빛미디어', 12000);
    
--insert 2번: 속성(컬럼)리스트 명시
insert into book(bookid, bookname, publisher, price)
values(12, '라임오렌지나무', '좋은책', 8000);

--insert 3번: 컬럼의 순서를 변경
insert into book(bookid, price, publisher, bookname)
values(13, 28000, '부자나라', '부의 습관');
--테이블 순서를 맞출 필요는 없지만, 명시된 컬럼의 순서는 꼭 맞춰야한다

--insert 4번: 특정 컬럼의 값을 생략
insert into book(bookid, price, bookname)
values(14, 10000, '아침명상');

--테이블 구조가 같은 다른 테이블의 데이터행 삽입하는 방법

update imported_book
set bookid=15
where bookid=11;

update imported_book
set bookid=16
where bookid=12;

insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

--update: 데이터 변경
--고객번호가 5번인 고객의 주소를 대한민국 부산으로 변경하시오.
select * from customer;

update customer 
set address='대한민국 부산'
where custid=5;

--박세리 고객의 주소를 김연아 고객의 주소와 동일하게 변경하시오
update customer 
set address=(select address 
            from customer
            where name='김연아')
where name='박세리';

--박세리 고객의 전화번호를 김연아 고객의 전화번호와 동일하게 변경하시오
update customer 
set phone=(select phone 
            from customer
            where name='김연아')
where name='박세리';

--모든 고객을 삭제하세요
delete from customer;

rollback;

--(1)박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
