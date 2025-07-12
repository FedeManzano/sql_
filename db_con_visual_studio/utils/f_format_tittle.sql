USE db_con_visual_studio


GO
CREATE OR ALTER FUNCTION f_Format_Tittle (@W VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
    IF @W IS NULL 
        RETURN ''
    SET @W =  TRIM(UPPER(SUBSTRING(@W, 1, 1)) +  LOWER(SUBSTRING(@W, 2, LEN(@W))))
    RETURN @W 
END
GO