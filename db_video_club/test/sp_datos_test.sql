USE db_video_club;

GO
ALTER PROCEDURE sp_Datos_Test
AS
BEGIN
	
	-- Ingreso de clientes
	EXEC sp_Insertar_Cliente 'Federico', 'Manzano', 'Macedonio fernandez 2467', '1146547521', 'federico@gmal.com'
	EXEC sp_Insertar_Cliente 'Carlos', 'Gomez', 'Bernardino Frione 4680', '1146539142', 'carlos@gmal.com'
	EXEC sp_Insertar_Cliente 'Dario', 'Cooper', 'Acosta 34', '1147772222', 'dario@gmal.com'
	EXEC sp_Insertar_Cliente 'fernando', 'mendoza', 'alsina 444', '1146582222', 'fernando@gmal.com'
	EXEC sp_Insertar_Cliente 'ezequiel', 'lopez', 'don bosco 22', '1148852222', 'ezequiel@gmal.com'
	EXEC sp_Insertar_Cliente 'leonardo', 'gomez', 'cordoba 11', '1145551111', 'leonardo@gmal.com'
	EXEC sp_Insertar_Cliente 'isabel', 'medina', 'rivadavia 44', '1155554444', 'isabel@gmal.com'

	-- Ingreso de los géneros
	EXEC sp_Insertar_Genero 'acción' 
	EXEC sp_Insertar_Genero 'aventura'
	EXEC sp_Insertar_Genero 'terror'
	EXEC sp_Insertar_Genero 'romántica'
	EXEC sp_Insertar_Genero 'triller'
	EXEC sp_Insertar_Genero 'policial'
	EXEC sp_Insertar_Genero 'ciencia ficción'
	EXEC sp_Insertar_Genero 'super heroes'
	EXEC sp_Insertar_Genero 'drama'
	EXEC sp_Insertar_Genero 'novelas'
	EXEC sp_Insertar_Genero 'basadas en libros'
	EXEC sp_Insertar_Genero 'Comedia'
	
	
	-- Insertar Directores
	EXEC sp_Insertar_Director 'Martin', 'Sccorssese'
	EXEC sp_Insertar_Director 'Cristopher', 'Nolan'
	EXEC sp_Insertar_Director 'Steven', 'Speelberd'
	EXEC sp_Insertar_Director 'Francis', 'Copola'
	EXEC sp_Insertar_Director 'Guilleromo', 'Del Toro'
	EXEC sp_Insertar_Director 'Alfred', 'Hitchcock'
	EXEC sp_Insertar_Director 'Stanley', 'Kubrick'
	EXEC sp_Insertar_Director 'James', 'Cameron'
	
	-- Insertar Peliculas
	EXEC sp_Insertar_Pelicula 'Rambo I',180,1,1
	EXEC sp_Insertar_Pelicula 'Rambo II',180,1,1
	EXEC sp_Insertar_Pelicula 'Rambo III',180,1,1
	EXEC sp_Insertar_Pelicula 'The Dark Nigth',180,1,2
	EXEC sp_Insertar_Pelicula 'The Dark Nigth RISES',180,1,3
	EXEC sp_Insertar_Pelicula 'The Dark Nigth',180,1,4
	EXEC sp_Insertar_Pelicula 'El Conjuro I',190,3,5
	EXEC sp_Insertar_Pelicula 'El Conjuro III',200,3,6
	EXEC sp_Insertar_Pelicula 'Rocky I',210,9,7
	EXEC sp_Insertar_Pelicula 'Rocky II',150,9,3
	EXEC sp_Insertar_Pelicula 'Rocky III',155,9,1
	EXEC sp_Insertar_Pelicula 'Rocky IV',220,9,5
	EXEC sp_Insertar_Pelicula 'Rocky V',195,9,5
	EXEC sp_Insertar_Pelicula 'Criaturas Salvajes',188,9,5
	EXEC sp_Insertar_Pelicula 'IRON MAN I',148,8,6
	EXEC sp_Insertar_Pelicula 'IRON MAN II',135,8,2
	EXEC sp_Insertar_Pelicula 'IRON MAN III',160,8,1
	EXEC sp_Insertar_Pelicula 'Puentes de madison',160,4,4

	EXEC sp_Insertar_Ejemplar 1
	EXEC sp_Insertar_Ejemplar 1
	EXEC sp_Insertar_Ejemplar 1
	EXEC sp_Insertar_Ejemplar 1

	EXEC sp_Insertar_Ejemplar 2
	EXEC sp_Insertar_Ejemplar 2
	EXEC sp_Insertar_Ejemplar 2
	EXEC sp_Insertar_Ejemplar 2


	EXEC sp_Insertar_Ejemplar 3
	EXEC sp_Insertar_Ejemplar 3
	EXEC sp_Insertar_Ejemplar 3
	EXEC sp_Insertar_Ejemplar 3


	EXEC sp_Insertar_Ejemplar 4
	EXEC sp_Insertar_Ejemplar 4
	EXEC sp_Insertar_Ejemplar 4
	EXEC sp_Insertar_Ejemplar 4

	EXEC sp_Insertar_Ejemplar 5
	EXEC sp_Insertar_Ejemplar 5
	EXEC sp_Insertar_Ejemplar 5
	EXEC sp_Insertar_Ejemplar 5


	EXEC sp_Insertar_Ejemplar 6
	EXEC sp_Insertar_Ejemplar 6
	EXEC sp_Insertar_Ejemplar 6
	EXEC sp_Insertar_Ejemplar 6


	EXEC sp_Insertar_Ejemplar 7
	EXEC sp_Insertar_Ejemplar 7
	EXEC sp_Insertar_Ejemplar 7
	EXEC sp_Insertar_Ejemplar 7

	EXEC sp_Insertar_Ejemplar 8
	EXEC sp_Insertar_Ejemplar 8
	EXEC sp_Insertar_Ejemplar 8
	EXEC sp_Insertar_Ejemplar 8


	EXEC sp_Insertar_Ejemplar 9
	EXEC sp_Insertar_Ejemplar 9
	EXEC sp_Insertar_Ejemplar 9
	EXEC sp_Insertar_Ejemplar 9


	EXEC sp_Insertar_Ejemplar 10
	EXEC sp_Insertar_Ejemplar 10
	EXEC sp_Insertar_Ejemplar 10
	EXEC sp_Insertar_Ejemplar 10


	EXEC sp_Insertar_Ejemplar 11
	EXEC sp_Insertar_Ejemplar 11
	EXEC sp_Insertar_Ejemplar 11
	EXEC sp_Insertar_Ejemplar 11

	EXEC sp_Insertar_Ejemplar 12
	EXEC sp_Insertar_Ejemplar 12
	EXEC sp_Insertar_Ejemplar 12
	EXEC sp_Insertar_Ejemplar 12


	EXEC sp_Insertar_Ejemplar 13
	EXEC sp_Insertar_Ejemplar 13
	EXEC sp_Insertar_Ejemplar 13
	EXEC sp_Insertar_Ejemplar 13


	EXEC sp_Insertar_Ejemplar 14
	EXEC sp_Insertar_Ejemplar 14
	EXEC sp_Insertar_Ejemplar 14
	EXEC sp_Insertar_Ejemplar 14


	EXEC sp_Insertar_Ejemplar 15
	EXEC sp_Insertar_Ejemplar 15
	EXEC sp_Insertar_Ejemplar 15
	EXEC sp_Insertar_Ejemplar 15

	EXEC sp_Insertar_Ejemplar 16
	EXEC sp_Insertar_Ejemplar 16
	EXEC sp_Insertar_Ejemplar 16
	EXEC sp_Insertar_Ejemplar 16


	EXEC sp_Insertar_Ejemplar 17
	EXEC sp_Insertar_Ejemplar 17
	EXEC sp_Insertar_Ejemplar 17
	EXEC sp_Insertar_Ejemplar 17

	EXEC sp_Insertar_Ejemplar 18
	EXEC sp_Insertar_Ejemplar 18
	EXEC sp_Insertar_Ejemplar 18
	EXEC sp_Insertar_Ejemplar 18

	DECLARE @CLI_1 CHAR(36) = (SELECT CodCli FROM Cliente WHERE Email = 'carlos@gmal.com')
	DECLARE @CLI_2 CHAR(36) = (SELECT CodCli FROM Cliente WHERE Email = 'fernando@gmal.com')
	DECLARE @CLI_3 CHAR(36) = (SELECT CodCli FROM Cliente WHERE Email = 'isabel@gmal.com')
	DECLARE @CLI_4 CHAR(36) = (SELECT CodCli FROM Cliente WHERE Email = 'federico@gmal.com')
	DECLARE @CLI_5 CHAR(36) = (SELECT CodCli FROM Cliente WHERE Email = 'ezequiel@gmal.com')
	DECLARE @CLI_6 CHAR(36) = (SELECT CodCli FROM Cliente WHERE Email = 'dario@gmal.com')
	DECLARE @CLI_7 CHAR(36) = (SELECT CodCli FROM Cliente WHERE Email = 'leonardo@gmal.com')

	EXEC sp_Realizar_Alquiler 1, @CLI_1, '2023-05-01'

	
	EXEC sp_Realizar_Alquiler 5, @CLI_2, '2023-05-02'
	EXEC sp_Realizar_Devolucion 2, '2023-05-05'


	
	EXEC sp_Realizar_Alquiler 3, @CLI_3, '2023-05-04'
	EXEC sp_Realizar_Devolucion 3, '2023-05-06'


	EXEC sp_Realizar_Alquiler 6, @CLI_4, '2023-05-04'

	
	EXEC sp_Realizar_Alquiler 7, @CLI_6, '2023-05-07'
	EXEC sp_Realizar_Devolucion 5, '2023-05-10'

	EXEC sp_Realizar_Alquiler 5, @CLI_2, '2023-05-07'
	EXEC sp_Realizar_Devolucion 6, '2023-05-15'

	
	EXEC sp_Realizar_Alquiler 1, @CLI_1, '2023-05-08'
	EXEC sp_Realizar_Devolucion 1, '2023-05-15'

	
	EXEC sp_Realizar_Alquiler 8, @CLI_6, '2023-05-15'
	EXEC sp_Realizar_Devolucion 8, '2023-05-20'

	EXEC sp_Realizar_Alquiler 8, @CLI_6, '2023-05-25'
	EXEC sp_Realizar_Devolucion 9, '2023-05-30'


	EXEC sp_Realizar_Alquiler 11, @CLI_7, '2023-06-01'
	EXEC sp_Realizar_Devolucion 10, '2023-06-05'

	
	EXEC sp_Realizar_Alquiler 12, @CLI_6, '2023-06-03'
	EXEC sp_Realizar_Devolucion 11, '2023-06-08'
END
GO
SELECT * FROM Director
SELECT * FROM Genero
SELECT * FROM Cliente
SELECT * FROM Pelicula
SELECT * FROM Ejemplar ORDER BY CodPel
SELECT * FROm Alquiler




	


	

	

	

	

	

	

	

	

	


