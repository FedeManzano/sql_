CREATE DATABASE db_bares;
USE db_bares;

-- CREAR Procedimiento /sp/sp_Crear_Tablas.sql
-- sp_Crear_Tablas

-- CREACION DE TABLAS
-- EXEC sp_Crear_Tablas

-- CREAR sp_Insertar_Datos_Prueba /test/datos_prueba
-- EXEC sp_Insertar_Datos_Prueba



/*
1. Frecuentan solamente bares que sirven alguna cerveza que les guste.

CONSULTA

2. No frecuentan ning�n bar que sirva alguna cerveza que les guste.

CONSULTA

3. Frecuentan solamente los bares que sirven todas las cervezas que les gustan.

CONSULTA

4. Frecuentan solamente los bares que no sirven ninguna de las cervezas que no les gusta.

CONSULTA
*/

/*
DROP TABLE Frecuenta
DROP TABLE Sirve
DROP TABLE Gusta
DROP TABLE Persona
DROP TABLE Cerveza
DROP TABLE Bar
*/


/*
    3 - Solo asisten a bares que sirven todas las cervezas que les gustan
    EJEMPLO
    Gusta
    32595830, BRAMA     
    32595830, STELLA

    Sirve
    La juakina, BRAMA
    La juakina, STELLA
    Cosmos, BRAMA
    Cosmos, STELLA
    Cosmos, QUILMES

    Si 32595830 Frecuenta los dos bares el resultado va a ser

    32595830, La juakina
    32595830, Cosmos // Este bar vende todas las que le gustan mas una que no le gusta
*/
SELECT *
FROM Frecuenta f 
WHERE f.DniPersona NOT IN 
(

    SELECT fre.DniPersona
    FROM Frecuenta fre 
    WHERE fre.NombreBar NOT IN
    (
        SELECT s.NombreBar
        FROM Sirve s 
        WHERE s.NombreCerveza IN 
        (
            SELECT g.NombreCerveza
            FROM Gusta g 
            WHERE g.DniPersona = fre.DniPersona
        )
        GROUP BY  s.NombreBar
        HAVING COUNT(s.NombreCerveza) >= ALL 
        (
            SELECT COUNT(g.NombreCerveza)
            FROM Gusta g 
            WHERE g.DniPersona = fre.DniPersona
        )
    )
)


/*
    4 - Solo asisten a bares que sirven todas las cervezas que les gustan
    EJEMPLO
    Gusta
    32595830, BRAMA     
    32595830, STELLA

    Sirve
    La juakina, BRAMA
    La juakina, STELLA
    Cosmos, BRAMA
    Cosmos, STELLA
    Cosmos, QUILMES

    Si 32595830 Frecuenta los dos bares el resultado va a ser

    VACIO no hay resultados

    -- ESTE NO VA A ESTAR EN EL RESULTADO PORQUE VENDE UNA CERVEZA QUE NO LE GUSTA
    32595830, Cosmos // Este bar vende todas las que le gustan pero una que no
    Esta situación descarta a la persona
*/
SELECT *
FROM Persona p 
WHERE p.Dni
IN
(
    SELECT f.DniPersona
    FROM Frecuenta f
    WHERE f.DniPersona NOT IN 
    (

        SELECT fre.DniPersona
        FROM Frecuenta fre 
        WHERE fre.NombreBar NOT IN
        (
            SELECT s.NombreBar
            FROM Sirve s 
            WHERE s.NombreCerveza IN 
            (
                SELECT g.NombreCerveza
                FROM Gusta g 
                WHERE g.DniPersona = fre.DniPersona
            )
            GROUP BY  s.NombreBar
            HAVING COUNT(s.NombreCerveza) >= ALL 
            (
                SELECT COUNT(g.NombreCerveza)
                FROM Gusta g 
                WHERE g.DniPersona = fre.DniPersona
            )
        )
    ) GROUP BY f.DniPersona
    HAVING COUNT(f.NombreBar) =ALL 
    (
        SELECT COUNT(s.NombreBar) 
        FROM Sirve s 
        WHERE s.NombreCerveza IN
        (
            SELECT g.NombreCerveza
            FROM Gusta g 
            WHERE g.DniPersona = f.DniPersona
        )GROUP BY s.NombreBar
        HAVING COUNT(s.NombreCerveza) >= 
        (
            SELECT COUNT(g.NombreCerveza)
            FROM Gusta g 
            WHERE g.DniPersona = f.DniPersona
        )
    )
)