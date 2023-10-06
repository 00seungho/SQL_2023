DECLARE
BEGIN
  insert into BOOK
  (BOOKID,BOOKNAME,PUBLISHER,PRICE)
  values
  (NULL,NULL,NULL,NULL);
  rollback; 
END;
