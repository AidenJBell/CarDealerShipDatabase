# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealershipBase                               #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS cardealershipbase;

CREATE DATABASE IF NOT EXISTS cardealershipbase;

USE cardealershipbase;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"									             #
# ---------------------------------------------------------------------- #

CREATE TABLE Dealerships(
	DealershipID INT AUTO_INCREMENT PRIMARY KEY,
    DealershipName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50)
);

# ---------------------------------------------------------------------- #
# Add table "Employees"										             #
# ---------------------------------------------------------------------- #

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(10) NOT NULL,
    Title VARCHAR(30),
    TitleOfCourtesy VARCHAR(25),
    BirthDate DATETIME,
    HireDate DATETIME,
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    HomePhone VARCHAR(24),
    Extension VARCHAR(4),
    Photo LONGBLOB,
    Notes MEDIUMTEXT NOT NULL,
    ReportsTo INT,
    PhotoPath VARCHAR(255),
    Salary FLOAT
);


# ---------------------------------------------------------------------- #
# Add table "Customers"	                      	         		         #
# ---------------------------------------------------------------------- #

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(40) NOT NULL,
    LastName VARCHAR(30),
    TitleOfCourtesy VARCHAR(25),
    BirthDate DATETIME,
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24)
);


# ---------------------------------------------------------------------- #
# Add table "Inventory"										             #
# ---------------------------------------------------------------------- #

CREATE TABLE Inventory(
	InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    DealershipID INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    Year INT,
    Make VARCHAR(45) NOT NULL,
    Model VARCHAR(70) NOT NULL,
    CarType VARCHAR (12) NOT NULL,
    Color VARCHAR(10) NOT NULL,
    Mileage INT,
    Price DECIMAL(10,2),
    DateAdded DATE,
    Status VARCHAR(10) NOT NULL,
	FOREIGN KEY (DealershipID) REFERENCES Dealerships(DealershipID)
);

# ---------------------------------------------------------------------- #
# Add table "Contracts"										             #
# ---------------------------------------------------------------------- #

CREATE TABLE Contracts(
	ContractID INT AUTO_INCREMENT PRIMARY KEY,
    ContractType VARCHAR(5),
    CustomerID INT,
    EmployeeID INT,
	Date DATE,
    InventoryID INT,
    MonthlyPayment DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID)
);

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #
INSERT INTO Dealerships(DealershipName, City, State)
VALUES
('Sunshine Motors','Austin','TX'),
('Lone Star Auto','Round Rock','TX'),
('Hill Country Cars','San Antonio','TX');

# ---------------------------------------------------------------------- #
# Add info into "Employees"	                      	                     #
# ---------------------------------------------------------------------- #

