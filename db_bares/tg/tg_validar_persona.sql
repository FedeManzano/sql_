USE db_bares;

GO
CREATE OR ALTER TRIGGER tg_Validar_Persona ON Persona
FOR INSERT, UPDATE
AS
BEGIN 
	DECLARE @DNI CHAR(8) = (SELECT Dni FROM inserted)
	DECLARE @NOMBRE VARCHAR(100) = (SELECT NombrePersona FROM inserted)

	IF @DNI LIKE '%[^0-9]%'
	BEGIN
		RAISERROR('Error en el dni caracteres inválidos', 11, 1)
	END

	IF @NOMBRE LIKE '%[^a-zA-Z]%'
	BEGIN
		RAISERROR('Error en el nombre caracteres inválidos', 11, 1)
	END
END