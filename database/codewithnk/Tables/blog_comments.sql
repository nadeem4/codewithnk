CREATE TABLE [dbo].[blog_comment]
(
	[id] INT NOT NULL IDENTITY(0,1),
	comment NVARCHAR(MAX) NOT NULL,
	blog_id INT NOT NULL,
	[user_id] INT NOT NULL,
	reply_id INT NULL,
	deleted BIT NOT NULL DEFAULT 0,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_blog_comment_id PRIMARY KEY(id),
	CONSTRAINT fk_blog_comment_user_id_user_master_id FOREIGN KEY([user_id]) REFERENCES user_master(id),
	CONSTRAINT fk_blog_comment_blog_id_blog_master_id FOREIGN KEY(blog_id) REFERENCES blog_master(id),
	CONSTRAINT fk_blog_comment_reply_id_blog_comment_id FOREIGN KEY(reply_id) REFERENCES blog_comment(id)
)
