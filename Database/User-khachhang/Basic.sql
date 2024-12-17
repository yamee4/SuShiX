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
    @username char(10),
    @password varchar(50)
AS
BEGIN
    -- Check if the username and password match
    IF EXISTS (SELECT * FROM ONLINE_CUSTOMER WHERE OCCCD = @username AND O_Password = @password)
    BEGIN
        SELECT * FROM ONLINE_CUSTOMER WHERE OCCCD = @username AND O_Password = @password
    END
    ELSE
    BEGIN
        RAISERROR('Invalid username or password', 16, 1);
		return
    END
END
GO