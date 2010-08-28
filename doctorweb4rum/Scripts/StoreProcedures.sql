use doctorWeb4rum
GO

-- da su dung. trong visual
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetNewPostBySubForumID' AND TYPE = 'P')
DROP PROC GetNewPostBySubForumID
GO
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
                     Members.IsPublic, Members.IsOnline
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
                      Members.IsPublic,Members.IsOnline, Posts.TopicID
FROM         Members INNER JOIN  Posts ON Members.MemberID = Posts.MemberID
WHERE Posts.TopicID = @TopicID
ORDER BY Posts.PostID DESC
END

GO
EXEC GetLastMemberPostByTopicID 2
GO

--CountDaysOldOfTopicByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'CountDaysOldOfTopicByTopicID' AND TYPE = 'P')
DROP PROC CountDaysOldOfTopicByTopicID
GO
CREATE PROC CountDaysOldOfTopicByTopicID
	@TopicID INT
AS BEGIN
SELECT DATEDIFF(day,Topics.DateCreate,GETDATE()) from dbo.Topics where TopicID = @TopicID
END
GO
EXEC CountDaysOldOfTopicByTopicID 1

--DeleteMemberProfiles By MemberID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'DeleteMemberProfiles' AND TYPE = 'P')
DROP PROC DeleteMemberProfiles
go
CREATE PROC DeleteMemberProfiles
	@MemberID as int
AS BEGIN 
delete dbo.[MemberProfiles]
 where 	(@MemberID=MemberProfiles.MemberID)
END

GO

--GetMemberByUserNamePassword
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetMemberByUserNamePassword' AND TYPE = 'P')
DROP PROC GetMemberByUserNamePassword
go
CREATE PROC GetMemberByUserNamePassword
	@UserName nvarchar(30),
	@Password nvarchar(50)
AS BEGIN 
SELECT     MemberID, UserName, Password, Email, FullName, DateCreation, AllowLogin, IsPublic,IsOnline
FROM         Members
WHERE		UserName = @UserName AND Password = @Password
END

go
exec GetMemberByUserNamePassword 'username1', 'password'
go

--GetRoleByRoleID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetRoleByRoleID' AND TYPE = 'P')
DROP PROC GetRoleByRoleID
go
CREATE PROC GetRoleByRoleID
	@RoleID int
AS BEGIN 
SELECT      *
FROM        dbo.Roles 
WHERE		RoleID = @RoleID
END

go
exec GetRoleByRoleID 1
go

--SelectLatestTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SelectLatestTopicID' AND TYPE = 'P')
DROP PROC SelectLatestTopicID
GO
CREATE PROCEDURE SelectLatestTopicID
@TopicID	INT OUTPUT
AS BEGIN
   		SELECT 	@TopicID=ISNULL(MAX(TopicID),0) FROM dbo.Topics
   END

GO

--InsertTopic
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'InsertTopic' AND TYPE = 'P')
DROP PROC InsertTopic
go
CREATE PROC InsertTopic
	@SubForumID int,
	@MemberID int,
	@Title nvarchar(100),
	@Content ntext,
	@IsLocked bit,
	@TotalViews int,
	@TotalMessages int,
	@MoveTo int,
	@Result SMALLINT OUTPUT
AS BEGIN 
	Insert into  dbo.Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,MoveTo) 
	values (@SubForumID,@MemberID,@Title,@Content,@IsLocked,@TotalViews,@TotalMessages,@MoveTo)
	SELECT  @Result = @@Identity
END

go

--InsertPost
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'InsertPost' AND TYPE = 'P')
DROP PROC InsertPost
go
CREATE PROC InsertPost
	@TopicID int,
	@MemberID int,
	@Title nvarchar(100),
	@Content ntext,
	@DateEdited datetime,
	@Signature bit,
	@IPAddress nvarchar(50)
AS BEGIN 
	Insert into  dbo.Posts(TopicID,MemberID,Title,[Content],DateEdited,Signature,IPAddress) 
	values (@TopicID,@MemberID,@Title,@Content,@DateEdited,@Signature,@IPAddress)
END

go


select * from Roles

