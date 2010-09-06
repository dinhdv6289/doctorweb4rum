/***************************************************************************
							 Select Procedure 
****************************************************************************/
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SelectRoles' AND TYPE = 'P')
DROP PROC SelectRoles
GO
CREATE PROCEDURE SelectRoles
AS BEGIN
	SELECT RoleID, RoleName, Description, TotalPosts, RankImage
		FROM Roles
END

GO
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SelectLatestMemberID' AND TYPE = 'P')
DROP PROC SelectLatestMemberID
GO
CREATE PROCEDURE SelectLatestMemberID
@MemberID	INT OUTPUT
AS BEGIN
   		SELECT 	@MemberID=ISNULL(MAX(MemberID),0) FROM Members
   END

GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'InsertMemberInfo' AND TYPE = 'P')
DROP PROC InsertMemberInfo
GO
CREATE PROCEDURE InsertMemberInfo
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
@IPAddress		NVARCHAR(15),
@Result			SMALLINT OUTPUT
AS	BEGIN
		IF(NOT EXISTS(SELECT UserName FROM Members WHERE UserName=@UserName))
			BEGIN
				IF(NOT EXISTS(SELECT Email FROM Members WHERE Email=@Email))
					BEGIN
						INSERT INTO Members(UserName,[Password],Email,FullName,DateCreation,AllowLogin,IsOnline)
						VALUES	(@UserName,@Password,@Email,@FullName,GETDATE(),1,1)
						
						DECLARE @MemberID	INT
						EXEC SelectLatestMemberID @MemberID OUTPUT
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

CREATE PROC CategoriesInsert
@CategoryName as nvarchar(50),
@Priority as int,
@DateCreation as datetime
 as 
INSERT INTO Categories
(
	CategoryName,
	Priority,
	DateCreation
)
VALUES
(
	@CategoryName,
	@Priority,
	@DateCreation
)
select SCOPE_IDENTITY()		 					
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


create proc InsertTest
@RoleName nvarchar(20),
@Description nvarchar(100),
@TotalPosts int,
@RankImage nvarchar(100)
as begin
insert into dbo.Roles(RoleName,Description,TotalPosts,RankImage) values(@RoleName,@Description,@TotalPosts,@RankImage)
end

select * from Roles

--CREATE PROC UPDATECATEGORY BY CATEGORYID:
CREATE PROC CategoriesUpdate
@CategoryID as int,
@CategoryName as nvarchar(50),
@Priority as int,
@DateCreation as datetime
AS 
UPDATE Categories SET 
	CategoryName= @CategoryName,
	Priority= @Priority,
	DateCreation= @DateCreation
WHERE 	
	(@CategoryID = Categories.CategoryID)

--CREATE PROC DELETECATEGORY BY CATEGORY:
CREATE PROC CategoriesDelete
@CategoryID as int
AS 
DELETE Categories
WHERE 	(@CategoryID = Categories.CategoryID)

--CREATE PROC DELETEMEMBERS BY MEMBERID:
CREATE PROC MembersDelete
@MemberID as int
AS 
DELETE Members
WHERE 	(@MemberID = Members.MemberID)

go
--CREATE PROC UPDATESUBFORUMS BY SUBFORUMID:
CREATE procedure UpdateSubForums
@SubForumID as int,
@SubForumName as nvarchar(100),
@Description as nvarchar(500),
@Priority as int,
@TotalTopics as int,
@TotalMessages as int
 as 
update SubForums set 
	SubForumName= @SubForumName,
	Description= @Description,
	Priority= @Priority,
	TotalTopics= @TotalTopics,
	TotalMessages= @TotalMessages
 where 	(@SubForumID=SubForums.SubForumID)

GO
--DELETE SUBFORUMS BY SUBFORUMID:
CREATE procedure DeleteSubForums
@SubForumID as int
 as 
delete SubForums
 where 	(@SubForumID = SubForums.SubForumID)

GO