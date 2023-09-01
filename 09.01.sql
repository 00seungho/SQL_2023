select * from book;
--book���̺����� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�
select * from book
where bookname like '%����%' and price >= 15000;

--book���̺����� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ������ �˻��Ͻÿ�
select *from book
where publisher = '�½�����' or publisher = '��ũ�ν�';

--���� ������ in �����ڸ� ����Ͽ� ������ ���ÿ�
select *from book
where publisher in '�½�����' or publisher in '��ũ�ν�';

--book���̺����� ������������ �˻��Ͻÿ�.
select *from book order by bookname;
--book���̺����� ������ȣ������ �˻��Ͻÿ�.
select *from book order by bookid;
--book���̺����� ���� ������ �˻��� �ϰ� ����  �����̸� �̸� ������ �˻��Ͻÿ�.
select *from book order by price, bookname;
--book���̺����� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ� ������ �˻��Ͻÿ�,
select *from book order by price desc, publisher asc;

select * from orders;
--order ���̺����� ������ �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
--�����Լ� ��� (�հ�: sum)
select sum(saleprice) from orders;


-- orders���̺����� ���� ��ȣ�� 1�� ������ �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ� from orders
where custid = 1 ;

-- orders ���̺����� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�,
avg(saleprice) as �Ǹž����,
min(saleprice) as ��������,
max(saleprice) as �ִ밡��
from orders;


--orders ���̺����� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*) from orders;
--orders ���̺����� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�.
select count(*) from orders where saleprice >=13000;
--orders ���̺����� ������ȣ�� 1 �Ǵ� 3�� ������ �ֹ� ������ ���Ͻÿ�.
select count(*) from orders where custid in (1,3);


--orders ���̺����� ������ �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.
--�׷�ȭ(�κ���): group by
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ�
from orders
group by custid
order by custid;

--orders ���̺����� �ǸŰ����� 8000���̻��� ������ ������ ������ ���� ������ �ֹ� ������ �� ������ ���Ͻÿ�.
--�� 2���̻� ������ ������ ����Ͻÿ�
select custid, count(*) as �������� from orders
where saleprice >= 8000
group by custid
having count(*) >= 2
order by custid;

--��������

--���缭���� ������ �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
--1)������ȣ�� 1�� ������ �̸�,
select bookname from book
where bookid = 1;
--2)������ 20,000�� �̻��� ������ �̸�, 
select bookname from book
where price >= 20000;
--3)�������� �� ���ž�(�������� ������ȣ�� 1������ ���� �ۼ�),
select sum(saleprice) as �������Ǳ��ž� from orders
where custid = 1;
--4)�������� ������ ������ ��
select count(*) as �������̱����ѵ����Ǽ� from orders
where custid = 1;


--���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�.
--1)���缭�� ������ �� ���� 
select count(*) as �Ѱ��� from book;
--2)���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) as ���ǻ����Ѱ��� from book;

--3)��� ������ �̸�, �ּ� 
select name,address from customer;
--4)2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select orderid from orders
where orderdate >= '14/07/04' and orderdate <= '14/07/07';
--5)2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ
select orderid from orders
where not (orderdate >= '14/07/04' and orderdate <= '14/07/07');
--6)���� �达�� ������ �̸��� �ּ�
select name,address from customer
where name like '��%';
-- 7)���� �达�̰� �̸��� �Ʒ� ������ ������ �̸��� �ּ�
select name,address from customer
where name like '��%��%';