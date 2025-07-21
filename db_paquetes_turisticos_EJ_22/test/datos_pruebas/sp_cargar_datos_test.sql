-- USE db_paquetes_turisticos
GO 
CREATE OR ALTER PROCEDURE sp_Insertar_Datos 
AS 
BEGIN
    EXEC sp_Insertar_Pais 'argentina'
    EXEC sp_Insertar_Pais 'perú'
    EXEC sp_Insertar_Pais 'bolivia'
    EXEC sp_Insertar_Pais 'brasil'
    EXEC sp_Insertar_Pais 'paraguay'
    EXEC sp_Insertar_Pais 'ecuador'
    EXEC sp_Insertar_Pais 'colombia'
    EXEC sp_Insertar_Pais 'venezuela'
    EXEC sp_Insertar_Pais 'mexico'
    EXEC sp_Insertar_Pais 'chile'
    EXEC sp_Insertar_Pais 'uruguay'
    EXEC sp_Insertar_Pais 'puerto rico'

    EXEC sp_Insertar_Provincia 'Buenos Aires', 1
    EXEC sp_Insertar_Provincia '  nEuQuen  ', 1
    EXEC sp_Insertar_Provincia 'la rioja', 1
    EXEC sp_Insertar_Provincia 'salta', 1
    EXEC sp_Insertar_Provincia 'santa fe', 1
    EXEC sp_Insertar_Provincia 'mendoza', 1
    EXEC sp_Insertar_Provincia 'cordoba', 1
    EXEC sp_Insertar_Provincia 'la pampa', 1
    EXEC sp_Insertar_Provincia 'santiago del estero', 1
    EXEC sp_Insertar_Provincia 'tierra del fuego', 1
    EXEC sp_Insertar_Provincia 'misiones', 1
    EXEC sp_Insertar_Provincia 'entre rios', 1
    EXEC sp_Insertar_Provincia 'corrientes', 1
    EXEC sp_Insertar_Provincia 'jujuy', 1
    EXEC sp_Insertar_Provincia 'tucuman', 1
    EXEC sp_Insertar_Provincia 'san juan', 1
    EXEC sp_Insertar_Provincia 'san luis', 1
    EXEC sp_Insertar_Provincia 'chubut', 1
    

    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador
    EXEC sp_Insertar_Operador


    EXEC sp_Insertar_Destino 'Todo incluido', 25000
    EXEC sp_Insertar_Destino 'Hotel Cuatro estrellas (No incluye viaje)', 19000
    EXEC sp_Insertar_Destino 'Hotel Cinco estrellas (incluye viaje)', 30000
    EXEC sp_Insertar_Destino 'Hotel Tres estrellas, tercera clase', 15000
    EXEC sp_Insertar_Destino 'Hotel Tres estrellas, viaje omnibus', 12500
END


SELECT * FROM Pais
SELECT * FROM Destino d INNER JOIN Pais p ON p.CodPais = d.CodPaisDestino