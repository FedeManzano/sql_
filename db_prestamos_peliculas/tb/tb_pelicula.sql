
GO
CREATE TABLE Pelicula 
(
    CodPelicula SMALLINT PRIMARY KEY,
    Titulo VARCHAR(100) NOT NULL,
    Duracion SMALLINT NOT NULL,
    AñoLanzamiento SMALLINT,
    IdGenero TINYINT NOT NULL,
    FOREIGN KEY(IdGenero) REFERENCES Genero(IdGenero) ON DELETE CASCADE,
    CHECK 
    (
        CodPelicula > 0
    ),

    CHECK 
    (
        Duracion > 0
    ),

     CHECK 
    (
        AñoLanzamiento >= 1900 AND AñoLanzamiento < 9999
    ),
);
GO
