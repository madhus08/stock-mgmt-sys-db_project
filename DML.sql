
insert into ADMIN values ('ad123','store');
insert into ADMIN values ('ad213','store');
insert into ADMIN values ('ad312','store');
insert into ADMIN values ('ad425','store');
insert into ADMIN values ('ad500','store');


insert into STAFF_DETAILS values ('s11','Lena','Smith','144, thompson street, NY 10093',TO_DATE('JAN-04-2013','MON-DD-YYYY'),3000,'2034563214','ad123');
insert into STAFF_DETAILS values ('s31','Tom','Taylor','93, Allen street, NY 10092',TO_DATE('DEC-23-2010','MON-DD-YYYY'),6000,'4752314658','ad425');
insert into STAFF_DETAILS values ('s23','Lucy','White','1023, Auburn street, CT 06603',TO_DATE('JAN-08-2011','MON-DD-YYYY'),4000,'9190982456','ad213');
insert into STAFF_DETAILS values ('s30','David','King','2, Fulton street, NY 10091',TO_DATE('SEP-19-2012','MON-DD-YYYY'),5210,'2032104228','ad312');
insert into STAFF_DETAILS values ('s01','Paul','Miller','35, Franklin avenue, CT 06601',TO_DATE('MAR-10-2010','MON-DD-YYYY'),6240,'4756549087','ad500');
insert into STAFF_DETAILS values ('s52','Jone','Smith','288,West side avenue, NJ 07005',TO_DATE('OCT-15-2015','MON-DD-YYYY'),2130,'9193425890','ad123');

insert into CUSTOMER values ('c1','4756558942','Bill','bill@gmail.com');
insert into CUSTOMER values ('c23','2036758587','Edwin','edwin@ymail.com');
insert into CUSTOMER values ('c100','9197598952','Finch','finch@gmail.com');
insert into CUSTOMER values ('c213','9097456321','Harry','harry@hotmail.com');
insert into CUSTOMER values ('c46','2125479653','Bella','bella@gmail.com');
insert into CUSTOMER values ('c154','4776757426','Anny','anny@ymail.com');
insert into CUSTOMER values ('c99','7524789632','John','john@hotmail.com');

insert into TRANSACTION values ('t110',TO_DATE('JAN-02-2011','MON-DD-YYYY'),'mens shirts','pidshir01', '1000','$20');
insert into TRANSACTION values ('t115',TO_DATE('JAN-03-2011','MON-DD-YYYY'),'womens shirts','pidshir02', '1500','$25');
insert into TRANSACTION values ('t120',TO_DATE('JAN-04-2011','MON-DD-YYYY'),'capri','pidcapr03', '900','$20');
insert into TRANSACTION values ('t140',TO_DATE('JAN-02-2011','MON-DD-YYYY'),'mens jeans','pidjea04', '500','$30');
insert into TRANSACTION values ('t10',TO_DATE('JAN-04-2011','MON-DD-YYYY'),'womens skirts','pidskir05', '550','$15');
insert into TRANSACTION values ('t220',TO_DATE('JAN-05-2011','MON-DD-YYYY'),'mens tees','pidmtee06', '2000','$10');
insert into TRANSACTION values ('t11',TO_DATE('JAN-03-2011','MON-DD-YYYY'),'coats','pidcoa07', '1500','$70');
insert into TRANSACTION VALUES ('t1321',TO_DATE('DEC-10-2015','MON-DD-YYYY'),'coats','pidcoa07','200','$80');