INSERT INTO Employees
(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath, Salary)
VALUES
('Griffin','Laura','General Manager','Ms.','1980-04-12','2010-05-01','1221 Oak Ridge Dr','Austin','TX','78753','USA','512-555-1010','201',NULL,'Oversees full operations for Sunshine Motors.',NULL,'/photos/laura.jpg',98000),
('Paxton','Derrick','Sales Manager','Mr.','1986-09-03','2014-03-12','812 Barton Crest','Austin','TX','78745','USA','512-555-2223','305',NULL,'Manages sales team and monthly goals.',1,'/photos/derrick.jpg',78000),
('Chen','Mia','Sales Associate','Ms.','1992-06-18','2020-01-10','9400 Trade Wind St','Austin','TX','78744','USA','512-555-4471','310',NULL,'Consistent top performer in new car sales.',2,'/photos/mia.jpg',52000),
('Hernandez','Roberto','Sales Associate','Mr.','1991-11-22','2019-06-04','442 Emerald Loop','Austin','TX','78727','USA','512-555-1244','312',NULL,'Experienced in financing discussions.',2,'/photos/roberto.jpg',51000),
('Vargas','Elena','Service Advisor','Ms.','1988-02-09','2018-09-15','1509 Willow Branch Ln','Austin','TX','78758','USA','512-555-9876','420',NULL,'Provides customer service for maintenance and repairs.',1,'/photos/elena.jpg',56000),
('Wallace','Tim','Technician','Mr.','1984-07-17','2016-11-20','3309 Broadcrest Dr','Austin','TX','78728','USA','512-555-3321','421',NULL,'Certified automotive technician.',1,'/photos/tim.jpg',64000),
('Barker','Nicole','General Manager','Mrs.','1982-01-08','2011-03-01','8120 Creekside Cv','Round Rock','TX','78665','USA','512-555-7741','200',NULL,'Manages Lone Star Auto operations.',NULL,'/photos/nicole.jpg',95000),
('Shaw','Kevin','Sales Manager','Mr.','1987-05-24','2015-07-14','4501 Chisholm Trl','Round Rock','TX','78664','USA','512-555-2420','308',NULL,'Leads sales team performance.',7,'/photos/kevin.jpg',74000),
('Nguyen','Tara','Sales Associate','Ms.','1994-12-01','2021-05-17','500 Maple View Dr','Round Rock','TX','78665','USA','512-555-9003','311',NULL,'Focuses on customer consultations and follow-ups.',8,'/photos/tara.jpg',50000),
('Fletcher','Mark','Sales Associate','Mr.','1993-10-29','2020-10-03','214 Oak Lantern Way','Round Rock','TX','78681','USA','512-555-6649','314',NULL,'Handles test drives and inventory walkthroughs.',8,'/photos/mark.jpg',49500),
('Dalton','Renee','Office Administrator','Ms.','1989-03-05','2017-08-22','330 Pine Arbor Ln','Round Rock','TX','78664','USA','512-555-1118','401',NULL,'Coordinates paperwork and office operations.',7,'/photos/renee.jpg',45000),
('Cortez','Eduardo','General Manager','Mr.','1979-09-12','2009-12-01','2019 Hill View Pass','San Antonio','TX','78249','USA','210-555-2201','500',NULL,'Oversees dealership operations for Hill Country Cars.',NULL,'/photos/eduardo.jpg',97000),
('Santos','Lila','Sales Manager','Ms.','1985-08-06','2013-04-19','8893 Lost Creek Dr','San Antonio','TX','78254','USA','210-555-3122','503',NULL,'Manages sales targets and customer relations.',12,'/photos/lila.jpg',76000),
('Ramirez','Jon','Sales Associate','Mr.','1992-04-11','2021-02-01','1203 Riverbrook St','San Antonio','TX','78251','USA','210-555-8874','507',NULL,'Specializes in pre-owned vehicle sales.',13,'/photos/jon.jpg',48000),
('Spencer','Camille','Office Assistant','Ms.','1990-11-30','2016-09-28','640 Oak Trail Dr','San Antonio','TX','78250','USA','210-555-6639','509',NULL,'Handles customer scheduling and front office duties.',12,'/photos/camille.jpg',45500);


# ---------------------------------------------------------------------- #
# Add info into "Customers"	                      	                     #
# ---------------------------------------------------------------------- #

