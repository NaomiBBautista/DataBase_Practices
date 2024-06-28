DROP DATABASE IF EXISTS empleados; 

/*Crear Base de Datos*/
CREATE DATABASE empleados CHARACTER SET utf8mb4; 
USE empleados; 

/*Crear tabla Departamento*/
CREATE TABLE departamento 
( 
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(100) NOT NULL, 
  presupuesto DOUBLE UNSIGNED NOT NULL, 
  gastos DOUBLE UNSIGNED NOT NULL 
); 

 
/*Crear tabla Empleado*/
CREATE TABLE empleado 
( 
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nif VARCHAR(9) NOT NULL UNIQUE, 
  nombre VARCHAR(100) NOT NULL, 
  apellido1 VARCHAR(100) NOT NULL, 
  apellido2 VARCHAR(100), 
  id_departamento INT UNSIGNED, 
  FOREIGN KEY (id_departamento) REFERENCES departamento(id) 
); 

 
/*Insertar Valores a la tabla Departamento*/
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000); 
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000); 
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000); 
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000); 
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000); 
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0); 
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000); 

 
/*Insertar Valores a la tabla Empleado*/
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1); 
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2); 
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3); 
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4); 
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5); 
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1); 
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2); 
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3); 
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2); 
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5); 
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1); 
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL); 
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL); 

/*Consultas*/
/*01*/ SELECT apellido1 FROM empleado;

/*02*/ SELECT DISTINCT apellido1 FROM empleado;

/*03*/ SELECT * FROM empleado;

/*04*/ SELECT nombre, apellido1, apellido2 FROM empleado;

/*05*/ SELECT id_departamento FROM empleado;

/*06*/ SELECT DISTINCT id_departamento FROM empleado;

/*07*/ SELECT CONCAT(nombre,' ', apellido1, ' ', apellido2) AS Nombre_Completo FROM empleado;

/*08*/ SELECT UPPER(CONCAT(nombre,' ', apellido1, ' ', apellido2) ) AS Nombre_Completo FROM empleado;

/*09*/ SELECT LOWER(CONCAT(nombre,' ', apellido1, ' ', apellido2) ) AS Nombre_Completo FROM empleado;

/*10*/ SELECT id, SUBSTRING(nif, 1, LENGTH(nif)-1) AS nif, RIGHT(nif, 1) AS nif FROM empleado;

/*11*/ SELECT nombre, presupuesto-gastos AS presupuesto_actual FROM departamento;

/*12*/ SELECT nombre, presupuesto-gastos AS presupuesto_actual FROM departamento ORDER BY presupuesto_actual ASC;

/*13*/ SELECT nombre FROM departamento ORDER BY nombre ASC;

/*14*/ SELECT nombre FROM departamento ORDER BY nombre DESC;

/*15*/ SELECT apellido1, apellido2, nombre FROM empleado ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

/*16*/ SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto DESC LIMIT 3;

/*17*/ SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto ASC LIMIT 3;

/*18*/ SELECT nombre, gastos FROM departamento ORDER BY gastos DESC LIMIT 2;

/*19*/ SELECT nombre, gastos FROM departamento ORDER BY gastos ASC LIMIT 2;

/*20*/ SELECT * FROM empleado LIMIT 2, 5;

/*21*/ SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 150000;

/*22*/ SELECT nombre, gastos FROM departamento WHERE gastos < 5000;

/*23*/ SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 100000 AND presupuesto <= 200000;

/*24*/ SELECT nombre FROM departamento WHERE NOT presupuesto < 100000 AND presupuesto >200000;

/*25*/ SELECT nombre FROM departamento WHERE presupuesto BETWEEN 100000 AND 200000;

/*26*/ SELECT nombre FROM departamento WHERE presupuesto NOT BETWEEN 100000 AND 200000;

/*27*/ SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos > presupuesto;

/*28*/ SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos < presupuesto;

/*29*/ SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos = presupuesto;

/*30*/ SELECT * FROM empleado WHERE apellido2 IS NULL;

/*31*/ SELECT * FROM empleado WHERE apellido2 IS NOT NULL;

/*32*/ SELECT * FROM empleado WHERE apellido2 = 'López';

/*33*/ SELECT * FROM empleado WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

/*34*/ SELECT * FROM empleado WHERE apellido2 IN ('Díaz', 'Moreno');

/*35*/ SELECT nombre, apellido1, apellido2, nif FROM empleado WHERE id_departamento = 3;

/*36*/ SELECT nombre, apellido1, apellido2, nif FROM empleado WHERE id_departamento IN (2, 4, 5);

