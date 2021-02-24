CREATE TABLE [dbo].[blog_category]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[category_id] INT NOT NULL,
	blog_id INT NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_blog_category_id PRIMARY KEY(id),
	CONSTRAINT fk_blog_catergory_category_id_category_master_id FOREIGN KEY(category_id) REFERENCES category_master(id),
	CONSTRAINT fk_blog_category_blog_id_blog_master_id FOREIGN KEY(blog_id) REFERENCES blog_master(id)
)