--CREATE PROC GetMemberByUserNamePassword
--	@UserName nvarchar(30),
--	@Password nvarchar(50)
--AS BEGIN 
--SELECT     Members.MemberID, Members.UserName, Members.Password, Members.Email, Members.FullName, Members.DateCreation, Members.AllowLogin, 
--           Members.IsOnline, MemberProfiles.RoleID, MemberProfiles.Blast, MemberProfiles.Avatar, MemberProfiles.Country, MemberProfiles.Address, 
--           MemberProfiles.BirthDay, MemberProfiles.Gender, MemberProfiles.Yahoo, MemberProfiles.Phone, MemberProfiles.Hospital, MemberProfiles.Blog, 
--           MemberProfiles.TotalPosts, MemberProfiles.TotalThanks, MemberProfiles.TotalThanked, MemberProfiles.CurrentExperience, MemberProfiles.MemberLevel, 
--           MemberProfiles.IPAddress, MemberProfiles.LastLogin, MemberProfiles.MyRss, MemberProfiles.Signature, MemberProfiles.AboutMe, Roles.RoleName, 
--           Roles.Description, Roles.RankImage
--FROM       Members INNER JOIN  MemberProfiles ON Members.MemberID = MemberProfiles.MemberID INNER JOIN
--           Roles ON MemberProfiles.RoleID = Roles.RoleID
--WHERE	   Members.UserName = @UserName AND Members.Password = @Password
--END
go

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
@Email			NVARCHAR(100),
@FullName		NVARCHAR(50) ,
@Country		NVARCHAR(50),
@Address		NVARCHAR(255),
@BirthDay		DATETIME,
@Gender			BIT,
@Yahoo			NVARCHAR(50),
@Phone			NVARCHAR(15),
@Hospital		NVARCHAR(100),
@AboutMe		NVARCHAR(15),
@IsPublic		BIT,
@Result			SMALLINT OUTPUT
AS	BEGIN
		IF(NOT EXISTS(SELECT UserName FROM Members WHERE UserName=@UserName))
			BEGIN
				IF(NOT EXISTS(SELECT Email FROM Members WHERE Email=@Email))
					BEGIN
						INSERT INTO Members(UserName,[Password],Email,FullName,DateCreation,AllowLogin,IsPublic,IsOnline)
						VALUES	(@UserName,@Password,@Email,@FullName,GETDATE(),@IsPublic,1,1)
						
						DECLARE @MemberID	INT
						EXEC SelectLatestMemberID @MemberID OUTPUT
						INSERT INTO MemberProfiles(MemberID,RoleID,Country,[Address],BirthDay,Gender,Yahoo,Phone,Hospital,AboutMe)
						VALUES	(@MemberID,1,@Country,@Address,@BirthDay,@Gender,@Yahoo,@Phone,@Hospital,@AboutMe)
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
--End Insert Member


-- Informations for TopicDetailsByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'TopicDetailsByTopicID' AND TYPE = 'P')
DROP PROC TopicDetailsByTopicID
GO
CREATE PROCEDURE TopicDetailsByTopicID
@TopicID	INT 
AS BEGIN
SELECT     Members.MemberID, Members.UserName, Members.Email, Members.FullName, Members.DateCreation, Members.AllowLogin, Members.IsPublic, Members.IsOnline, 
                      MemberProfiles.RoleID, MemberProfiles.Blast, MemberProfiles.Avatar, MemberProfiles.Country, MemberProfiles.Address, MemberProfiles.BirthDay, 
                      MemberProfiles.Gender, MemberProfiles.Yahoo, MemberProfiles.Phone, MemberProfiles.Hospital, MemberProfiles.Blog, MemberProfiles.TotalPosts, 
                      MemberProfiles.TotalThanks, MemberProfiles.TotalThanked, MemberProfiles.CurrentExperience, MemberProfiles.MemberLevel, MemberProfiles.IPAddress, 
                      MemberProfiles.LastLogin, MemberProfiles.MyRss, MemberProfiles.Signature, MemberProfiles.AboutMe, Posts.PostID, Posts.TopicID, Posts.[Content], 
                      Posts.DateCreation AS DateCreationOfPosts, Posts.DateEdited, Posts.Signature AS SignatureOfPosts, Posts.IPAddress AS IPAddressOfPost
FROM         Members INNER JOIN
                      MemberProfiles ON Members.MemberID = MemberProfiles.MemberID INNER JOIN
                      Posts ON Members.MemberID = Posts.MemberID
WHERE Posts.TopicID = @TopicID
END

GO

EXEC TopicDetailsByTopicID 1
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SearchTopic' AND TYPE = 'P')
DROP PROC SearchTopic
GO
CREATE PROCEDURE SearchTopic
@KeySearch			NVARCHAR(500),
@CategoryID			INT,	
@SubForumID			INT,
@UserName			NVARCHAR(50),
@FromDateCreate		DATETIME,
@ToDateCreate		DATETIME
AS
BEGIN
SET @UserName = '%' + @UserName + '%';
SET @KeySearch = '%' + @KeySearch + '%';
SELECT    Topics.*
FROM         Categories INNER JOIN
                      SubForums ON Categories.CategoryID = SubForums.CategoryID INNER JOIN
                      Topics ON SubForums.SubForumID = Topics.SubForumID INNER JOIN
                      Members ON Topics.MemberID = Members.MemberID
		AND (@CategoryID = 0 OR Categories.CategoryID = @CategoryID)
		AND (@SubForumID = 0 OR SubForums.SubForumID = @SubForumID)
		AND (@UserName IS NULL  OR Members.UserName LIKE @UserName)
		AND (@FromDateCreate IS NULL OR Topics.DateCreate >= @FromDateCreate)
		AND (@ToDateCreate IS NULL OR Topics.DateCreate <= @ToDateCreate)
		AND (@KeySearch IS NULL OR Topics.Title LIKE @KeySearch OR Topics.Content LIKE @KeySearch)
END

EXEC SearchTopic '', 0, 0, '', null, null

select * from topics