-- USE db_paquetes_turisticos
GO
CREATE TABLE Pais 
(
    CodPais TINYINT PRIMARY KEY,
    NombrePais VARCHAR(60) NOT NULL UNIQUE,

    CHECK 
    (
        CodPais > 0 AND CodPais <= 256

    ),

    CHECK 
    (
        NombrePais NOT LIKE '%[^A-Za-z ]%'
    )

);
GO
 