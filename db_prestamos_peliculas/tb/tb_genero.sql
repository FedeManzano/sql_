
GO
CREATE TABLE Genero
(
    IdGenero TINYINT PRIMARY KEY,
    NombreGenero VARCHAR(40) UNIQUE,
    CHECK 
    (
        IdGenero > 0
    ),
    CHECK 
    (
        NombreGenero NOT LIKE '%[^a-zA-Z0-9 ]%'
    )
);
GO


