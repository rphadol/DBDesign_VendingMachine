--Rajshree Phadol
--IT6863 Database Security & Auditing
--16 October 2017

 
--a) Table CUSTOMER

CREATE TABLE CUSTOMER
(
CUST_ID        INT        PRIMARY KEY,
CUST_NAME      VARCHAR (50),
ADDRESS        VARCHAR(50),
CITY           VARCHAR(50),
STATE          VARCHAR(50),
ZIP_CODE       INT,
CONTACT_NUMBER INT

);

INSERT INTO CUSTOMER(CUST_ID, CUST_NAME, ADDRESS, CITY, STATE, ZIP_CODE, CONTACT_NUMBER)
VALUES(101, 'Kennesaw State University', '1100 Marrieta','Atlanta','GA',30345,2786549087);

INSERT INTO CUSTOMER(CUST_ID, CUST_NAME, ADDRESS, CITY, STATE, ZIP_CODE, CONTACT_NUMBER)
VALUES(102, 'Vertafore', '876 peachtree rd','Atlanta','GA',32987,8769760987);

INSERT INTO CUSTOMER(CUST_ID, CUST_NAME, ADDRESS, CITY, STATE, ZIP_CODE, CONTACT_NUMBER)
VALUES(103, 'Kennesaw State University', '1200 kennesaw','Atlanta','GA',30333,4048763542);


INSERT INTO CUSTOMER(CUST_ID, CUST_NAME, ADDRESS, CITY, STATE, ZIP_CODE, CONTACT_NUMBER)
VALUES(104, 'Gerogia Tech', '888 Georgia Tech ave','Atlanta','GA',32987,2668973540);

INSERT INTO CUSTOMER(CUST_ID, CUST_NAME, ADDRESS, CITY, STATE, ZIP_CODE, CONTACT_NUMBER)
VALUES(105, 'Perimeter walmart', '1900 peachtree rd','Atlanta','GA',30333,8678782341);

Select * from CUSTOMER;


 

--b) Table Technician
--drop Table Technician
Create Table Technician
(
T_ID    INT primary key,
T_FirstName   varchar(30),
T_LastName    varchar(30),
T_Contact     INT
);

INSERT INTO  Technician(T_ID, T_FirstName, T_LastName, T_Contact)
VALUES(10, 'Vishal', 'Kharjul',4449862325);

INSERT INTO  Technician(T_ID, T_FirstName, T_LastName, T_Contact)
VALUES(11, 'Vibha', 'Desai',9876098321);

INSERT INTO  Technician(T_ID, T_FirstName, T_LastName, T_Contact)
VALUES(12, 'Kapil', 'Joshi', 5674321890);

INSERT INTO  Technician(T_ID, T_FirstName, T_LastName, T_Contact)
VALUES(13, 'Mayur', 'Phadol',2679876543);

INSERT INTO  Technician(T_ID, T_FirstName, T_LastName, T_Contact)
VALUES(14, 'Shobha', 'Phadol',9076234986);

Select * from Technician;
 

--drop Table VendingMachine

create table VendingMachine
(
V_ID     INT Primary key,
MachineLocation  Varchar(50),
CUST_ID       INT,  

CONSTRAINT FK1_CUSTOMER FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID)
);

INSERT INTO  VendingMachine(V_ID, MachineLocation, CUST_ID)
VALUES(501, '1100 Marrieta Atlanta GA 30345',103);

INSERT INTO  VendingMachine(V_ID, MachineLocation, CUST_ID)
VALUES(502,'1032 Marsh trail cir Atlanta GA 30328', 105);

INSERT INTO  VendingMachine(V_ID, MachineLocation, CUST_ID)
VALUES(503,'1902 Parkair Crossing NC 30876' , 101);

INSERT INTO  VendingMachine(V_ID, MachineLocation, CUST_ID)
VALUES(504,'678 Morgans Fall Sandy springs GA 30332', 104);

INSERT INTO  VendingMachine(V_ID, MachineLocation, CUST_ID)
VALUES(505,'234 Abernathy Sqaure Dunwoody GA 35467', 102);

select * from VendingMachine;
 





--drop Table ItemInVendingmachine
Create table ItemInVendingmachine
(
Item_ID  INT Primary key,
RefillDate   date,
AvailableQuant   INT,
T_ID    INT,
V_ID      INT,
 CONSTRAINT FK1_Technician FOREIGN KEY (T_ID) REFERENCES Technician(T_ID),
  CONSTRAINT FK_VendingMachine FOREIGN KEY (V_ID) REFERENCES VendingMachine(V_ID)
);

