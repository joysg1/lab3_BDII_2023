CREATE DATABASE
BANCO5
 GO
 
USE
BANCO5
 GO
 
CREATE TABLE CLIENTE
 (IDCLIENTE VARCHAR(5)PRIMARY KEY,
  APELLIDO VARCHAR(30),
   NOMBRE VARCHAR(30),
   CIUDAD VARCHAR (30),
   FECHA_NAC datetime)
GO
 
CREATE TABLE CUENTA
(IDCLIENTE VARCHAR(5),
 IDCUENTA VARCHAR(5) PRIMARY KEY,
 IDSUCURSAL VARCHAR(2),
 SALDO FLOAT,
 NOMBRE_SUC VARCHAR(20))
GO
 
CREATE TABLE PRESTAMO
(IDPRESTAMO VARCHAR(5) PRIMARY KEY,
 IDSUCURSAL VARCHAR(2),
 IDCLIENTE VARCHAR(5),
 NOMBRE VARCHAR(30),
 MONTO FLOAT,
 FECHA DATETIME)
GO

CREATE TABLE SUCURSAL
(IDSUCURSAL VARCHAR(2) PRIMARY KEY,
NOMBRE_SUCURSAL VARCHAR (30),
CIUDAD VARCHAR(30))
GO
 
ALTER TABLE
CUENTA ADD FOREIGN KEY(IDCLIENTE)
REFERENCES
CLIENTE
GO
 
ALTER TABLE
PRESTAMO ADD FOREIGN KEY(IDSUCURSAL)
REFERENCES
SUCURSAL
GO

ALTER TABLE
PRESTAMO ADD FOREIGN KEY(IDCLIENTE)
REFERENCES
CLIENTE
GO


SELECT*FROM SUCURSAL
SELECT*FROM CLIENTE
SELECT*FROM PRESTAMO
SELECT*FROM CUENTA  

/* TABLA SUCURSAL */

INSERT INTO SUCURSAL (IDSUCURSAL,NOMBRE_SUCURSAL,CIUDAD) VALUES ('02','PANAMA PACIFICO','PANAMA')
INSERT INTO SUCURSAL (IDSUCURSAL,NOMBRE_SUCURSAL,CIUDAD) VALUES ('05','ALBROOK','PANAMA')
INSERT INTO SUCURSAL (IDSUCURSAL,NOMBRE_SUCURSAL,CIUDAD) VALUES ('06','COSTA VERDE','PANAMA')
INSERT INTO SUCURSAL (IDSUCURSAL,NOMBRE_SUCURSAL,CIUDAD) VALUES ('04','CENTENIAL','PANAMA')
INSERT INTO SUCURSAL (IDSUCURSAL,NOMBRE_SUCURSAL,CIUDAD) VALUES ('03','WESTLAND  MALL','PANAMA')

/*-----TABLA CLIENTE-----*/

SELECT*FROM CLIENTE
INSERT INTO CLIENTE(IDCLIENTE,APELLIDO,NOMBRE,CIUDAD,FECHA_NAC) VALUES ('00001','Sánchez','José','Panamá','1979-12-29')
INSERT INTO CLIENTE(IDCLIENTE,APELLIDO,NOMBRE,CIUDAD,FECHA_NAC) VALUES ('00002','Suárez','Carmen','Panamá','1982-07-09')
INSERT INTO CLIENTE(IDCLIENTE,APELLIDO,NOMBRE,CIUDAD,FECHA_NAC) VALUES ('00003','Sánchez','Jorge','Chitré','1975-11-24')
INSERT INTO CLIENTE(IDCLIENTE,APELLIDO,NOMBRE,CIUDAD,FECHA_NAC) VALUES ('00004','Zeta','Patricia','Penonomé','1964-02-14')
INSERT INTO CLIENTE(IDCLIENTE,APELLIDO,NOMBRE,CIUDAD,FECHA_NAC) VALUES ('00005','Rodriguez','Jorge','Chitré','1984-09-13')
INSERT INTO CLIENTE(IDCLIENTE,APELLIDO,NOMBRE,CIUDAD,FECHA_NAC) VALUES ('00007','Perez','Manuela','Panamá','1989-07-07')


/*TABLA PRESTAMO*/
SELECT*FROM PRESTAMO
INSERT INTO PRESTAMO (IDPRESTAMO,IDSUCURSAL,IDCLIENTE,MONTO,FECHA,NOMBRE) VALUES ('P01','02','00001',39050.8547,'2012-05-12','José')
INSERT INTO PRESTAMO (IDPRESTAMO,IDSUCURSAL,IDCLIENTE,MONTO,FECHA,NOMBRE) VALUES ('P02','05','00002',59475.9722,'2010-09-27','Carmen')
INSERT INTO PRESTAMO (IDPRESTAMO,IDSUCURSAL,IDCLIENTE,MONTO,FECHA,NOMBRE) VALUES ('P03','06','00003',10000,'2009-11-17','Jorge')
INSERT INTO PRESTAMO (IDPRESTAMO,IDSUCURSAL,IDCLIENTE,MONTO,FECHA,NOMBRE) VALUES ('P04','04','00007',7895.6577,'2005-10-03','Manuela')
INSERT INTO PRESTAMO (IDPRESTAMO,IDSUCURSAL,IDCLIENTE,MONTO,FECHA,NOMBRE) VALUES ('P05','03','00004',47856.96,'2007-07-30','Patricia')
INSERT INTO PRESTAMO (IDPRESTAMO,IDSUCURSAL,IDCLIENTE,MONTO,FECHA,NOMBRE) VALUES ('P06','02','00003',8945,'2012-05-24','Jorge')