insert into STOCKS values ('B110','mens shirt',TO_DATE('JAN-03-2011','MON-DD-YYYY'),'ad123','Calvin Klien','50','$30','t110');
insert into STOCKS values ('B111','mens shirt',TO_DATE('JAN-03-2011','MON-DD-YYYY'),'ad123','Nike','50','$28','t110');
insert into STOCKS values ('B113','mens shirt',TO_DATE('JAN-04-2011','MON-DD-YYYY'),'ad123','Adidas','40','$28','t110');
insert into STOCKS values ('B210','womens shirt',TO_DATE('JAN-03-2011','MON-DD-YYYY'),'ad213','Phoebe','50','$18','t115');
insert into STOCKS values ('B211','womens shirt',TO_DATE('JAN-03-2011','MON-DD-YYYY'),'ad213','Felina','40','$20','t115');
insert into STOCKS values ('B500','mens coats',TO_DATE('JAN-10-2011','MON-DD-YYYY'),'ad500','Blackout','50','$77','t11');
insert into STOCKS values ('B501','womens coats',TO_DATE('JAN-10-2011','MON-DD-YYYY'),'ad500','Baccinni','67','$80','t11');
insert into STOCKS values ('B301','mens tees',TO_DATE('JAN-04-2011','MON-DD-YYYY'),'ad312','Nike','98','$18','t220');
insert into STOCKS values ('B302','mens tees',TO_DATE('JAN-04-2011','MON-DD-YYYY'),'ad312','Polo','80','$20','t220');
insert into STOCKS values ('B410','womens skirts',TO_DATE('JAN-05-2011','MON-DD-YYYY'),'ad425','Habitual','110','$20','t10');
insert into STOCKS values ('B411','womens skirts',TO_DATE('JAN-05-2011','MON-DD-YYYY'),'ad425','Parker','90','$19','t10');

insert into LOOKUP (pid,brand,price)
select pid,brand,price from STOCKS;

insert into STORE values ('B110','mens shirt','Calvin Klien',20,30,TO_DATE('JAN-03-2011','MON-DD-YYYY'));
insert into STORE values ('B111','mens shirt','Nike',30,28,TO_DATE('JAN-03-2011','MON-DD-YYYY'));
insert into STORE values ('B210','womens shirt','Phoebe',9,18,TO_DATE('JAN-04-2011','MON-DD-YYYY'));
insert into STORE values ('B500','mens coats','Blackout',15,77,TO_DATE('JAN-11-2011','MON-DD-YYYY'));
insert into STORE values ('B410','womens skirts','Habitual',10,20,TO_DATE('JAN-04-2011','MON-DD-YYYY'));
insert into STORE values ('B211','womens shirt','Felina',20,40,TO_DATE('JAN-05-2011','MON-DD-YYYY'));
insert into STORE values ('B411','womens skirts','Parker',3,19,TO_DATE('JAN-21-2011','MON-DD-YYYY'));
insert into STORE values ('B210','womens shirt','Phoebe',9,10,TO_DATE('JAN-24-2011','MON-DD-YYYY'));
insert into STORE values ('B113','mens shirt','Adidas',150,28,TO_DATE('JAN-29-2011','MON-DD-YYYY'));

insert into SALES (pid,quantity_sold,price,period_of_time,saleamount)
select pid, sum(quantity),price, date_of_purchase,price
from STORE group by date_of_purchase,pid,price;
update sales set saleamount=price*quantity_sold;

insert into PURCHASE values ('c1','4756558942',TO_DATE('JAN-03-2011','MON-DD-YYYY'),600,'s11');
insert into PURCHASE values ('c46','2125479653',TO_DATE('JAN-11-2011','MON-DD-YYYY'),1155,'s30');
insert into PURCHASE values ('c154','4776757426',TO_DATE('JAN-04-2011','MON-DD-YYYY'),200,'s52');
insert into PURCHASE values ('c100','9197598952',TO_DATE('JAN-03-2011','MON-DD-YYYY'),840,'s01');
insert into PURCHASE values ('c213','9097456321',TO_DATE('JAN-05-2011','MON-DD-YYYY'),800,'s31');
insert into PURCHASE values ('c46','2125479653',TO_DATE('JAN-21-2011','MON-DD-YYYY'),57,'s01');
insert into PURCHASE values ('c46','2125479653',TO_DATE('JAN-24-2011','MON-DD-YYYY'),90,'s52');

insert into STAFF_SALES (staff_id,date_of_sales,amount)
select staff_id,date_of_sale,amount from PURCHASE;
