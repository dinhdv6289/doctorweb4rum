USE [master]
IF EXISTS (SELECT * FROM sysdatabases WHERE NAME= 'doctorWeb4rum') DROP DATABASE doctorWeb4rum

GO

CREATE DATABASE doctorWeb4rum
GO
USE doctorWeb4rum
GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Roles' AND TYPE = 'U')
DROP TABLE Roles
GO
--thu test SVN
CREATE TABLE Roles
(
	RoleID			INT IDENTITY(1,1) PRIMARY KEY,
	RoleName		NVARCHAR(20) NOT NULL,
	Description 	NVARCHAR(100),
	TotalPosts		INT,
	RankImage		NVARCHAR(100)	
)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Members' AND TYPE = 'U')
DROP TABLE Members
GO
CREATE TABLE Members
(
	MemberID		INT IDENTITY(1,1) PRIMARY KEY,
	UserName		NVARCHAR(30) NOT NULL,
	Password		NVARCHAR(50) NOT NULL,
	Email			NVARCHAR(100) NOT NULL,
	FullName		NVARCHAR(50) NOT NULL,
	DateCreation	DATETIME DEFAULT GETDATE(),
	AllowLogin		BIT DEFAULT 1,
	IsOnline		BIT DEFAULT 0
)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'ChatMessages' AND TYPE = 'U')
DROP TABLE ChatMessages
GO
CREATE TABLE ChatMessages
(
	ChatID			INT IDENTITY(1,1) PRIMARY KEY,	
	MemberID		INT NOT NULL,
	ChatContent		NTEXT NOT NULL,
	ChatDate		DATETIME DEFAULT GETDATE()
)

ALTER TABLE ChatMessages ADD CONSTRAINT FK_ChatMessages_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'MemberProfiles' AND TYPE = 'U')
DROP TABLE MemberProfiles
GO
CREATE TABLE MemberProfiles
(
	MemberID		INT PRIMARY KEY NOT NULL,
	RoleID			INT NOT NULL,
	Blast			NVARCHAR(100),
	Avatar			NVARCHAR(150),
	Country			NVARCHAR(50),
	Address			NVARCHAR(255),
	BirthDay		DATETIME,
	Gender			BIT DEFAULT 1,
	Yahoo			NVARCHAR(100),
	Phone			NVARCHAR(15),
	Hospital		NVARCHAR(100),
	Blog			NVARCHAR(100),
	TotalPosts		INT,
	TotalThanks		INT,
	TotalThanked	INT,
	IPAddress		NVARCHAR(50),
	LastLogin		DATETIME DEFAULT GETDATE(),	
	MyRss			NVARCHAR(300),
	Signature		NVARCHAR(1000),
	AboutMe			NTEXT
)
ALTER TABLE MemberProfiles ADD CONSTRAINT FK_MemberProfiles_RoleID FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
ALTER TABLE MemberProfiles ADD CONSTRAINT FK_MemberProfiles_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'AllowDisplay' AND TYPE = 'U')
DROP TABLE AllowDisplay
GO
CREATE TABLE AllowDisplay
(
	MemberID		INT PRIMARY KEY NOT NULL,
	DisFullName		BIT DEFAULT 1,
	DisEmail		BIT DEFAULT 1,
	DisBirthDay		BIT DEFAULT 1,
	DisAddress		BIT DEFAULT 1,
	DisYahoo		BIT DEFAULT 1,
	DisPhone		BIT DEFAULT 1,
	DisHospital		BIT DEFAULT 1,
	DisBlog			BIT DEFAULT 1,	
	DisSignature	BIT DEFAULT 1
)

