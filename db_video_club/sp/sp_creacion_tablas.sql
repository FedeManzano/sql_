USE db_video_club;

GO
CREATE PROCEDURE sp_Main_Crear_Tablas
AS
BEGIN
	BEGIN TRANSACTION
	BEGIN TRY
		
		CREATE TABLE Genero
		(
			IdGenero TINYINT PRIMARY KEY,
			NombreGenero VARCHAR(20) NOT NULL
		);

		CREATE TABLE Director
		(
			IdDirector TINYINT PRIMARY KEY,
			NombreDirector VARCHAR(20) NOT NULL,
			ApellidoDirector VARCHAR(20) NOT NULL
		);

		CREATE TABLE Cliente 
		(
			CodCli CHAR(36) PRIMARY KEY DEFAULT NEWID(), 
			NombreCliente VARCHAR(20) NOT NULL, 
			ApellidoCliente VARCHAR(20) NOT NULL,
			Direccion VARCHAR(100) NOT NULL, 
			Tel VARCHAR(40), 
			Email VARCHAR(100) NOT NULL UNIQUE, 
			Estado TINYINT DEFAULT 1
		);

		CREATE TABLE Pelicula 
		(
			CodPel INT PRIMARY KEY, 
			Titulo VARCHAR(70) NOT NULL, 
			Duracion SMALLINT NOT NULL, 
			IdGenero TINYINT NOT NULL, 
			IdDirector TINYINT NOT NULL,
			FOREIGN KEY(IdGenero) REFERENCES Genero(IdGenero) ON DELETE CASCADE,
			FOREIGN KEY(IdDirector) REFERENCES Director(IdDirector) ON DELETE CASCADE,
		);

		CREATE TABLE Ejemplar 
		(
			NroEj SMALLINT NOT NULL, 
			CodPel INT NOT NULL, 
			Estado TINYINT DEFAULT 1,
			PRIMARY KEY(NroEj, CodPel),
			FOREIGN KEY(CodPel) REFERENCES Pelicula(CodPel) ON DELETE CASCADE
		);

		CREATE TABLE Alquiler 
		(
			IdAlquiler INT PRIMARY KEY, 
			NroEj SMALLINT NOT NULL, 
			CodPel INT NOT NULL, 
			CodCli CHAR(36) NOT NULL, 
			FechaAlq DATE NOT NULL, 
			FechaDev DATE,
			FOREIGN KEY(NroEj,CodPel) REFERENCES Ejemplar(NroEj, CodPel) ON DELETE CASCADE,
			FOREIGN KEY(CodCli) REFERENCES Cliente(CodCli) ON DELETE CASCADE
		);

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK
	END CATCH
END
GO