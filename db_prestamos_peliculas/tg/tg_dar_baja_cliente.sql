
GO
CREATE OR ALTER TRIGGER tg_Dar_Baje_Cliente ON Cliente
INSTEAD OF DELETE 
AS 
BEGIN
    DECLARE @S_COD CHAR(6) = (SELECT CodSocio FROM deleted)
    UPDATE Cliente SET Estado = 0 WHERE CodSocio = @S_COD 
END  
GO