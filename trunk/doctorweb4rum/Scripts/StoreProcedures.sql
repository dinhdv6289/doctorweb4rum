use doctorWeb4rum
GO

-- da su dung. trong visual
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetNewPostBySubForumID' AND TYPE = 'P')
DROP PROC GetNewPostBySubForumID
GO
CREATE PROC GetNewPostBySubForumID
	@SubForumID	INT
AS BEGIN
	SELECT   Top(1)  Posts.PostID, Posts.TopicID, Posts.MemberID,  Posts.[Content], Posts.DateCreation, Posts.DateEdited, Posts.Signature, Posts.QuoteID
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
SELECT   TOP(1)  Posts.PostID, Posts.TopicID, Posts.MemberID, Posts.[Content], Posts.DateCreation, Posts.DateEdited, Posts.Signature,  Posts.QuoteID
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
	@Content ntext,
	@DateEdited datetime,
	@Signature bit,
	@QuoteID int
AS BEGIN 
	Insert into  dbo.Posts(TopicID,MemberID,[Content],DateEdited,Signature,QuoteID) 
	values (@TopicID,@MemberID,@Content,@DateEdited,@Signature,@QuoteID)
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
@Professional   NVARCHAR(255), 
@Experience		NVARCHAR(255),
@Result			SMALLINT OUTPUT
AS	BEGIN
		IF(NOT EXISTS(SELECT UserName FROM Members WHERE UserName=@UserName))
			BEGIN
				IF(NOT EXISTS(SELECT Email FROM Members WHERE Email=@Email))
					BEGIN
						INSERT INTO Members(UserName,[Password],Email,FullName,DateCreation,IsPublic)
						VALUES	(@UserName,@Password,@Email,@FullName,GETDATE(),@IsPublic)
						
						DECLARE @MemberID	INT
						EXEC SelectLatestMemberID @MemberID OUTPUT
						INSERT INTO MemberProfiles(MemberID,RoleID,Country,[Address],BirthDay,Gender,Yahoo,Phone,Hospital,AboutMe,Professional,Experience)
						VALUES	(@MemberID,1,@Country,@Address,@BirthDay,@Gender,@Yahoo,@Phone,@Hospital,@AboutMe,@Professional,@Experience)
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
go

-- Informations for TopicDetailsByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'TopicDetailsByTopicID' AND TYPE = 'P')
DROP PROC TopicDetailsByTopicID
GO
CREATE PROCEDURE TopicDetailsByTopicID
@TopicID	INT 
AS BEGIN
SELECT     Members.MemberID, Members.UserName, Members.Email, Members.FullName, Members.DateCreation, Members.AllowLogin, Members.IsPublic, Members.IsOnline, 
                      MemberProfiles.RoleID, MemberProfiles.Blast, MemberProfiles.Avatar, MemberProfiles.Country, MemberProfiles.Address, MemberProfiles.BirthDay, 
                      MemberProfiles.Gender, MemberProfiles.Yahoo, MemberProfiles.Phone, MemberProfiles.Hospital, MemberProfiles.Blog, 
					  (select count(*) from Posts where Posts.MemberID = Members.MemberID) AS TotalPosts, 
                      MemberProfiles.TotalThanks, MemberProfiles.TotalThanked, MemberProfiles.LastLogin, MemberProfiles.Signature, MemberProfiles.AboutMe,MemberProfiles.Professional,MemberProfiles.Experience, Posts.PostID, Posts.TopicID, Posts.[Content], 
                      Posts.DateCreation AS DateCreationOfPosts, Posts.DateEdited, Posts.Signature AS SignatureOfPosts, Posts.QuoteID,
			"RatingPoint" = CASE WHEN (select avg(RatePoint) from RatingPost where RatingPost.PostID = Posts.PostID group by PostID) is null THEN 0 Else (select avg(RatePoint) from RatingPost where PostID = Posts.PostID group by PostID) END,
			(select Posts.Content from Posts where Posts.PostID = Posts.QuoteID) as Quote
FROM         Members INNER JOIN
                      MemberProfiles ON Members.MemberID = MemberProfiles.MemberID INNER JOIN
                      Posts ON Members.MemberID = Posts.MemberID
WHERE Posts.TopicID = @TopicID
END


