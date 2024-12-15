use Nhom3_ADB

GO
CREATE OR ALTER PROCEDURE UserSignup
    @cccd char(10),
    @firstname NVARCHAR(20),
    @lastname NVARCHAR(20),
    @password varchar(50),
    @phone char(10),
    @email varchar(50),
    @gender bit,
    @membercard char(10)
AS
BEGIN
    declare @isMember bit = 0; 
    -- Check if the username already exists
    IF EXISTS (SELECT 1 FROM CUSTOMER WHERE CCCD = @cccd)
    BEGIN
        RAISERROR('This user is already exists', 16, 1);
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM CUSTOMER_MEMBER WHERE  MemberCardNumber = @membercard)
    BEGIN
        SET @isMember = 1;
    END

    -- Insert new user into customer table
    INSERT INTO CUSTOMER (CCCD, CustomerFirstName, CustomerLastName, PhoneNumber, Email, Gender, isMember, isRegistered)
    VALUES (@cccd, @firstname, @lastname, @phone, @email, @gender, @isMember, 1);

    -- Insert new user into online_customer table
    INSERT INTO ONLINE_CUSTOMER (OCCCD, O_password)
    VALUES (@cccd, @password);

    PRINT 'User signed up successfully';
END
GO

CREATE OR ALTER PROCEDURE UserLogin
    @cccd char(10),
    @password NVARCHAR(50)
AS
BEGIN
    -- Check if the username and password match
    IF EXISTS (SELECT 1 FROM ONLINE_CUSTOMER WHERE OCCCD = @cccd AND O_Password = @password)
    BEGIN
        PRINT 'User logged in successfully';
    END
    ELSE
    BEGIN
        RAISERROR('Invalid username or password', 16, 1);
    END
END
GO