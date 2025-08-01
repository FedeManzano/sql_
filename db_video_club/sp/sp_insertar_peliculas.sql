USE db_video_club;

GO
CREATE PROCEDURE sp_Insertar_Pelicula
@TITULO VARCHAR(70),
@DURACION SMALLINT,
@ID_GENERO TINYINT,
@ID_DIRECTOR TINYINT
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF @TITULO IS NULL
		BEGIN 
			PRINT('T�tulo Erroneo')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF @DURACION IS NULL OR @DURACION < 0 
		BEGIN 
			PRINT('Duraci�n Erronea')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF NOT EXISTS (SELECT * FROM Genero WHERE IdGenero = @ID_GENERO)
		BEGIN
			PRINT('G�nero no existe')
			ROLLBACK TRANSACTION
			RETURN
		END

		IF NOT EXISTS (SELECT * FROM Director WHERE IdDirector = @ID_DIRECTOR)
		BEGIN
			PRINT('Director no existe')
			ROLLBACK TRANSACTION
			RETURN
		END

		DECLARE @COD_PEL INT = (SELECT COUNT(1) FROM Pelicula) + 1
		SET @TITULO = TRIM(UPPER(@TITULO))

		INSERT INTO Pelicula(CodPel, Titulo, IdGenero, IdDirector, Duracion)
		VALUES
		(@COD_PEL, @TITULO, @ID_GENERO, @ID_DIRECTOR, @DURACION)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
	END CATCH
END
GO