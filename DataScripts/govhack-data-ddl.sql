USE [master]
GO

/****** Object:  Database [govhack-data]  ******/
/****** Unleashed Adelaide, GovHack 2015 database supporting the HealthBuddy application  ******/

USE [govhack-data]
GO
/****** Drop any dependencies in case the database has previously been created    ******/


/****** Object:  Index [ACHC20150617_DataDotGov_SVw_Idx]     ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ACHC20150617_DataDotGov_SVw]') AND name = N'ACHC20150617_DataDotGov_SVw_Idx')
DROP INDEX [ACHC20150617_DataDotGov_SVw_Idx] ON [dbo].[ACHC20150617_DataDotGov_SVw] WITH ( ONLINE = OFF )
GO
/****** Object:  View [dbo].[ACHC20150617_DataDotGov_SVw]     ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ACHC20150617_DataDotGov_SVw]'))
DROP VIEW [dbo].[ACHC20150617_DataDotGov_SVw]
GO
/****** Object:  Table [dbo].[Test]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Test]') AND type in (N'U'))
DROP TABLE [dbo].[Test]
GO
/****** Object:  Table [dbo].[SituationFacilityTypeGuide]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituationFacilityTypeGuide]') AND type in (N'U'))
DROP TABLE [dbo].[SituationFacilityTypeGuide]
GO
/****** Object:  Table [dbo].[SaCommunityServiceDirectory]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaCommunityServiceDirectory]') AND type in (N'U'))
DROP TABLE [dbo].[SaCommunityServiceDirectory]
GO
/****** Object:  Table [dbo].[PublicHospitalsInAihwHospitalsDb]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicHospitalsInAihwHospitalsDb]') AND type in (N'U'))
DROP TABLE [dbo].[PublicHospitalsInAihwHospitalsDb]
GO
/****** Object:  Table [dbo].[myhospitals-contact-data]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[myhospitals-contact-data]') AND type in (N'U'))
DROP TABLE [dbo].[myhospitals-contact-data]
GO
/****** Object:  Table [dbo].[FacilityType]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacilityType]') AND type in (N'U'))
DROP TABLE [dbo].[FacilityType]
GO
/****** Object:  Table [dbo].[emergencydept4hourlengthofstaymetadata]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emergencydept4hourlengthofstaymetadata]') AND type in (N'U'))
DROP TABLE [dbo].[emergencydept4hourlengthofstaymetadata]
GO
/****** Object:  Table [dbo].[emergencydepartmentpresentations]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emergencydepartmentpresentations]') AND type in (N'U'))
DROP TABLE [dbo].[emergencydepartmentpresentations]
GO
/****** Object:  Table [dbo].[emergencydepartmentadmissions]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emergencydepartmentadmissions]') AND type in (N'U'))
DROP TABLE [dbo].[emergencydepartmentadmissions]
GO
/****** Object:  Table [dbo].[ED007_ExpectedArrivalsByType]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED007_ExpectedArrivalsByType]') AND type in (N'U'))
DROP TABLE [dbo].[ED007_ExpectedArrivalsByType]
GO
/****** Object:  Table [dbo].[ED007_csv]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED007_csv]') AND type in (N'U'))
DROP TABLE [dbo].[ED007_csv]
GO
/****** Object:  Table [dbo].[ED004_WaitTypeTime]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED004_WaitTypeTime]') AND type in (N'U'))
DROP TABLE [dbo].[ED004_WaitTypeTime]
GO
/****** Object:  Table [dbo].[ED003_FacilityStreamCurrentActivity]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED003_FacilityStreamCurrentActivity]') AND type in (N'U'))
DROP TABLE [dbo].[ED003_FacilityStreamCurrentActivity]
GO
/****** Object:  Table [dbo].[ED002_ActivityLast24Hours]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED002_ActivityLast24Hours]') AND type in (N'U'))
DROP TABLE [dbo].[ED002_ActivityLast24Hours]
GO
/****** Object:  Table [dbo].[ED001_HospitalStatus]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED001_HospitalStatus]') AND type in (N'U'))
DROP TABLE [dbo].[ED001_HospitalStatus]
GO
/****** Object:  Table [dbo].[AllSaHospitals]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllSaHospitals]') AND type in (N'U'))
DROP TABLE [dbo].[AllSaHospitals]
GO
/****** Object:  Table [dbo].[ACHC20150617_DataDotGov]     ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACHC20150617_DataDotGov]') AND type in (N'U'))
DROP TABLE [dbo].[ACHC20150617_DataDotGov]
GO

/****** Drop and recreate the Database [govhack-data]     ******/

