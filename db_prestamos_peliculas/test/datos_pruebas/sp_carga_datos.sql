
GO
CREATE OR ALTER PROCEDURE sp_Insertar_Datos 
AS 
BEGIN 
    -- Insertar géneros    
    EXEC sp_Insertar_Genero 'ciencia ficción y fantacia'
    EXEC sp_Insertar_Genero 'suspenso'
    EXEC sp_Insertar_Genero 'ciencia ficción'
    EXEC sp_Insertar_Genero 'terror'
    EXEC sp_Insertar_Genero 'aclamados por la crítica'
    EXEC sp_Insertar_Genero 'aventura'
    EXEC sp_Insertar_Genero 'infantiles'
    EXEC sp_Insertar_Genero 'acción'
    EXEC sp_Insertar_Genero 'Top 10 de este año'
    EXEC sp_Insertar_Genero 'adaptaciones de libros'
    EXEC sp_Insertar_Genero 'drama'
    EXEC sp_Insertar_Genero 'Belicas'
    EXEC sp_Insertar_Genero 'superheroes'
    EXEC sp_Insertar_Genero 'misterios'
    EXEC sp_Insertar_Genero 'psicodelicas'
    EXEC sp_Insertar_Genero 'románticas'


    -- Insertar películas 
    EXEC sp_Insertar_Pelicula 'Rambo 3', 150, 1978, 'acción'
    EXEC sp_Insertar_Pelicula 'Rambo 2', 140, 1982, 'acción'
    EXEC sp_Insertar_Pelicula 'Rambo 1', 140, 1976, 'acción'
    EXEC sp_Insertar_Pelicula 'Rocky 1', 150, 1970, 'drama'
    EXEC sp_Insertar_Pelicula 'Rocky 2', 180, 1970, 'drama'
    EXEC sp_Insertar_Pelicula 'Rocky 3', 161, 1970, 'drama'
    EXEC sp_Insertar_Pelicula 'Rocky 4', 144, 1970, 'drama'
    EXEC sp_Insertar_Pelicula 'Asesinos', 210, 1990, 'acción'
    EXEC sp_Insertar_Pelicula 'harry potter: La piedra filosofal', 210, 1993, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'harry potter: La camara secreta', 200, 1995, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'harry potter: el presionero de azkaban', 210, 1998, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'harry potter: el caliz de fuego', 210, 2000, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'harry potter: la prden del fenix', 220, 2001, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'harry potter: El principe mestizo', 250, 2005, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'harry potter: Las reliquias de la muerte parte 1', 210, 2008, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'harry potter: Las reliquias de la muerte parte 2', 220, 2008, 'Adaptaciones De Libros'
    EXEC sp_Insertar_Pelicula 'telefono negro', 200, 1995, 'terror'
    EXEC sp_Insertar_Pelicula 'Superman', 200, 2025, 'superheroes'
    EXEC sp_Insertar_Pelicula 'la liga de la justicia: zack snaider', 200, 2025, 'superheroes'
    EXEC sp_Insertar_Pelicula 'Irom man 1', 150, 2008, 'superheroes'
    EXEC sp_Insertar_Pelicula 'Irom man 2', 150, 2010, 'superheroes'
    EXEC sp_Insertar_Pelicula 'Irom man 3', 150, 2013, 'superheroes'
    EXEC sp_Insertar_Pelicula 'batman inicia', 160, 2005, 'superheroes'
    EXEC sp_Insertar_Pelicula 'el caballero de la noche', 180, 2008, 'superheroes'
    EXEC sp_Insertar_Pelicula 'el caballero de la noche asciende', 160, 2010, 'superheroes'
    EXEC sp_Insertar_Pelicula 'tenet', 160, 2005, 'psicodelicas'

    -- Insertar ejemplares
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
    EXEC sp_Insertar_Ejemplar 19
    EXEC sp_Insertar_Ejemplar 19
    EXEC sp_Insertar_Ejemplar 19
    EXEC sp_Insertar_Ejemplar 19
    EXEC sp_Insertar_Ejemplar 20
    EXEC sp_Insertar_Ejemplar 20
    EXEC sp_Insertar_Ejemplar 20
    EXEC sp_Insertar_Ejemplar 20
    EXEC sp_Insertar_Ejemplar 21
    EXEC sp_Insertar_Ejemplar 21
    EXEC sp_Insertar_Ejemplar 21
    EXEC sp_Insertar_Ejemplar 21
    EXEC sp_Insertar_Ejemplar 22
    EXEC sp_Insertar_Ejemplar 22
    EXEC sp_Insertar_Ejemplar 22
    EXEC sp_Insertar_Ejemplar 22
    EXEC sp_Insertar_Ejemplar 23
    EXEC sp_Insertar_Ejemplar 23
    EXEC sp_Insertar_Ejemplar 23
    EXEC sp_Insertar_Ejemplar 23
    EXEC sp_Insertar_Ejemplar 24
    EXEC sp_Insertar_Ejemplar 24
    EXEC sp_Insertar_Ejemplar 24
    EXEC sp_Insertar_Ejemplar 24
    EXEC sp_Insertar_Ejemplar 25
    EXEC sp_Insertar_Ejemplar 25
    EXEC sp_Insertar_Ejemplar 25
    EXEC sp_Insertar_Ejemplar 25
    EXEC sp_Insertar_Ejemplar 26
    EXEC sp_Insertar_Ejemplar 26
    EXEC sp_Insertar_Ejemplar 26
    EXEC sp_Insertar_Ejemplar 26

    -- Insertar clientes
    EXEC sp_Insertar_Cliente 'federico', 'manzano', '44457777', 'federico@gmail.com'
    EXEC sp_Insertar_Cliente 'alberto ezequiel', 'perez rodriguez', '44445555', 'aeperez@gmail.com'
    EXEC sp_Insertar_Cliente 'roberto carlos', 'ramirez', '44778888', 'roberto_ramirez@gmail.com'
    EXEC sp_Insertar_Cliente 'esteban fresno', 'gonzalez surco', '44991111', 'estebanf_surco@gmail.com'
    EXEC sp_Insertar_Cliente 'leonardo', 'gomez', '47775555', 'leo_gomez@gmail.com'
    EXEC sp_Insertar_Cliente 'javier ernesto', 'gomez', '54546666', 'javi_e_gomez@gmail.com'
    EXEC sp_Insertar_Cliente 'cesaar', 'gomez esquivel', '44117700', 'cesarge@gmail.com'
    EXEC sp_Insertar_Cliente 'xamara', 'gimenez', '55142222', 'xam_gimenez@gmail.com'
    EXEC sp_Insertar_Cliente 'karen ernestina', 'lopez salvador', '47471212', 'ke_lsalvador@gmail.com'
    EXEC sp_Insertar_Cliente 'gimena isabel', 'garcia', '47471212', 'gigarcia@gmail.com'

    EXEC sp_Insertar_Prestamo 'A-071', 25, 1, '2025-01-01'
    EXEC sp_Insertar_Prestamo 'A-071', 11, 2, '2025-01-01'
    EXEC sp_Insertar_Prestamo 'A-071', 12, 3, '2025-01-01'
    EXEC sp_Insertar_Prestamo 'C-107', 2, 1, '2025-01-01'
    EXEC sp_Insertar_Prestamo 'C-107', 5, 1, '2025-01-01'
    EXEC sp_Insertar_Prestamo 'C-107', 8, 2, '2025-01-01'
    EXEC sp_Insertar_Prestamo 'G-543', 9, 2, '2025-01-02'
    EXEC sp_Insertar_Prestamo 'Q-435', 9, 3, '2025-01-03'
    EXEC sp_Insertar_Prestamo 'Q-435', 15, 1, '2025-01-03'
    EXEC sp_Insertar_Prestamo 'M-582', 12, 1, '2025-01-03'
    EXEC sp_Insertar_Prestamo 'Z-484', 1, 3, '2025-01-03'
    EXEC sp_Insertar_Prestamo 'S-168', 16, 3, '2025-01-04'
    EXEC sp_Insertar_Prestamo 'S-168', 25, 4, '2025-01-04'
    EXEC sp_Insertar_Prestamo 'S-168', 21, 4, '2025-01-04'
    EXEC sp_Insertar_Prestamo 'A-071', 25, 1, '2025-01-10'
    EXEC sp_Insertar_Prestamo 'S-168', 14, 1, '2025-02-10'
    EXEC sp_Insertar_Prestamo 'S-168', 15, 1, '2025-02-10'
    EXEC sp_Insertar_Prestamo 'A-071', 25, 1, '2025-01-10'
    EXEC sp_Insertar_Prestamo 'A-071', 9, 1, '2025-01-10'


    EXEC sp_Generar_Devolucion 'CIR-975', '2025-01-04', '2025-01-02', 2, 9
    EXEC sp_Generar_Devolucion 'CVU-616', '2025-01-08', '2025-01-04', 2, 16
    EXEC sp_Generar_Devolucion 'DPM-600', '2025-01-06', '2025-01-03', 1, 12
    EXEC sp_Generar_Devolucion 'DWY-237', '2025-01-06', '2025-01-03', 1, 15
    EXEC sp_Generar_Devolucion 'EVF-651', '2025-01-06', '2025-01-01', 1, 25
    EXEC sp_Generar_Devolucion 'ITS-955', '2025-01-04', '2025-01-04', 4, 21
    EXEC sp_Generar_Devolucion 'JCJ-939', '2025-01-04', '2025-01-01', 2, 8
    EXEC sp_Generar_Devolucion 'LCJ-942', '2025-01-04', '2025-01-04', 4, 25
    EXEC sp_Generar_Devolucion 'MDD-704', '2025-01-04', '2025-01-01', 1, 2
    EXEC sp_Generar_Devolucion 'RNG-974', '2025-01-05', '2025-01-03', 3, 9
    EXEC sp_Generar_Devolucion 'TDI-507', '2025-01-03', '2025-01-01', 3, 12
    EXEC sp_Generar_Devolucion 'TKP-577', '2025-01-06', '2025-01-03', 3, 1
    EXEC sp_Generar_Devolucion 'QFH-097', '2025-01-14', '2025-01-10', 1, 25
    EXEC sp_Generar_Devolucion 'QFH-097', '2025-01-14', '2025-01-10', 1, 25
    EXEC sp_Generar_Devolucion 'TJK-094', '2025-02-14', '2025-02-10', 1, 14
    EXEC sp_Generar_Devolucion 'PQD-345', '2025-02-14', '2025-02-10', 1, 15
    EXEC sp_Generar_Devolucion 'FGL-352', '2025-01-14', '2025-01-10', 1, 25
    EXEC sp_Generar_Devolucion'XWR-472', '2025-01-14', '2025-01-10', 1, 9
END
GO 

