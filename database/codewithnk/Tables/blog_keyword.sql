CREATE TABLE [dbo].[blog_keyword]
(
	[id] INT NOT NULL IDENTITY(0,1),
	keyword_id INT NOT NULL,
	blog_id INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_blog_keywords_id PRIMARY KEY(id),
	CONSTRAINT fk_blog_keyword_keyword_id_keyword_master_id FOREIGN KEY(keyword_id) REFERENCES keyword_master(id),
	CONSTRAINT fk_blog_keywords_blog_id_blog_master_id FOREIGN KEY(blog_id) REFERENCES blog_master(id)
)
