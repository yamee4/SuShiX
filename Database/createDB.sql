-- CREATE DATABASE Nhom3_ADB
use Nhom3_ADB

go
create table BRANCH
(
	BranchID int,
	BranchName nvarchar(30),
	BranchAddress nvarchar(100),
	OpeningTime time,
	ClosedTime time,
	DeliveryService bit,
	isParkinglot bit,
	AreaName nvarchar(30)

	primary key(BranchID)
)
go
create table BRANCH_PHONE_NUMBER
(
	BranchID int,
	PhoneNumber char(10)

	primary key (BranchID, PhoneNumber)
)
go
create table STATION_EMPLOYEE
(
	BranchID int,
	EmpID char(5),
	StationName nvarchar(20)

	primary key(BranchID, EmpID, StationName)
)

go
create table STATION
(
	StationName nvarchar(20),
	StationSalary int

	primary key(StationName)
)
go
create table AREA
(
	AreaName nvarchar(30),
	MenuID char(4) UNIQUE,
	MenuName nvarchar(30),

	primary key(AreaName)
)
go
create table DISH
(
	DishID int,
	DishName nvarchar(30),
	CurrentPrice int,
	DishSection nvarchar(20),
	isCombo bit,
	DeliveryAvailable bit,

	primary key(DishID)
)
go
create table COMBO
(
	ComboID int primary key,
)
go
create table DISH_MENU
(
	MenuID char(4),
	DishID int,
	inMenu bit

	primary key (MenuID, DishID)
)
go
create table DISH_COMBO
(
	ComboID int,
	DishID int,
	Quantity int

	primary key(ComboID, DishID)
)
go
create table MENU_DETAIL
(
	BranchID int,
	DishID int,
	isServing bit

	primary key (BranchID, DishID)
)
go
create table EMPLOYEE
(
	EmpID char(5),
	EmpFirstName nvarchar(20),
	EmpLastName nvarchar(20),
	EmpBirthDate datetime,
	EmpGender nchar(3),
	Salary int,
	BranchManager int

	primary key(EmpID)
)
go
create table WORK_HISTORY
(
	EmpID char(5),
	StartDate datetime,
	EndDate datetime,
	BranchID int

	primary key(EmpID, StartDate)
)
go
create table CUSTOMER
(
	CCCD char(10),		
	CustomerFirstName nvarchar(20),
	CustomerLastName nvarchar(20),
	PhoneNumber char(10),
	Email varchar(50),
	Gender nchar(3),
	isMember bit,
	isRegistered bit,

	primary key (CCCD)
)
go
create table CUSTOMER_MEMBER
(
	MCCCD char(10),
	MemberCardNumber char(10),
	CreatedDate datetime,
	SupportEmp char(5),
	MemberCardRank char(6),
	MemberCardPoints int,
	MemberCardAcquiredRankDate date

	primary key (MCCCD)

)
go
create table ONLINE_CUSTOMER
(
	OCCCD char(10),
	O_password varchar(50)

	primary key (OCCCD)
)
go
create table CUSTOMER_LOG
(
	CCCD char(10),
	Accessed_datetime datetime,
	Accessed_time_duration int,

	primary key(CCCD, Accessed_datetime)
)
go
create table ORDER_TICKET
(
	TicketID char(10),
	TicketType char(3),
	BranchID int,
	CCCD char(10),
	EmpID char(5),
	Discount int,
	TotalPrice bigint,
	CreatedDate datetime,

	primary key(TicketID)
)
go

