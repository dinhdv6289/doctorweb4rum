use doctorWeb4rum
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
---Procedure InsertRoles

CREATE PROC InsertRoles
	@RoleName		NVARCHAR(20),
	@Description	NVARCHAR(100),
	@RankImage		NVARCHAR(100)
AS BEGIN 
	INSERT INTO Roles(RoleName,Description,RankImage) VALUES (@RoleName,@Description,@RankImage)
END

GO
---PROCEDURE InsertMembers

CREATE PROC InsertMembers
	@UserName	NVARCHAR(30),
	@Password	NVARCHAR(50),
	@Email		NVARCHAR(100),
	@FullName	NVARCHAR(50)
AS BEGIN
	INSERT INTO Members (UserName,Password,Email,FullName) VALUES (@UserName,@Password,@Email,@FullName)
END

GO

---PROCEDURE InsertMemberProfiles

CREATE PROC InsertMemberProfiles
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

GO
---PROCEDURE InsertCategories

CREATE PROC InsertCategories
	@CategoryName	NVARCHAR(50),
	@Priority		INT
AS BEGIN 
	INSERT INTO Categories (CategoryName,Priority) VALUES (@CategoryName,@Priority)			 					
END

GO
---PROCEDURE InsertSubForums

CREATE PROC InsertSubForums
	@CategoryID		INT,
	@SubForumName	NVARCHAR(100),
	@Description	NVARCHAR(500),
	@Priority		INT,
	@ImageIcon		NVARCHAR(50)
AS BEGIN 
	INSERT INTO SubForums (CategoryID,SubForumName,Description,Priority,ImageIcon) VALUES (@CategoryID,@SubForumName,@Description,@Priority,@ImageIcon)	
END

GO
---PROCEDURE InsertPosts

CREATE PROC InsertPosts
	@TopicID	INT,
	@MemberID	INT,
	@Title		NVARCHAR(100),
	@Content	NTEXT,
	@Experience	FLOAT,
	@DateEdited	DATETIME,
	@IPAddress	NVARCHAR(50)
AS BEGIN 
	INSERT INTO Posts (TopicID,MemberID,Title,[Content],Experience,DateEdited,IPAddress) VALUES (@TopicID,@MemberID,@Title,@Content,@Experience,@DateEdited,@IPAddress)
END

GO
--CREATE PROC GetAllSubForums BY CATEGORIES:

CREATE PROC GetAllSubForumsByCategoriesID
	@CategoryID		INT
AS BEGIN
	SELECT  SubForums.SubForumID, SubForums.SubForumName, SubForums.Description, SubForums.DateCreation, SubForums.Priority, 
            SubForums.TotalTopics, SubForums.TotalMessages
    FROM	Categories INNER JOIN  SubForums ON Categories.CategoryID = SubForums.CategoryID
END

GO
--CREATE PROCEDURE GetAllToPicBySubForumsID
DROP PROC GetAllToPicBySubForumsID
CREATE PROC GetAllToPicBySubForumsID
	@SubForumID		INT
AS BEGIN
	SELECT   Topics.TopicID, Topics.MemberID, Topics.LastPostId, Topics.IsLocked, Topics.TotalViews, 
			 Topics.TotalMessages, Topics.DateLastPost, Topics.MoveTo
	FROM     SubForums INNER JOIN Topics ON SubForums.SubForumID = Topics.SubForumID	
	WHERE	 SubForums.SubForumID = @SubForumID
END

GO

--CREATE PROCEDURE GetAllPostsByTopicsID

CREATE PROC GetAllPostsByTopicsID
	@TopicID	INT
AS BEGIN
	SELECT     Posts.PostID, Posts.TopicID, Posts.MemberID, Posts.Title, Posts.[Content], Posts.DateCreation, Posts.DateEdited, Posts.Signature, Posts.IPAddress, 
               Topics.TopicID 
	FROM       Posts INNER JOIN Topics ON Posts.TopicID = Topics.TopicID AND Posts.PostID = Topics.LastPostId
	WHERE	   Topics.TopicID = @TopicID	
END


-- da su dung. trong visual
CREATE PROC GetNewPostBySubForumID
	@SubForumID	INT
