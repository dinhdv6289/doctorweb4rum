use doctorWeb4rum
GO

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

--CountDaysOldOfTopicByTopicID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'CountDaysOldOfTopicByTopicID' AND TYPE = 'P')
DROP PROC CountDaysOldOfTopicByTopicID
GO
CREATE PROC CountDaysOldOfTopicByTopicID
	@TopicID INT
AS BEGIN
SELECT DATEDIFF(day,Topics.DateLastPost,GETDATE()) from dbo.Topics where TopicID = @TopicID
END
GO
EXEC CountDaysOldOfTopicByTopicID 1

--DeleteMemberProfiles By MemberID
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'DeleteMemberProfiles' AND TYPE = 'P')
DROP PROC DeleteMemberProfiles
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
SELECT     MemberID, UserName, Password, Email, FullName, DateCreation, AllowLogin, IsOnline
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