ALTER TABLE AllowDisplay ADD CONSTRAINT FK_AllowDisplay_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Categories' AND TYPE = 'U')
DROP TABLE Categories
GO
CREATE TABLE Categories
(
	CategoryID		INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName		NVARCHAR(50) NOT NULL,
	Priority			INT,
	DateCreation		DATETIME DEFAULT GETDATE()
)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SubForums' AND TYPE = 'U')
DROP TABLE SubForums
GO
CREATE TABLE SubForums
(
	SubForumID		INT IDENTITY(1,1) PRIMARY KEY,
	CategoryID	INT NOT NULL ,
	SubForumName	NVARCHAR(100) NOT NULL,
	Description		NVARCHAR(500) NOT NULL,
	DateCreation	DATETIME DEFAULT GETDATE(),
	Priority		INT,			
	TotalTopics		INT,
	TotalMessages	INT	
)
ALTER TABLE SubForums ADD CONSTRAINT FK_SubForums_CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Topics' AND TYPE = 'U')
DROP TABLE Topics
GO
CREATE TABLE Topics
(
	TopicID			INT IDENTITY(1,1) PRIMARY KEY,
	SubForumID		INT NOT NULL,
	MemberID		INT NOT NULL,
	PostId		INT NOT NULL,	
	IsLocked		BIT DEFAULT 0,
	TotalViews		INT,
	TotalMessages	INT,
	DateLastPost	DATETIME,
	MoveTo			INT
)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Posts' AND TYPE = 'U')
DROP TABLE Posts
GO
CREATE TABLE Posts
(
	PostID			INT IDENTITY(1,1) PRIMARY KEY,
	TopicID			INT NOT NULL,
	MemberID		INT NOT NULL,
	Title			NVARCHAR(100) NOT NULL,
	[Content]		NTEXT,
	DateCreation	DATETIME DEFAULT GETDATE(),
	DateEdited		DATETIME,
	Signature		BIT DEFAULT 1,
	IPAddress		NVARCHAR(50)		
)

GO
ALTER TABLE Topics ADD CONSTRAINT FK_Topics_SubForumID FOREIGN KEY (SubForumID) REFERENCES SubForums(SubForumID)
ALTER TABLE Topics ADD CONSTRAINT FK_Topics_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
ALTER TABLE Topics ADD CONSTRAINT FK_Topics_PostId FOREIGN KEY (PostId) REFERENCES Posts(PostID)
GO
ALTER TABLE Posts ADD CONSTRAINT FK_Posts_TopicID FOREIGN KEY (TopicID) REFERENCES Topics(TopicID)
ALTER TABLE Posts ADD CONSTRAINT FK_Posts_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Messages' AND TYPE = 'U')
DROP TABLE Messages
GO
CREATE TABLE Messages
(
	MessageID		INT IDENTITY(1,1) PRIMARY KEY,
	FromMember		INT NOT NULL,
	ToMember		INT NOT NULL,
	Title			NVARCHAR(100) NOT NULL,
	[Message]		NTEXT,
	DateSend		DATETIME DEFAULT GETDATE(),
	IsView			BIT DEFAULT 0,
	IsRead			BIT DEFAULT 0	 		
)
ALTER TABLE Messages ADD CONSTRAINT FK_Messages_FromMember FOREIGN KEY (FromMember) REFERENCES Members(MemberID)
ALTER TABLE Messages ADD CONSTRAINT FK_Messages_ToMember FOREIGN KEY (ToMember) REFERENCES Members(MemberID)

