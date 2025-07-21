
-- USE db_paquetes_turisticos

GO 
CREATE TABLE Destino 
(
    CodDestino TINYINT PRIMARY KEY,
    CodPaisDestino TINYINT NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Precio FLOAT NOT NULL,
    FOREIGN KEY(CodPaisDestino)
    REFERENCES Pais(CodPais)
);
GO

