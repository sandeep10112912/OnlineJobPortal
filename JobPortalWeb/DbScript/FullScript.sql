USE [master]
GO
/****** Object:  Database [JobPortal]    Script Date: 1/14/2024 10:30:46 PM ******/
CREATE DATABASE [JobPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JobPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JobPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JobPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\JobPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [JobPortal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobPortal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobPortal] SET RECOVERY FULL 
GO
ALTER DATABASE [JobPortal] SET  MULTI_USER 
GO
ALTER DATABASE [JobPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JobPortal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [JobPortal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobPortal', N'ON'
GO
ALTER DATABASE [JobPortal] SET QUERY_STORE = OFF
GO
USE [JobPortal]
GO
/****** Object:  Table [dbo].[CandidateRegistration]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateRegistration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
	[IsInternal] [bit] NOT NULL,
	[Resume] [varchar](100) NOT NULL,
	[YearsOfExperice] [int] NOT NULL,
	[PrimarySkill] [varchar](500) NOT NULL,
	[AssginedPostion] [int] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifyedBy] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CandidateRegistration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateStatus]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CandidateId] [int] NOT NULL,
	[Status] [varchar](500) NOT NULL,
	[PossitionId] [int] NOT NULL,
	[CandidateName] [varchar](500) NULL,
	[PositionName] [varchar](500) NULL,
 CONSTRAINT [PK_CandidateStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InterviewSteps]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InterviewSteps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InterviewSteps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginMaster]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[LoginType] [varchar](500) NULL,
 CONSTRAINT [PK_LoginMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Descriptions] [varchar](500) NULL,
	[Is_Active] [bit] NOT NULL,
	[InterviewStepIds] [varchar](50) NULL,
	[ModifyBy] [varchar](100) NULL,
	[ModifyOn] [datetime] NOT NULL,
	[CreatedBy] [varchar](100) NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CandidateRegistration]  WITH CHECK ADD  CONSTRAINT [FK_CandidateRegistration_Position] FOREIGN KEY([AssginedPostion])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[CandidateRegistration] CHECK CONSTRAINT [FK_CandidateRegistration_Position]
GO
/****** Object:  StoredProcedure [dbo].[InsertCandidate]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[InsertCandidate]
 @FullName varchar(50),
 @ContactNo varchar(50),
 @EmailId varchar(50),
 @IsInternal bit,
 @Resume varchar(100),
 @PrimarySkill varchar(500),
 @AssginedPostion int,
 @YearsOfExperice int,
 @createdBy varchar(50),
 @modifiedBy varchar(50)
AS
begin 
if not exists (select 1 from  CandidateRegistration  where ContactNo=@ContactNo)
begin
 insert into CandidateRegistration  values (@FullName,@ContactNo,@EmailId,@IsInternal,@Resume,@YearsOfExperice,@PrimarySkill,@AssginedPostion,@createdBy,@modifiedBy,GETDATE(),GETDATE())
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[InsertPosition]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[InsertPosition]
 @Name varchar(100),
 @Description varchar(500),
 @IsActive bit,
 @InterviewStepIds varchar(50),
 @createdBy varchar(50),
 @modifiedBy varchar(50)
AS
begin 
if not exists (select 1 from Position where Name=@Name)
begin
 insert into Position  values (@Name,@Description,@IsActive,@InterviewStepIds,@modifiedBy,GETDATE(),@createdBy,GETDATE())
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[InsertSteps]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[InsertSteps]
 @Name varchar(100),
 @createdBy varchar(50),
 @modifiedBy varchar(50)
AS
begin 
if not exists (select 1 from InterviewSteps where Name=@Name)
begin
 insert into InterviewSteps values (@Name,@createdBy,@modifiedBy,GETDATE(),GETDATE())
 end
 end
GO
/****** Object:  StoredProcedure [dbo].[SaveUserMaster]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[SaveUserMaster]
 @Name varchar(500),
 @Password varchar(500),
 @LoginType varchar(500)

AS
insert into [dbo].[LoginMaster]  values (@Name,@Password,@LoginType)
 
GO
/****** Object:  StoredProcedure [dbo].[SetPositionStatus]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[SetPositionStatus]
 @CandidateId int,
 @PositionId int,
 @Status varchar(500),
 @CandidateName varchar(500),
 @PositionName varchar(500)

AS
insert into [dbo].[CandidateStatus]  values (@CandidateId,@Status,@PositionId,@CandidateName,@PositionName)
GO
/****** Object:  StoredProcedure [dbo].[UpdateCandidate]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[UpdateCandidate]
 @Id int,
 @FullName varchar(50),
 @ContactNo varchar(50),
 @EmailId varchar(50),
 @IsInternal bit,
 @Resume varchar(100),
 @PrimarySkill varchar(500),
 @AssginedPostion int,
 @YearsOfExperice int,
 @ModifyedBy  varchar(50)
AS
begin  
 UPDATE CandidateRegistration
SET FullName = @FullName, ContactNo = @ContactNo,EmailId=@EmailId,IsInternal=@IsInternal,Resume=@Resume,PrimarySkill=@PrimarySkill,AssginedPostion=@AssginedPostion,YearsOfExperice=@YearsOfExperice,ModifyedBy= @ModifyedBy,ModifyDate= GETDATE()
WHERE Id=@Id;
 end
 
GO
/****** Object:  StoredProcedure [dbo].[UpdatePosition]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE Procedure [dbo].[UpdatePosition]
 @Id int,
 @Name varchar(100),
 @Description varchar(500),
 @IsActive bit,
 @InterviewStepIds varchar(50),
 @createdBy varchar(50),
 @modifiedBy varchar(50)
AS
UPDATE Position
SET Name = @Name, Descriptions = @Description,Is_Active=@IsActive,InterviewStepIds=@InterviewStepIds,CreatedBy=@createdBy, ModifyBy= @modifiedBy,ModifyOn= GETDATE()
WHERE Id=@Id;
GO
/****** Object:  StoredProcedure [dbo].[UpdateSteps]    Script Date: 1/14/2024 10:30:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Procedure [dbo].[UpdateSteps]
 @id int,
 @Name varchar(100),
 @modifiedBy varchar(50)
AS
UPDATE InterviewSteps
SET Name = @Name, ModifiedBy = @modifiedBy 
WHERE Id=@id;
GO
USE [master]
GO
ALTER DATABASE [JobPortal] SET  READ_WRITE 
GO
