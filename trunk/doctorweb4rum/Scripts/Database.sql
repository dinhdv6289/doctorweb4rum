USE [master]
IF EXISTS (SELECT * FROM sysdatabases WHERE NAME= 'doctorWeb4rum') DROP DATABASE doctorWeb4rum

GO
--drop DATABASE doctorWeb4rum
CREATE DATABASE doctorWeb4rum
GO
USE doctorWeb4rum
GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Roles' AND TYPE = 'U')
DROP TABLE Roles
GO
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
	CurrentExperience		FLOAT,
	MemberLevel		INT,
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
	CategoryID	    INT NOT NULL ,
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
	Title			NVARCHAR(100) NOT NULL,
	[Content]		NTEXT,
	--PostId			INT NOT NULL,	
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
	Experience		FLOAT,
	DateCreation	DATETIME DEFAULT GETDATE(),
	DateEdited		DATETIME,
	Signature		BIT DEFAULT 1,
	IPAddress		NVARCHAR(50)		
)

GO
ALTER TABLE Topics ADD CONSTRAINT FK_Topics_SubForumID FOREIGN KEY (SubForumID) REFERENCES SubForums(SubForumID)
ALTER TABLE Topics ADD CONSTRAINT FK_Topics_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
--ALTER TABLE Topics ADD CONSTRAINT FK_Topics_PostId FOREIGN KEY (PostId) REFERENCES Posts(PostID)
GO
ALTER TABLE Posts ADD CONSTRAINT FK_Posts_TopicID FOREIGN KEY (TopicID) REFERENCES Topics(TopicID)
ALTER TABLE Posts ADD CONSTRAINT FK_Posts_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'Messages' AND TYPE = 'U')
DROP TABLE Messages
GO
create TABLE Messages
(
	MessageID		INT IDENTITY(1,1) PRIMARY KEY,
	FromMember		INT NOT NULL,
	ToMember		INT NOT NULL,
	Title			NVARCHAR(100) NOT NULL,
	MessageContent	NTEXT,
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
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'RatingTopic' AND TYPE = 'U')
DROP TABLE RatingTopic
GO
CREATE TABLE RatingTopic
(
	RateTopicID		INT IDENTITY(1,1) PRIMARY KEY,
	--TypeID		INT NOT NULL,
	FromMember	INT	NOT NULL,
	TopicID		INT NOT NULL,
	RatePoint	INT	,
	RateDate	DATETIME
)
--ALTER TABLE Rating ADD CONSTRAINT FK_Rating_TypeID FOREIGN KEY (TypeID) REFERENCES RateType(TypeID)
ALTER TABLE RatingTopic ADD CONSTRAINT FK_RatingTopic_FromMember FOREIGN KEY (FromMember) REFERENCES Members(MemberID)
ALTER TABLE RatingTopic ADD CONSTRAINT FK_RatingTopic_TopicID FOREIGN KEY (TopicID) REFERENCES Topics(TopicID)

GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'RatingPost' AND TYPE = 'U')
DROP TABLE RatingPost
GO
CREATE TABLE RatingPost
(
	RatingPostID INT IDENTITY(1,1) PRIMARY KEY,
	--TypeID		INT NOT NULL,
	FromMember	INT	NOT NULL,
	PostID		INT NOT NULL,
	RatePoint	INT	,
	RateDate	DATETIME
)
--ALTER TABLE Rating ADD CONSTRAINT FK_Rating_TypeID FOREIGN KEY (TypeID) REFERENCES RateType(TypeID)
ALTER TABLE RatingPost ADD CONSTRAINT FK_RatingPost_FromMember FOREIGN KEY (FromMember) REFERENCES Members(MemberID)
ALTER TABLE RatingPost ADD CONSTRAINT FK_RatingPost_PostID FOREIGN KEY (PostID) REFERENCES Posts(PostID)

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
	



