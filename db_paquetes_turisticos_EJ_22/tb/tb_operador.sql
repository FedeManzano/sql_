
-- USE db_paquetes_turisticos
GO
CREATE TABLE Operador
(
    CodOperador SMALLINT PRIMARY KEY,
    Direccion VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    CodProvincia SMALLINT NOT NULL,
    FOREIGN KEY(CodProvincia) REFERENCES Provincia(CodProvincia)
);
GO
SELECT * FROM  Operador o INNER JOIN Provincia p ON p.CodProvincia = o.CodProvincia