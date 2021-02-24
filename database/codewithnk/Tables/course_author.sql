CREATE TABLE [dbo].[course_author]
(
	[id] INT NOT NULL IDENTITY(0,1),
	author_id INT NOT NULL,
	course_id INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_course_author_id PRIMARY KEY(id),
	CONSTRAINT fk_course_author_author_id_user_master_id FOREIGN KEY(author_id) REFERENCES user_master(id),
	CONSTRAINT fk_course_author_course_id_course_master_id FOREIGN KEY(course_id) REFERENCES course_master(id)
)
