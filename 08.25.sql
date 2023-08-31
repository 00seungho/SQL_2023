--�������� Book ���̺�
create table Book(
    bookid NUMBER(2) PRIMARY Key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price  NUMBER(8)
);
--������ Customer ���̺�
create table Customer(
    custid NUMBER(2) PRIMARY key,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(50)
);
-- �ֹ����� Orders ���̺�

create table Orders(
    orderid NUMBER(2) PRIMARY key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);
--Imported_Book ���̺�
create table Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price  NUMBER(8)
);

--Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book values(1,'�౸�� ����','�½�����', 7000);
insert into Book values(2,'�౸ �ƴ� ����','������', 13000);
insert into Book values(3,'�͸���Į�� 1��','�л깮ȭ��', 7000);
insert into Book values(4,'������ ������','����������', 12600);
insert into Book values(5,'���Ƕ� �����ΰ�','�������', 13500);
insert into Book values(6,'���ǿ�','����å��', 14220);
insert into Book values(7,'1�� �丮 �ҵ�����','���', 19800);
insert into Book values(8,'�Ƹ޸�ĭ ���θ��׿콺','���̾𽺺Ͻ�', 22500);
insert into Book values(9,'��ũ��Ʈ �����Ǿ�','����������', 13500);
insert into Book values(10,'Ŀ���� ����','����ü', 15300);

-- Customer ���̺������� 5�� �߰�
insert into Customer values(1,'������','���� ��ü����', '000-5000-001');
insert into Customer values(2,'�迬��','���� ���۱� �漮��', '02-3333-5555');
insert into Customer values(3,'��̶�','���� ��걸 ������', '02-555-7777');
insert into Customer values(4,'�߽ż�','��õ������ ������', '032-233-5656');
insert into Customer values(5,'�ڼ���','���������� ������', '042-1234-5678');

