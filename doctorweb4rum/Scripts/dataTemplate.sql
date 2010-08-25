use doctorWeb4rum
GO
/**************************** INSERT TABLE ********************************/
INSERT INTO Roles VALUES('Member','Users',0,'member.gif')
INSERT INTO Roles VALUES('Moderator','Management Posts',100,'mod.gif')
INSERT INTO Roles VALUES('Super Moderator','Management SubForum',300,'supmod.gif')
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
values(9,'Med Business [ MD/MBA, DO/MBA, DDS/MBA ] ','For those currently in combined MBA programs and those interested. Co-hosted with MD-MBA.org',3,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(9,'Topics in Healthcare   ','A place to discuss, discourse, hold forth, and maybe, just maybe, have your mind changed.',4,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(9,'Finance and Investment  ','Discussion of everything other than financial aid. Includes investment, mortgage, retirement, banking, etc. Co-hosted with Business of Medicine.',5,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(9,'Financial Aid ','Discuss financial topics, including private or military scholarships, student loans, and educational costs. Co-hosted with Business of Medicine.',6,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(9,'Public Health Service and Indian Health Service  ','Discussion of USPHS and IHS issues.',7,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(9,'Confidential Consult  ','A place to ask sensitive questions you do not feel comfortable asking elsewhere.',8,0,0)


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
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Internship, Residency and Fellowship Positions  ','List upcoming or currently available internship, residency or fellowship positions, positions wanted and position swaps. Co-Hosted with Resident Swap.',2,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Chiefs Room','For past and current chief residents. This forum is not open to pre-med, medical students and junior residents.',3,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'General Residency Issues','General residency topics, not specialty related.Co-hosted with Scutwork.com.',4,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Internship ','Preliminary year and transitional year discussion forum',5,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Combined Residencies  ','For discussions covering topics realted to combined residency programs (ie: IM-Peds, EM-IM, etc).',6,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Anesthesiology ','',6,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Critical Care  ','Critical Care Medicine discussion forum',7,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Dermatology ','Dermatology discussion forum',8,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Emergency Medicine ','Emergency Medicine discussion forum',9,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Family Medicine  ','Family Medicine discussion forum',10,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Hospice and Palliative Medicine  ','Hospice and Palliative Care Medicine discussion forum.',11,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Internal Medicine and IM Subspecialties ','Internal Medicine discussion forum.',12,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Neonatology and Pediatric Critical Care/Cardiology ','',13,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Neurology ','Neurology discussion forum.',14,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Ob/Gyn ','Obstetrics and Gynecology discussion forum.',15,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Ophthalmology: Eye Physicians & Surgeons ','Co-hosted with the AAO Young Ophthalmologists Committee.',16,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Pain Medicine ','For practicing pain physicians and pain fellows. Co-hosted with PainRounds.com',17,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Pathology ','Pathology discussion forum.',18,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Pediatrics ','Pediatrics discussion forum.',19,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'PM&R ','Physical Medicine and Rehabilitation discussion forum.',20,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Psychiatry  ','For psychiatry residents and students interested in psychiatry. Co-hosted with PsychCentral.',21,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Radiation Oncology ','Radiation Oncology discussion forum.',22,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,' Radiology  ','Radiology discussion forum.Co-Hosted with radRounds.',23,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Sleep Medicine ','Sleep Medicine discussion forum.',24,0,0)
insert into dbo.SubForums(CategoryID,SubForumName,Description,Priority,TotalTopics,TotalMessages)
values(12,'Surgery and Surgical Subspecialties ','Discuss surgery and surgical subspecialties.',25,0,0)

select * from SubForums

insert into dbo.Members(UserName,Password,Email,FullName,DateCreation,AllowLogin,IsPublic,IsOnline)
values('username1','password','test@gmail.com','userName1Test',GetDate(),'true','true','true')

insert into dbo.Members(UserName,Password,Email,FullName,DateCreation,AllowLogin,IsPublic,IsOnline)
values('username2','password','test2@gmail.com','testtt',GetDate(),'true','true','true')

insert into dbo.MemberProfiles(MemberID,RoleID,Blast,Avatar,Country,Address,BirthDay,Gender,Yahoo,
Phone,Hospital,Blog,TotalPosts,TotalThanks,TotalThanked,CurrentExperience,MemberLevel,IPAddress,
LastLogin,MyRss,Signature,AboutMe) 
values(
1,1,'Blast Content','avarta.gif','Viet Nam','Ha noi','08/18/1987','true','yahoo.com',
'0987123123','Viet Nam Cuba','blog.com',2,2,5,2,1,'102.12.434.23',getdate(),'','learn','not about'
)
select * from roles
select * from members
select * from MemberProfiles
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
values(2,1,'Title test','Content Test','false',1,1,'12/12/2008',1)

insert into Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,DateCreate,MoveTo) 
values(2,1,'Title test','Content Test','false',1,1,'12/12/2008',1)

insert into Topics(SubForumID,MemberID,Title,[Content],IsLocked,TotalViews,TotalMessages,DateCreate,MoveTo) 
values(2,2,'Title memberID = 2','Content Test memberID = 2','false',1,1,'10/10/2008',1)




insert into Posts(TopicID,MemberID,Title,[Content],DateCreation,DateEdited,Signature,IPAddress)
values(1,1,'Test title','test content ',getdate(),getdate(),'true','1111332323')

insert into Posts(TopicID,MemberID,Title,[Content],DateCreation,DateEdited,Signature,IPAddress)
values(2,1,'Test title','test content ',getdate(),getdate(),'true','1111332323')

insert into Posts(TopicID,MemberID,Title,[Content],DateCreation,DateEdited,Signature,IPAddress)
values(3,1,'Test title3','test content 3',getdate(),getdate(),'true','1111332323')

insert into Posts(TopicID,MemberID,Title,[Content],DateCreation,DateEdited,Signature,IPAddress)
values(2,1,'Test titleabc','test content abc',getdate(),getdate(),'true','1111332323')

select * from dbo.Members


