
/**
	Función de devuelve una cadena con letras aleatorias
	Para su uso es necesario crear la vista:
	CREATE VIEW vw_GET_RAND
	AS
		SELECT RAND() -- Devuelve un número aleatorio 0 - 1
	Parámetros
	@SIZE Cantidad de letras de la cadena
	@IS_UPPER	1 las letras van a estar en mayúsculas
				0 las letras van a estar en minúsculas
*/
GO
CREATE FUNCTION f_Random_Letters (@SIZE SMALLINT, @IS_UPPER TINYINT)
RETURNS VARCHAR(MAX)
AS
BEGIN
	-- Letras del alfabeto que van a formar la cadena resultado
	DECLARE @LETTER VARCHAR(26) = ''

	-- Indice de la letra en curso
	DECLARE @I INT = 0

	-- Cadena a retornar
	DECLARE @RSTRING VARCHAR(MAX) = ''

	IF @IS_UPPER = 1
		SET @LETTER = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
	ELSE
		SET @LETTER = 'abcdefghijklmnopqrstuvwxyz'

	IF @SIZE <= 0
		RETURN ''
	WHILE @I < @SIZE
	BEGIN
		DECLARE @RAN INT = FLOOR((SELECT * FROM vw_GET_RAND) * (LEN(@LETTER))) + 1
		SET @RSTRING = UPPER(@RSTRING + SUBSTRING(@LETTER, @RAN, 1))
		SET @I = @I + 1 
	END
	RETURN @RSTRING
END
GO