USE [master]
GO
/****** Object:  Database [govhack-data]     ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'govhack-data')
DROP DATABASE [govhack-data]
GO
/****** Object:  Database [govhack-data]     ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'govhack-data')
BEGIN
CREATE DATABASE [govhack-data]
END

GO
ALTER DATABASE [govhack-data] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [govhack-data].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [govhack-data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [govhack-data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [govhack-data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [govhack-data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [govhack-data] SET ARITHABORT OFF 
GO
ALTER DATABASE [govhack-data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [govhack-data] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [govhack-data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [govhack-data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [govhack-data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [govhack-data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [govhack-data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [govhack-data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [govhack-data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [govhack-data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [govhack-data] SET  DISABLE_BROKER 
GO
ALTER DATABASE [govhack-data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [govhack-data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [govhack-data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [govhack-data] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [govhack-data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [govhack-data] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [govhack-data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [govhack-data] SET RECOVERY FULL 
GO
ALTER DATABASE [govhack-data] SET  MULTI_USER 
GO
ALTER DATABASE [govhack-data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [govhack-data] SET DB_CHAINING OFF 
GO

/****** Create the database objects     ******/

USE [govhack-data]
GO
/****** Object:  Table [dbo].[ACHC20150617_DataDotGov]     ******/
/****** Description: ACNC Registered Charities    ******/
/****** Detail     : Used to identify community services, their location and contact details.  ******/
/****** DataSource : http://data.gov.au/dataset/b050b242-4487-4306-abf5-07ca073e5594 ******/
/****** LoadMethod : SSIS using a raw data load    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACHC20150617_DataDotGov]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACHC20150617_DataDotGov](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ABN] [bigint] NULL,
	[Charity_Legal_Name] [varchar](222) NULL,
	[Other_Organisation_Names] [varchar](4000) NULL,
	[Operating_Countries] [varchar](1002) NULL,
	[Address_Type] [varchar](10) NULL,
	[Address_Line_1] [varchar](52) NULL,
	[Address_Line_2] [varchar](52) NULL,
	[Address_Line_3] [varchar](46) NULL,
	[Town_City] [varchar](40) NULL,
	[State] [varchar](10) NULL,
	[Postcode] [bigint] NULL,
	[Country] [varchar](26) NULL,
	[Charity_Website] [varchar](192) NULL,
	[Registration_Date] [datetime] NULL,
	[Date_Organisation_Established] [datetime] NULL,
	[Charity_Size] [varchar](7) NULL,
	[Number_of_Responsible_Persons] [bigint] NULL,
	[Financial_Year_End] [varchar](10) NULL,
	[Operates_in_ACT] [varchar](1) NULL,
	[Operates_in_NSW] [varchar](1) NULL,
	[Operates_in_NT] [varchar](1) NULL,
	[Operates_in_QLD] [varchar](1) NULL,
	[Operates_in_SA] [varchar](1) NULL,
	[Operates_in_TAS] [varchar](1) NULL,
	[Operates_in_VIC] [varchar](1) NULL,
	[Operates_in_WA] [varchar](1) NULL,
	[PBI] [varchar](1) NULL,
	[HPC] [varchar](1) NULL,
	[Preventing_or_relieving_suffering_of_animals] [varchar](1) NULL,
	[Advancing_Culture] [varchar](1) NULL,
	[Advancing_Education] [varchar](1) NULL,
	[Advancing_Health] [varchar](1) NULL,
	[Promote_or_oppose_a_change_to_law__government_poll_or_prac] [varchar](4000) NULL,
	[Advancing_natual_environment] [varchar](1) NULL,
	[Promoting_or_protecting_human_rights] [varchar](1) NULL,
	[Purposes_beneficial_to_ther_general_public_and_other_analogous] [varchar](1) NULL,
	[Promoting_reconciliation__mutual_respect_and_tolerance] [varchar](1) NULL,
	[Advancing_Religion] [varchar](1) NULL,
	[Advancing_social_or_public_welfare] [varchar](1) NULL,
	[Advancing_security_or_safety_of_Australia_or_Australian_public] [varchar](1) NULL,
	[Another_purpose_beneficial_to_the_community] [varchar](1) NULL,
	[Aboriginal_or_TSI] [varchar](1) NULL,
	[Aged_Persons] [varchar](1) NULL,
	[Children] [varchar](1) NULL,
	[Communities_Overseas] [varchar](1) NULL,
	[Ethnic_Groups] [varchar](1) NULL,
	[Gay__Lesbian__Bisexual] [varchar](1) NULL,
	[General_Community_in_Australia] [varchar](1) NULL,
	[Men] [varchar](1) NULL,
	[Migrants__Refugees_or_Asylum_Seekers] [varchar](1) NULL,
	[Pre_Post_Release_Offenders] [varchar](1) NULL,
	[People_with_Chronic_Illness] [varchar](1) NULL,
	[People_with_Disabilities] [varchar](1) NULL,
	[People_at_risk_of_homelessness] [varchar](1) NULL,
	[Unemployed_Persons] [varchar](1) NULL,
	[Veterans_or_their_families] [varchar](1) NULL,
	[Victims_of_crime] [varchar](1) NULL,
	[Victims_of_Disasters] [varchar](1) NULL,
	[Women] [varchar](1) NULL,
	[Youth] [varchar](1) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AllSaHospitals]     ******/
