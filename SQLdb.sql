formulated queries:

1)	View the total quantity of items available in the stock which has a product name of “Shirt”.
select sum(quantity) from STOCKS where pname like '%sh%';

2)	View the number of products that was purchased on 2nd of January 2011.
select sum(quantity) from TRANSACTION where tdate='02-JAN-2011';

3)	Give the transaction id of the product “Pant” purchased on 10th of December 2015.
select tid from TRANSACTION where tdate='10-DEC-2015' and pname='coats';

4)	View the price of the product with a product id of 1025.
 select T.SUPPLIER_PRICE AS SUPPLIER_PRICE , S.PRICE AS SELLER_PRICE
 FROM TRANSACTION T, STOCKS S
 WHERE T.TID=S.TID
 AND T.TID='t110';
 
5)	View the count of id values in stock sorted in the order of date of moving.
	 select count(pid), pname,date_of_moving from stocks group by pname,date_of_moving order by date_of_moving;

6)	List the customers who made a purchase of $1000.
select * from purchase where amount<1000;

7)	View the item that is present in lookup table and also sold out.
	 select * from lookup where pid in(select pid from sales);

8)	View the date of joining of the staff whose id is s01.
select date_of_joining from staff_details where staff_id='s01';

9)	View the total sales made by a staff whose id is 79.
select sum(amount) from staff_sales where staff_id='s01';

10)	Update the salary of the staff by 30% whose id is 2.
update staff_details set salary = salary+(salary*0.3) where staff_id='s01';

11)	View the count of good sold by the store within a period of 10th January 2015 to 20th June 2015.
 select count(quantity_sold) , price from sales where period_of_time>='02-JAN-2011' AND
period_of_time <='12-JAN-2011' group by price;

12)	Add a new user to the admin.
insert into admin values ('ad697','store');

13)	Delete the customer with the customer id of 1005.
 delete customer where cid='c99';
 
14)	Update the phone number of staff with date of joining 30th April 2015.
 update staff_details set staff_phone_no='2038767907' where staff_id='s23';

15)	View all the customers who purchases in the store.
select unique * from customer join purchase on customer.cid=purchase.cid;