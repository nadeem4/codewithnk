CREATE PROCEDURE [dbo].[create_course]
	@name NVARCHAR(200),
	@desc NVARCHAR(MAX),
	@image_url NVARCHAR(MAX),
	@keywords NVARCHAR(MAX),
	@author_email NVARCHAR(200),
	@categories NVARCHAR(MAX)
AS

BEGIN

BEGIN TRANSACTION

BEGIN TRY 

DECLARE @course_id INT
DECLARE @author_id INT = (SELECT id FROM user_master WHERE email = @author_email)
DECLARE @category_ids udtt_ids
DECLARE @keyword_ids udtt_ids



INSERT INTO course_master ([name], main_image_url, [desc], created_by, updated_by)
VALUES( @name, @image_url, @desc, @author_email, @author_email)

SET @course_id = (SELECT IDENT_CURRENT('course_master'))

INSERT INTO course_author( author_id, course_id, created_by, updated_by)
VALUES(@author_id, @course_id, @author_email, @author_email)

INSERT INTO category_master([name])
OUTPUT inserted.id INTO @category_ids
SELECT value FROM string_split(@categories, ',')


INSERT INTO keyword_master([name])
OUTPUT inserted.id INTO @keyword_ids
SELECT value FROM string_split(@keywords, ',')

INSERT INTO course_category(course_id, category_id)
SELECT @course_id, id FROM @category_ids

INSERT INTO course_keywords(course_id, keyword_id)
SELECT @course_id, id FROM @keyword_ids

IF @@TRANCOUNT > 0
COMMIT

SELECT @course_id as courseId

END TRY

BEGIN CATCH

IF @@TRANCOUNT > 0

ROLLBACK

;Throw

END CATCH

END
