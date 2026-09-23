create database BookmyshowDB;
create table customer(
CID int primary key,
CNaame varchar (20),
Mobile varchar(15),
Email varchar (50),
City  varchar(30),
)
select*from CUSTOMER
insert into CUSTOMER values
(101,'vignesh',93915,'narravullavenkatavigneswarredd@gmail.com','plvd'),
(102,'Rakesh',91007,'Rakesh@gmail.com','nlr'),
(103,'dhanush',98765,'dhanush@gmail.com','hyd'),
(104,'Harsha',77689,'harshavardhannaddela7@gmail.com','tpt'),
(105,'Rafi',64710,'Rafi@gmail.com','ndl')

create table MOVIE(
MID int primary key,
MName varchar(30),
Language varchar (30),
Genre varchar (50),
Duration float
)
select*from MOVIE
insert into MOVIE values
(501,'og','tel','action',2.45),
(502,'salar','Hin','action',3.5),
(503,'Leo','Eng','Thriller',2.5)
(504,'saho \mil'comedy',3.4)





