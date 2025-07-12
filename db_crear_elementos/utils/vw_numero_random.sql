USE db_con_visual_studio


GO
CREATE OR ALTER VIEW vw_GET_RAND
AS
SELECT RAND() AS RND
GO