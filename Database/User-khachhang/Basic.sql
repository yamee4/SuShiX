use Nhom3_ADB

GO
CREATE OR ALTER PROCEDURE UserSignUp
    @cccd char(10),
    @firstname NVARCHAR(20),
    @lastname NVARCHAR(20),
    @password varchar(50),
    @phone char(10),
    @email varchar(50),
    @gender int,
    @membercard char(10)
AS
BEGIN
    declare @isMember bit = 0; 
    declare @genderVal nchar(3);

    IF (@gender = 1)
    BEGIN
        SET @genderVal = N'Nam'; 
    END
    ELSE

    BEGIN
        SET @genderVal = N'Nữ';
    END
    -- Check if the username already exists
    IF EXISTS (SELECT * FROM CUSTOMER WHERE CCCD = @cccd)
    BEGIN
        RAISERROR('This user is already exists', 16, 1);
        RETURN;
    END

    IF EXISTS (SELECT * FROM CUSTOMER_MEMBER WHERE  MemberCardNumber = @membercard)
    BEGIN
        SET @isMember = 1;
    END


    -- Insert new user into customer table
    INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered)
    VALUES (@cccd, @firstname, @lastname, @phone, @email, @genderVal, @isMember, 1);

    -- Insert new user into online_customer table
    INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password)
    VALUES (@cccd, @password);

    PRINT 'User signed up successfully';
END
GO

CREATE OR ALTER PROCEDURE UserLogin
    @username char(50),
    @password char(50)
AS
BEGIN
    -- Check if user exists in EMPLOYEE table
    IF EXISTS (SELECT * FROM EMPLOYEE WHERE EmpID = @username and @password = 'emp')
    BEGIN
		 SELECT 
            EmpID AS ID,
            EmpFirstName + ' ' + EmpLastName AS Username,
			BranchManager as userType,
            'employee' AS Role
        FROM EMPLOYEE
        WHERE EmpID = @username;
	END

	ELSE IF EXISTS (SELECT * FROM ONLINE_CUSTOMER WHERE OCCCD = @username and O_password = @password)
	BEGIN
        SELECT 
            CCCD AS ID,
            CustomerFirstName + ' ' + CustomerLastName AS Username,
			isMember as userType,
            'customer' AS Role
        FROM CUSTOMER
        WHERE CCCD = @username;
	END

    ELSE IF @username = 'admin' and @password = 'diziduckhuyson'
    BEGIN
		select 'admin' as Role
	END

	ELSE
	BEGIN
		 SELECT 
            NULL AS ID,
            NULL AS Username,
            NULL AS Role;
	END

    -- Check if user exists in CUSTOMER table
END;
