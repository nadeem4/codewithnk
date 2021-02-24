CREATE TABLE [dbo].[blog_master]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[name] NVARCHAR(1000) NOT NULL,
	[desc] NVARCHAR(MAX) NOT NULL,
	[course_id] INT NULL,
	[main_image_url] NVARCHAR(MAX) NOT NULL,
	[views] INT NOT NULL DEFAULT 0,
	[shares] INT NOT NULL DEFAULT 0,
	[likes] INT NOT NULL DEFAULT 0,
	[author_id] INT NOT NULL, 
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_blog_master_id PRIMARY KEY(id),
	CONSTRAINT fk_blog_master_course_id_course_master_id FOREIGN KEY(course_id) REFERENCES course_master(id),
	CONSTRAINT fk_blog_master_author_id_user_master_id FOREIGN KEY(author_id) REFERENCES user_master(id)
)