GO

EXEC TopicDetailsByTopicID 2
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
@ToDateCreate		DATETIME,
@Address			NVARCHAR(255),
@Professional		NVARCHAR(255),
@Experience         NVARCHAR(255)
AS
BEGIN
SET @UserName = '%' + @UserName + '%';
SET @KeySearch = '%' + @KeySearch + '%';
SET @Address = '%' + @Address + '%';
SET @Professional = '%' + @Professional + '%';
SET @Experience = '%' + @Experience + '%';
SELECT    Topics.*
FROM         Categories INNER JOIN
                      SubForums ON Categories.CategoryID = SubForums.CategoryID INNER JOIN
                      Topics ON SubForums.SubForumID = Topics.SubForumID INNER JOIN
                      Members ON Topics.MemberID = Members.MemberID INNER JOIN
					  MemberProfiles ON MemberProfiles.MemberID = Members.MemberID
		AND (@CategoryID = 0 OR Categories.CategoryID = @CategoryID)
		AND (@SubForumID = 0 OR SubForums.SubForumID = @SubForumID)
		AND (@UserName IS NULL  OR Members.UserName LIKE @UserName)
		AND (@FromDateCreate IS NULL OR Topics.DateCreate >= @FromDateCreate)
		AND (@ToDateCreate IS NULL OR Topics.DateCreate <= @ToDateCreate)
		AND (@KeySearch IS NULL OR Topics.Title LIKE @KeySearch OR Topics.Content LIKE @KeySearch)
		AND (@Address IS NULL OR MemberProfiles.Address LIKE @Address)
		AND (@Professional IS NULL OR MemberProfiles.Professional LIKE @Professional)
		AND (@Experience IS NULL OR MemberProfiles.Experience LIKE @Experience)
		ORDER BY Topics.DateCreate DESC
END
go
EXEC SearchTopic '', 0, 0, '', null, null,'','',''
go
select * from topics

--GetPostByPostID
go
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetPostByPostID' AND TYPE = 'P')
DROP PROC GetPostByPostID
go
CREATE PROC GetPostByPostID
	@PopicID int
AS BEGIN 
	select * from dbo.Posts where PostID = @PopicID
END

go

exec GetPostByPostID 1
go


--EditTopic
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'EditTopic' AND TYPE = 'P')
DROP PROC EditTopic
go
CREATE PROC EditTopic
	@Title nvarchar(100),
	@Content ntext,
	@TopicID int

AS
UPDATE Topics
SET
	Title = @Title,
	[Content] = @Content
WHERE
	[TopicID] = @TopicID
GO

--EditPost
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'EditPost' AND TYPE = 'P')
DROP PROC EditPost
go
CREATE PROC EditPost
	@Content ntext,
	@PostID int

AS
UPDATE Posts
SET
	[Content] = @Content
WHERE
	PostID = @PostID
GO

--GetStatistics

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetStatistics' AND TYPE = 'P')
DROP PROC GetStatistics
go
CREATE PROC GetStatistics
AS BEGIN
	SELECT     
		(SELECT Count(*) FROM Topics) AS TotalTopic, 
		(SELECT Count(*) FROM Posts) AS TotalPost ,
		(SELECT count(*) FROM members) AS TotalMember ,
		(SELECT username FROM members WHERE memberid = (SELECT MAX(MemberID) FROM members)) AS NewestMember,
		(SELECT MAX(MemberID) FROM members) AS MemberID
END

go

--GetStatistics

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetStatistics' AND TYPE = 'P')
DROP PROC GetStatistics
go
CREATE PROC GetStatistics
AS BEGIN
	SELECT     
		(SELECT Count(*) FROM Topics) AS TotalTopic, 
		(SELECT Count(*) FROM Posts) AS TotalPost ,
		(SELECT count(*) FROM members) AS TotalMember ,
		(SELECT username FROM members WHERE memberid = (SELECT MAX(MemberID) FROM members)) AS NewestMember,
		(SELECT MAX(MemberID) FROM members) AS MemberID
END

go

