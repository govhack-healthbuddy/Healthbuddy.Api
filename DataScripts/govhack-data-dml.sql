/****** Description: Data sourced from the SA Health campaign, Emergency Departments are for emergencies    ******/
/****** Detail     : provides rough examples as to the types of services suited to some situations  ******/
/****** DataSource : http://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/health+topics/emergency+departments/emergency+departments+are+for+emergencies+campaign
 ******/

USE [govhack-data]
GO

-- Clear the data ready for insert
DELETE FROM [dbo].[SituationFacilityTypeGuide];
DELETE FROM [dbo].[FacilityType];
GO

-- Facility 
INSERT INTO [dbo].[FacilityType] ([FacilityType]) VALUES('000');
INSERT INTO [dbo].[FacilityType] ([FacilityType]) VALUES('GP');
INSERT INTO [dbo].[FacilityType] ([FacilityType]) VALUES('Pharmacy');
GO

-- SituationFacilityType
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (2,'Ear pain');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (2,'Flu');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (2,'Gastro');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (2,'Minor sports injuries');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (2,'Persistent headache');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (2,'Sore throat');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (2,'Sprained ankle');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Broken bones');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Heart attack or chest pain');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Heavy bleeding');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Loss of consciousness');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Burns');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Severe abdominal pain');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Stroke');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (1,'Trouble breathing');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (3,'Cold');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (3,'Constipation');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (3,'Hay fever');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (3,'Mild skin irritation');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (3,'Minor grazes');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (3,'Nappy rash');
INSERT INTO [dbo].[SituationFacilityTypeGuide] ([FacilityTypeId],[Situation]) VALUES (3,'Tinea');
GO



