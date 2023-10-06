create or replace procedure interest
as 
    myInterest number;
    price numeric;
    CURSOR interestCursor IS SELECT saleprice FROM orders;
begin
    myInterest := 0.0;
    open interestCursor;
    loop
        fetch interestCursor into price;
        exit when interestCursor%NOTFOUND;
        if price >= 30000 then
            myInterest := myInterest + price * 0.1;
        else
            myInterest := myInterest + price * 0.5;
        end if;
    end loop;
    close interestCursor;
    DBMS_OUTPUT.PUT_LINE('��ü ���ͱݾ� ='|| round(myInterest,3));
end;
