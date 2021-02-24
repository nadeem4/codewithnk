CREATE TABLE [dbo].[sub_course_master]
(
	[id] INT NOT NULL IDENTITY(0,1),
	course_id INT NOT NULL,
	sub_course_id INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_sub_course_master_id PRIMARY KEY(id),
	CONSTRAINT pk_sub_course_master_course_id_course_master_id FOREIGN KEY(course_id) REFERENCES course_master(id),
	CONSTRAINT pk_sub_course_master_sub_course_id_course_master_id FOREIGN KEY(sub_course_id) REFERENCES course_master(id),
)
