create database hotel;
use hotel;
drop database hotel;

create table Guests (
Guest_ID int primary key,
First_name varchar(40) not null,
Last_name varchar(40) not null,
Mobile varchar(11) unique not null,
Address varchar(100),
Email varchar(50) unique,
Nationality varchar(50),
NationalID varchar(15) unique,
Last_visit_Date date,
Pass varchar(10) not null unique
);



create table Rooms(
Room_number int primary key,
Room_type varchar(20) not null,
Category varchar(20),
Extras varchar(20),
Price float not null,
Pet_allowed bool,
Room_view varchar(20),
in_service bool
);


create table Services (
Service_number int primary key,
Service_name varchar(40) not null,
Date date,
Guest_ID int,
Room_number int,
constraint Guest_Service_fk foreign key(Guest_ID)
references Guests (Guest_ID),
constraint Room_Service_fk foreign key(Room_number)
references Rooms (Room_number)
);


create table Job_Permissions(
Job varchar (50) primary key,
Receive_complains bool,
Access_houskeeping_reports bool,
View_payment_info bool,
View_staff_report bool,
View_guest_info bool,
View_Booking_info bool
);



create table Employees(
Employee_ID int primary key,
First_name varchar(20) not null,
Last_name varchar(20) not null,
Mobile INT unique not null,
Job varchar(20),
Email varchar(20) unique,
Salary float not null,
Pass varchar(10) not null,
Hiring_Date date,
constraint Job_Permission_fk foreign key (Job)
references Job_Permissions (Job)
);





create table Bookings(
Reservation_number int primary key,
confirmed bool,
Room_number int not null,
Guest_ID int,
Check_in_date date not null,
Check_out_date date not null,
Pet_company bool,
constraint Guest_Booking_fk foreign key(Guest_ID)
references Guests (Guest_ID),
constraint Room_Booking_fk foreign key(Room_number)
references Rooms (Room_number)
);


create table Payments(
Payment_number int primary key,
Guest_ID int,
Room_number int not null,
Payment_date date,
Payment_amount float not null,
Payment_type varchar(20) not null,
Currency varchar(3),
constraint Guest_payment_fk foreign key(Guest_ID)
references Guests (Guest_ID),
constraint Room_payment_fk foreign key(Room_number)
references Rooms (Room_number)
);


create table Complains_Suggestions(
Reference_number int primary key,
Guest_ID int,
Date date,
description varchar(80) not null,
Type_CorS bool,
constraint Guest_Suggestion_fk foreign key(Guest_ID)
references Guests (Guest_ID)
);



alter table guests ADD preferences varchar(80);

insert into guests(Guest_ID,First_name,Last_name,Mobile,Address,Email,Nationality,NationalID,Last_visit_date,Pass,preferences)
values ('1','salma','sakr','01009853456','qena','s.sakr@gmail.com','egyptian','203065987413652','2023-01-01','ssssss','she has a pet'),
('2','ahmed','sameh','01009853031','cairo','a.sameh@gmail.com','egyptian','20309876543210','2022-02-01','aaasss','he has a pet'),
('3','noureen','gamal','01009853679','giza','n.gaml@gmail.com','egyptian','203001234567896','2021-03-01','nnnggg','she has a pet'),
('4','dina','magdy','01009853258','aswan','d.magdy@gmail.com','egyptian','203098745632105','2022-11-01','dddmmm','she does not have pets'),
('5','nada','tamer','01009853147','alex','n.tamer@gmail.com','egyptian','203098564732198','2020-06-01','nnnttt','she has a pet'),
('6','hadeer','said','01009853369','cairo','h,said@gmail.com','egyptian','203069874521365','2023-09-01','hhhsss','she has a pet'),
('7','malak','ahmed','01009853321','giza','m.ahmed@gmail.com','egyptian','203056987421658','2022-11-01','mmmaaa','she has a pet'),
('8','salma','magdy','01009853654','aswan','s.magdy@gmail.com','egyptian','203026598741659','2021-02-01','sssmmm','she has a pet'),
('9','mostafa','mohammed','01009853987','qena','m.moh@gmail.com','egyptian','203026598741365','2020-03-01','mmmmmm','he is a smoker'),
('10','osama','gamal','01009853004','cairo','o.gamal@gmail.com','egyptian','203036985214702','2020-12-01','oooggg','he does not have pets');


insert into rooms(Room_number,Room_type,Category,Extras,Price,Pet_allowed,Room_view,in_service)
values ('1','single','normal','need extra bed','2000','1','1','1'),
       ('2','double','royal','need WIFI','4000','1','0','1'),
       ('3','single','normal',' ','2000','1','0','0'),
	   ('4','double','empirical','need another bed','1500','4','1','1'),
       ('5','single','normal','need WIFI','2000','1','1','0'),
	   ('6','single','royal','need extra bed','3000','1','0','0'),
	   ('7','double','royal','need extra wipes','4000','1','1','1'),
       ('8','double','empirical','need extra bed','4000','0','1','1'),
       ('9','single','normal',' ','2000','0','1','0'),
       ('10','single','normal','need extra wipes','2000','0','0','1');
 

select Guest_ID,first_name,last_name,mobile,address
from guests;

select*from guests
where address in ('cairo');

select distinct address from guests;

select Room_number,Room_type,price,category
from Rooms
where price in (4000);

select max(price) "highest price",min(price) "lowest price",avg(price)"average",sum(price)"total prices"
from rooms;

select guest_ID,first_name,address,last_visit_Date
from guests
where address not in ('cairo');


select Guest_ID,First_name,Last_name,Email,Room_number,Room_type,price
from Guests G inner join Rooms R
on Guest_id=Room_number
order by price desc;

update guests
set Email='h.said@gmail.com'
where Guest_ID = 6;

update rooms
set Room_type = 'single',
price = '2000'
where Room_number= 4;

update bookings
set Pet_company='1'
where reservation_number=9 and Guest_ID=9;

update services
set service_name= 'lina'
where service_number = 6 and Room_number= 6;

delete from complains_suggestions
where Guest_ID = 11;

delete from bookings
where Room_number = 11;