create table ONLINE_TICKET
(
	OTicketID char(10),
	DeliveryDate datetime

	primary key (OTicketID)
)
go
create table PRE_ORDER_TICKET
(
	PTicketID char(10),
	BranchName nvarchar(30),
	Area nvarchar(30),
	NumberofCustomer int,
	PreOrderDate datetime,
	PreOrderArrivalTime datetime,
	PreOrderNote nvarchar(100)

	primary key (PTicketID)
)
go
create table STANDARD_ORDER_TICKET
(
	SOTicketID char(10),
	TableName nvarchar(30),
	SupportEmployee char(5),
	CreatedDate datetime

	primary key (SOTicketID)
)
go 
create table  ONLINE_TICKET_DETAIL
(
	OTicketID char(10),
	DishID int,
	OrderTime datetime,
	Quantity int,
	Price int

	primary key(OTicketID, DishID, OrderTime)
)
go
create table  PRE_ORDER_TICKET_DETAIL
(
	PTicketID char(10),
	DishID int,
	OrderTime datetime,
	Quantity int,
	Price int

	primary key(PTicketID, DishID, OrderTime)
)
go
create table  STANDARD_ORDER_DETAIL
(
	SOTicketID char(10),
	DishID int,
	OrderTime datetime,
	Quantity int,
	Price int

	primary key(SOTicketID, DishID, OrderTime)
)

go

create table FEEDBACK_TICKET
(
	TicketID char(10),
	FeedbackTotalScore int,
	FeedbackService int,
	FeedbackFoodQuality int,
	FeedbackPrice int,
	FeedbackLocation int,
	FeedbackNote nvarchar(100),

	primary key(TicketID, FeedbackTotalScore)
)
go

ALTER TABLE BRANCH
ADD CONSTRAINT FK_BRANCH_AREA
FOREIGN KEY (AreaName) REFERENCES AREA(AreaName);

ALTER TABLE BRANCH_PHONE_NUMBER
ADD CONSTRAINT FK_BRANCH_PHONE_NUMBER_BRANCH
FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID);

ALTER TABLE STATION_EMPLOYEE
ADD CONSTRAINT FK_STATION_EMPLOYEE_BRANCH
FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID);

ALTER TABLE STATION_EMPLOYEE
ADD CONSTRAINT FK_STATION_EMPLOYEE_EMPLOYEE
FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID);

ALTER TABLE STATION_EMPLOYEE
ADD CONSTRAINT FK_STATION_EMPLOYEE_STATION
FOREIGN KEY (StationName) REFERENCES STATION(StationName);

ALTER TABLE COMBO
ADD CONSTRAINT FK_COMBO_DISH
FOREIGN KEY (ComboID) REFERENCES DISH(DishID)

ALTER TABLE DISH_MENU
ADD CONSTRAINT FK_DISH_MENU_MENU
FOREIGN KEY (MenuID) REFERENCES AREA(MenuID);

ALTER TABLE DISH_MENU
ADD CONSTRAINT FK_DISH_MENU_DISH
FOREIGN KEY (DishID) REFERENCES DISH(DishID);

ALTER TABLE DISH_COMBO
ADD CONSTRAINT FK_DISH_COMBO_COMBO
FOREIGN KEY (ComboID) REFERENCES COMBO(ComboID);

ALTER TABLE DISH_COMBO
ADD CONSTRAINT FK_DISH_COMBO_DISH
FOREIGN KEY (DishID) REFERENCES DISH(DishID);

ALTER TABLE MENU_DETAIL
ADD CONSTRAINT FK_MENU_DETAIL_BRANCH
FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID);

ALTER TABLE MENU_DETAIL
ADD CONSTRAINT FK_MENU_DETAIL_DISH
FOREIGN KEY (DishID) REFERENCES DISH(DishID);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_BRANCH
FOREIGN KEY (BranchManager) REFERENCES BRANCH(BranchID);

ALTER TABLE WORK_HISTORY
ADD CONSTRAINT FK_WORK_HISTORY_EMPLOYEE
FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID);

ALTER TABLE WORK_HISTORY
ADD CONSTRAINT FK_WORK_HISTORY_BRANCH
FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID);

ALTER TABLE CUSTOMER_MEMBER
ADD CONSTRAINT FK_CUSTOMER_MEMBER_CUSTOMER
FOREIGN KEY (MCCCD) REFERENCES CUSTOMER(CCCD);

