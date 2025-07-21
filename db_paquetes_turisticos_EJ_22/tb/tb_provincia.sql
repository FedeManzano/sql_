-- USE db_paquetes_turisticos
GO 
CREATE TABLE Provincia 
(
    CodProvincia SMALLINT PRIMARY KEY,
    NombreProvincia VARCHAR(80) NOT NULL,
    CodPais TINYINT NOT NULL,
    CONSTRAINT FK_Pais FOREIGN KEY(CodPais) REFERENCES Pais(CodPais),

    CHECK 
    (
        CodProvincia > 0 AND CodProvincia <= 500
    ),
);
GO