--UpdateMemberProfilesByAdmin
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'UpdateMemberInfoByAdmin' AND TYPE = 'P')
DROP PROC UpdateMemberInfoByAdmin
GO
CREATE PROCEDURE UpdateMemberInfoByAdmin
@MemberID		INT,
@Email			NVARCHAR(100) ,
@FullName		NVARCHAR(50) ,
@RoleID			INT,
@Blast			NVARCHAR(100),
@Avatar			NVARCHAR(150),	
@Country		NVARCHAR(50),
@Address		NVARCHAR(255),
@BirthDay		DATETIME,
@Yahoo			NVARCHAR(100),		
@Phone			NVARCHAR(15),
@Blog			NVARCHAR(100),
@Hospital		NVARCHAR(100),
@Signature      NVARCHAR(1000),
@AboutMe		NTEXT,
@Professional   NVARCHAR(255),
@Experience     NVARCHAR(255)
AS
	BEGIN
		UPDATE Members	SET
			Email = @Email,
			FullName = @FullName
		WHERE MemberID=@MemberID
		UPDATE MemberProfiles SET
			RoleID = @RoleID,
			Blast = @Blast,
			Avatar = @Avatar,
			Country = @Country,
			[Address] = @Address,
			BirthDay = @BirthDay,
			Yahoo = @Yahoo,
			Phone = @Phone,
			Hospital = @Hospital,
			Blog = @Blog,
			AboutMe = @AboutMe,
			Signature = @Signature,
			Professional = @Professional,
			Experience = @Experience
		WHERE MemberID=@MemberID
	END	

GO
--UpdateMemberProfiles
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'UpdateMemberInfo' AND TYPE = 'P')
DROP PROC UpdateMemberInfo
GO
CREATE PROCEDURE UpdateMemberInfo
@MemberID		INT,
@Password       NVARCHAR(50) ,
@Email			NVARCHAR(100) ,
@FullName		NVARCHAR(50) ,
@Blast			NVARCHAR(100),
@Avatar			NVARCHAR(150),	
@Country		NVARCHAR(50),
@Address		NVARCHAR(255),
@BirthDay		DATETIME,
@Yahoo			NVARCHAR(100),		
@Phone			NVARCHAR(15),
@Blog			NVARCHAR(100),
@Hospital		NVARCHAR(100),
@Signature      NVARCHAR(1000),
@AboutMe		NTEXT,
@Professional   NVARCHAR(255),
@Experience     NVARCHAR(255)
AS
	BEGIN
		UPDATE Members	SET
			Password = @Password,
			Email = @Email,
			FullName = @FullName
		WHERE MemberID=@MemberID
		UPDATE MemberProfiles SET
			Blast = @Blast,
			Avatar = @Avatar,
			Country = @Country,
			[Address] = @Address,
			BirthDay = @BirthDay,
			Yahoo = @Yahoo,
			Phone = @Phone,
			Hospital = @Hospital,
			Blog = @Blog,
			AboutMe = @AboutMe,
			Signature = @Signature,
			Professional = @Professional,
			Experience = @Experience
		WHERE MemberID=@MemberID
	END	

GO

-- GetAllInfoOfMemberByMemberID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetAllInfoOfMemberByMemberID' AND TYPE = 'P')
DROP PROC GetAllInfoOfMemberByMemberID
GO
CREATE PROCEDURE GetAllInfoOfMemberByMemberID
@MemberID		INT
AS
	BEGIN
SELECT     Members.*, MemberProfiles.*, Roles.*
FROM         Members INNER JOIN
                      MemberProfiles ON Members.MemberID = MemberProfiles.MemberID INNER JOIN
                      Roles ON MemberProfiles.RoleID = Roles.RoleID
WHERE Members.MemberID = @MemberID
END

go
EXEC GetAllInfoOfMemberByMemberID 1

go
--BanOrUnBanUser
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'BanOrUnBanUser' AND TYPE = 'P')
DROP PROC BanOrUnBanUser
GO
CREATE PROCEDURE BanOrUnBanUser
@MemberID		INT,
@AllowLogin		BIT
AS
	BEGIN
Update dbo.Members set AllowLogin = @AllowLogin where MemberID = @MemberID
END

go
--GetMemberByUserName
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetMemberByUserName' AND TYPE = 'P')
DROP PROC GetMemberByUserName
GO
CREATE PROCEDURE GetMemberByUserName
@UserName	nvarchar(30)
AS
	BEGIN
