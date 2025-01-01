use Nhom3_test
GO

CREATE OR ALTER PROCEDURE sp_Generate2024TestData
AS
BEGIN
    -- Set specific date range for 2024
    DECLARE @StartDate datetime = '2024-01-01'
    DECLARE @EndDate datetime = '2024-12-31'
    DECLARE @CurrentDate datetime = @StartDate
    DECLARE @Counter int = 1

    -- Clear existing data if any
    TRUNCATE TABLE ORDER_TICKET

    -- Generate sample customers if needed
    IF NOT EXISTS (SELECT 1 FROM CUSTOMER)
    BEGIN
        INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Gender, isMember, isRegistered)
        VALUES 
            ('0000000001', 'John', 'Doe', '0123456789', 'M', 1, 1),
            ('0000000002', 'Jane', 'Smith', '0123456790', 'F', 1, 1),
            ('0000000003', 'Bob', 'Johnson', '0123456791', 'M', 1, 1)
    END

    -- Generate sample employees if needed
    IF NOT EXISTS (SELECT 1 FROM EMPLOYEE)
    BEGIN
        INSERT INTO EMPLOYEE (EmpID, EmpFirstName, EmpLastName, EmpGender, Salary)
        VALUES 
            ('EMP01', 'James', 'Wilson', 'M', 50000),
            ('EMP02', 'Mary', 'Brown', 'F', 45000)
    END

    -- Generate sample branches if needed
    IF NOT EXISTS (SELECT 1 FROM BRANCH)
    BEGIN
        INSERT INTO BRANCH (BranchID, BranchName, BranchAddress)
        VALUES 
            (1, 'Downtown Branch', '123 Main St'),
            (2, 'Uptown Branch', '456 High St')
    END

    -- Generate orders for each day of 2024
    WHILE @CurrentDate <= @EndDate
    BEGIN
        DECLARE @OrdersPerDay int = 1300
        DECLARE @DailyCounter int = 1

        WHILE @DailyCounter <= @OrdersPerDay
        BEGIN
            INSERT INTO ORDER_TICKET (
                TicketID,
                TicketType,
                BranchID,
                CCCD,
                EmpID,
                Discount,
                TotalPrice,
                CreatedDate
            )
            VALUES (
                'TK' + RIGHT('00000000' + CAST(@Counter AS varchar(8)), 8),
                CASE WHEN RAND() > 0.5 THEN 'STD' ELSE 'ONL' END,
                CASE WHEN RAND() > 0.5 THEN 1 ELSE 2 END,
                '000000000' + CAST(FLOOR(RAND()*(3-1+1))+1 AS varchar(1)),
                CASE WHEN RAND() > 0.5 THEN 'EMP01' ELSE 'EMP02' END,
                FLOOR(RAND()*(20-0+1)),
                FLOOR(RAND()*(200000-50000+1))+50000,
                DATEADD(SECOND, FLOOR(RAND()*(86400)), @CurrentDate)
            )

            SET @Counter = @Counter + 1
            SET @DailyCounter = @DailyCounter + 1
        END

        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate)
    END
END
GO

-- Generate our test data
EXEC sp_Generate2024TestData
GO

-- Test with no partition
SET STATISTICS TIME ON
GO

SELECT COUNT(*), SUM(TotalPrice)
FROM ORDER_TICKET
WHERE CreatedDate BETWEEN '2024-01-01' AND '2024-06-30'
GO

-- Test queries for second half of 2024
SELECT COUNT(*), SUM(TotalPrice)
FROM ORDER_TICKET
WHERE CreatedDate BETWEEN '2024-07-01' AND '2024-12-31'
GO

SET STATISTICS TIME OFF
GO

-- Create filegroups for each half of the year
ALTER DATABASE Nhom3_test
ADD FILEGROUP FG_2024_H1  -- First half of 2024
GO
ALTER DATABASE Nhom3_test
ADD FILEGROUP FG_2024_H2  -- Second half of 2024
GO

-- Add files to the filegroups
ALTER DATABASE Nhom3_test
ADD FILE (
    NAME = '2024_H1',
    FILENAME = 'D:\SQLData\2024_H1.ndf',
    SIZE = 100MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 50MB
) TO FILEGROUP FG_2024_H1
GO

ALTER DATABASE Nhom3_test
ADD FILE (
    NAME = '2024_H2',
    FILENAME = 'D:\SQLData\2024_H2.ndf',
    SIZE = 100MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 50MB
) TO FILEGROUP FG_2024_H2
GO

-- Create partition function for mid-year split
CREATE PARTITION FUNCTION PF_2024_Midyear (datetime)
AS RANGE RIGHT
FOR VALUES ('2024-07-01')  -- Split point at July 1st, 2024
GO

-- Create partition scheme
CREATE PARTITION SCHEME PS_2024_Midyear
AS PARTITION PF_2024_Midyear
TO (FG_2024_H1, FG_2024_H2)
GO

-- Create new partitioned table
CREATE TABLE ORDER_TICKET_NEW
(
    TicketID char(10),
    TicketType char(3),
    BranchID int,
    CCCD char(10),
    EmpID char(5),
    Discount int,
    TotalPrice bigint,
    CreatedDate datetime,
    CONSTRAINT PK_ORDER_TICKET_NEW PRIMARY KEY NONCLUSTERED (TicketID, CreatedDate)
) ON PS_2024_Midyear(CreatedDate)
GO

-- Move data to partitioned table
INSERT INTO ORDER_TICKET_NEW
SELECT * FROM ORDER_TICKET
GO

-- Replace old table with new partitioned table
DROP TABLE ORDER_TICKET
GO
EXEC sp_rename 'ORDER_TICKET_NEW', 'ORDER_TICKET'
GO

-- Create monitoring view
CREATE OR ALTER VIEW vw_PartitionInfo
AS
SELECT 
    p.partition_number,
    p.rows as 'Row Count',
    fg.name as 'Filegroup',
    CAST(prv.value AS datetime) as 'Boundary Value'
FROM sys.partitions p
JOIN sys.destination_data_spaces dds 
    ON p.partition_number = dds.destination_id
JOIN sys.filegroups fg 
    ON dds.data_space_id = fg.data_space_id
LEFT JOIN sys.partition_range_values prv 
    ON p.partition_number = prv.boundary_id
WHERE p.object_id = OBJECT_ID('ORDER_TICKET')
GO

-- First, check partition distribution
SELECT * FROM vw_PartitionInfo
GO

CREATE NONCLUSTERED INDEX IX_ORDER_TICKET_CreatedDate_TotalPrice
ON [dbo].[ORDER_TICKET] ([CreatedDate])
INCLUDE ([TotalPrice])

-- Test queries for first half of 2024
SET STATISTICS TIME ON
GO

SELECT COUNT(*), SUM(TotalPrice)
FROM ORDER_TICKET
WHERE CreatedDate BETWEEN '2024-01-01' AND '2024-06-30'
GO

-- Test queries for second half of 2024
SELECT COUNT(*), SUM(TotalPrice)
FROM ORDER_TICKET
WHERE CreatedDate BETWEEN '2024-07-01' AND '2024-12-31'
GO

SET STATISTICS TIME OFF
GO