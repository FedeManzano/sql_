/**
	Crea una cadena num�rica de @SIZE n�meros 
	Para su uso es necesario crear la vista:
	CREATE VIEW vw_GET_RAND
	AS
		SELECT RAND() -- Devuelve un n�mero aleatorio 0 - 1
	Par�metros
	@SIZE Cantidad de n�meros de la cadena
*/
GO
CREATE FUNCTION f_Random_Numbers (@SIZE BIGINT)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @NUMBERS CHAR(10) = '0123456789'
	DECLARE @I INT = 0
	DECLARE @RSTRING VARCHAR(MAX) = ''
	
	IF @SIZE <= 0
		RETURN ''
	WHILE @I < @SIZE
	BEGIN
		DECLARE @RAN INT = FLOOR((SELECT * FROM vw_GET_RAND) * (LEN(@NUMBERS))) + 1
		SET @RSTRING = @RSTRING + SUBSTRING(@NUMBERS, @RAN, 1)
		SET @I = @I + 1 
	END
	RETURN @RSTRING
END
GO

