# Asociacion-la-lecherita_BD
## Descripción

La Lecherita DB es una base de datos desarrollada en MySQL para la gestión de producción y ventas de leche. El sistema permite registrar socios, compradores, establos, usuarios, producción de leche y ventas con su respectivo detalle.

## Integrantes

* Diana Felicita Huamani Espinoza
* (Agregar integrantes del equipo)

## Tecnologías utilizadas

* MySQL 8.0
* MySQL Workbench
* JasperSoft Studio
* GitHub

## Estructura del proyecto

### creacion_bd.sql

Contiene la estructura completa de la base de datos:

* Tablas maestras
* Tablas transaccionales
* Claves primarias
* Claves foráneas
* Restricciones de negocio

### maestros.sql

Contiene la inserción de datos para:

* Ubigeo
* Socio
* Comprador
* Establo
* Usuario

### transaccional.sql

Contiene la inserción de datos para:

* Producción de leche
* Venta
* Detalle de venta

## Restricciones aplicadas

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* CHECK
* ON UPDATE CASCADE
* ON DELETE RESTRICT
* ON DELETE CASCADE

## Reportes

* Reporte Maestro (Socio)
* Reporte Transaccional (Venta y DetalleVenta)

## Repositorio

Proyecto académico desarrollado para el curso de Base de Datos.