/****** Description: SA Health Hospitals Locations    ******/
/****** Detail     : Used to identify health care facilities in HealthBuddy.  ******/
/****** DataSource : https://data.sa.gov.au/data/dataset/sa-health-hospitals-locations ******/
/****** LoadMethod : SSIS using a raw data load    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AllSaHospitals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AllSaHospitals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DHS_ID] [int] NULL,
	[NAME] [nvarchar](200) NULL,
	[ADDRESS] [nvarchar](100) NULL,
	[SUBURB] [nvarchar](50) NULL,
	[POSTCODE] [int] NULL,
	[SUBTYPE] [nvarchar](50) NULL,
	[LABEL] [nvarchar](100) NULL,
	[DEPT] [nvarchar](50) NULL,
	[MET] [char](1) NULL,
	[XCORD] [nvarchar](11) NULL,
	[YCORD] [nvarchar](11) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Description: SA Health Emergency Department Dashboard   ******/
/****** Detail     : The following tables are populated from data sourced from the SA Health Emergency Department Dashboard
                     Used to provide details about current waiting times, capacity and inbound ambulances for the Health Buddy application 
					 and providing detail on the Health Buddy Dashboard					   ******/
/****** DataSource : (Licensing considerations for real production use) 
                     http://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/about+us/our+performance/our+hospital+dashboards/about+the+ed+dashboard/emergency+department+dashboard

 ******/
/****** LoadMethod : SSIS using a raw data load from an initial point in time, easily extended to update in sync with the Emergency Department Dashboard updates currently every 30 minutes.   ******/

/****** Object:  Table [dbo].[ED001_HospitalStatus]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED001_HospitalStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ED001_HospitalStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdated] [datetime] NULL,
	[HospitalCode] [varchar](10) NULL,
	[ExpectedArrivals] [bigint] NULL,
	[EdWaiting] [bigint] NULL,
	[EdCommenced] [bigint] NULL,
	[Capacity] [bigint] NULL,
	[EdCurrentStatus] [varchar](5) NULL,
	[AvgWaitTimeMinsExclHigh] [numeric](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ED002_ActivityLast24Hours]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED002_ActivityLast24Hours]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ED002_ActivityLast24Hours](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HospitalCode] [varchar](10) NULL,
	[ActivityDateTime] [datetime] NULL,
	[Arrivals] [bigint] NULL,
	[EdCurrent] [bigint] NULL,
	[Capacity] [bigint] NULL,
	[EdWaiting] [bigint] NULL,
	[EdCommenced] [bigint] NULL,
	[Departures] [bigint] NULL,
	[Thresh1] [numeric](5, 2) NULL,
	[Thresh2] [numeric](5, 2) NULL,
	[Thresh3] [numeric](5, 2) NULL,
	[Thresh4] [numeric](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ED003_FacilityStreamCurrentActivity]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED003_FacilityStreamCurrentActivity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ED003_FacilityStreamCurrentActivity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HospitalCode] [varchar](10) NULL,
	[ClinicalStream] [varchar](20) NULL,
	[WaitToSeeTotal] [bigint] NULL,
	[WaitOverRecommended] [bigint] NULL,
	[ED003_6] [numeric](5, 2) NULL,
	[Unk1] [varchar](3) NULL,
	[BeingTreated] [bigint] NULL,
	[Unk2] [varchar](3) NULL,
	[WaitForBed] [bigint] NULL,
	[WaitOverRec] [bigint] NULL,
	[ED003.15] [numeric](5, 2) NULL,
	[Unk3] [varchar](3) NULL,
	[InEd0-2Hrs] [bigint] NULL,
	[InEd2-3Hrs] [bigint] NULL,
	[InEd3-4Hrs] [bigint] NULL,
	[InEd4-8Hrs] [bigint] NULL,
	[InEdGt8Hrs] [bigint] NULL,
	[Unk4] [varchar](3) NULL,
	[ExtendCareUnit] [bigint] NULL,
	[TotalInStream] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ED004_WaitTypeTime]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED004_WaitTypeTime]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ED004_WaitTypeTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HospitalCode] [varchar](10) NULL,
	[WaitingType] [varchar](30) NULL,
	[Wait0-2Hrs] [bigint] NULL,
	[Wait2-4Hrs] [bigint] NULL,
	[Wait4-8Hrs] [bigint] NULL,
	[Wait8-12Hrs] [bigint] NULL,
	[Wait12-24Hrs] [bigint] NULL,
	[WaitGt24Hrs] [bigint] NULL,
	[WaitTotal] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ED007_csv]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED007_csv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ED007_csv](
	[HospitalCode] [varchar](4) NULL,
	[ArrivalType] [varchar](13) NULL,
	[ExpectedArrivals] [bigint] NULL
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ED007_ExpectedArrivalsByType]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ED007_ExpectedArrivalsByType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ED007_ExpectedArrivalsByType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HospitalCode] [varchar](10) NULL,
	[ArrivalType] [varchar](20) NULL,
	[ExpectedArrivals] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[emergencydepartmentadmissions]     ******/
/****** Description: Emergency Department Admissions    ******/
/****** Detail     : Used in the HealthBuddy Dashboard to present details on ED performance and community use of ED.  ******/
/****** DataSource : https://data.sa.gov.au/data/dataset/admissions-from-emergency-departments ******/
/****** LoadMethod : Data extracted from sourced xls file and inserted into table    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emergencydepartmentadmissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emergencydepartmentadmissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Quarter] [varchar](50) NULL,
	[HospitalID] [varchar](10) NULL,
	[HospitalName] [varchar](50) NULL,
	[Admissions] [int] NULL,
	[Year] [varchar](7) NULL,
 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[emergencydepartmentpresentations]     ******/
/****** Description: Emergency Department Presentations    ******/
/****** Detail     : Used in the HealthBuddy Dashboard to present details on ED performance and community use of ED. ******/
/****** DataSource : https://data.sa.gov.au/data/dataset/emergency-dept-presentations ******/
/****** LoadMethod : SSIS using a raw data load    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emergencydepartmentpresentations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emergencydepartmentpresentations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Quarter] [varchar](50) NULL,
	[HospitalID] [varchar](10) NULL,
	[HospitalName] [varchar](50) NULL,
	[Presentations] [int] NULL,
	[Year] [varchar](7) NULL,
 CONSTRAINT [Pk_emergencydepartmentpresentations_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[emergencydept4hourlengthofstaymetadata]     ******/
/****** Description: Emergency Department 4 hour length of stay    ******/
/****** Detail     : Used in the HealthBuddy Dashboard to present details on ED performance and community use of ED.
                     Used in HealthBuddy to inform the community of ED performance compared to targets at each facility. ******/
/****** DataSource : https://data.sa.gov.au/data/dataset/sa-health-emergency-department-4-hour-length-of-stay  ******/
/****** LoadMethod : Data extracted from sourced xls file and inserted into table    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[emergencydept4hourlengthofstaymetadata]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[emergencydept4hourlengthofstaymetadata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Quarter] [varchar](50) NULL,
	[HospitalID] [varchar](10) NULL,
	[HospitalName] [varchar](50) NULL,
	[LessThan4HrsPct] [decimal](10, 5) NULL,
	[Year] [varchar](7) NULL,
	[MyHospitalsId] [int] NULL,
	[HospitalCode] [varchar](4) NULL,
 CONSTRAINT [Pk_emergencydept4hourlengthofstaymetadata_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[FacilityType]     ******/
