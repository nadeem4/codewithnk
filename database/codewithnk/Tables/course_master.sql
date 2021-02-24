﻿CREATE TABLE [dbo].[course_master]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[name] NVARCHAR(1000) NOT NULL,
	[desc] NVARCHAR(MAX) NOT NULL,
	[main_image_url] NVARCHAR(MAX) NOT NULL,
	[views] INT NOT NULL DEFAULT 0,
	[shares] INT NOT NULL DEFAULT 0,
	[likes] INT NOT NULL DEFAULT 0,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_course_master_id PRIMARY KEY(id)
)