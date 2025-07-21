
-- USE db_paquetes_turisticos
GO
CREATE OR ALTER TRIGGER tg_Validar_Pais ON Pais 
FOR INSERT 
AS 
BEGIN 

    DECLARE @NOMBRE_PAIS VARCHAR(MAX) = (SELECT NombrePais FROM inserted) 

    IF @NOMBRE_PAIS LIKE '%[^a-zA-Z ]%'
        RAISERROR('Error nombre del país insertado es inválido', 11, 1)
END 
GO


-- DROP TRIGGER tg_Validar_Pais

