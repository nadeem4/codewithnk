﻿/*
Deployment script for code_with_nk_db

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "code_with_nk_db"
:setvar DefaultFilePrefix "code_with_nk_db"
:setvar DefaultDataPath ""
:setvar DefaultLogPath ""

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)] COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[udtt_ids]...';


GO
CREATE TYPE [dbo].[udtt_ids] AS TABLE (
    [Id] INT NOT NULL);


GO
PRINT N'Creating [dbo].[udtt_ids_string]...';


GO
CREATE TYPE [dbo].[udtt_ids_string] AS TABLE (
    [id] NVARCHAR (MAX) NULL);


GO
PRINT N'Creating [dbo].[blog_action]...';


GO
CREATE TABLE [dbo].[blog_action] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [blog_id]          INT            NOT NULL,
    [user_id]          INT            NOT NULL,
    [type]             NVARCHAR (100) NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_blog_views_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[blog_category]...';


GO
CREATE TABLE [dbo].[blog_category] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [category_id]      INT            NOT NULL,
    [blog_id]          INT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_blog_category_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[blog_comment]...';


GO
CREATE TABLE [dbo].[blog_comment] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [comment]          NVARCHAR (MAX) NOT NULL,
    [blog_id]          INT            NOT NULL,
    [user_id]          INT            NOT NULL,
    [reply_id]         INT            NULL,
    [deleted]          BIT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_blog_comment_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[blog_keyword]...';


GO
CREATE TABLE [dbo].[blog_keyword] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [keyword_id]       INT            NOT NULL,
    [blog_id]          INT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_blog_keywords_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[blog_master]...';


GO
CREATE TABLE [dbo].[blog_master] (
    [id]               INT             IDENTITY (0, 1) NOT NULL,
    [name]             NVARCHAR (1000) NOT NULL,
    [desc]             NVARCHAR (MAX)  NOT NULL,
    [course_id]        INT             NULL,
    [main_image_url]   NVARCHAR (MAX)  NOT NULL,
    [views]            INT             NOT NULL,
    [shares]           INT             NOT NULL,
    [likes]            INT             NOT NULL,
    [author_id]        INT             NOT NULL,
    [created_datetime] DATETIME        NOT NULL,
    [updated_datetime] DATETIME        NOT NULL,
    [created_by]       NVARCHAR (200)  NOT NULL,
    [updated_by]       NVARCHAR (200)  NOT NULL,
    CONSTRAINT [pk_blog_master_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[category_master]...';


GO
CREATE TABLE [dbo].[category_master] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [name]             NVARCHAR (200) NOT NULL,
    [views]            INT            NOT NULL,
    [shares]           INT            NOT NULL,
    [likes]            INT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_category_master_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[course_action]...';


GO
CREATE TABLE [dbo].[course_action] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [course_id]        INT            NOT NULL,
    [user_id]          INT            NOT NULL,
    [type]             NVARCHAR (100) NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_course_views_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[course_author]...';


GO
CREATE TABLE [dbo].[course_author] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [author_id]        INT            NOT NULL,
    [course_id]        INT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_course_author_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[course_category]...';


GO
CREATE TABLE [dbo].[course_category] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [category_id]      INT            NOT NULL,
    [course_id]        INT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_course_category_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[course_keywords]...';


GO
CREATE TABLE [dbo].[course_keywords] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [keyword_id]       INT            NOT NULL,
    [course_id]        INT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_course_keywords_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[course_master]...';


GO
CREATE TABLE [dbo].[course_master] (
    [id]               INT             IDENTITY (0, 1) NOT NULL,
    [name]             NVARCHAR (1000) NOT NULL,
    [desc]             NVARCHAR (MAX)  NOT NULL,
    [main_image_url]   NVARCHAR (MAX)  NOT NULL,
    [views]            INT             NOT NULL,
    [shares]           INT             NOT NULL,
    [likes]            INT             NOT NULL,
    [created_datetime] DATETIME        NOT NULL,
    [updated_datetime] DATETIME        NOT NULL,
    [created_by]       NVARCHAR (200)  NOT NULL,
    [updated_by]       NVARCHAR (200)  NOT NULL,
    CONSTRAINT [pk_course_master_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[keyword_master]...';


GO
CREATE TABLE [dbo].[keyword_master] (
    [id]               INT             IDENTITY (0, 1) NOT NULL,
    [name]             NVARCHAR (1000) NOT NULL,
    [views]            INT             NOT NULL,
    [shares]           INT             NOT NULL,
    [likes]            INT             NOT NULL,
    [created_datetime] DATETIME        NOT NULL,
    [updated_datetime] DATETIME        NOT NULL,
    [created_by]       NVARCHAR (200)  NOT NULL,
    [updated_by]       NVARCHAR (200)  NOT NULL,
    CONSTRAINT [pk_keyword_master_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[sub_course_master]...';


GO
CREATE TABLE [dbo].[sub_course_master] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [course_id]        INT            NOT NULL,
    [sub_course_id]    INT            NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_sub_course_master_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[user_master]...';


GO
CREATE TABLE [dbo].[user_master] (
    [id]               INT             IDENTITY (0, 1) NOT NULL,
    [name]             NVARCHAR (200)  NOT NULL,
    [email]            NVARCHAR (200)  NOT NULL,
    [dob]              NVARCHAR (12)   NULL,
    [about]            NVARCHAR (2000) NULL,
    [photo_url]        NVARCHAR (MAX)  NULL,
    [created_datetime] DATETIME        NOT NULL,
    [updated_datetime] DATETIME        NOT NULL,
    [created_by]       NVARCHAR (200)  NOT NULL,
    [updated_by]       NVARCHAR (200)  NOT NULL,
    CONSTRAINT [pk_userid] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating [dbo].[user_role]...';


GO
CREATE TABLE [dbo].[user_role] (
    [id]               INT            IDENTITY (0, 1) NOT NULL,
    [user_id]          INT            NOT NULL,
    [role]             NVARCHAR (100) NOT NULL,
    [created_datetime] DATETIME       NOT NULL,
    [updated_datetime] DATETIME       NOT NULL,
    [created_by]       NVARCHAR (200) NOT NULL,
    [updated_by]       NVARCHAR (200) NOT NULL,
    CONSTRAINT [pk_user_role_id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_action]...';


GO
ALTER TABLE [dbo].[blog_action]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_action]...';


GO
ALTER TABLE [dbo].[blog_action]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_category]...';


GO
ALTER TABLE [dbo].[blog_category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_category]...';


GO
ALTER TABLE [dbo].[blog_category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_comment]...';


GO
ALTER TABLE [dbo].[blog_comment]
    ADD DEFAULT 0 FOR [deleted];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_comment]...';


GO
ALTER TABLE [dbo].[blog_comment]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_comment]...';


GO
ALTER TABLE [dbo].[blog_comment]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_keyword]...';


GO
ALTER TABLE [dbo].[blog_keyword]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_keyword]...';


GO
ALTER TABLE [dbo].[blog_keyword]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_master]...';


GO
ALTER TABLE [dbo].[blog_master]
    ADD DEFAULT 0 FOR [views];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_master]...';


GO
ALTER TABLE [dbo].[blog_master]
    ADD DEFAULT 0 FOR [shares];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_master]...';


GO
ALTER TABLE [dbo].[blog_master]
    ADD DEFAULT 0 FOR [likes];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_master]...';


GO
ALTER TABLE [dbo].[blog_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[blog_master]...';


GO
ALTER TABLE [dbo].[blog_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[category_master]...';


GO
ALTER TABLE [dbo].[category_master]
    ADD DEFAULT 0 FOR [views];


GO
PRINT N'Creating unnamed constraint on [dbo].[category_master]...';


GO
ALTER TABLE [dbo].[category_master]
    ADD DEFAULT 0 FOR [shares];


GO
PRINT N'Creating unnamed constraint on [dbo].[category_master]...';


GO
ALTER TABLE [dbo].[category_master]
    ADD DEFAULT 0 FOR [likes];


GO
PRINT N'Creating unnamed constraint on [dbo].[category_master]...';


GO
ALTER TABLE [dbo].[category_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[category_master]...';


GO
ALTER TABLE [dbo].[category_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_action]...';


GO
ALTER TABLE [dbo].[course_action]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_action]...';


GO
ALTER TABLE [dbo].[course_action]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_author]...';


GO
ALTER TABLE [dbo].[course_author]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_author]...';


GO
ALTER TABLE [dbo].[course_author]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_category]...';


GO
ALTER TABLE [dbo].[course_category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_category]...';


GO
ALTER TABLE [dbo].[course_category]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_keywords]...';


GO
ALTER TABLE [dbo].[course_keywords]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_keywords]...';


GO
ALTER TABLE [dbo].[course_keywords]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_master]...';


GO
ALTER TABLE [dbo].[course_master]
    ADD DEFAULT 0 FOR [views];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_master]...';


GO
ALTER TABLE [dbo].[course_master]
    ADD DEFAULT 0 FOR [shares];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_master]...';


GO
ALTER TABLE [dbo].[course_master]
    ADD DEFAULT 0 FOR [likes];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_master]...';


GO
ALTER TABLE [dbo].[course_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[course_master]...';


GO
ALTER TABLE [dbo].[course_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[keyword_master]...';


GO
ALTER TABLE [dbo].[keyword_master]
    ADD DEFAULT 0 FOR [views];


GO
PRINT N'Creating unnamed constraint on [dbo].[keyword_master]...';


GO
ALTER TABLE [dbo].[keyword_master]
    ADD DEFAULT 0 FOR [shares];


GO
PRINT N'Creating unnamed constraint on [dbo].[keyword_master]...';


GO
ALTER TABLE [dbo].[keyword_master]
    ADD DEFAULT 0 FOR [likes];


GO
PRINT N'Creating unnamed constraint on [dbo].[keyword_master]...';


GO
ALTER TABLE [dbo].[keyword_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[keyword_master]...';


GO
ALTER TABLE [dbo].[keyword_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[sub_course_master]...';


GO
ALTER TABLE [dbo].[sub_course_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[sub_course_master]...';


GO
ALTER TABLE [dbo].[sub_course_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_master]...';


GO
ALTER TABLE [dbo].[user_master]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_role]...';


GO
ALTER TABLE [dbo].[user_role]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [created_datetime];


GO
PRINT N'Creating unnamed constraint on [dbo].[user_role]...';


GO
ALTER TABLE [dbo].[user_role]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [updated_datetime];


GO
PRINT N'Creating [dbo].[fk_blog_views_course_id_course_master_id]...';


GO
ALTER TABLE [dbo].[blog_action]
    ADD CONSTRAINT [fk_blog_views_course_id_course_master_id] FOREIGN KEY ([blog_id]) REFERENCES [dbo].[blog_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_views_user_id_user_master_id]...';


GO
ALTER TABLE [dbo].[blog_action]
    ADD CONSTRAINT [fk_blog_views_user_id_user_master_id] FOREIGN KEY ([blog_id]) REFERENCES [dbo].[user_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_catergory_category_id_category_master_id]...';


GO
ALTER TABLE [dbo].[blog_category]
    ADD CONSTRAINT [fk_blog_catergory_category_id_category_master_id] FOREIGN KEY ([category_id]) REFERENCES [dbo].[category_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_category_blog_id_blog_master_id]...';


GO
ALTER TABLE [dbo].[blog_category]
    ADD CONSTRAINT [fk_blog_category_blog_id_blog_master_id] FOREIGN KEY ([blog_id]) REFERENCES [dbo].[blog_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_comment_user_id_user_master_id]...';


GO
ALTER TABLE [dbo].[blog_comment]
    ADD CONSTRAINT [fk_blog_comment_user_id_user_master_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_comment_blog_id_blog_master_id]...';


GO
ALTER TABLE [dbo].[blog_comment]
    ADD CONSTRAINT [fk_blog_comment_blog_id_blog_master_id] FOREIGN KEY ([blog_id]) REFERENCES [dbo].[blog_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_comment_reply_id_blog_comment_id]...';


GO
ALTER TABLE [dbo].[blog_comment]
    ADD CONSTRAINT [fk_blog_comment_reply_id_blog_comment_id] FOREIGN KEY ([reply_id]) REFERENCES [dbo].[blog_comment] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_keyword_keyword_id_keyword_master_id]...';


GO
ALTER TABLE [dbo].[blog_keyword]
    ADD CONSTRAINT [fk_blog_keyword_keyword_id_keyword_master_id] FOREIGN KEY ([keyword_id]) REFERENCES [dbo].[keyword_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_keywords_blog_id_blog_master_id]...';


GO
ALTER TABLE [dbo].[blog_keyword]
    ADD CONSTRAINT [fk_blog_keywords_blog_id_blog_master_id] FOREIGN KEY ([blog_id]) REFERENCES [dbo].[blog_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_master_course_id_course_master_id]...';


GO
ALTER TABLE [dbo].[blog_master]
    ADD CONSTRAINT [fk_blog_master_course_id_course_master_id] FOREIGN KEY ([course_id]) REFERENCES [dbo].[course_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_master_author_id_user_master_id]...';


GO
ALTER TABLE [dbo].[blog_master]
    ADD CONSTRAINT [fk_blog_master_author_id_user_master_id] FOREIGN KEY ([author_id]) REFERENCES [dbo].[user_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_views_course_id_course_master_id]...';


GO
ALTER TABLE [dbo].[course_action]
    ADD CONSTRAINT [fk_course_views_course_id_course_master_id] FOREIGN KEY ([course_id]) REFERENCES [dbo].[course_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_views_user_id_user_master_id]...';


GO
ALTER TABLE [dbo].[course_action]
    ADD CONSTRAINT [fk_course_views_user_id_user_master_id] FOREIGN KEY ([course_id]) REFERENCES [dbo].[user_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_author_author_id_user_master_id]...';


GO
ALTER TABLE [dbo].[course_author]
    ADD CONSTRAINT [fk_course_author_author_id_user_master_id] FOREIGN KEY ([author_id]) REFERENCES [dbo].[user_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_author_course_id_course_master_id]...';


GO
ALTER TABLE [dbo].[course_author]
    ADD CONSTRAINT [fk_course_author_course_id_course_master_id] FOREIGN KEY ([course_id]) REFERENCES [dbo].[course_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_catergory_category_id_category_master_id]...';


GO
ALTER TABLE [dbo].[course_category]
    ADD CONSTRAINT [fk_course_catergory_category_id_category_master_id] FOREIGN KEY ([category_id]) REFERENCES [dbo].[category_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_category_blog_id_blog_master_id]...';


GO
ALTER TABLE [dbo].[course_category]
    ADD CONSTRAINT [fk_course_category_blog_id_blog_master_id] FOREIGN KEY ([course_id]) REFERENCES [dbo].[course_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_keyword_keyword_id_keyword_master_id]...';


GO
ALTER TABLE [dbo].[course_keywords]
    ADD CONSTRAINT [fk_course_keyword_keyword_id_keyword_master_id] FOREIGN KEY ([keyword_id]) REFERENCES [dbo].[keyword_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_course_keywords_course_id_course_master_id]...';


GO
ALTER TABLE [dbo].[course_keywords]
    ADD CONSTRAINT [fk_course_keywords_course_id_course_master_id] FOREIGN KEY ([course_id]) REFERENCES [dbo].[course_master] ([id]);


GO
PRINT N'Creating [dbo].[pk_sub_course_master_course_id_course_master_id]...';


GO
ALTER TABLE [dbo].[sub_course_master]
    ADD CONSTRAINT [pk_sub_course_master_course_id_course_master_id] FOREIGN KEY ([course_id]) REFERENCES [dbo].[course_master] ([id]);


GO
PRINT N'Creating [dbo].[pk_sub_course_master_sub_course_id_course_master_id]...';


GO
ALTER TABLE [dbo].[sub_course_master]
    ADD CONSTRAINT [pk_sub_course_master_sub_course_id_course_master_id] FOREIGN KEY ([sub_course_id]) REFERENCES [dbo].[course_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_user_role_user_id]...';


GO
ALTER TABLE [dbo].[user_role]
    ADD CONSTRAINT [fk_user_role_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user_master] ([id]);


GO
PRINT N'Creating [dbo].[fk_blog_action_types]...';


GO
ALTER TABLE [dbo].[blog_action]
    ADD CONSTRAINT [fk_blog_action_types] CHECK ([type] IN ('View', 'Like', 'Share', 'Comment'));


GO
PRINT N'Creating [dbo].[fk_course_action_types]...';


GO
ALTER TABLE [dbo].[course_action]
    ADD CONSTRAINT [fk_course_action_types] CHECK ([type] IN ('View', 'Like', 'Share'));


GO
PRINT N'Creating [dbo].[check_user_role]...';


GO
ALTER TABLE [dbo].[user_role]
    ADD CONSTRAINT [check_user_role] CHECK ([role] in ('Writer', 'Reader'));


GO
PRINT N'Creating [dbo].[assign_category_if_exist]...';


GO
CREATE PROCEDURE [dbo].[assign_category_if_exist]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
PRINT N'Creating [dbo].[assign_keyword_if_exist]...';


GO
CREATE PROCEDURE [dbo].[assign_keyword_if_exist]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
PRINT N'Creating [dbo].[create_blog]...';


GO
CREATE PROCEDURE [dbo].[create_blog]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
PRINT N'Creating [dbo].[create_category]...';


GO
CREATE PROCEDURE [dbo].[create_category]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
PRINT N'Creating [dbo].[create_course]...';


GO
CREATE PROCEDURE [dbo].[create_course]
	@name NVARCHAR(200),
	@desc NVARCHAR(MAX),
	@image_url NVARCHAR(MAX),
	@keywords NVARCHAR(MAX),
	@author_email NVARCHAR(200),
	@categories NVARCHAR(MAX)
AS

BEGIN

BEGIN TRANSACTION

BEGIN TRY 

DECLARE @course_id INT
DECLARE @author_id INT = (SELECT id FROM user_master WHERE email = @author_email)
DECLARE @category_ids udtt_ids
DECLARE @keyword_ids udtt_ids



INSERT INTO course_master ([name], main_image_url, [desc], created_by, updated_by)
VALUES( @name, @image_url, @desc, @author_email, @author_email)

SET @course_id = (SELECT IDENT_CURRENT('course_master'))

INSERT INTO course_author( author_id, course_id, created_by, updated_by)
VALUES(@author_id, @course_id, @author_email, @author_email)

INSERT INTO category_master([name])
OUTPUT inserted.id INTO @category_ids
SELECT value FROM string_split(@categories, ',')


INSERT INTO keyword_master([name])
OUTPUT inserted.id INTO @keyword_ids
SELECT value FROM string_split(@keywords, ',')

INSERT INTO course_category(course_id, category_id)
SELECT @course_id, id FROM @category_ids

INSERT INTO course_keywords(course_id, keyword_id)
SELECT @course_id, id FROM @keyword_ids

IF @@TRANCOUNT > 0
COMMIT

SELECT @course_id as courseId

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0

ROLLBACK

;Throw

END CATCH

END
GO
PRINT N'Creating [dbo].[create_keywords]...';


GO
CREATE PROCEDURE [dbo].[create_keywords]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO