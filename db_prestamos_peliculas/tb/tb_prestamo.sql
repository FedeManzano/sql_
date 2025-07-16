
GO
CREATE TABLE Prestamo
(
    CodPrestamo CHAR(7) PRIMARY KEY,
    CodSocio CHAR(6) NOT NULL,
    CodPelicula SMALLINT NOT NULL,
    NroEjemplar SMALLINT NOT NULL,
    FechaPrestamo DATE NOT NULL,
    FechaDevolucion DATE,
    FOREIGN KEY(CodSocio) REFERENCES Cliente(CodSocio),
    FOREIGN KEY(NroEjemplar,CodPelicula) REFERENCES Ejemplar(NroEjemplar,CodPelicula) 
);
GO

--DROP INDEX IX_Cliente ON Prestamo
CREATE INDEX IX_Cliente ON Prestamo(CodSocio)
