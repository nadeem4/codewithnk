CREATE TABLE [dbo].[course_action]
(
	[id] INT NOT NULL IDENTITY(0,1),
	course_id INT NOT NULL,
	[user_id] INT NOT NULL,
	[type] NVARCHAR(100) NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_course_views_id PRIMARY KEY(id),
	CONSTRAINT fk_course_views_course_id_course_master_id FOREIGN KEY(course_id) REFERENCES course_master(id),
	CONSTRAINT fk_course_views_user_id_user_master_id FOREIGN KEY(course_id) REFERENCES user_master(id),
	CONSTRAINT fk_course_action_types CHECK ([type] IN ('View', 'Like', 'Share'))

)