INSERT INTO  ItemInVendingmachine(Item_ID, RefillDate, AvailableQuant, T_ID, V_ID)
VALUES(90001,'21-JUN-17', 100, 12, 501);

INSERT INTO  ItemInVendingmachine(Item_ID, RefillDate, AvailableQuant, T_ID, V_ID)
VALUES(90002,'10-JUN-17', 90, 14, 503);

INSERT INTO  ItemInVendingmachine(Item_ID, RefillDate, AvailableQuant, T_ID, V_ID)
VALUES(90003,'21-May-17', 50, 13, 505);

INSERT INTO  ItemInVendingmachine(Item_ID, RefillDate, AvailableQuant, T_ID, V_ID)
VALUES(90004,'10-May-17', 100, 11, 504);

INSERT INTO  ItemInVendingmachine(Item_ID, RefillDate, AvailableQuant, T_ID, V_ID)
VALUES(90005,'21-Apr-17', 110, 12, 501);

Select * from ItemInVendingmachine;
 

--drop Table Orders
Create table Orders
(OrderID     INT Primary key,
Orderdate    date,
T_ID       INT,
CUST_ID     INT,
OrderStatus Varchar(50),
AMOUNT_PAID int,
CONSTRAINT FK_Technician FOREIGN KEY (T_ID) REFERENCES  Technician(T_ID),

CONSTRAINT FK2_CUSTOMER FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID)
);


INSERT INTO  Orders(OrderID, Orderdate, T_ID, CUST_ID,OrderStatus,amount_paid)
VALUES(401,'18-Jun-17', 12, 104,'Completed',1000);

INSERT INTO  Orders(OrderID, Orderdate, T_ID, CUST_ID,OrderStatus,amount_paid)
VALUES(402,'9-Jun-17', 10, 101,'Completed',500);

INSERT INTO  Orders(OrderID, Orderdate, T_ID, CUST_ID,OrderStatus,amount_paid)
VALUES(403,'19-May-17', 14, 105,'Completed',1000);

INSERT INTO  Orders(OrderID, Orderdate, T_ID, CUST_ID,OrderStatus,amount_paid)
VALUES(404,'10-May-17', 13, 102,'Completed',500);

INSERT INTO  Orders(OrderID, Orderdate,  T_ID, CUST_ID,OrderStatus,amount_paid)
VALUES(405,'17-apr-17', 11, 104,'Completed',1000);

select * from Orders;
 

--Sequence for Receipt Table
create sequence reciept_ReceiptNum_seq start with 10001
increment by 1;

 





Create table Receipt
(
ReceiptNum     INT primary key,
ReceiptPaymentDate   Date,
Amount_Paid    INT,
OrderID  INT,

CONSTRAINT FK2_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO  Receipt(ReceiptNum, ReceiptPaymentDate, Amount_Paid,OrderID)
VALUES(reciept_ReceiptNum_seq.nextval, '21-JUN-17', 1000,403);

INSERT INTO  Receipt(ReceiptNum, ReceiptPaymentDate, Amount_Paid, OrderID)
VALUES(reciept_ReceiptNum_seq.nextval, '10-JUN-17', 1000,401);


INSERT INTO  Receipt(ReceiptNum, ReceiptPaymentDate, Amount_Paid,OrderID)
VALUES(reciept_ReceiptNum_seq.nextval, '21-May-17', 500, 402);


INSERT INTO  Receipt(ReceiptNum, ReceiptPaymentDate, Amount_Paid,OrderID)
VALUES(reciept_ReceiptNum_seq.nextval, '10-May-17', 1000,405);


INSERT INTO  Receipt(ReceiptNum, ReceiptPaymentDate, Amount_Paid,OrderID)
VALUES(reciept_ReceiptNum_seq.nextval, '21-Apr-17', 500,404);

select * from Receipt;

 




--drop Table ItenInOrder
Create table ItenInOrder
(
Item_ID   int primary key,
OrderID  int,
Quantity  Int,

CONSTRAINT FK_ORDERS FOREIGN KEY (orderID) REFERENCES ORDERS(OrderID),
CONSTRAINT FK_ItemInVendingmachine FOREIGN KEY (Item_ID) REFERENCES ItemInVendingmachine(Item_ID)

);

INSERT INTO  ItenInOrder(Item_ID, OrderID, Quantity)
VALUES(90003,405,40);

INSERT INTO  ItenInOrder(Item_ID, OrderID, Quantity)
VALUES(90001,402,50);

INSERT INTO  ItenInOrder(Item_ID, OrderID, Quantity)
VALUES(90005,404,80);

INSERT INTO  ItenInOrder(Item_ID, OrderID, Quantity)
VALUES(90002,403,70);

INSERT INTO  ItenInOrder(Item_ID, OrderID, Quantity)
VALUES(90004,401,90);

select * from ItenInOrder;

 








--Sequence for Receipt Table
create sequence reciept_ReceiptNum_seq start with 10001
increment by 1;

 



--Before applying Trigger
a)	select * from Receipt;
 