/*TABLA CUENTA*/

SELECT*FROM CUENTA 
INSERT INTO CUENTA (IDCLIENTE,IDCUENTA,IDSUCURSAL,SALDO,NOMBRE_SUC) VALUES ('00003','14893','06',24507,'COSTA VERDE')
INSERT INTO CUENTA (IDCLIENTE,IDCUENTA,IDSUCURSAL,SALDO,NOMBRE_SUC) VALUES ('00004','20512','04',248.783,'CENTENIAL')
INSERT INTO CUENTA (IDCLIENTE,IDCUENTA,IDSUCURSAL,SALDO,NOMBRE_SUC) VALUES ('00002','24527','05',524.55,'ALBROOK')
INSERT INTO CUENTA (IDCLIENTE,IDCUENTA,IDSUCURSAL,SALDO,NOMBRE_SUC) VALUES ('00005','30913','03',10942,'WESTLAND MALL')
INSERT INTO CUENTA (IDCLIENTE,IDCUENTA,IDSUCURSAL,SALDO,NOMBRE_SUC) VALUES ('00001','45923','02',10958,'PANAMA PACIFICO')



Select idcliente 
from
prestamo

Select cliente.idcliente, cliente.ciudad   ---- 1. Obtener el código de clientes y ciudades donde viven, que cumplan con la condición de tener un prestamo
from cliente
Right Join Prestamo on cliente.idcliente = prestamo.idcliente


Select cliente.idcliente  ---- 2. Obtener el id de los clientes que tienen, una cuenta, un préstamo, o ambas cosas en la sucursal 02

from cliente
Join Prestamo on cliente.idcliente = prestamo.idcliente
Join Cuenta on cliente.idcliente = cuenta.idcliente
where cuenta.idsucursal = '02' or prestamo.idsucursal = '02' or cuenta.idsucursal = '02' and prestamo.idsucursal = '02'


Select cliente.idcliente  ---- 3. Obtener el id de los clientes que tienen un préstamo pero que no tienen cuenta
from cliente
Join PRESTAMO on cliente.idcliente = prestamo.idcliente
except
select cuenta.IDCLIENTE
from cuenta



Select cliente.idcliente  ----- 4. Obtener el código de los clientes que tienen depósito y préstamo al mismo tiempo en la sucursal de Panama Pacifico.

from cliente
Join prestamo on cliente.idcliente = prestamo.idcliente
Join cuenta on cliente.idcliente = cuenta.idcliente
where cuenta.IDSUCURSAL = '02' and prestamo.IDSUCURSAL = '02'



Select DISTINCT SUBSTRING(cliente.NOMBRE,1,3) as ExtractString   ----- 5. Seleccionar las 3 primeras letras del nombre de los clientes sin filas repetidas
from CLIENTE


Select CONCAT ('el nombre del cliente es ', '', nombre) ---- 6. Uso de concat
from cliente

Select nombre + ' ' + apellido as Clientes_no_Sanchez
from cliente 
where apellido <> 'Sánchez'


/* 7.  Se solicita una consulta que visualice el nombre más el apellido del cliente (debe tener el espacio entre ambos),
donde el apellido sea igual a Sánchez, el nombre de la columna debe decir Nombre Completo */


Select nombre + ' ' + apellido as Nombre_Completo 
from cliente
where apellido = 'Sánchez'


Select lower('HOLA ESTUDIAnte');  --- 8. Uso de lower


--- 9. Visualice una consulta donde cambie el nombre de las sucursales a minúsculas y cuyo nombre de columna se llame RESULTADO

Select lower(nombre_sucursal) as RESULTADO
from sucursal

--- 10. Uso de upper

Select upper ('HOLA ESTUDIAnte'); 


--- 11. Visualice una consulta donde cambie el apellido de los clientes a mayúscula, ordene la salida por apellido de manera descendente

Select upper(cliente.apellido) as Apellidos_Clientes
from cliente
order by cliente.apellido desc


--- 12. Uso de char

Select char(65);


--- 13. Uso de len

Select len('Hola');

--- 14. Obtener la longitud de caracteres de los diferentes nombres de sucursales

Select nombre_sucursal, len (nombre_sucursal) as longitud_nombre_sucursal 
from SUCURSAL

--- 15. Uso de left

Select left('buenos dias',8);

/* 16. Mediante una consulta se requiere se visualice el nombre de la sucursal y la ciudad, este último campo que sean
solo las tres primeras letras y esa columna su resultado debe llamarse CIUDADT */

Select nombre_sucursal, left(ciudad,3) as CIUDADT
from sucursal

--- 17. Uso de right

Select Right('buenos dias',8);

/* 18. Visualice el ID del cliente y la ciudad donde viven, este último campo solo debe devolver las últimas 4 letras,
donde la ciudad es igual a Panamá */

select idcliente, right(ciudad,4)
from cliente
where cliente.ciudad = 'Panamá'


--- 19. Uso de round

SELECT ROUND(45.923, 2), ROUND(45.923, 0), ROUND(45.923, -1)


--- 20.  Seleccionar la sucursal y redondear todos los depósitos(cuentas) de los diversos clientes

Select idcliente, nombre_suc, ROUND(saldo,2) as saldo_redondeado
from CUENTA


select * from PRESTAMO

select * from CUENTA

select * from cliente

