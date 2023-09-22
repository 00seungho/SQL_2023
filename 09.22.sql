--15�� ���밪���� ���� : 15
Select ABS(-15)
from dual;

--�Ҽ��� �ø��� ������ ��ȯ :16
select ceil(15.7)
from dual;

--�ڻ��� ��ȯ : -0.9999999999999999999999999999999999
select cos(3.14159)
from dual;

--�Ҽ��� ������ ��ȯ : 15
select floor(15.7)
from dual;  

--������ ���� �α׸� ��� :2
select log(10,100)
from dual;  

--���� ���� ������ ���� ������ �������� ��ȯ : 3
select mod(11,4)
from dual; 

--�������� ������ ������ �ŵ����� : 9
select power(3,2)
from dual; 

--���� �ݿø� :16
select round(15.7) from dual;
--������ ��ȣ ��ȯ :-1
select sign(-15) from dual;
--���� �κи� ��ȯ :15
select trunc(15.7) from dual;
--�ƽ�Ű �ڵ� ���� ��ȯ :C
select chr(67) from dual;
--���ڿ��� �̾����:HAPPYBirthday
select concat('HAPPY','Birthday') from dual;
--���ڿ��� �ҹ��ڷ�:birthday
select lower('Birthday') from dual;
--���ڿ��� �������� �е� :*.*.*.*.*Page 1
select lpad('Page 1', 15, '*.') from dual;
--���ڿ��� ���ʺ��� ������ ���� ���� : Page 1
select ltrim('Page 1','ae') from dual;
--1�����ڷ� ���ڿ�, 2�����ڷ� �ٲ� ����, 3�����ڷ� �ٲ� ���� ����: BLACK
select replace('JACK', 'J', 'BL') from dual;
--���ڿ��� ���������� �е� :Page 1*.*.*.*.*
select rpad('Page 1', 15, '*.') from dual;
--������ ���������� ���ڿ� ���� : Page 1 
select rtrim('Page 1', 'ae') from dual;
--2��° ���ں��� 3��° ������ ������ŭ �����ؼ� ���:CDEF
select substr('ABCDEFG',3,4) from dual;
--���� 0�� ���� : AA00
select trim(LEADING 0 FROM '00AA00') from dual;

--���ڿ��� �빮�ڷ� ��ȯ : BIRTHDAY
select upper('Birthday') from dual;
--������ �ƽ�Ű �ڵ� ��ȯ :65
select ascii('A') from dual;
--or ���ڿ��� ����° ���� ������ �ִ� �ι� �˻� :14
select instr('CORPORATE FLOOR','OR',3,2) from dual;
--���ڿ��� ���̸� ��ȯ : 8
select length('Birthday') from dual;
--���ڿ� 1���� ���Ѱ��� ��ȯ : 14/06/21
select add_months(TO_DATE('14/05/21', 'yy/mm/dd'),1) from dual;
--���� ������ ������ ���� ��ȯ : 23/09/30
select last_day(sysdate) from dual;

select next_day(sysdate, 'Thu') from dual;
--���� ���ڸ� �ݿø��ؼ� ��ȯ :23/09/22
select round(sysdate) from dual;
--���� ���ڸ� ��ȯ :23/09/22
select sysdate from dual;
--���� ���ڸ� ���ڷ� ��ȯ :23/09/22
select to_char(sysdate) from dual;
--123�� ���ڷ� ��ȯ:123
select to_char(123) from dual;
--������ 12/05/2014�� date Ÿ������ ��ȯ�� ���
select to_date('12 05 2014', 'DD MM YYYY') from dual;
--���ڿ� 12.3�� ���ڷ� ��ȯ�� ���:12.3
select to_number('12.3') from dual;
--ù��°���ڿ� �ι�° ���ڸ� ���� ���� ������ 3��°����, �ƴϸ� 4��° ���� ��ȯ: aa
select decode(1,1,'aa','bb') from dual;
--ù��° ���ڿ� �ι�° ���ڰ� ������ Null ��ȯ, �̿��� ��쿣 ù��° ���ڸ� ��ȯ:123
select nullif(123,345) from dual;
--ù��° ���� �� ���̶�� �ι�° ���ڷ� ǥ�� : 123
select nvl(null, 123) from dual;

--���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�. (������ ��ȭ��ȣ�� ���� ���� ����ó �������� ǥ��)
select name �̸�, phone ��ȭ��ȣ from customer;
select name �̸�,nvl(phone, '����ó����') ��ȭ��ȣ from customer;

--�� ��Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� ���� ����Ͻÿ�.
select rownum ����, custid, name,phone from customer
where rownum <= 2;

--mybook ����
create table Mybook(
    bookid number not null PRIMARY key,
    price number
);
--������ ����
insert into Mybook VALUES(1,10000);
insert into Mybook VALUES(2,20000);
insert into Mybook(bookid) VALUES(3);

--my ���� ��� �÷� ǥ��
select *
from mybook;

--my ���� ��� �÷� ǥ��, �ΰ��� 0����ǥ��
select bookid,NVL(price,0)
from mybook;

--my ���� null �÷��� ǥ��
select *
from mybook
where price is null;

--my ���� ��� �÷� ǥ��
select *
from mybook
where price="";

--my ���� ��� �÷� ���� price �� 100�߰��� ǥ��, null�� ���� ���� ����ȵ�
select bookid, price+100
from mybook;

--my ���� ���� ������ ǥ��, null ���� ���Ե��� ����
select sum(price),AVG(price),Count(*)
from mybook;

--my ���� ��հ� ���� �� ǥ��, �ΰ��� ����x

select sum(price),AVG(price)
from mybook;


-- 1  "book" ���̺��� ��� �����͸� ��ȯ
select * from book;
-- 2 "book" ���̺��� ó�� 5���� �ุ ����
select * from book
where rownum <= 5;
-- 3  "book" ���̺��� ó�� 5���� ���� �����ϰ� "price" ���� �������� ������������ ����
select * from book
where rownum <= 5
order by price;
-- 4  "book" ���̺��� ��� ���� "price" ���� �������� ������ ����, �� ������� ó�� 5���� �ุ ����
select * from (select*from book order by price)b
where rownum <= 5;
-- 5 3�̶� ����
select * from (select*from book where rownum <= 5)b
order by price;
-- 6  "book" ���̺��� ó�� 5���� ���� �����ϰ�, �� ����� "price" ���� �������� ������������ ����
select *
from (select * from book where rownum <=5 order by price)b;
-- ��� �Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �Ǹűݾ��� ����Ͻÿ�
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select avg(saleprice) from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

--�� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ���������ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid=so.custid);

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
select sum(saleprice) ���Ǹűݾ� from orders;
--���￡ �����ϴ� ����� ����ȣ
select custid from customer
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in(select custid from customer
where address like '%����%');

--���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
select sum(saleprice) ���Ǹűݾ� from orders
where custid not in(select custid from customer
where address like '%����%');


--3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice > all(select saleprice from orders where custid=3);

select saleprice from orders where custid=3;

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.(�� exist ������ ���)
select sum(saleprice) ���Ǹűݾ� from orders mo
where exists(
    select * from customer c
    where address like '%����%' and mo.custid=c.custid);
--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

--���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����, �Ǹ��հ�)
select (select name from customer c
        where c.custid=o.custid)����, sum(saleprice) �Ǹ��հ� from orders o, customer c
group by o.custid;
--�ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);


--����ȣ, �ּ�, ���Ǹž��� ����ȣ���� �����µǰ� �ϴ� ���๮
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;

--����ȣ, �ּ�, ���Ǹž��� ����ȣ���� �����µǰ� �ϴ� ���๮
select custid,(select address from customer cs where cs.custid = od.custid) "address", sum(saleprice) "total"
from orders od
group by od.custid;