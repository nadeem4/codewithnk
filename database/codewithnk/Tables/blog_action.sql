CREATE TABLE [dbo].[blog_action]
(
	[id] INT NOT NULL IDENTITY(0,1),
	blog_id INT NOT NULL,
	[user_id] INT NOT NULL,
	[type] NVARCHAR(100) NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_blog_views_id PRIMARY KEY(id),
	CONSTRAINT fk_blog_views_course_id_course_master_id FOREIGN KEY(blog_id) REFERENCES blog_master(id),
	CONSTRAINT fk_blog_views_user_id_user_master_id FOREIGN KEY(blog_id) REFERENCES user_master(id),
	CONSTRAINT fk_blog_action_types CHECK ([type] IN ('View', 'Like', 'Share', 'Comment'))
)