select * from dbo.Members where UserName = @UserName
end
go

go
--GetBannedUsers
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetBannedUsers' AND TYPE = 'P')
DROP PROC GetBannedUsers
GO
CREATE PROCEDURE GetBannedUsers
AS
	BEGIN
select * from dbo.Members where AllowLogin = 0;
end
go

exec GetBannedUsers
go

--GetBannedUser
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetBannedUser' AND TYPE = 'P')
DROP PROC GetBannedUser
GO
CREATE PROCEDURE GetBannedUser
	@MemberID int
AS
	BEGIN
select * from dbo.Members where MemberID = @MemberID;
end
go


--CREATE PROC UPDATECATEGORY BY CATEGORYID:
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'CategoriesUpdate' AND TYPE = 'P')
DROP PROC CategoriesUpdate
GO
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
go

--CREATE PROC DELETECATEGORY BY CATEGORY:
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'CategoriesDelete' AND TYPE = 'P')
DROP PROC CategoriesDelete
GO
CREATE PROC CategoriesDelete
@CategoryID as int
AS 
DELETE Categories
WHERE 	(@CategoryID = Categories.CategoryID)
go

--GetAllRoles
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetAllRoles' AND TYPE = 'P')
DROP PROC GetAllRoles
GO
CREATE PROCEDURE GetAllRoles
AS
	BEGIN
select * from dbo.Roles
end
go


--InsertCategory
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'InsertCategory' AND TYPE = 'P')
DROP PROC InsertCategory
GO
CREATE PROCEDURE InsertCategory
@CategoryName nvarchar(50),
@Priority  int
 AS
INSERT INTO Categories(	CategoryName,Priority) VALUES(@CategoryName,@Priority)
go

--CREATE PROC MembersDelete BY MEMBERID:
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'MembersDelete' AND TYPE = 'P')
DROP PROC MembersDelete
GO
CREATE PROC MembersDelete
@MemberID as int
AS 
DELETE Members
WHERE 	(@MemberID = Members.MemberID)

go
--CREATE PROC UpdateSubForums BY SUBFORUMID:
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'UpdateSubForums' AND TYPE = 'P')
DROP PROC UpdateSubForums
GO
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
--DELETE DeleteSubForums BY SUBFORUMID:
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'DeleteSubForums' AND TYPE = 'P')
DROP PROC DeleteSubForums
GO
CREATE procedure DeleteSubForums
@SubForumID as int
 as 
delete SubForums
 where 	(@SubForumID = SubForums.SubForumID)
GO

--SearchForUserByUserName
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SearchForUserByUserName' AND TYPE = 'P')
DROP PROC SearchForUserByUserName
GO
CREATE procedure SearchForUserByUserName
@UserName nvarchar(30)
as
SELECT     Members.*, MemberProfiles.*, Roles.*
FROM         Members INNER JOIN
                      MemberProfiles ON Members.MemberID = MemberProfiles.MemberID INNER JOIN
                      Roles ON MemberProfiles.RoleID = Roles.RoleID
where Members.UserName = @UserName

go 

exec SearchForUserByUserName 'username1'


--CountSubForumInTopicsBySubForumIDToDelete
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'CountSubForumInTopicsBySubForumIDToDelete' AND TYPE = 'P')
DROP PROC CountSubForumInTopicsBySubForumIDToDelete
GO
CREATE procedure CountSubForumInTopicsBySubForumIDToDelete
@SubForumID int
as
select count(*) as CountSubForumInTopic from dbo.Topics
where SubForumID = @SubForumID
go 
exec  CountSubForumInTopicsBySubForumIDToDelete 1

go

--SelectCategoryIDsInSubForumsByCategoryIDToDelete
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'SelectCategoryIDsInSubForumsByCategoryIDToDelete' AND TYPE = 'P')
DROP PROC SelectCategoryIDsInSubForumsByCategoryIDToDelete
GO
CREATE procedure SelectCategoryIDsInSubForumsByCategoryIDToDelete
@CategoryID int
as
select *  from dbo.SubForums
where CategoryID = @CategoryID
go 
exec  SelectCategoryIDsInSubForumsByCategoryIDToDelete 12

select * from Categories
go

