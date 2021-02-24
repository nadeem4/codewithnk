CREATE TABLE [dbo].[user_role]
(
	[id] INT NOT NULL IDENTITY(0,1),
	[user_id] INT NOT NULL,
	[role] NVARCHAR(100) NOT NULL,
	created_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by NVARCHAR(200) NOT NULL,
	updated_by NVARCHAR(200) NOT NULL,
	CONSTRAINT pk_user_role_id PRIMARY KEY(id),
	CONSTRAINT fk_user_role_user_id FOREIGN KEY([user_id]) REFERENCES user_master(id),
	CONSTRAINT check_user_role CHECK ([role] in ('Writer', 'Reader'))
)