b)	select * from Orders;
 



--Trigger Query:
create or replace trigger orders_after_update 
AFTER UPDATE 
	ON ORDERS 
	FOR EACH ROW 
BEGIN 
        
	IF :NEW.ORDERSTATUS = 'Completed' THEN 
         INSERT INTO RECEIPT VALUES(reciept_ReceiptNum_seq.nextval,SYSDATE,:OLD.AMOUNT_PAID,:OLD.ORDERID);
  END IF;
END ;
/
 

 



--Inserting New row in order table
INSERT INTO  Orders(OrderID, Orderdate,  T_ID, CUST_ID,OrderStatus,amount_paid)
VALUES(407,SYSDATE, 11, 104,'In Progress',20000);
 
--After applying Trigger
a)	select * from orders ;
 

b)	Select * from receipt;

 
--Updated "orderstatus" to "completed" for OrderID=407 so that trigger will apply on receipt table
a)	update orders set orderstatus='Completed' where orderid=407;

 
b)	select * from orders ;
 

c)	select * from receipt;


 
 
 
 
 --Section IV

a.	adding an item +5 points



INSERT INTO  ItemInVendingmachine(Item_ID, RefillDate, AvailableQuant, T_ID, V_ID)
VALUES(90006,'21-July-17', 500, 11, 505);

 

Select * from ItemInVendingmachine;
 





--b.	adding a vending machine +5 points

INSERT INTO  VendingMachine(V_ID, MachineLocation, CUST_ID)
VALUES(506,'1234 marsh trail Cir GA 35467', 105);

 

 
--c.	updating inventory of the vending machine +5 points

UPDATE ItemInVendingmachine SET AvailableQuant=100 where Item_ID=90003;
 


Select * from ItemInVendingmachine;

 


--d.	updating the technician's information +5 points

UPDATE Technician SET T_LastName= 'Vaidya' where T_ID=11;

 

 

--e.	deleting a vending machine +5 points

select * from VendingMachine;

DELETE FROM VendingMachine WHERE V_ID=506;



 

 

--f.	deleting a technician +5 points
Technician if FK for other tables so, first it was giving error then I dropped other tables to delete Technician.

DELETE FROM Technician WHERE T_ID=12;

 


Select * from Technician;
 

--g.	demo user permissions for all three groups +15 points
--user Administrator
CREATE USER Raji 
 IDENTIFIED BY xyz123
      DEFAULT TABLESPACE users
      TEMPORARY TABLESPACE temp
      QUOTA 10M ON users
      PROFILE default;
      
                GRANT connect to Raji;
                GRANT create table to Raji;
                GRANT insert,update, delete, select on 
                ItenInOrder to Raji; 
                GRANT insert,update, delete, select  on 
                Orders to Raji; 
                GRANT insert,update, delete, select  on 
                ItemInVendingmachine to Raji; 
                GRANT insert,update, delete, select  on 
                Vendingmachine to Raji;
                GRANT insert,update, delete, select  on 
                Technician to Raji;
                GRANT insert,update, delete, select  on 
                Technician to Raji;
                GRANT insert,update, delete, select  on 
                Receipt to Raji;
                GRANT insert,update, delete, select  on 
                CUSTOMER to Raji;

 


--user Technician
CREATE USER Tech1
    IDENTIFIED BY abc123
    DEFAULT TABLESPACE users
    QUOTA 10M ON users
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system 
    PROFILE default
    PASSWORD EXPIRE;
 
   GRANT connect to Tech1;

 
GRANT select,insert,update on Orders to Tech1;
 


--userReportingStaff
CREATE USER Vishu
    IDENTIFIED BY abc123
    DEFAULT TABLESPACE users
    QUOTA 10M ON users
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system 
    PROFILE default
    PASSWORD EXPIRE;
    
  GRANT connect to Vishu;

Grant update on ItemInVendingMachine to Vishu;



--h.	weekly report generation +25 points

	select * from orders where orderdate between SYSDATE-7 and SYSDATE and orderstatus='Completed' ;
 
 
select * from orders where orderdate between SYSDATE-7 and SYSDATE and orderstatus='In Progress' ; 







