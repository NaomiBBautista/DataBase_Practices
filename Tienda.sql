DROP DATABASE IF EXISTS tienda; 

/*Crear Base de Datos*/
CREATE DATABASE tienda CHARACTER SET utf8mb4; 
USE tienda; 


/*Crear tabla Fabricante*/
CREATE TABLE fabricante 
( 
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(100) NOT NULL 
); 


/*Crear tabla Producto*/
CREATE TABLE producto
 ( 
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(100) NOT NULL, 
  precio DOUBLE NOT NULL, 
  id_fabricante INT UNSIGNED NOT NULL, 
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id) 
); 

 
/*Insertar Valores a la tabla Fabricante*/
INSERT INTO fabricante VALUES(1, 'Asus'); 
INSERT INTO fabricante VALUES(2, 'Lenovo'); 
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard'); 
INSERT INTO fabricante VALUES(4, 'Samsung'); 
INSERT INTO fabricante VALUES(5, 'Seagate'); 
INSERT INTO fabricante VALUES(6, 'Crucial'); 
INSERT INTO fabricante VALUES(7, 'Gigabyte'); 
INSERT INTO fabricante VALUES(8, 'Huawei'); 
INSERT INTO fabricante VALUES(9, 'Xiaomi'); 

 
/*Insertar Valores a tabla Producto*/
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5); 
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6); 
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4); 
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7); 
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6); 
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1); 
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1); 
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2); 
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2); 
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3); 
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


/*Consultas*/
/*01*/ SELECT nombre FROM producto;

/*02*/ SELECT nombre, precio FROM producto;

/*03*/ SELECT * FROM producto;

/*04*/ SELECT 
		nombre, 
        precio, 
        precio / 18.59 AS precio_usd,
        precio / 20.14 AS precio_euro
		FROM producto;

/*05*/ 	SELECT 
			nombre AS nombre_de_producto,
            (precio / 18.59) AS dolares,
            (precio / 20.14) AS euros
		FROM producto;
        
/*06*/ SELECT UPPER(nombre), precio FROM producto;

/*07*/ SELECT LOWER(nombre), precio FROM producto;

/*08*/ SELECT nombre, UPPER(LEFT(nombre, 2)) AS abreviatura
		FROM fabricante;
        
/*09*/ SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;

/*10*/ SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;

/*11*/ SELECT id_fabricante FROM producto;

/*12*/ SELECT DISTINCT id_fabricante FROM producto;

/*13*/ SELECT nombre FROM fabricante ORDER BY nombre ASC;

/*14*/ SELECT nombre FROM fabricante ORDER BY nombre DESC;

/*15*/ SELECT nombre,precio FROM producto ORDER BY nombre ASC;
		SELECT nombre, precio FROM producto ORDER BY precio DESC;

/*16*/ SELECT * FROM fabricante LIMIT 5;

/*17*/ SELECT * FROM fabricante LIMIT 3, 3;

/*18*/ SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

/*19*/ SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

/*20*/ SELECT nombre FROM producto WHERE id_fabricante = 2;

/*21*/ SELECT nombre FROM producto WHERE precio <= 120;

/*22*/ SELECT nombre FROM producto WHERE precio >= 400;

/*23*/ SELECT nombre FROM producto WHERE precio < 400;

/*24*/ SELECT nombre FROM producto WHERE precio >= 80 AND precio <= 300;

/*25*/ SELECT nombre FROM producto WHERE precio BETWEEN 60 AND 200;

/*26*/ SELECT nombre FROM producto WHERE precio > 200 AND id_fabricante = 6;

/*27*/ SELECT nombre FROM producto 
		WHERE id_fabricante = 1 
		OR id_fabricante = 3 
        OR id_fabricante = 5;

/*28*/ SELECT nombre FROM producto WHERE id_fabricante IN (1, 3, 5);

/*29*/ SELECT nombre, (precio * 100) AS céntimos FROM producto;

/*30*/ SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

/*31*/ SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

/*32*/ SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

/*33*/ SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

/*34*/ SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

/*35*/ SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;

/*36*/ SELECT nombre, precio FROM producto 
		WHERE precio >= 180 
        ORDER BY precio DESC;
        
        SELECT nombre, precio FROM producto 
		WHERE precio >= 180 
        ORDER BY nombre ASC;
  