/****** Description: Facility Type     ******/
/****** Detail     : A master list of facility types from Emergency Departments are for emergencies  ******/
/****** DataSource : http://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/health+topics/emergency+departments/emergency+departments+are+for+emergencies+campaign
 ******/
/****** LoadMethod : Derived list loaded into database    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FacilityType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FacilityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SituationFacilityTypeGuide]     ******/
/****** Description: Situation linking to facility type derived from Emergency Departments are for emergencies    ******/
/****** Detail     : Used to provide details about common conditions as listed by SA Health which are treated by a GP or Pharmacy.   ******/
/****** DataSource : http://www.sahealth.sa.gov.au/wps/wcm/connect/public+content/sa+health+internet/health+topics/emergency+departments/emergency+departments+are+for+emergencies+campaign
 ******/
/****** LoadMethod : Derived list loaded into database    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SituationFacilityTypeGuide]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SituationFacilityTypeGuide](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacilityTypeId] [int] NOT NULL,
	[Situation] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[myhospitals-contact-data]     ******/
/****** Description: MyHospitals Data Download   ******/
/****** Detail     : Used to enrich details relating to healthcare facilities including location details (Geospatial) and number of beds.  ******/
/****** DataSource : http://www.myhospitals.gov.au/about-the-data/download-data  ******/
/****** LoadMethod : SSIS using a raw data load    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[myhospitals-contact-data]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[myhospitals-contact-data](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Hospital name] [varchar](200) NULL,
	[Phone number] [varchar](50) NULL,
	[Street address] [varchar](200) NULL,
	[Suburb] [varchar](50) NULL,
	[Postcode] [varchar](4) NULL,
	[State] [varchar](3) NULL,
	[Website] [varchar](500) NULL,
	[Description] [varchar](200) NULL,
	[Sector] [varchar](50) NULL,
	[Beds] [varchar](50) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[HospitalCode] [varchar](4) NULL,
	[Child] [bit] NULL,
	[Gender] [varchar](1) NULL,
	[Emergency] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[PublicHospitalsInAihwHospitalsDb]     ******/
/****** Description: Public hospitals included in AIHW hospitals databases for the year 2012–13     ******/
/****** Detail     : Providing Number of Beds and whether or not they provide an ED department for the Health Buddy application.  ******/
/****** DataSource : http://data.gov.au/dataset/australian-hospital-statistics-2012-13  ******/
/****** LoadMethod : SSIS using a raw data load    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PublicHospitalsInAihwHospitalsDb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PublicHospitalsInAihwHospitalsDb](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[State] [varchar](50) NULL,
	[Hospname] [varchar](200) NULL,
	[Establishment ID] [varchar](50) NULL,
	[Parent Id] [varchar](50) NULL,
	[Unit] [varchar](50) NULL,
	[Medicare Prov Number] [varchar](50) NULL,
	[Address Line 1] [varchar](50) NULL,
	[Address Line 2] [varchar](50) NULL,
	[Remoteness area (code)] [varchar](50) NULL,
	[Remoteness area ] [varchar](50) NULL,
	[Number of available beds] [varchar](50) NULL,
	[2012-13 Peer Group code] [varchar](50) NULL,
	[2012-13 Peer Group Name] [varchar](50) NULL,
	[Admissions reported] [varchar](50) NULL,
	[Emergency department] [varchar](50) NULL,
	[Elective surgery reported] [varchar](50) NULL,
	[Outpatient clinics] [varchar](50) NULL,
	[2011-12 Peer Group code] [varchar](50) NULL,
	[2011-12 Peer Group Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[SaCommunityServiceDirectory]     ******/
