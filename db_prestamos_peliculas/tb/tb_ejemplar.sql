
GO
CREATE TABLE Ejemplar
(
    NroEjemplar SMALLINT NOT NULL,
    CodPelicula SMALLINT NOT NULL,
    Ubicacion CHAR(15) UNIQUE,
    Estado BIT DEFAULT 1,
    PRIMARY KEY(NroEjemplar, CodPelicula),
    FOREIGN KEY(CodPelicula) REFERENCES Pelicula(CodPelicula)
);
GO

