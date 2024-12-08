use Nhom3_QLSUSHI

go
create table BRANCH
(
	BranchID char(2),
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
	BranchID char(2),
	PhoneNumber char(10)

	primary key (BranchID, PhoneNumber)
)
go
create table STATION_EMPLOYEE
(
	BranchID char(2),
	EmpID char(10),
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
	MenuID char(4)

	primary key(AreaName)
)
go
create table MENU
(
	MenuID char(4),
	MenuName nvarchar(30)
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
	BranchID char(2),
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
	BranchManager char(2)

	primary key(EmpID)
)
go
create table WORK_HISTORY
(
	EmpID char(5),
	StartDate datetime,
	EndDate datetime,
	BranchID char(2)

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
	TiketType char(3),
	BranchID char(2),
	CCCD char(10),
	EmpID char(5)

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
	PreOrderDate date,
	PreOrderArrivalTime time,
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
	DishID char(5),
	OrderTime datetime,
	Quantity int,
	Price int

	primary key(OTicketID, DishID, OrderTime)
)
go
create table  PRE_ORDER_TICKET_DETAIL
(
	PTicketID char(10),
	DishID char(5),
	OrderTime datetime,
	Quantity int,
	Price int

	primary key(PTicketID, DishID, OrderTime)
)
go
create table  STANDARD_ORDER_DETAIL
(
	SOTicketID char(10),
	DishID char(5),
	OrderTime datetime,
	Quantity int,
	Price int

	primary key(SOTicketID, DishID, OrderTime)
)

