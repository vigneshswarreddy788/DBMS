CREATE database Restaurant

CREATE TABLE Restaurant
(
RID       INT              PRIMARY KEY,
RName     VARCHAR(50)      NOT NULL,
ADDRESS   VARCHAR(200)     NOT NULL,
contact   VARCHAR(15)      UNIQUE NOT NULL,
Type      VARCHAR(15)      NOT NULL,
Rating    DECIMAL(6,1)     CHECK(Rating<=5)
)

DROP TABLE Restaurant

SELECT * FROM Restaurant

INSERT INTO Restaurant VALUES(5, 'Bilal', 'Rangampeta', '9878959540','Veg', 4.5)
INSERT INTO Restaurant VALUES(4, 'Ismali', 'TPT', '9878959785','Non - Veg', 3.3)
INSERT INTO Restaurant VALUES(3, 'Minerva', 'Hyd', '9878959542','Both', 4.5)
INSERT INTO Restaurant VALUES(101, 'Miado', 'Peru', '9878959541','veg', 5)
INSERT INTO Restaurant VALUES(107, 'Taj', 'Guntur', '9878959549','Non-Veg', 4.5)

UPDATE Restaurant SET ADDRESS = 'HYD' WHERE RID = 101


CREATE TABLE customer
(
UID            INT             PRIMARY KEY,
Name           VARCHAR(50)     NOT NULL,
Phone_Number   VARCHAR(15)     UNIQUE NOT NULL,
Email          VARCHAR(100)    UNIQUE null,
ADDRESS        VARCHAR(100)    NOT NULL
)

DROP TABLE customer

SELECT * FROM customers

INSERT INTO customers VALUES(101, 'Ballu', '9874561230', 'ballu.659@gamil.com', 'Ongole')
INSERT INTO customers VALUES(102, 'Vivek', '9874561231', 'vivek.659@gamil.com', 'Banglore')
INSERT INTO customers VALUES(103, 'Sanu', '9874561232', 'sanu.659@gamil.com', 'Prakasam')
INSERT INTO customers VALUES(104, 'Roja', '9874561233', 'roja.659@gamil.com', 'Bombay')
INSERT INTO customers VALUES(210, 'Sita', '9874561234', 'sita.659@gamil.com', 'Varanasi')
INSERT INTO customers VALUES(106, 'lallu', '9874561235', 'lallu.659@gamil.com', 'TPT')
INSERT INTO customers VALUES(107, 'veera', '9874561236', 'veera.659@gamil.com', 'Vijayawada')
INSERT INTO customers VALUES(108, 'praveen', '9874561237', 'praveen.659@gamil.com', 'Eluru')
INSERT INTO customers VALUES(109, 'srihari', '9874561238', 'srihari.659@gamil.com', 'Chennai')
INSERT INTO customers VALUES(100, 'Harshith', '9874561220', 'harshith.659@gamil.com', 'Madars')

CREATE TABLE Foods
 (
FID        INT           PRIMARY KEY,
FName      VARCHAR(100)  NOT NULL,
Type       VARCHAR(15)   NOT NULL,
Quantity   VARCHAR(20)   null,
Price      INT           CHECK(price>0) NOT NULL,
RID        INT,          foreign key(RID) references Restaurants(RID)
)

DROP TABLE Food

SELECT * FROM Foods

INSERT INTO Foods VALUES(20, 'chicken loli pop Biryani', 'Non-Veg', '500 gm', 550, 3)
INSERT INTO Foods VALUES(21, 'Curd Rice', 'Veg', '500 gm', 120, 101)
INSERT INTO Foods VALUES(22, 'Burger', 'veg', '550 gm', 2550, 107)
INSERT INTO Foods VALUES(305, 'South Indian Meals', 'Veg', null, 399, 107)
INSERT INTO Foods VALUES(23, 'Chicken Thali', 'FastFood', '1500 gm', 250, 4)
INSERT INTO Foods VALUES(24, 'Butter Chicken', 'Non-Veg', '1000 gm', 550, 101)
INSERT INTO Foods VALUES(25, 'mutton biryani', 'Non-Veg', '1000 gm', 830, 3)
INSERT INTO Foods VALUES(26, 'Paneer Tikka Masala', 'FastFood', '1000 gm', 250, 5)
INSERT INTO Foods VALUES(27, 'Nellore Chepalu Pulusu', 'Non-Veg', '750 gm', 600, 3)
INSERT INTO Foods VALUES(28, 'Bisi Bele Bhath', 'Veg', null, 420, 107)
INSERT INTO Foods VALUES(29, 'Ragi Mudde with Soppu Saaru', 'Veg', null, 300, 3)



