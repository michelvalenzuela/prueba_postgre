CREATE DATABASE biblioteca;

\c biblioteca


DROP TABLE IF EXISTS nub_autor;
DROP TABLE IF EXISTS historial_prestamo;
DROP TABLE IF EXISTS socio;
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS autor;

CREATE TABLE socio(
    rut VARCHAR(12) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(20),
    direccion VARCHAR(20)
);


CREATE TABLE autor(
    id_autor VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nac INTEGER,
    fecha_muer INTEGER
);

CREATE TABLE libros(
    isbn VARCHAR(50) PRIMARY KEY,
    dias_prestamo INTEGER,
    titulo VARCHAR(50),
    paginas INTEGER
);


CREATE TABLE nub_autor(
    id_nub INTEGER PRIMARY KEY,
    id_autor VARCHAR(50),
    id_libro VARCHAR(50),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor),
    FOREIGN KEY (id_libro) REFERENCES libros(isbn)
);

CREATE TABLE historial_prestamo(
    id_prestamo INTEGER PRIMARY KEY,
    fecha_devolucion DATE,
    fecha_prestamo DATE,
    id_socio VARCHAR(50),
    id_libro VARCHAR(50),
    FOREIGN KEY (id_socio) REFERENCES socio(rut),
    FOREIGN KEY (id_libro) REFERENCES libros(isbn)
);



INSERT INTO socio(rut,nombre,apellido,telefono,direccion) VALUES('1111111-1','JUAN','SOTO','AVENIDA1,SANTIAGO','911111111');
INSERT INTO socio(rut,nombre,apellido,telefono,direccion) VALUES('2222222-2','ANA','PEREZ','PASAJE2,SANTIAGO','922222222');
INSERT INTO socio(rut,nombre,apellido,telefono,direccion) VALUES('3333333-3','SANDRA','AGUILAR','AVENIDA2,SANTIAGO','933333333');
INSERT INTO socio(rut,nombre,apellido,telefono,direccion) VALUES('4444444-4','ESTEBAN','JEREZ','AVENIDA3,SANTIAGO','944444444');
INSERT INTO socio(rut,nombre,apellido,telefono,direccion) VALUES('5555555-5','SILVANA','MUÑOZ','PASAJE3,SANTIAGO','955555555');

INSERT INTO autor(id_autor,nombre,apellido,fecha_nac,fecha_muer) VALUES('1','JOSE','SALGADO','1968','2020');
INSERT INTO autor(id_autor,nombre,apellido,fecha_nac) VALUES('2','ANA','SALGADO','1972');
INSERT INTO autor(id_autor,nombre,apellido,fecha_nac) VALUES('3','ANDRES','ULLOA','1982');
INSERT INTO autor(id_autor,nombre,apellido,fecha_nac,fecha_muer) VALUES('4','SERGIO','MARDONES','1950','2012');
INSERT INTO autor(id_autor,nombre,apellido,fecha_nac) VALUES('5','MARTIN','PORTA','1976');

INSERT INTO libros(isbn,dias_prestamo,titulo,paginas) VALUES('111-1111111-111',7,'CUENTOS DE TERROR',344);
INSERT INTO libros(isbn,dias_prestamo,titulo,paginas) VALUES('222-2222222-222',7,'POESIAS CONTEMPORANEAS',167);
INSERT INTO libros(isbn,dias_prestamo,titulo,paginas) VALUES('333-3333333-333',14,'HISTORIA DE ASIA',511);
INSERT INTO libros(isbn,dias_prestamo,titulo,paginas) VALUES('444-4444444-444',14,'MANUAL DE MECANICA',298);

INSERT INTO nub_autor(id_nub,id_autor,id_libro) VALUES(1,'1','111-1111111-111');
INSERT INTO nub_autor(id_nub,id_autor,id_libro) VALUES(2,'2','111-1111111-111');
INSERT INTO nub_autor(id_nub,id_autor,id_libro) VALUES(3,'3','222-2222222-222');
INSERT INTO nub_autor(id_nub,id_autor,id_libro) VALUES(4,'4','333-3333333-333');
INSERT INTO nub_autor(id_nub,id_autor,id_libro) VALUES(5,'5','444-4444444-444');

INSERT INTO historial_prestamo(id_prestamo,fecha_prestamo,fecha_devolucion,id_socio,id_libro) VALUES(1,'2020-01-20','2020-1-27','1111111-1','111-1111111-111');
INSERT INTO historial_prestamo(id_prestamo,fecha_prestamo,fecha_devolucion,id_socio,id_libro) VALUES(2,'2020-01-20','2020-1-30','5555555-5','222-2222222-222');
INSERT INTO historial_prestamo(id_prestamo,fecha_prestamo,fecha_devolucion,id_socio,id_libro) VALUES(3,'2020-01-22','2020-1-30','3333333-3','333-3333333-333');
INSERT INTO historial_prestamo(id_prestamo,fecha_prestamo,fecha_devolucion,id_socio,id_libro) VALUES(4,'2020-01-23','2020-1-30','4444444-4','444-4444444-444');
INSERT INTO historial_prestamo(id_prestamo,fecha_prestamo,fecha_devolucion,id_socio,id_libro) VALUES(5,'2020-01-27','2020-2-04','2222222-2','111-1111111-111');
INSERT INTO historial_prestamo(id_prestamo,fecha_prestamo,fecha_devolucion,id_socio,id_libro) VALUES(6,'2020-01-31','2020-2-12','1111111-1','444-4444444-444');
INSERT INTO historial_prestamo(id_prestamo,fecha_prestamo,fecha_devolucion,id_socio,id_libro) VALUES(7,'2020-01-31','2020-2-12','3333333-3','222-2222222-222');


SELECT titulo FROM libros WHERE paginas<300;
SELECT nombre FROM autor WHERE fecha_nac>1970;
SELECT titulo FROM libros JOIN historial_prestamo ON libros.isbn=historial_prestamo.id_libro WHERE id_libro = (SELECT MAX (id_libro) FROM historial_prestamo);