USE A2ZSuntours;
/*CREATING DATABASE TABLES*/
CREATE TABLE ContactUsForm 
(
	CustID int IDENTITY(1,1) NOT NULL,
		CONSTRAINT PK_ContactUsForm_CustID PRIMARY KEY (CustID),
	FirstName varchar(75) NOT NULL,
	LastName varchar(100) NOT NULL,
	Email varchar(100) NOT NULL,
	City varchar(50) NOT NULL,
	State varchar(50),
	Country varchar(75) NOT NULL,
	PhoneNum varchar(25) NOT NULL,
	Subject varchar(100)NOT NULL,
	Message varchar NOT NULL, 
	TimeStamp timestamp
);

CREATE TABLE Reviews
(
	ReviewID int IDENTITY(1,1) NOT NULL,
		CONSTRAINT PK_Reviews_ReviewID PRIMARY KEY (ReviewID),
	CustName varchar(100) NOT NULL,
	Email varchar(100) NOT NULL,
	ReviewDate smalldatetime,
	ReviewComment varchar
);

CREATE TABLE TripCustomer
(
	TripCustID int IDENTITY(1,1) NOT NULL,
		CONSTRAINT PK_TripCustomer_TripCustID PRIMARY KEY (TripCustID),
	TFirstName varchar(75) NOT NULL,
	TLastName varchar(100) NOT NULL,
	TEmail varchar(100) NOT NULL,
	TCity varchar(50) NOT NULL,
	TState varchar(50),
	TCountry varchar(75) NOT NULL,
	TPhoneNum varchar(25) NOT NULL,
);

CREATE TABLE Trips
(
	TripID int IDENTITY(1,1) NOT NULL,
		CONSTRAINT PK_Trips_TripID PRIMARY KEY (TripID),
	TripName varchar(75),
	TripLoc varchar
);

CREATE TABLE TripsPerReq
(
	TripsPerReqID int IDENTITY(1,1) NOT NULL,
		CONSTRAINT PK_TripsPerReq_TripsPerReqID PRIMARY KEY (TripsPerReqID),
	TripReqID int NOT NULL, 
	TripDate smalldatetime,
	Triptime time,
	CustCount int NOT NULL,
	CustLoc	varchar NOT NULL
);

CREATE TABLE TripRequest
(
	TripReqID int IDENTITY(1,1) NOT NULL,
		CONSTRAINT PK_TripRequest_TripReqID PRIMARY KEY (TripReqID),
	TripCustID int,
	TripID int
);

/*CREATING FOREIGN KEY CONSTRAINTS*/
ALTER TABLE TripsPerReq
	ADD CONSTRAINT FK_TripsPerReq_TripReq FOREIGN KEY (TripReqID)	
		REFERENCES TripRequest (TripReqID)
		ON DELETE CASCADE
		ON UPDATE CASCADE;

ALTER TABLE TripRequest
	ADD CONSTRAINT FK_TripReq_TripCustomer FOREIGN KEY (TripCustID)	
		REFERENCES TripCustomer (TripCustID)	
		ON DELETE CASCADE
		ON UPDATE CASCADE
;

ALTER TABLE TripRequest
	ADD CONSTRAINT FK_TripReq_Trips FOREIGN KEY (TripID)	
		REFERENCES Trips (TripID)	
		ON DELETE CASCADE
		ON UPDATE CASCADE
	;

