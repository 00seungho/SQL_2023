insert into orders VALUES (1,1,1,6000,TO_D  ATE('2023-01-10','YYYY-mm-dd'));
insert into orders VALUES (2,1,3,21000,TO_DATE('2023-03-15','YYYY-mm-dd'));
insert into orders VALUES (3,2,5,8000,TO_DATE('2022-11-07','YYYY-mm-dd'));
insert into orders VALUES (4,3,6,6000,TO_DATE('2023-07-12','YYYY-mm-dd'));
insert into orders VALUES (5,4,7,20000,TO_DATE('2023-07-07','YYYY-mm-dd'));
insert into orders VALUES (6,1,2,12000,TO_DATE('2022-11-14','YYYY-mm-dd'));
insert into orders VALUES (7,4,8,13000,TO_DATE('2023-08-28','YYYY-mm-dd'));
insert into orders  VALUES (8,3,10,12000,TO_DATE('2023-08-04','YYYY-mm-dd'));
insert into orders VALUES (9,2,10,7000,TO_DATE('2022-10-29','YYYY-mm-dd'));
insert into orders VALUES (10,3,8,13000,TO_DATE('2022-10-04','YYYY-mm-dd'));

insert into imported_book VALUES(21,'zen Golf','person',12000);
insert into imported_book VALUES(22,'soccer Skills','Human Kinetics',15000);
   

select publisher, price FRom book
where bookname like'�౸�� ����';

select name, phone from customer
WHERE name = '�迬��';

select * from customer
where name ='�迬��';

select bookname, price
from book;

select price, bookname from book;

select * from book;

select publisher from book;

select * from book
where price < 15000;

select * from book  
    where price between 10000 and 16000;

select * from book  
    where price > 10000 and price  < 16000;

select * from book
where publisher = '�½�����'or publisher = '�س�'or publisher = '�����Ͽ콺';

select * from book 
 where publisher != '�½�����' and publisher!='�س�' and publisher!= '���������Ͽ콺';
 
