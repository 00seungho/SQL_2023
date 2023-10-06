set serveroutput on;
exec interest;

create table book_log(
    bookid_l number,
    bookname_1 varchar2(40),
    publisher_l varchar2(40),
    price_l number
);


select * from book; 

set serveroutput on;
exec insertcust (6,'±Ë¡ÿ»Ò','≥ÌªÍ','010-0000-9000');