--GO
--
--CREATE TABLE RateType
--(
--	TypeID		INT IDENTITY(1,1) PRIMARY KEY,
--	RatePoint	INT	
--)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Rating' AND TYPE = 'U')
DROP TABLE Rating
GO
CREATE TABLE Rating
(
	RateID		INT IDENTITY(1,1) PRIMARY KEY,
	TypeID		INT NOT NULL,
	FromMember	INT	NOT NULL,
	TopicID		INT NOT NULL,
	RatePoint	INT	,
	RatingDate	DATETIME
)
--ALTER TABLE Rating ADD CONSTRAINT FK_Rating_TypeID FOREIGN KEY (TypeID) REFERENCES RateType(TypeID)
ALTER TABLE Rating ADD CONSTRAINT FK_Rating_FromMember FOREIGN KEY (FromMember) REFERENCES Members(MemberID)
ALTER TABLE Rating ADD CONSTRAINT FK_Rating_TopicID FOREIGN KEY (TopicID) REFERENCES Topics(TopicID)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Moderator' AND TYPE = 'U')
DROP TABLE Moderator
GO
CREATE TABLE Moderator
(
	SubForumID		INT NOT NULL,
	MemberID		INT NOT NULL
CONSTRAINT PK_Moderator PRIMARY KEY (SubForumID,MemberID)
)
ALTER TABLE Moderator ADD CONSTRAINT FK_Moderator_SubForumID FOREIGN KEY (SubForumID) REFERENCES SubForums(SubForumID)
ALTER TABLE Moderator ADD CONSTRAINT FK_Moderator_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
	
GO
/**************************** INSERT TABLE ********************************/
INSERT INTO Roles VALUES('Member','Users',0,'member.gif')
INSERT INTO Roles VALUES('Moderator','Management Posts',100,'mod.gif')
INSERT INTO Roles VALUES('Super Moderator','Management SubForum',300,'supmod.gif')
INSERT INTO Roles VALUES('Admin','Management Forum',500,'admin.gif')


GO
/***************************************************************************
							 Select Procedure 
****************************************************************************/
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Sel_Roles' AND TYPE = 'P')
DROP PROC Sel_Roles
GO
CREATE PROCEDURE Sel_Roles
AS BEGIN
	SELECT RoleID, RoleName, Description, TotalPosts, RankImage
		FROM Roles
END

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Sel_LastMemberID' AND TYPE = 'P')
DROP PROC Sel_LastMemberID
GO
CREATE PROCEDURE Sel_LastMemberID
@MemberID	INT OUTPUT
AS BEGIN
   		SELECT 	@MemberID=ISNULL(MAX(MemberID),0) FROM Members
   END

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Ins_MemberInfo' AND TYPE = 'P')
DROP PROC Ins_MemberInfo
GO
CREATE PROCEDURE Ins_MemberInfo
@UserName		NVARCHAR(30),
@Password		NVARCHAR(50),
@Email			NVARCHAR(100) ,
@FullName		NVARCHAR(50) ,
@Country		NVARCHAR(50),
@Address		NVARCHAR(255),
@BirthDay		DATETIME,
@Gender			BIT,
@Phone			NVARCHAR(15),
@Hospital		NVARCHAR(100),
@IPAddress				NVARCHAR(15),
@Result			SMALLINT OUTPUT
AS	BEGIN
		IF(NOT EXISTS(SELECT UserName FROM Members WHERE UserName=@UserName))
			BEGIN
				IF(NOT EXISTS(SELECT Email FROM Members WHERE Email=@Email))
					BEGIN
						INSERT INTO Members(UserName,[Password],Email,FullName,DateCreation,AllowLogin,IsOnline)
						VALUES	(@UserName,@Password,@Email,@FullName,GETDATE(),1,1)
						
						DECLARE @MemberID	INT
						EXEC Sel_LastMemberID @MemberID OUTPUT
						INSERT INTO MemberProfiles(MemberID,RoleID,Country,[Address],BirthDay,Gender,Phone,Hospital,IPAddress)
						VALUES	(@MemberID,1,@Country,@Address,@BirthDay,@Gender,@Phone,@Hospital,@IPAddress)
						
						INSERT INTO AllowDisplay(MemberID,DisFullName,DisEmail,DisBirthDay,DisAddress,DisYahoo,
									DisPhone,DisHospital,DisBlog,DisSignature)
						VALUES(@MemberID,1,1,1,1,1,1,1,1,1)
						
						SET @Result = 1;
					END
				ELSE
					BEGIN
						SET @Result = -2;
					END
			END
		ELSE
			BEGIN
				SET @Result = -1;
			END		
	END
	
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'udp_IsOnilne' AND TYPE = 'P')
DROP PROC udp_IsOnilne
GO
CREATE PROCEDURE udp_IsOnilne
@MemberID	INT,
@Status		BIT
AS BEGIN
   		UPDATE Members SET	IsOnline = @Status WHERE MemberID=@MemberID
   END

GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Sel_MemberLogin' AND TYPE = 'P')
DROP PROC Sel_MemberLogin
GO
CREATE PROCEDURE Sel_MemberLogin
@UserName		NVARCHAR(30) ,
@Password		NVARCHAR(50) ,
@Result			SMALLINT OUTPUT
AS BEGIN
	DECLARE @ID INT
	IF(EXISTS(SELECT MemberID FROM Members WHERE UserName = @UserName))
		BEGIN
			SELECT @ID = MemberID FROM Members WHERE UserName = @UserName
			IF(EXISTS(SELECT MemberID FROM Members WHERE password=@Password))
				BEGIN
					IF((SELECT AllowLogin FROM Members WHERE MemberID=@ID) = 1)
						BEGIN
							SET @Result = 1;
							EXEC udp_IsOnilne @ID,1
						END
					ELSE
						BEGIN
							SET @Result = -3;
						END
				END
			ELSE
				BEGIN
					SET @Result = -2;
				END
		END
	ELSE
		BEGIN
			SET @Result = -1;
		END
END

GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Sel_MemberIdByUserName' AND TYPE = 'P')
DROP PROC Sel_MemberIdByUserName
GO
CREATE PROCEDURE Sel_MemberIdByUserName
@UserName	 NVARCHAR(30)
AS BEGIN
   	SELECT MemberID FROM Members WHERE UserName=@UserName
   END
GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Sel_MemberProfilesByMemberID' AND TYPE = 'P')
DROP PROC Sel_MemberProfilesByMemberID
GO
CREATE PROCEDURE Sel_MemberProfilesByMemberID
@MemberID		INT
AS
	BEGIN
		SELECT dm.Email,dm.FullName,
			   dmp.Country,dmp.[Address],dmp.BirthDay,dmp.Gender,dmp.Yahoo,dmp.Phone,dmp.Hospital,dmp.Blog,dmp.AboutMe,
			   dad.DisFullName,dad.DisEmail,dad.DisBirthDay,dad.DisAddress,dad.DisYahoo,dad.DisPhone,dad.DisHospital,
			   dad.DisBlog
		FROM Members dm INNER JOIN MemberProfiles dmp ON dm.MemberID= dmp.MemberID 
			INNER JOIN AllowDisplay dad ON dad.MemberID = dm.MemberID AND dad.MemberID = dmp.MemberID 
		WHERE dm.MemberID=@MemberID
	END
GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Udp_MemberProfiles' AND TYPE = 'P')
DROP PROC Udp_MemberProfiles
GO
CREATE PROCEDURE Udp_MemberProfiles
@MemberID		INT,
@FullName		NVARCHAR(50) ,
@Email			NVARCHAR(100) ,
@Address		NVARCHAR(255),
@Hospital		NVARCHAR(100),
@BirthDay		DATETIME,
@Gender			BIT,
@Yahoo			NVARCHAR(100),		
@Phone			NVARCHAR(15),
@Blog			NVARCHAR(100),
@Country		NVARCHAR(50),
@AboutMe		NTEXT,
@DisFullName	BIT ,
@DisEmail		BIT ,
@DisBirthDay	BIT ,
@DisAddress		BIT ,
@DisYahoo		BIT ,
@DisPhone		BIT ,
@DisHospital	BIT ,
@DisBlog		BIT 
AS
	BEGIN
		UPDATE Members	SET
			Email = @Email,
			FullName = @FullName
		WHERE MemberID=@MemberID
		UPDATE MemberProfiles SET
			Country = @Country,
			[Address] = @Address,
			BirthDay = @BirthDay,
			Gender = @Gender,
			Yahoo = @Yahoo,
			Phone = @Phone,
			Hospital = @Hospital,
			Blog = @Blog,
			AboutMe = @AboutMe
		WHERE MemberID=@MemberID
		UPDATE AllowDisplay	SET
			DisFullName = @DisFullName,
			DisEmail = @DisEmail,
			DisBirthDay = @DisBirthDay,
			DisAddress = @DisAddress,
			DisYahoo = @DisYahoo,
			DisPhone = @DisPhone,
			DisHospital = @DisHospital,
			DisBlog = @DisBlog
		WHERE MemberID=@MemberID
	END	

GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Sel_ChatMessages' AND TYPE = 'P')
DROP PROC Sel_ChatMessages
GO
CREATE PROCEDURE Sel_ChatMessages
AS BEGIN
	SELECT TOP 50 ChatID,(SELECT UserName FROM Members WHERE MemberID = cm.MemberID) AS UserName, ChatContent, ChatDate
		FROM ChatMessages cm ORDER BY cm.ChatID DESC
END

GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Ins_ChatMessages' AND TYPE = 'P')
DROP PROC Ins_ChatMessages
GO
CREATE PROCEDURE Ins_ChatMessages
@MemberID		INT ,
@ChatContent	NTEXT ,
@ChatDate		DATETIME
AS	BEGIN
		INSERT INTO	ChatMessages(MemberID,ChatContent,ChatDate) VALUES (@MemberID,@ChatContent,@ChatDate)
END

GO


---------
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Sel_ChatMessageGetLastMessage' AND TYPE = 'P')
DROP PROC Sel_ChatMessageGetLastMessage
GO
CREATE PROCEDURE Sel_ChatMessageGetLastMessage
AS	BEGIN
		SELECT 	ISNULL(MAX(ChatID),0) AS ChatID FROM ChatMessages
  	END

GO
---Procedure Roles

CREATE PROC Insert_Roles
	@RoleName		NVARCHAR(20),
	@Description	NVARCHAR(100),
	@RankImage		NVARCHAR(100)
AS BEGIN 
	INSERT INTO Roles(RoleName,Description,RankImage) VALUES (@RoleName,@Description,@RankImage)
END

---PROCEDURE Members

CREATE PROC Insert_Members
	@UserName	NVARCHAR(30),
	@Password	NVARCHAR(50),
	@Email		NVARCHAR(100),
	@FullName	NVARCHAR(50)
AS BEGIN
	INSERT INTO Members (UserName,Password,Email,FullName) VALUES (@UserName,@Password,@Email,@FullName)
END

---PROCCEDURE ChatMessages

---PROCEDURE MemberProfiles

CREATE PROC Insert_MemberProfiles
	@RoleID			INT,
	@Blast			NVARCHAR(100),
	@Avatar			NVARCHAR(150),
	@Country		NVARCHAR(50),
	@Address		NVARCHAR(255),
	@BirthDay		DATETIME,
	@Yahoo			NVARCHAR(100),
	@Phone			NVARCHAR(15),
	@Hospital		NVARCHAR(100),
	@Blog			NVARCHAR(100),
	@IPAddress		NVARCHAR(50),	
	@MyRss			NVARCHAR(300),
	@Signature		NVARCHAR(1000),
	@AboutMe		NTEXT
AS BEGIN
	INSERT INTO MemberProfiles (RoleID,Blast,Avatar,Country,Address,BirthDay,Yahoo,Phone,Hospital,Blog,IPAddress,MyRss,Signature,AboutMe) VALUES (@RoleID,@Blast,@Avatar,@Country,@Address,@BirthDay,@Yahoo,@Phone,@Hospital,@Blog,@IPAddress,@MyRss,@Signature,@AboutMe)
END

---PROCEDURE Categories

CREATE PROC Insert_Categories

