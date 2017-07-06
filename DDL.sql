create table ADMIN (user_id varchar(25) not null,
password varchar(25) not null,
constraint pk_userid primary key(user_id));

create table STAFF_DETAILS (staff_id varchar(25) not null,
sfirstname varchar(25) not null ,
slastname varchar(25) not null,
staff_address varchar(100),
date_of_joining date,
salary number(10),
staff_phone_no number(12)not null,
user_id varchar(25),
constraint pk_staffid primary key(staff_id),
constraint fk_userid foreign key(user_id) references ADMIN (user_id));

create table STAFF_SALES (staff_id varchar(25) not null,
date_of_sales date,
amount number(6),
constraint fk_staffid foreign key (staff_id) references STAFF_DETAILS(staff_id));

create table CUSTOMER (cid varchar(25) not null,
cust_phone_no varchar(20) not null unique,
cname varchar(50),
cust_email varchar(25),
constraint pk_cid primary key(cid));

create table TRANSACTION (tid varchar(25) not null,
tdate date,
pname varchar(25),
pid varchar(25),
quantity varchar(10),
supplier_price varchar(10),
constraint pk_tid primary key(tid));

create table STOCKS (pid varchar(25) not null,
pname varchar(25),
date_of_moving date,
user_id varchar(25),
brand varchar(25),
quantity varchar(25),
price varchar(10),
tid varchar(25),
constraint pk_pid primary key(pid),
constraint fk_userid1 foreign key(user_id) references ADMIN(user_id),
constraint fk_tid foreign key(tid) references TRANSACTION(tid)); 

create table PURCHASE (cid varchar(25) not null,
cust_phone_no varchar(20) not null,
date_of_Sale date,
amount number(10),
staff_id varchar(10),
constraint fk_cid foreign key(cid) references CUSTOMER(cid),
constraint fk_staffid1 foreign key(staff_id) references STAFF_DETAILS(staff_id),
constraint fk_custph foreign key(cust_phone_no) references CUSTOMER(cust_phone_no));

create table LOOKUP (pid varchar(25) not null,
brand varchar(25),
price varchar(25),
constraint pk_pidlkup primary key(pid),
constraint fk_pid foreign key(pid) references STOCKS (pid));

create table STORE (pid varchar(25) not null,
pname varchar(50),
brand varchar(25),
quantity number(10),
price number(10),
date_of_purchase date,
constraint fk_stpid foreign key(pid) references STOCKS (pid));

create table SALES (pid varchar(25) not null,
quantity_sold varchar(20),
price number(10),
period_of_time varchar(20),
saleamount varchar(20),
constraint fk_salepid foreign key(pid) references STOCKS(pid));

CREATE OR REPLACE PROCEDURE DISCOUNT
(AMOUNT IN PURCHASE.amount%type)
IS
PURCH NUMBER;
BEGIN 
SELECT COUNT(*) INTO PURCH FROM PURCHASE
JOIN CUSTOMER ON PURCHASE.CID=CUSTOMER.CID;
IF(PURCH>1000) THEN
DBMS_OUTPUT.PUT_LINE('DISCOUNT');
ELSE
DBMS_OUTPUT.PUT_LINE('NO DISCOUNT');
END IF;
END;
/


create or replace trigger check_quantity
after insert or update of quantity on store
for each row
begin
if :new.quantity<0 or :new.quantity > 100 then
raise_application_error(-20157,'not a valid quantity');
end if;
end;
/
