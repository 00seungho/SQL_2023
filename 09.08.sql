--���� ������: ������(union), ������(minus), ������(intersect)
--������ ������ ���
--�ֹ��� �������� ���� ���� �̸�
select name from customer;

select distinct custid from orders;

select name from customer
where custid in(select custid from orders);

select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);

--���� ������ ������� ���� ���
select name from customer
where custid not in(select distinct custid from orders);

-- EXISTS : ���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
-- in ������ ����� ���(���� ����� ���� ���� ���)
select name, address from customer
where custid in(select distinct custid from orders); 
--���� ���ΰ� �ߺ� �� ����
select name, address from customer c, orders o
where c.custid = o.orderid;
--EXISTS ����� ���
select name, address from customer c
where exists(select * from orders o 
where c.custid = o.custid);

--5)�������� ������ ������ ���ǻ� ��
select count(distinct publisher) as "���ǻ� ��"
from customer, orders , book 
where customer.custid = orders.custid
  and orders.bookid = book.bookid
  and customer.name = '������';
--6)�������� ������ ������ �̸�,����, ������ �ǸŰ��� ����
select bookname,price,saleprice-price as "�������ǸŰ�������"
from customer, orders, book
where customer.custid = orders.custid
  and orders.bookid = book.bookid
  and customer.name = '������';
--7)�������� �������� ���� ������ �̸�
 select bookname from book
 minus
 select bookname from book,customer,orders 
 where
  customer.custid = orders.custid
  and orders.bookid = book.bookid
  and customer.name = '������'; 
--8)�ֹ����� ���� ���� �̸�(�μ����� ���)
select name from customer                                                                    
where custid not in(select distinct custid from orders);
--9)�ֹ��ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice) as "�ֹ��ݾ��Ѿ�",avg(saleprice) as "�ֹ��ݾ����" from orders,book;
--10)���� �̸��� ���� ���ž�
select name,sum(saleprice) as "�������ž�" from book,customer,orders
where customer.custid = orders.custid
group by name;
--11)���� �̸��� ���� ������ ���� ���
select name,bookname from book,customer,orders
where customer.custid = orders.custid
      and book.bookid = orders.bookid;
--12)������ ����(Book ���̺�) �� �ǸŰ���(Orders ���̺�) �� ���̰� ���� ���� �ֹ�
  select * from orders, book 
  where orders.bookid = book.bookid   
  and (price-saleprice) = (select max(price-saleprice) from orders, book 
  where orders.bookid = book.bookid);
--13)���� �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
   select name from book b,orders o,customer c
   where b.bookid = o.bookid
   and c.custid = o.custid
   group by name having
   avg(saleprice) <= (select avg(saleprice) from orders o,customer c
   where c.custid = o.custid);
   
   --DDL(Data Defination Langusge):������ ���Ǿ�
   --create table/alter table/drop table
   --���̺� ���� ����1
create table newbook1(
bookid number,
bookname varchar2(20),
publisher varchar2(20),
price number
);
--���̺� �������� 2
--primary key ���� ��� 1
create table newbook2(
bookid number,
bookname varchar2(20),
publisher varchar2(20),
price number,
primary key (bookid)
);

--primary key ���� ��� 2
create table newbook3(
bookid number primary key,
bookname varchar2(20),
publisher varchar2(20),
price number
);

-- bookname �÷�: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������, �⺻���� 10000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
-- bookname, publisher �÷��� ����Ű�� ����
create table newbook4(
bookid number,
bookname varchar2(20) not null,
publisher varchar2(20) unique,
price number default 10000 check(price >= 1000),
primary key (bookname, publisher)
);