INSERT INTO Customers
(FirstName, LastName, TitleOfCourtesy, BirthDate, Address, City, Region, PostalCode, Country, Phone)
VALUES
('Marcus', 'Ellison', 'Mr.', '1988-05-14 00:00:00', '421 Meadow Ridge Dr', 'Killeen', 'TX', '76542', 'USA', '254-555-1844'),
('Danielle', 'Rivas', 'Ms.', '1992-11-02 00:00:00', '1983 Lakeview Cir', 'Harker Heights', 'TX', '76548', 'USA', '254-555-9098'),
('Evan', 'Cartwright', 'Mr.', '1985-03-22 00:00:00', '766 Oak Glen St', 'Belton', 'TX', '76513', 'USA', '254-555-7621'),
('Alicia', 'Monroe', 'Ms.', '1995-08-30 00:00:00', '1509 Bridgewater Ln', 'Temple', 'TX', '76502', 'USA', '254-555-4419'),
('Troy', 'Sanders', 'Mr.', '1987-07-12 00:00:00', '913 Walnut Ridge Rd', 'Round Rock', 'TX', '78665', 'USA', '512-555-7332'),
('Lydia', 'Kramer', 'Mrs.', '1990-12-19 00:00:00', '2042 Creek Bend Dr', 'Georgetown', 'TX', '78628', 'USA', '512-555-9093'),
('Samuel', 'Hutchins', 'Mr.', '1984-02-05 00:00:00', '6450 Limestone Pass', 'Leander', 'TX', '78641', 'USA', '512-555-4482'),
('Karina', 'Vasquez', 'Ms.', '1997-09-09 00:00:00', '3108 Cypress Mill Rd', 'Cedar Park', 'TX', '78613', 'USA', '512-555-3204'),
('Joseph', 'Durham', 'Mr.', '1983-04-27 00:00:00', '112 Pickfair Dr', 'Austin', 'TX', '78752', 'USA', '512-555-1289'),
('Maya', 'Blake', 'Ms.', '1996-01-14 00:00:00', '4501 Briarwood Ln', 'Austin', 'TX', '78745', 'USA', '512-555-8840'),
('Ruben', 'Castellanos', 'Mr.', '1982-09-03 00:00:00', '225 Pecan Park Blvd', 'Pflugerville', 'TX', '78660', 'USA', '512-555-7590'),
('Jenna', 'Whitford', 'Ms.', '1993-06-25 00:00:00', '150 Riverway Ave', 'San Marcos', 'TX', '78666', 'USA', '512-555-0502'),
('Oscar', 'Hernandez', 'Mr.', '1989-10-16 00:00:00', '800 Lone Star Blvd', 'New Braunfels', 'TX', '78130', 'USA', '830-555-6711'),
('Isabella', 'Molina', 'Ms.', '1994-03-02 00:00:00', '3295 Mission Gate', 'Schertz', 'TX', '78154', 'USA', '210-555-1198'),
('Terrence', 'Rowe', 'Mr.', '1981-05-08 00:00:00', '1018 Juniper Springs Dr', 'San Antonio', 'TX', '78249', 'USA', '210-555-3833');


# ---------------------------------------------------------------------- #
# Add info into "Inventory"	                      	                     #
# ---------------------------------------------------------------------- #

