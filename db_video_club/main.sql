CREATE DATABASE db_video_club;
USE db_video_club;

/* Crear ejecutar en el orden que está a continuación */
-- Crear el procedimiento (sp_Main_Crear_Tablas /sp/)
-- EXEC sp_Main_Crear_Tablas -- Ejecutarlo
	-- Crear sp_Insertar_Director
	-- Crear sp_Insertar_Genero
	-- Crear sp_Insertar_Director
	-- Crear sp_Insertar_Pelicula
	-- Crear sp_Insertar_Cliente
	-- Crear sp_Insertar_Ejemplar
	-- Crear sp_Insertar_Alquiler
	-- Crear sp_Realizar_Devolucion
	-- Crear sp_Realizar_Alquiler
	-- Crear sp_Dar_Alta_Cliente

-- Crear el procedimiento (sp_Datos_Test /test/)
-- EXEC sp_Datos_Test -- Ejecutarlo

-- Trigger
--ENABLE TRIGGER tg_Dar_Baja_Cliente ON Cliente -- Evita el borrado del cliente y modifica su estado

-- Elinar tablas de la base de datos
-- DISABLED TRIGGER tg_Dar_Baja_Cliente ON Cliente
--DROP TABLE Alquiler
--DROP TABLE Ejemplar
--DROP TABLE Pelicula
--DROP TABLE Cliente
--DROP TABLE Genero
--DROP TABLE Director