AS BEGIN
	SELECT   Top(1)  Posts.PostID, Posts.TopicID, Posts.MemberID, Posts.Title, Posts.[Content], Posts.DateCreation, Posts.DateEdited, Posts.Signature, Posts.IPAddress
	FROM       Posts INNER JOIN Topics ON Posts.TopicID = Topics.TopicID 
			   INNER JOIN SubForums ON Topics.SubForumID = SubForums.SubForumID
	WHERE	   SubForums.SubForumID = @SubForumID ORDER BY Posts.PostID DESC
END

GO
exec GetNewPostBySubForumID 1

GO
--CountTopicsInSubForumBySubForumID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'CountTopicsInSubForumBySubForumID' AND TYPE = 'P')
DROP PROC CountTopicsInSubForumBySubForumID
GO
CREATE PROC CountTopicsInSubForumBySubForumID
	@SubForumID INT
AS BEGIN
	SELECT COUNT (*) FROM Topics 
	WHERE SubForumID = @SubForumID
END

GO

EXEC CountTopicsInSubForumBySubForumID  1
GO

--GetMemberOfTopicByMemberID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetMemberOfTopicByTopicID' AND TYPE = 'P')
DROP PROC GetMemberOfTopicByTopicID
GO
CREATE PROC GetMemberOfTopicByTopicID
	@TopicID INT
AS BEGIN
SELECT     Members.MemberID, Members.UserName, Members.Password, Members.Email, Members.FullName, Members.DateCreation, Members.AllowLogin, 
                      Members.IsOnline
FROM         Members INNER JOIN
                      Topics ON Members.MemberID = Topics.MemberID
WHERE Topics.TopicID = @TopicID
END
GO

exec GetMemberOfTopicByTopicID 1

go

--GetCountPostsByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetCountPostsByTopicID' AND TYPE = 'P')
DROP PROC GetCountPostsByTopicID
GO
CREATE PROC GetCountPostsByTopicID
	@TopicID INT
AS BEGIN
SELECT     COUNT(*) 
FROM         Posts INNER JOIN   Topics ON Posts.TopicID = Topics.TopicID
WHERE Topics.TopicID = @TopicID
END
GO
EXEC GetCountPostsByTopicID 2
GO

--GetTotalViewsByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetTotalViewsByTopicID' AND TYPE = 'P')
DROP PROC GetTotalViewsByTopicID
GO
CREATE PROC GetTotalViewsByTopicID
	@TopicID INT
AS BEGIN
SELECT     TotalViews
FROM         Topics
WHERE TopicID = @TopicID
END

GO
EXEC GetTotalViewsByTopicID 4
GO

--GetLastPostOfTopicByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetLastPostOfTopicByTopicID' AND TYPE = 'P')
DROP PROC GetLastPostOfTopicByTopicID
GO
CREATE PROC GetLastPostOfTopicByTopicID
	@TopicID INT
AS BEGIN
SELECT   TOP(1)  Posts.PostID, Posts.TopicID, Posts.MemberID, Posts.Title, Posts.[Content], Posts.DateCreation, Posts.DateEdited, Posts.Signature, Posts.IPAddress
FROM         Posts INNER JOIN  Topics ON Posts.TopicID = Topics.TopicID
WHERE Posts.TopicID = @TopicID
ORDER BY Posts.PostID  DESC
END

GO

EXEC GetLastPostOfTopicByTopicID 2

SELECT * FROM dbo.Posts
GO

--GetLastMemberPostByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetLastMemberPostByTopicID' AND TYPE = 'P')
DROP PROC GetLastMemberPostByTopicID
GO
CREATE PROC GetLastMemberPostByTopicID
	@TopicID INT
AS BEGIN
SELECT     TOP(1) Posts.PostID, Members.MemberID, Members.UserName, Members.Password, Members.Email, Members.FullName, Members.DateCreation, Members.AllowLogin, 
                      Members.IsOnline, Posts.TopicID
FROM         Members INNER JOIN  Posts ON Members.MemberID = Posts.MemberID
WHERE Posts.TopicID = @TopicID
ORDER BY Posts.PostID DESC
END

GO
EXEC GetLastMemberPostByTopicID 2
GO

--CountDaysOldOfTopic
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'CountDaysOldOfTopic' AND TYPE = 'P')
DROP PROC CountDaysOldOfTopic
GO
CREATE PROC CountDaysOldOfTopic
	@TopicID INT
AS BEGIN
SELECT DATEDIFF(day,Topics.DateLastPost,GETDATE()) from dbo.Topics where TopicID = @TopicID
END
GO
EXEC CountDaysOldOfTopic 1
