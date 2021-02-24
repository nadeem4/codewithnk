CREATE TABLE [dbo].[course_keywords]
(
	[id] INT NOT NULL IDENTITY(0,1),
	keyword_id INT NOT NULL,
	course_id INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_course_keywords_id PRIMARY KEY(id),
	CONSTRAINT fk_course_keyword_keyword_id_keyword_master_id FOREIGN KEY(keyword_id) REFERENCES keyword_master(id),
	CONSTRAINT fk_course_keywords_course_id_course_master_id FOREIGN KEY(course_id) REFERENCES course_master(id)
)