/****** Description:  South Australian Community Services Directory   ******/
/****** Detail     :  Used to identify services, their location, hours of operation and contact details.  ******/
/****** DataSource :  https://data.sa.gov.au/data/dataset/south-australian-community-services-directory  ******/
/****** LoadMethod : Data first required rough cleansing prior to data being loaded through SSIS    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaCommunityServiceDirectory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SaCommunityServiceDirectory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Organization Name] [nvarchar](110) NULL,
	[Street Address] [nvarchar](72) NULL,
	[Supplemental Address 1] [nvarchar](500) NULL,
	[Supplemental Address 2] [nvarchar](500) NULL,
	[City] [nvarchar](44) NULL,
	[Postal Code] [int] NULL,
	[StreetAddress-State] [nvarchar](26) NULL,
	[PostalAddress-Street Address] [nvarchar](109) NULL,
	[PostalAddress-Supplemental Address 1] [nvarchar](500) NULL,
	[PostalAddress-Supplemental Address 2] [nvarchar](500) NULL,
	[PostalAddress-City] [nvarchar](37) NULL,
	[PostalAddress-Postal Code] [int] NULL,
	[PostalAddress-State] [nvarchar](27) NULL,
	[Phone #1] [nvarchar](34) NULL,
	[Phone #2] [nvarchar](38) NULL,
	[Mobile #1] [nvarchar](33) NULL,
	[Mobile #2] [nvarchar](14) NULL,
	[Mobile #2 Comment] [nvarchar](34) NULL,
	[Fax #1] [nvarchar](36) NULL,
	[Email] [nvarchar](73) NULL,
	[Website] [nvarchar](306) NULL,
	[Parent Body] [nvarchar](289) NULL,
	[Contact] [nvarchar](1000) NULL,
	[Hours] [nvarchar](1000) NULL,
	[Meetings] [nvarchar](2000) NULL,
	[Eligibility] [nvarchar](2000) NULL,
	[Comment] [nvarchar](2000) NULL,
	[Services] [nvarchar](2000) NULL,
	[ABN] [nvarchar](910) NULL,
	[Last updated] [date] NULL,
	[Internal Contact ID] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END
GO

/****** Object:  View [dbo].[ACHC20150617_DataDotGov_SVw]     ******/
/****** Description: ACNC Registered Charities Subset    ******/
/****** Detail     : Subset of charity contact details including those who provide services direct to individuals  ******/
/****** DataSource : http://data.gov.au/dataset/b050b242-4487-4306-abf5-07ca073e5594 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ACHC20150617_DataDotGov_SVw]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[ACHC20150617_DataDotGov_SVw]
WITH SCHEMABINDING
AS
SELECT [Id]
      ,[ABN]
      ,[Charity_Legal_Name]
      ,[Address_Type]
      ,[Address_Line_1]
      ,[Address_Line_2]
      ,[Address_Line_3]
      ,[Town_City]
      ,[State]
      ,[Postcode]
      ,[Country]
      ,[Charity_Website]
      ,[Charity_Size]
      ,[Number_of_Responsible_Persons]
      ,[Operates_in_ACT]
      ,[Operates_in_NSW]
      ,[Operates_in_NT]
      ,[Operates_in_QLD]
      ,[Operates_in_SA]
      ,[Operates_in_TAS]
      ,[Operates_in_VIC]
      ,[Operates_in_WA]
      ,[PBI]
      ,[HPC]
      ,[Advancing_Health]
      ,[Advancing_Religion]
      ,[Advancing_social_or_public_welfare]
      ,[Aged_Persons]
      ,[Children]
      ,[Men]
      ,[People_with_Chronic_Illness]
      ,[People_with_Disabilities]
      ,[Women]
      ,[Youth]
  FROM [dbo].[ACHC20150617_DataDotGov]
  WHERE [PBI] = ''Y'' -- Public benevolent institution
  AND CHARINDEX(''Y'',[People_with_Chronic_Illness]
      +[People_with_Disabilities]
	  +[Advancing_Health]) > 0
  AND CHARINDEX(''Y'',[Operates_in_ACT]
      +[Operates_in_NSW]
      +[Operates_in_NT]
      +[Operates_in_QLD]
      +[Operates_in_SA]
      +[Operates_in_TAS]
      +[Operates_in_VIC]
      +[Operates_in_WA]) > 0;
' 
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [ACHC20150617_DataDotGov_SVw_Idx]     ******/
/****** Description:   Index for the schema bound view to improve performance for only those charities to be presented by the Health Buddy application  ******/

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ACHC20150617_DataDotGov_SVw]') AND name = N'ACHC20150617_DataDotGov_SVw_Idx')
CREATE UNIQUE CLUSTERED INDEX [ACHC20150617_DataDotGov_SVw_Idx] ON [dbo].[ACHC20150617_DataDotGov_SVw]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
USE [master]
GO
ALTER DATABASE [govhack-data] SET  READ_WRITE 
GO