CREATE TABLE Staffs
(
SID            INT           PRIMARY KEY,
Name           VARCHAR(100)  NOT NULL,
Orders         INT,
Position       VARCHAR(50)   NOT NULL,
Rating         INT,
salary         VARCHAR(10),
RID            INT           foreign key (RID) references Restaurants (RID)
)

DROP TABLE Staff

SELECT * FROM Staffs

INSERT INTO Staffs VALUES(99, 'Raju', 201, 'Waiter', 4.6, '15k', 2)
INSERT INTO Staffs VALUES(100, 'sreenu', 5, 'Cheif',5, '20k', 5)
INSERT INTO Staffs VALUES(101, 'Rajesh', 255, 'Cashier',2, '15k', 1)
INSERT INTO Staffs VALUES(102, 'Suresh', 30, 'Cleaner', 1, '10k', 3)
INSERT INTO Staffs VALUES(103, 'Peeru', 22, 'Waiter',1, '15k', 2)
INSERT INTO Staffs VALUES(104, 'Hemanth', 223, 'Delivery Executive',4.6, '20k', 2)
INSERT INTO Staffs VALUES(105, 'Ramesh', 5, 'Receptionist',3, '20k', 4)
INSERT INTO Staffs VALUES(106, 'kishore', 5, 'Manager',2, '35k', 2)
INSERT INTO Staffs VALUES(107, 'Venkat', 5, 'Waiter',4, '15k', 3)
INSERT INTO Staffs VALUES(108, 'Ramu', 222, 'Manager',4.5, '35k', 2)



CREATE TABLE Payments
(
PID              INT    PRIMARY KEY,
Amount           INT    NOT NULL,
Ptype            VARCHAR(50) NOT NULL CHECK(Ptype In('UPI', 'Cash', 'Card')),
PDate            date,
Discount         INT,
UID              INT,   foreign key(UID) references customers(UID)
)

DROP TABLE Payment

SELECT * FROM Payments

INSERT INTO Payments VALUES(505, 1500, 'Cash', '2026-09-12', 10, 101)
INSERT INTO Payments VALUES(12, 1000, 'UPI', '2026-08-12', 10, 102)
INSERT INTO Payments VALUES(13, 500, 'Card', '2027-08-12', 10, 103)
INSERT INTO Payments VALUES(14, 2000, 'UPI', '2026-08-12', 10, 104)
INSERT INTO Payments VALUES(15, 1550, 'Cash', '2026-08-30', 10, 210)
INSERT INTO Payments VALUES(16, 2200, 'UPI', '2027-06-12', 10, 106)
INSERT INTO Payments VALUES(501, 2256, 'Cash', '2026-08-12', 10, 107)
INSERT INTO Payments VALUES(18, 3694, 'Card', '2026-09-12', 10, 108)
INSERT INTO Payments VALUES(309, 999, 'UPI', '2026-07-13', 10, 109)
INSERT INTO Payments VALUES(20, 1500, 'Cash', '2026-08-12', 10, 110)


SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT * FROM Restaurants
SELECT * FROM customers
SELECT * FROM Foods
SELECT * FROM Staffs
SELECT * FROM Payments

update Restaurants set RName = 'Chitti Babu Biryani' where RID = 2
update Restaurants set address = 'Nellore' where RID = 2
update Restaurants set Rating = 4.5 where RID = 3
update staffs set SID = 9 where SID = 99
update restaurants set address = 'Nellore' where RID = 2