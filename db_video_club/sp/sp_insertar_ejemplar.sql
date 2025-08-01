USE db_video_club;

GO
CREATE PROCEDURE sp_Insertar_Ejemplar
@COD_PEL INT
AS 
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Pelicula WHERE CodPel = @COD_PEL)
		BEGIN
			PRINT('La pel�cula ' + str(@COD_PEL) + ' No existe')
			ROLLBACK TRANSACTION
			RETURN
		END

		DECLARE @NRO_EJ SMALLINT = (SELECT COUNT(*) FROM Ejemplar WHERE CodPel = @COD_PEL) + 1 

		INSERT INTO Ejemplar(NroEj, CodPel)
		VALUES
		(@NRO_EJ, @COD_PEL)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION
	END CATCH
END