ALTER TABLE CUSTOMER_MEMBER
ADD CONSTRAINT FK_CUSTOMER_MEMBER_EMPLOYEE
FOREIGN KEY (SupportEmp) REFERENCES EMPLOYEE(EmpID);

ALTER TABLE ONLINE_CUSTOMER
ADD CONSTRAINT FK_ONLINE_CUSTOMER_CUSTOMER
FOREIGN KEY (OCCCD) REFERENCES CUSTOMER(CCCD);

ALTER TABLE CUSTOMER_LOG
ADD CONSTRAINT FK_CUSTOMER_LOG_CUSTOMER
FOREIGN KEY (CCCD) REFERENCES ONLINE_CUSTOMER(OCCCD);

ALTER TABLE ORDER_TICKET
ADD CONSTRAINT FK_ORDER_TICKET_BRANCH
FOREIGN KEY (BranchID) REFERENCES BRANCH(BranchID);

ALTER TABLE ORDER_TICKET
ADD CONSTRAINT FK_ORDER_TICKET_CUSTOMER
FOREIGN KEY (CCCD) REFERENCES CUSTOMER(CCCD);

ALTER TABLE ORDER_TICKET
ADD CONSTRAINT FK_ORDER_TICKET_EMPLOYEE
FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID);

ALTER TABLE ONLINE_TICKET
ADD CONSTRAINT FK_ONLINE_TICKET_ORDER_TICKET
FOREIGN KEY (OTicketID) REFERENCES ORDER_TICKET(TicketID);

ALTER TABLE PRE_ORDER_TICKET
ADD CONSTRAINT FK_PRE_ORDER_TICKET_ORDER_TICKET
FOREIGN KEY (PTicketID) REFERENCES ORDER_TICKET(TicketID);

ALTER TABLE STANDARD_ORDER_TICKET
ADD CONSTRAINT FK_STANDARD_ORDER_TICKET_ORDER_TICKET
FOREIGN KEY (SOTicketID) REFERENCES ORDER_TICKET(TicketID);

ALTER TABLE ONLINE_TICKET_DETAIL
ADD CONSTRAINT FK_ONLINE_TICKET_DETAIL_ONLINE_TICKET
FOREIGN KEY (OTicketID) REFERENCES ONLINE_TICKET(OTicketID);

ALTER TABLE ONLINE_TICKET_DETAIL
ADD CONSTRAINT FK_ONLINE_TICKET_DETAIL_DISH
FOREIGN KEY (DishID) REFERENCES DISH(DishID);

ALTER TABLE PRE_ORDER_TICKET_DETAIL
ADD CONSTRAINT FK_PRE_ORDER_TICKET_DETAIL_PRE_ORDER_TICKET
FOREIGN KEY (PTicketID) REFERENCES PRE_ORDER_TICKET(PTicketID);

ALTER TABLE PRE_ORDER_TICKET_DETAIL
ADD CONSTRAINT FK_PRE_ORDER_TICKET_DETAIL_DISH
FOREIGN KEY (DishID) REFERENCES DISH(DishID);

ALTER TABLE STANDARD_ORDER_DETAIL
ADD CONSTRAINT FK_STANDARD_ORDER_DETAIL_STANDARD_ORDER_TICKET
FOREIGN KEY (SOTicketID) REFERENCES STANDARD_ORDER_TICKET(SOTicketID);

ALTER TABLE STANDARD_ORDER_DETAIL
ADD CONSTRAINT FK_STANDARD_ORDER_DETAIL_DISH
FOREIGN KEY (DishID) REFERENCES DISH(DishID);

ALTER TABLE FEEDBACK_TICKET
ADD CONSTRAINT FK_FEEDBACK_TICKET_ORDER_TICKET
FOREIGN KEY (TicketID) REFERENCES ORDER_TICKET(TicketID)

ALTER TABLE BILL
ADD CONSTRAINT FK_BILL_ORDER_TICKET
FOREIGN KEY(TicketID) REFERENCES ORDER_TICKET(TicketID)