INSERT INTO Inventory(DealershipID,VIN,Year,Make,Model,CarType,Color,Mileage,Price,DateAdded,Status)
VALUES
(3,'VTGEWB7AX7KFRF4GB',2020,'Toyota','Camry','Sedan','Blue',12000,23999.99,'2023-06-04','SOLD'),
(1,'8CV4W0R25ZYBMPMMJ',2019,'Honda','Civic','Sedan','Red',18000,21999.50,'2023-07-19','SOLD'),
(2,'8349A3H69NKUAYX8M',2021,'Ford','F-150','Truck','Black',8000,35999.00,'2023-06-27','SOLD'),
(3,'YWX6E5AH2DYNWFPCU',2018,'Ford','Fusion','Sedan','White',25000,19999.99,'2023-08-02','SOLD'),
(1,'C8KYNJVX6R3K5D7TY',2022,'Jeep','Grand Cherokee','SUV','Silver',5000,42999.99,'2023-07-08','SOLD'),
(2,'9H831EJ389CSV9Z58',2020,'Ford','Ranger','Truck','Green',15000,28999.00,'2023-06-15','SOLD'),
(3,'GJP6AGUTXGPPV8RZT',2021,'Nissan','Rogue','SUV','Blue',9000,31999.99,'2023-07-31','SOLD'),
(1,'F4XBWESC1FJ0XDLHX',2019,'Chevrolet','Silverado','Truck','Black',22000,34999.50,'2023-06-09','SOLD'),
(2,'HV89TTKU0ZMV9V4EJ',2020,'Toyota','RAV4','SUV','White',14000,29999.99,'2023-07-03','SOLD'),
(3,'JMWVYS4T76UAPN3G2',2018,'Chevrolet','Malibu','Sedan','Gray',30000,18999.00,'2023-08-17','SOLD'),
(1,'TLZ8G9BH1G99FC1XV',2021,'Honda','Accord','Sedan','Silver',7000,31999.99,'2023-06-22','SOLD'),
(2,'MTL9B1KM48LA99LL3',2022,'Tesla','Model 3','Sedan','Red',4000,45999.00,'2023-07-26','SOLD'),
(3,'XNRBTF767527LLCWS',2020,'Jeep','Wrangler','SUV','Yellow',12000,39999.50,'2023-08-19','AVAILABLE'),
(1,'YWMS0HFE3SHMYBJST',2019,'Ford','F-250','Truck','Blue',26000,41999.99,'2023-06-03','AVAILABLE'),
(2,'5W1JMMC70CP64XAV9',2021,'Ford','Fusion','Sedan','Black',8000,27999.00,'2023-07-14','AVAILABLE'),
(3,'N89GYZWA7SAE5APAE',2020,'Toyota','Corolla','Sedan','White',11000,20999.50,'2023-06-30','AVAILABLE'),
(1,'E67F0N9C8EYKFAR4D',2018,'Hyundai','Sonata','Sedan','Silver',28000,17999.00,'2023-08-11','AVAILABLE'),
(2,'87MJ82PF2AS7TYHB9',2019,'Chevrolet','Tahoe','SUV','Black',23000,38999.99,'2023-06-07','AVAILABLE'),
(3,'425BHX2722GK2NH6N',2020,'Nissan','Altima','Sedan','Blue',16000,23999.00,'2023-07-22','AVAILABLE'),
(1,'2LLS1U1453UVUHK9D',2021,'Dodge','Charger','Sedan','Red',9000,32999.50,'2023-08-05','AVAILABLE'),
(2,'ADAL3PYX6B72KEZRY',2020,'Toyota','Highlander','SUV','Gray',15000,37999.99,'2023-06-19','AVAILABLE'),
(3,'LCZ0K7815CBNN25WP',2021,'Ford','F-150','Truck','White',6000,42999.00,'2023-07-01','AVAILABLE'),
(1,'KS7V7CH227V3EDM8X',2019,'Chevrolet','Silverado','Truck','Red',21000,35999.99,'2023-08-08','AVAILABLE'),
(2,'Y0NPXMZ83L8KJK2FR',2021,'Hyundai','Tucson','SUV','Green',8000,28999.50,'2023-07-11','AVAILABLE'),
(3,'A6X7HK4JXJTKPB6U0',2020,'Jeep','Cherokee','SUV','White',13000,31999.99,'2023-06-25','AVAILABLE');




# ---------------------------------------------------------------------- #
# Add info into "Contracts"	                      	                     #
# ---------------------------------------------------------------------- #

INSERT INTO Contracts(ContractType, CustomerID, EmployeeID, Date, InventoryID, MonthlyPayment)
VALUES
('SALE', 1, 3, '2023-07-12', 1, NULL),
('LEASE', 2, 4, '2023-09-03', 2, 399.99),
('SALE', 3, 9, '2023-08-11', 3, NULL),
('LEASE', 4, 10, '2023-10-14', 4, 429.99),
('SALE', 5, 13, '2023-07-23', 5, NULL),
('SALE', 6, 14, '2023-11-18', 6, NULL),
('LEASE', 7, 8, '2023-12-01', 7, 359.99),
('SALE', 8, 11, '2023-08-29', 8, NULL),
('SALE', 9, 12, '2023-09-22', 9, NULL),
('LEASE', 10, 2, '2023-10-05', 10, 399.50),
('SALE', 11, 5, '2023-07-30', 11, NULL),
('LEASE', 12, 6, '2023-09-12', 12, 429.50);
