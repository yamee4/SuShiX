BULK INSERT CUSTOMER
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\CUSTOMER.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT EMPLOYEE
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\EMPLOYEE.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);


BULK INSERT CUSTOMER_MEMBER
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\CUSTOMER_MEMBER.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT ONLINE_CUSTOMER
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\ONLINE_CUSTOMER.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT CUSTOMER_LOG
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\CUSTOMER_LOG.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT WORK_HISTORY
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\WORK_HISTORY.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT STATION_EMPLOYEE
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\STATION_EMPLOYEE.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);


BULK INSERT ORDER_TICKET
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\ORDER_TICKET.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT STANDARD_ORDER_TICKET
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\STANDARD_ORDER_TICKET.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT PRE_ORDER_TICKET
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\PRE_ORDER_TICKET.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT ONLINE_TICKET
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\ONLINE_TICKET.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT ONLINE_TICKET_DETAIL
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\ONLINE_TICKET_DETAIL.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT PRE_ORDER_TICKET_DETAIL
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\PRE_ORDER_TICKET_DETAIL.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT STANDARD_ORDER_DETAIL
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\STANDARD_ORDER_DETAIL.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

BULK INSERT FEEDBACK_TICKET
FROM 'D:\hcmus_full_courses\The_3rd_Year\The_1st_Semester\Advanced_DB\Project\Nhom3_ADB\rs\FEEDBACK.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
	CHECK_CONSTRAINTS
);

 --delete from FEEDBACK_TICKET
 --delete from STANDARD_ORDER_DETAIL
 --delete from PRE_ORDER_TICKET_DETAIL
 --delete from ONLINE_TICKET_DETAIL
 --delete from STANDARD_ORDER_TICKET
 --delete from PRE_ORDER_TICKET
 --delete from ONLINE_TICKET
 --delete from ORDER_TICKET
 --delete from WORK_HISTORY
 --delete from STATION_EMPLOYEE
 --delete from ONLINE_CUSTOMER
 --delete from CUSTOMER_MEMBER
 --delete from EMPLOYEE
 --delete from CUSTOMER

-- select * from ORDER_TICKET
