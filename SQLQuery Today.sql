CREATE DATABASE BookMyShowQ;

USE BookMyShowQ;

CREATE TABLE Customer
(
    C_Id INT PRIMARY KEY,
    C_Name VARCHAR(100) NOT NULL,
    Mobile BIGINT NOT NULL,
    Email VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Customer VALUES
(123,'Arjun',9876543210,'arjun@gmail.com','Tirupati'),
(124,'Sneha',9123456780,'sneha@gmail.com','Chennai'),
(125,'Rahul',9988776655,'rahul@gmail.com','Tirupati'),
(126,'Priya',9012345678,'priya@gmail.com','Hyderabad'),
(127,'Varun',9345678901,'varun@gmail.com','Hyderabad'),
(128,'Adithya',9098943210,'adithya@gmail.com','Ongole'),
(129,'Sunitha',9678456780,'sunitha@gmail.com','Tirupati'),
(130,'Rohit',8988709855,'rohit@gmail.com','Hyderabad'),
(131,'Praveen',8009875678,'praveen@gmail.com','Andhra Pradesh'),
(132,'Vikram',7345678901,'vikram@gmail.com','Tirupati'),
(133,'Anji',9709808109,'anji@gmail.com','Hyderabad'),
(134,'Rohit',7894560980,'rohit@gmail.com','Bangalore'),
(135,'Karthik',8098234560,'karthik@gmail.com','Tirupati'),
(136,'Sanjeev',9123456701,'sanjeev@gmail.com','Mumbai'),
(137,'Dinesh',9988771234,'dinesh@gmail.com','Chennai');


CREATE TABLE Movie
(
    M_Id INT PRIMARY KEY,
    M_Name VARCHAR(100) NOT NULL UNIQUE,
    Language VARCHAR(30) NOT NULL,
    Genre VARCHAR(30),
    Duration INT
);

INSERT INTO Movie VALUES
(102,'Pushpa 2','Telugu','Action',155),
(103,'Leo','Tamil','Thriller',159),
(104,'Jawan','Hindi','Action',89),
(105,'12th Fail','Telugu','Drama',143),
(106,'Kantara','Kannada','Drama',162),
(107,'Hi Nanna','Telugu','Romance',138),
(108,'Spiderman','English','Drama',180),
(109,'Manjummel Boys','Malayalam','Action',117),
(110,'Dangal','English','Action',216),
(111,'Don','Tamil','Action',167);

drop table Movie;

CREATE TABLE Theater
(
    T_Id INT PRIMARY KEY,
    T_Name VARCHAR(100) NOT NULL UNIQUE,
    Location VARCHAR(50),
    City VARCHAR(50),
    Screens INT
);

INSERT INTO Theater VALUES
(201,'INOX Cinemas','Gachibowli','Hyderabad',5),
(202,'PVR Cinemas','Moosapet','Tirupati',2),
(203,'Cinepolis','Kapali','Chennai',4),
(204,'AMB Cinemas','Ameerpet','Tirupati',3),
(205,'PVR Icon','Goregaon','Mumbai',6);

CREATE TABLE Shows
(
    S_Id INT PRIMARY KEY,
    M_Id INT,
    T_Id INT,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
   
    FOREIGN KEY (M_Id) REFERENCES Movie(M_Id),
    FOREIGN KEY (T_Id) REFERENCES Theater(T_Id)
);

INSERT INTO Shows VALUES
(601,102,'201','01-08-26','11:00'),
(602,102,'201','02-08-26','11:30'),
(603,103,'202','03-08-26','2:30'),
(604,104,'202','04-08-26','2:15'),
(605,105,'203','05-08-26','6:20'),
(606,106,'203','06-08-26','6:30'),
(607,107,'204','07-08-26','6:40'),
(608,108,'204','08-08-26','9:30'),
(609,109,'205','09-08-26','9:45'),
(610,110,'205','10-08-26','10:00');

drop table shows;

CREATE TABLE Booking
(
    B_Id INT PRIMARY KEY,
    C_Id INT,
    S_Id INT,
    Seats INT NOT NULL,
    Booking_Date DATE NOT NULL,

    FOREIGN KEY (C_Id) REFERENCES Customer(C_Id),
    FOREIGN KEY (S_Id) REFERENCES Shows(S_Id)
);

INSERT INTO Booking VALUES
(401,123,601,2,'01-08-26'),
(402,124,602,3,'02-08-26'),
(403,125,603,1,'03-08-26'),
(404,126,604,4,'04-08-26'),
(405,127,605,2,'05-08-26'),
(406,128,606,5,'06-08-26'),
(407,129,607,2,'07-08-26'),
(408,130,608,4,'08-08-26'),
(409,131,609,1,'09-08-26'),
(410,132,610,6,'10-08-26');

CREATE TABLE Payment
(
    P_Id INT PRIMARY KEY,
    B_Id INT,
    P_Type VARCHAR(30) NOT NULL,
    Amount DECIMAL(10,2),
    P_Status VARCHAR(20) NOT NULL,

    FOREIGN KEY (B_Id) REFERENCES Booking(B_Id)
);

INSERT INTO Payment VALUES
(501,401,'UPI',360.00,'Success'),
(502,402,'Debit Card',660.00,'Success'),
(503,403,'Credit Card',400.00,'Success'),
(504,404,'UPI',299.00,'Failed'),
(505,405,'Net Banking',440.00,'Success'),
(506,406,'UPI',1100.00,'Refunded'),
(507,407,'Debit Card',490.00,'pending'),
(508,408,'Cash',600.00,'pending'),
(509,409,'Credit Card',300.00,'Success'),
(510,410,'UPI',99.00,'Pending');

SELECT C_Name
FROM Customer
WHERE City = 'Tirupati';

SELECT C_Name, Mobile
FROM Customer
WHERE City = 'Hyderabad';

SELECT *
FROM Movie
WHERE Language = 'Telugu';

SELECT M_Name, Genre
FROM Movie
WHERE Genre = 'Action';

SELECT M_Name
FROM Movie
WHERE Duration > 150;

SELECT * FROM Theater
WHERE City = 'Tirupati';

SELECT T_Name, Location
FROM Theater
WHERE Screens > 3;

SELECT * FROM Shows
WHERE Date = '05-08-26';

SELECT S_Id, M_Id, Time
FROM Shows
WHERE Time > '6:00';

SELECT * FROM Booking
WHERE Seats > 3;

SELECT B_Id ,C_Id,Seats 
FROM Booking
WHERE Date > '05-08-2026';

SELECT * FROM payment
WHERE Amount>500.00;

SELECT P_Id,B_Id,P_Type
FROM Payment 
WHERE P_Type ='UPI';

SELECT * FROM Payment
WHERE P_Status='Success';

SELECT C_Name,Email
FROM Customer 
WHERE City='Tirupati' OR 'Chennai';

SELECT M_Name 
FROM Movie 
WHERE Language='Telugu' AND Genre='Action';

SELECT M_Name
FROM Movie
WHERE Duration=120 AND Duration < 180;

 SELECT * FROM Customer
WHERE Adress='Tirupati' AND Email is NOT NULL;

SELECT * FROM Theater 
WHERE City ='Tirupati' OR 'Hyderabad';

SELECT T_Name 
FROM Theater 
WHERE Screens > 2 AND City ='Tiruapti';

SELECT * FROM Booking
WHERE Seats >=2 AND Seats <=5;

SELECT B_Id , C_Id 
FROM Booking 
WHERE Date='08-05-2026' OR Seats > 4;

SELECT * FROM Payment
WHERE Amount >500 AND P_Status='Success';

SELECT P_Id ,Aount,P_Type
FROM Payment 
WHERE P_Type = 'UPI' OR 'Credit Card';
 
SELECT * FROM Customer
WHERE City ='Tirupati' OR 'Hyderabad' AND Mobile is NOT NULL;

SELECT C_Id , C_Name
WHERE City ='Tirupati';

SELECT M_Name AS Movie_Name, Language, Genre
FROM Movie
WHERE Duration > 120;

SELECT T_Name AS Theatre_Name, City, Screens
FROM Theater
WHERE Screens > 3;

SELECT S_Id AS Show_ID, M_Id AS Movie_ID, Time AS Show_Time
FROM Shows
WHERE Time > '6:00';

SELECT P_Id AS Payment_ID, Amount, P_Status AS Payment_Status
FROM Payment
WHERE Amount > 2500;

-- 31. Display customer names and booking IDs
SELECT C.C_Name, B.B_Id AS Booking_ID
FROM Customer C
JOIN Booking B ON C.C_Id = B.C_Id;


-- 32. Display customer name, mobile number and seats booked
SELECT C.C_Name, C.Mobile, B.Seats
FROM Customer C
JOIN Booking B ON C.C_Id = B.C_Id;


-- 33. Display movie name and show time
SELECT M.M_Name AS Movie_Name, S.Time AS Show_Time
FROM Movie M
JOIN Shows S ON M.M_Id = S.M_Id;


-- 34. Display movie name, language and show date
SELECT M.M_Name AS Movie_Name, M.Language, S.Date AS Show_Date
FROM Movie M
JOIN Shows S ON M.M_Id = S.M_Id;


-- 35. Display theatre name and show time
SELECT T.T_Name AS Theatre_Name, S.Time AS Show_Time
FROM Theater T
JOIN Shows S ON T.T_Id = S.T_Id;


-- 36. Display theatre name, city and show date
SELECT T.T_Name AS Theatre_Name, T.City, S.Date AS Show_Date
FROM Theater T
JOIN Shows S ON T.T_Id = S.T_Id;


-- 37. Display movie name and theatre name
SELECT M.M_Name AS Movie_Name, T.T_Name AS Theatre_Name
FROM Movie M
JOIN Shows S ON M.M_Id = S.M_Id
JOIN Theater T ON S.T_Id = T.T_Id;


-- 38. Display movie name, theatre name and city for Tirupati
SELECT M.M_Name AS Movie_Name, T.T_Name AS Theatre_Name, T.City
FROM Movie M
JOIN Shows S ON M.M_Id = S.M_Id
JOIN Theater T ON S.T_Id = T.T_Id
WHERE T.City = 'Tirupati';


-- 39. Display customer, movie and seats for bookings greater than 2
SELECT C.C_Name AS Customer_Name,
       M.M_Name AS Movie_Name,
       B.Seats
FROM Customer C
JOIN Booking B ON C.C_Id = B.C_Id
JOIN Shows S ON B.S_Id = S.S_Id
JOIN Movie M ON S.M_Id = M.M_Id
WHERE B.Seats > 2;


-- 40. Display movie, theatre and show time for Tirupati after 6 PM
SELECT M.M_Name AS Movie_Name,
       T.T_Name AS Theatre_Name,
       S.Time AS Show_Time
FROM Movie M
JOIN Shows S ON M.M_Id = S.M_Id
JOIN Theater T ON S.T_Id = T.T_Id
WHERE T.City = 'Tirupati'
AND S.Time > '18:00:00';


-- 41. Display customer, movie and booking date after a particular date
SELECT C.C_Name AS Customer_Name,
       M.M_Name AS Movie_Name,
       B.Booking_Date
FROM Customer C
JOIN Booking B ON C.C_Id = B.C_Id
JOIN Shows S ON B.S_Id = S.S_Id
JOIN Movie M ON S.M_Id = M.M_Id
WHERE B.Booking_Date > '2026-08-05';


-- 42. Display Telugu movies shown in Tirupati
SELECT M.M_Name AS Movie_Name,
       T.T_Name AS Theatre_Name,
       T.City
FROM Movie M
JOIN Shows S ON M.M_Id = S.M_Id
JOIN Theater T ON S.T_Id = T.T_Id
WHERE M.Language = 'Telugu'
AND T.City = 'Tirupati';

UPDATE Customer
SET City = 'Chittoor'
WHERE C_Id = 123
AND City = 'Tirupati';

UPDATE Movie
SET Genre = 'Action'
WHERE M_Id = 105;

UPDATE Theater
SET Screens = Screens + 1
WHERE T_Id = 202;

UPDATE Payment
SET P_Status = 'Success'
WHERE P_Id = 510;

UPDATE Payment
SET P_Type = 'UPI'
WHERE P_Status = 'Pending' AND Amount < 500;

DELETE FROM Customer
WHERE C_Id = 123;

DELETE FROM Movie
WHERE Duration < 90;

DELETE FROM Theater
WHERE Screens < 2 AND City = 'Tirupati';

DELETE FROM Booking
WHERE Seats = 1 AND Booking_Date < '05-08-2026';

DELETE FROM Payment
WHERE P_Status = 'Failed'
AND Amount < 300;

UPDATE Movie
SET Duration = Duration + 10
WHERE Duration < 120;

UPDATE Theater
SET Screens = Screens + 1
WHERE Screens < 3;

UPDATE Theater
SET City = 'Tirupati'
WHERE City = 'Chittoor' AND Screens >= 3;

UPDATE Movie
SET Language = 'Telugu'
WHERE Language = 'English' AND Genre = 'Drama';

UPDATE Movie
SET Genre = 'Action'
WHERE Language = 'Telugu' AND Duration > 120;

UPDATE Shows
SET Time = '18:00:00'
WHERE Date = '2026-08-08'
AND Time < '6:00';

UPDATE Booking
SET Seats = Seats + 1
WHERE Seats < 3;

UPDATE Booking
SET Booking_Date = '2026-08-15'
WHERE Seats > 4
AND Booking_Date < '10-08-2026';

UPDATE Payment
SET P_Type = 'UPI'
WHERE P_Type = 'Cash';

UPDATE Payment
SET P_Status = 'Success'
WHERE Amount > 500 AND P_Status = 'Pending';

UPDATE Payment
SET P_Status = 'Failed'
WHERE Amount < 100 AND P_Status = 'Pending';

UPDATE Payment
SET Amount = Amount + 100
WHERE P_Type = 'UPI' AND Amount < 2500;

DELETE FROM Customer
WHERE City = 'Tirupati' AND Email LIKE '%@gmail.com';

DELETE FROM Movie
WHERE Language = 'English' AND Duration > 180;

DELETE FROM Theater
WHERE City = 'Hyderabad' OR 'Chennai' AND Screens < 3;

DELETE FROM Shows
WHERE Date = '05-08-2026'
AND Time < '6:40';

DELETE FROM Booking
WHERE Seats > 4 AND Booking_Date < '10-08-2026';

DELETE FROM Payment
WHERE Amount > 1000 AND P_Status = 'Failed';

SELECT * FROM Customer;
SELECT * FROM Movie;
SELECT * FROM Theater;
SELECT * FROM Shows;
SELECT * FROM Booking;
SELECT * FROM Payment;
