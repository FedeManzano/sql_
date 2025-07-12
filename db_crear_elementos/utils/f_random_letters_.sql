USE db_con_visual_studio
/**
	Funci�n de devuelve una cadena con letras aleatorias
	Para su uso es necesario crear la vista:
	CREATE VIEW vw_GET_RAND
	AS
		SELECT RAND() -- Devuelve un n�mero aleatorio 0 - 1
	Par�metros
	@SIZE Cantidad de letras de la cadena
	@IS_UPPER	1 las letras van a estar en may�sculas
				0 las letras van a estar en min�sculas
	Por default @IS_UPPER es 0
*/
GO
CREATE OR ALTER FUNCTION f_Random_Letters (@SIZE SMALLINT, @IS_UPPER TINYINT = 0)
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
		SET @RSTRING = @RSTRING + SUBSTRING(@LETTER, @RAN, 1)
		SET @I = @I + 1 
	END
	RETURN @RSTRING
END
GO