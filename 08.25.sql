--도서정보 Book 테이블
create table Book(
    bookid NUMBER(2) PRIMARY Key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price  NUMBER(8)
);
--고객정보 Customer 테이블
create table Customer(
    custid NUMBER(2) PRIMARY key,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(50)
);
-- 주문정보 Orders 테이블

create table Orders(
    orderid NUMBER(2) PRIMARY key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);
--Imported_Book 테이블
create table Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price  NUMBER(8)
);

--Book 테이블에 10권의 도서 정보를 추가하세요
insert into Book values(1,'축구의 역사','굿스포츠', 7000);
insert into Book values(2,'축구 아는 여자','나무수', 13000);
insert into Book values(3,'귀멸의칼날 1권','학산문화사', 7000);
insert into Book values(4,'불편한 편의점','나무옆의자', 12600);
insert into Book values(5,'정의란 무엇인가','와이즈베리', 13500);
insert into Book values(6,'파피용','열린책들', 14220);
insert into Book values(7,'1분 요리 뚝딱이형','길벗', 19800);
insert into Book values(8,'아메리칸 프로메테우스','사이언스북스', 22500);
insert into Book values(9,'콘크리트 유토피아','자음과모음', 13500);
insert into Book values(10,'커피의 위로','포르체', 15300);

-- Customer 테이블에고객정보 5개 추가
insert into Customer values(1,'박지성','영국 멘체스터', '000-5000-001');
insert into Customer values(2,'김연아','서울 동작구 흑석동', '02-3333-5555');
insert into Customer values(3,'장미란','서울 용산구 보광동', '02-555-7777');
insert into Customer values(4,'추신수','인천광역시 연수구', '032-233-5656');
insert into Customer values(5,'박세리','대전광역시 유성구', '042-1234-5678');

