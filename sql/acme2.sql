
CREATE TABLE Customer (
   CustomerID  INT NOT NULL primary key,
   FName  VARCHAR(15) NOT NULL ,
   LName  VARCHAR(15) NOT NULL ,
   Areacode  VARCHAR(3),
   Phone  VARCHAR(10)
);

insert into Customer values (1011, 'Neo', 'Anderson', '413', '756-1878');
insert into Customer values (108, 'Maria', 'Funicelo', '413', '382-2385');
insert into Customer values (1012, 'Jose', 'Martinez', '617', '742-2523');
insert into Customer values (1015, 'Nguyen', 'Tran', '617', '554-2334');
insert into Customer values (104, 'Myron', 'Weiner', '617', '222-1682');
insert into Customer values (1014, 'DeSouza', 'Nicole', '887', '535-3241');
insert into Customer values (1016, 'Puente', 'Tito', '332','555-4431');
insert into Customer values (1017, 'Hanks', 'Tom', '632', '221-3425');
insert into Customer values (1008, 'Wentz', 'John', '746', '667-1234');


CREATE TABLE PRODUCT (
PID VARCHAR(10) PRIMARY KEY,
Description VARCHAR(35),
QtyInStock int NOT NULL,
UnitPrice FLOAT NOT NULL
);

INSERT INTO PRODUCT VALUES('11QER/31','Power painter', 5, 109.99);
INSERT INTO PRODUCT VALUES('2232/QTY','B\&D jigsaw', 15, 109.92);
INSERT INTO PRODUCT VALUES('2238/QPD','B\&D cordless drill', 23, 38.95);
INSERT INTO PRODUCT VALUES('23109-HB','Claw hammer', 10, 9.95);
INSERT INTO PRODUCT VALUES('23114-AA','Sledge hammer', 6, 14.40);
INSERT INTO PRODUCT VALUES('54778-2T','Rat-tail file', 11, 4.99);

alter table product add column discount numeric(5,2);
update product set discount=.05 where qtyinstock=5 or qtyinstock=23;
update product set discount=.25 where qtyinstock=15 or qtyinstock=11;
update product set discount=.15 where qtyinstock=6;
update product set discount=.00 where qtyinstock=10;

CREATE TABLE INVOICE (
InvNumber INT NOT NULL PRIMARY KEY,
InvDate DATE NOT NULL,
CustomerID INT NOT NULL,
PID VARCHAR(10),
Foreign Key (CustomerID) References Customer (CustomerID),
Foreign Key (PID) References Product (PID)
);

INSERT INTO INVOICE VALUES(1035,'2011-05-05', 1011, '11QER/31');
INSERT INTO INVOICE VALUES(1047,'2012-12-16', 1011, '23114-AA');
INSERT INTO INVOICE VALUES(1024,'2002-11-11', 1011, '23114-AA');
INSERT INTO INVOICE VALUES(1015,'2010-10-17', 108, '2232/QTY');
INSERT INTO INVOICE VALUES(1079,'2012-12-13', 1012, '23109-HB');
INSERT INTO INVOICE VALUES(1020,'2011-01-23', 1015, '2232/QTY');
INSERT INTO INVOICE VALUES(1017,'2010-09-20', 104, '54778-2T');
INSERT INTO INVOICE VALUES(1070,'2012-10-15', 104, '2238/QPD');

