
-- Ejercicio 1 | Listar personas que asisten a bares que sirven alguna serveza que les gusta
SELECT *
FROM Frecuenta AS fre
WHERE fre.NombreBar IN -- BARES QUE FRECUENTA
(
    SELECT sir.NombreBar
    FROM Sirve AS sir 
    WHERE sir.NombreCerveza IN -- SIRVE ALGUNA SERVEZA QUE LE GUSTA
    (
        /*
            Listado de cervezas que le gustan a <fre.DniPersona>
        */
        SELECT gus.NombreCerveza
        FROM Gusta AS gus 
        WHERE gus.DniPersona = fre.DniPersona 
    )
) 

-- Ejercicio 2 | No frecuentan ningún bar que sirva alguna cerveza que les guste.
SELECT *
FROM Frecuenta fre 
WHERE fre.DniPersona NOT IN -- Bares frecuentados por <fre.DniPersona> que no venden ninguna cerveza que le guste
(
    SELECT fre.DniPersona
    FROM Frecuenta AS fre 
    WHERE fre.NombreBar IN -- Bares que frecuenta <fre.DniPersona> y que alguna cerveza le gusta
    (
        SELECT sir.NombreBar
        FROM Sirve AS sir 
        WHERE sir.NombreCerveza IN -- Bares que sirven alguna cerveza que le gusta a <fre.DniPersona>
        (
            /*
                Listado de cervezas que le gustan a <fre.DniPersona>
            */
            SELECT gus.NombreCerveza
            FROM Gusta AS gus 
            WHERE gus.DniPersona = fre.DniPersona--'25444666'
        )
    )
)

-- Ejercicio 3 | Frecuentan solamente los bares que sirven todas las cervezas que les gustan.
/*
    Solo asisten a bares que sirven todas las cervezas que les gustan
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
WHERE f.DniPersona NOT IN -- Todos los bares que sirven Todas las cervezas que le gusta a <f.DniPersona>
(
    SELECT fre.DniPersona
    FROM Frecuenta fre 
    WHERE fre.NombreBar NOT IN -- Todos los bares que sirven cerevezas que NO le gustan a <fre.DniPersona>
    (
        SELECT s.NombreBar
        FROM Sirve s 
        WHERE s.NombreCerveza IN -- (*) Listado de Bares que sirven algunas cervezas que le gustan a
        (                       -- fre.DniPersona
            SELECT g.NombreCerveza -- Listado con todas las cervezas que le gustan a <fre.DniPersona>
            FROM Gusta g 
            WHERE g.DniPersona = fre.DniPersona
        )
        GROUP BY  s.NombreBar -- Agrupamiento por bar
        HAVING COUNT(s.NombreCerveza) >= ALL -- Verifica (*) sean todas y no algunas
        (
            SELECT COUNT(g.NombreCerveza) -- Cantidad de cervezas que le gustan a fre.DniPersona
            FROM Gusta g 
            WHERE g.DniPersona = fre.DniPersona
        )
    )
)

--Ejercicio 4 | Frecuentan solamente los bares que no sirven ninguna de las cervezas que no les gusta.
/*
    EJEMPLO
    Gusta
    32595830, BRAMA     
    32595830, STELLA

    Sirve
    La juakina, BRAMA
    La juakina, STELLA
    Cosmos, BRAMA
    Cosmos, STELLA
    Cosmos, QUILMES -- Esta no le gusta y aún asi 32595830 asiste pro lo tanto se descarta

    Si 32595830 Frecuenta los dos bares el resultado va a ser

    VACIO no hay resultados

    -- ESTE NO VA A ESTAR EN EL RESULTADO PORQUE VENDE UNA CERVEZA QUE NO LE GUSTA
    32595830, Cosmos // Este bar vende todas las que le gustan pero una que no
    Esta situación descarta a la persona

    Para este ejercicio se ajustó el juego de pruebas eliminando de Frecuenta
    32595830, COSMOS Para que la consulta devuelva algo.
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
