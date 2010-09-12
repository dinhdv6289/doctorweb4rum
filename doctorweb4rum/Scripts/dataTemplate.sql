use doctorWeb4rum
GO
/**************************** INSERT TABLE ********************************/
INSERT INTO Roles VALUES('Member','Users',0,'member.gif')
INSERT INTO Roles VALUES('Admin','Management Forum',500,'admin.gif')
go

insert into dbo.Categories(CategoryName,Priority) values('Pre-Medical Forums',1)
insert into dbo.Categories(CategoryName,Priority) values('Dental Forums [ DDS / DMD ]',2)
insert into dbo.Categories(CategoryName,Priority) values('Optometry Forums [ OD ]',3)
insert into dbo.Categories(CategoryName,Priority) values('Pharmacy Forums [ PharmD ]',4)
insert into dbo.Categories(CategoryName,Priority) values('Podiatry Forums [DPM]',5)
insert into dbo.Categories(CategoryName,Priority) values('Psychology Forums',6)
insert into dbo.Categories(CategoryName,Priority) values('Veterinary Forums [ DVM ]',7)
insert into dbo.Categories(CategoryName,Priority) values('Rehabilitation Sciences',8)
insert into dbo.Categories(CategoryName,Priority) values('Interdisciplinary Forums',9)
insert into dbo.Categories(CategoryName,Priority) values('Research Forums',10)
insert into dbo.Categories(CategoryName,Priority) values('International Medical Forums',11)
insert into dbo.Categories(CategoryName,Priority) values('Physician / Resident Forums [ MD / DO ]',12)

select * from dbo.Categories


insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(1,'Pre-Medical Allopathic [ MD ] ','Premedical student discussion forum',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(1,'Pre-Medical Osteopathic [ DO ]','Premedical student discussion. Co-hosted with Pre-SOMA.',2,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(1,'MCAT Discussions ','Talk about the current MCAT, future tests, and study tactics.',3,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(1,'Nontraditional Students ','Nontraditional student discussion forum',4,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(1,'Re-Applicants [ MD / DO ] ','Dedicated to premedical students re-applying to medical school.',5,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(1,'Underrepresented in Healthcare ','',6,0,0)



insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(2,'Pre-Dental ','Predental student discussion forum',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(2,'DAT Discussions ','Discuss study tips and resources to excel on the Dental Admissions Test.',2,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(2,'Dental ','DDS and DMD student discussion forum',3,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(2,'Dental Residents and Practicing Dentists','For post-graduate dental residents to discuss programs and procedures.',4,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(2,'International Dental','',5,0,0)



insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(3,'Pre-Optometry','Pre-optometry student discussion forum.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(3,'OAT Discussions ','Discuss strategies and tips for the Optometry Admissions Test.',2,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(3,'Optometry ','Forum for practitioners and students currently enrolled in optometry school.',3,0,0)


insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(4,'Pre-Pharmacy','Prepharmacy student discussion forum.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(4,'PCAT Discussions ','For discussion of the Pharmacy College Admission Test.',2,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(4,'Pharmacy','For current PharmD students and practitioners.',3,0,0)


insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(5,'Pre-Podiatry Students ','Prepodiatry student forum. Co-hosted with APMSA.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(5,'Podiatry Students','For students currently in podiatry programs. Co-hosted with APMSA.',2,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(5,'Podiatric Residents & Physicians ','For podiatric residents and physicians. Co-hosted with APMA.',3,0,0)



insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(6,'Psychology [M.A., M.S.W., B.S., B.A.]','For discussion of undergraduate and masters degree issues. Co-hosted with PsychCentral.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(6,'Clinical Psychology [Psy.D. / Ph.D.] ','For discussion of PsyD or PhD issues. Co-hosted with PsychCentral.',2,0,0)


insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(7,'Pre-Veterinary','Preveterinary student forum.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(7,'Veterinary ','For current DVM students and graduates.',2,0,0)

insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(8,'Audiology [ Au.D ] ','Doctor of Audiology discussions',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(8,'Occupational Therapy [ O.T.D ]','Doctor of Occupational Therapy discussions',2,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(8,'Physical Therapy [ D.P.T. ] ','Doctor of Physical Therapy',3,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(8,'Speech Pathology [ Ph.D. ] ','Speech Pathology discussions',4,0,0)


insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(9,'Postbaccalaureate Programs ','Discuss Postbaccalaureate Premedical Programs.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(9,'Masters of Public Health [ MPH ]  ','For students interested in MPH either as an individual degree or in combination with another degree.',2,0,0)

insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(10,'Physician Scientist [ MD, MD/PhD, MD/MS, DO/PhD, DDS/PhD ] ','For students interested & current students in Physician Scientist Training Programs. Co-hosted with APSA.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(10,'Student Research and Publishing ','Co-hosted with McGill Journal of Medicine and APSA.',2,0,0)

insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(11,'General International Discussion ','General international medical discussion forum.',1,0,0)

insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Military Medicine','Discussion of Medical Corps issues.',1,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Practicing Physicians','For physicians that have completed residency training and are in hospital, community or academic practice.',2,0,0)

select * from SubForums

insert into dbo.Members(UserName,Password,Email,FullName,DateCreation,AllowLogin,IsPublic,IsOnline)
values('username1','password','test@gmail.com','userName1Test',GetDate(),'true','true','false')

insert into dbo.Members(UserName,Password,Email,FullName,DateCreation,AllowLogin,IsPublic,IsOnline)
values('username2','password','test2@gmail.com','testtt',GetDate(),'true','true','false')

insert into dbo.MemberProfiles(MemberID,RoleID,Blast,Avatar,Country,Address,BirthDay,Gender,Yahoo,
Phone,Hospital,Blog,TotalPosts,TotalThanks,TotalThanked,LastLogin,Signature,AboutMe,Professional,Experience) 
values(
1,1,'Blast Content','avarta.gif','India','India','08/18/1987','true','yahoo.com',
'0987123123','India','blog.com',2,2,5,getdate(),'learn','not about','Psychology','1 Year'
)

insert into dbo.MemberProfiles(MemberID,RoleID,Blast,Avatar,Country,Address,BirthDay,Gender,Yahoo,
Phone,Hospital,Blog,TotalPosts,TotalThanks,TotalThanked,LastLogin,Signature,AboutMe,Professional,Experience) 
values(
2,2,'Blast Content','avarta.gif','Viet Nam','Viet Nam','08/18/1987','true','yahoo.com',
'0987123123','Viet Nam Cuba','blog.com',2,2,5,getdate(),'learn','not about','Pre-Medical','1 Year'
)

insert into Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,DateCreate,MoveTo) 
values(
	1,
	1,
	'The Antibiotic Crisis: 10 year window',
	'It is been no mystery that we have been over prescribing antibiotics to the detriment of our ability to keep up with the rapidly evolving speed of drug-resistant bacteria. Here are two articles that point out a serious bacteria that seems like it has finally reached a point that we may not be able to handle.
	I know it is long but read it anyway--it will help your verbal score. ',
	'false',
	1,1,getdate(),1)

insert into Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,DateCreate,MoveTo) 
values(
	1,
	1,
	'Research question, what should I do?',
	'Last year I researched with a professor at my school to work on a thesis. I was a freshman and the professor suggested I run a project of a student who had graduated a few years back because he had had some trouble with it. The experiment goes great and we get great data. I write my thesis and the professor also had me write an article to submit to a journal. ',
	'false',
	1,1,'12/12/2008',1)

insert into Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,DateCreate,MoveTo) 
values(2,1,'Title test','Content Test','false',1,1,'09/09/2010',1)

insert into Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,DateCreate,MoveTo) 
values(2,1,'Title test','Content Test','false',1,1,getdate(),1)

insert into Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,DateCreate,MoveTo) 
values(2,2,'Title memberID = 2','Content Test memberID = 2','false',1,1,getdate(),1)

insert into RatingTopic(FromMember,TopicID,RatePoint,RateDate)
values(1,1,3,getdate())
insert into RatingTopic(FromMember,TopicID,RatePoint,RateDate)
values(2,1,5,getdate())
insert into RatingTopic(FromMember,TopicID,RatePoint,RateDate)
values(1,2,4,getdate())
insert into RatingTopic(FromMember,TopicID,RatePoint,RateDate)
values(2,2,1,getdate())

insert into Posts(TopicID,MemberID,[Content],DateCreation,DateEdited,Signature)
values(1,1,'test content ',getdate(),getdate(),'true')

insert into Posts(TopicID,MemberID,[Content],DateCreation,DateEdited,Signature)
values(2,1,'test content ',getdate(),getdate(),'true')

insert into Posts(TopicID,MemberID,[Content],DateCreation,DateEdited,Signature)
values(3,1,'test content 3',getdate(),getdate(),'true')

insert into Posts(TopicID,MemberID,[Content],DateCreation,DateEdited,Signature)
values(2,1,'test content abc',getdate(),getdate(),'true')

select * from dbo.Members