---InsertSubForum
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'InsertSubForum' AND TYPE = 'P')
DROP PROC InsertSubForum
GO

CREATE PROC InsertSubForum
	@CategoryID		INT,
	@SubForumName	NVARCHAR(100),
	@Description	NVARCHAR(500),
	@Priority		INT,
	@TotalTopics	INT,
	@TotalMessages	INT
AS BEGIN 
	INSERT INTO SubForums (CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages) 
	VALUES (@CategoryID,@SubForumName,@Description,@Priority,@TotalTopics,@TotalMessages)	
END

GO
-- WhatNew
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'WhatNew' AND TYPE = 'P')
DROP PROC WhatNew
GO
CREATE PROCEDURE WhatNew
AS
BEGIN
SELECT    *
FROM         Topics WHERE (DATEADD(d, 0, DATEDIFF(d, 0, Topics.DateCreate)))  = (DATEADD(d, 0, DATEDIFF(d, 0, getdate())))
END
go

exec WhatNew
select * from topics

go
-- GetAllThanksOfTopicByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetAllThanksOfTopicByTopicID' AND TYPE = 'P')
DROP PROC GetAllThanksOfTopicByTopicID
GO
CREATE PROCEDURE GetAllThanksOfTopicByTopicID
@TopicID int
as
SELECT     ThankTopic.*, Members.*
FROM         ThankTopic INNER JOIN
                      Members ON ThankTopic.FromMember = Members.MemberID
where ThankTopic.TopicID = @TopicID
go
exec GetAllThanksOfTopicByTopicID 8

go

-- GetAllThanksOfPostByPostID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetAllThanksOfPostByPostID' AND TYPE = 'P')
DROP PROC GetAllThanksOfPostByPostID
GO
CREATE PROCEDURE GetAllThanksOfPostByPostID
@PostID int
as
SELECT     ThankPost.*, Members.*
FROM         ThankPost INNER JOIN
                      Members ON ThankPost.FromMember = Members.MemberID
where ThankPost.PostID = @PostID
go
exec GetAllThanksOfPostByPostID 4

go
-- GetMembersIsOnline
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'GetMembersIsOnline' AND TYPE = 'P')
DROP PROC GetMembersIsOnline
GO
CREATE PROCEDURE GetMembersIsOnline
as
select * from dbo.Members where IsOnline = 'true'
go
exec GetMembersIsOnline 
go

-- ViewAllTopicsByMemberID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'ViewAllTopicsByMemberID' AND TYPE = 'P')
DROP PROC ViewAllTopicsByMemberID
GO
CREATE PROCEDURE ViewAllTopicsByMemberID
	@MemberID int
AS
BEGIN
SELECT    *
FROM         Topics 
where MemberID = @MemberID
END
go
exec ViewAllTopicsByMemberID 2
go

-- ViewAllPostsByMemberID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'ViewAllPostsByMemberID' AND TYPE = 'P')
DROP PROC ViewAllPostsByMemberID
GO
CREATE PROCEDURE ViewAllPostsByMemberID
	@MemberID int
AS
BEGIN
SELECT     Topics.*, Posts.*
FROM         Posts INNER JOIN
                      Topics ON Posts.TopicID = Topics.TopicID

where Posts.MemberID = @MemberID
END
go
exec ViewAllTopicsByMemberID 2

go

select * from Posts
select * from dbo.ThankPost


-- UpdateViewOfTopicTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'UpdateViewOfTopicTopicID' AND TYPE = 'P')
DROP PROC UpdateViewOfTopicTopicID
GO
CREATE PROCEDURE UpdateViewOfTopicTopicID
	@TopicID int,
	@TotalViews int
AS
BEGIN
Update Topics set TotalViews = @TotalViews where TopicID = @TopicID

END

go
-- UpdateTotalPostOfMemberByMemberID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'UpdateTotalPostOfMemberByMemberID' AND TYPE = 'P')
DROP PROC UpdateTotalPostOfMemberByMemberID
GO
CREATE PROCEDURE UpdateTotalPostOfMemberByMemberID
	@MemberID int,
	@TotalPost int
AS
BEGIN
Update MemberProfiles set TotalPosts = @TotalPost where MemberID = @MemberID

END