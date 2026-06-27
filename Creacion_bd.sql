-- ============================================================
-- BASE DE DATOS: LECHERITA DB
-- Motor: MySQL 8.0+
-- ============================================================

-- 1. CREAR BASE DE DATOS
DROP DATABASE IF EXISTS lecherita_db;
CREATE DATABASE lecherita_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE lecherita_db;

-- ============================================================
-- 2. TABLAS MAESTRAS
-- ============================================================

-- Tabla: Ubigeo
CREATE TABLE Ubigeo (
    id_ubigeo INT NOT NULL AUTO_INCREMENT,
    departamento VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    distrito VARCHAR(50) NOT NULL,
    sector VARCHAR(80) NOT NULL,
    CONSTRAINT pk_ubigeo PRIMARY KEY (id_ubigeo)
) ENGINE=InnoDB;

-- Tabla: Socio
CREATE TABLE Socio (
    id_socio INT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(80) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    dni CHAR(8) NOT NULL,
    telefono CHAR(9) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT pk_socio PRIMARY KEY (id_socio),
    CONSTRAINT uq_socio_dni UNIQUE (dni)
) ENGINE=InnoDB;

-- Tabla: Comprador
CREATE TABLE Comprador (
    id_comprador INT NOT NULL AUTO_INCREMENT,
    nombre_comprador VARCHAR(100) NOT NULL,
    tipo_comprador VARCHAR(20) NOT NULL,
    dni CHAR(8) NULL,
    ruc CHAR(11) NULL,
    telefono CHAR(9) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    CONSTRAINT pk_comprador PRIMARY KEY (id_comprador),
    CONSTRAINT chk_tipo_comprador CHECK (tipo_comprador IN ('persona_natural','empresa'))
) ENGINE=InnoDB;

-- ============================================================
-- 3. TABLAS CON RELACIONES
-- ============================================================

-- Tabla: Establo
CREATE TABLE Establo (
    id_establo INT NOT NULL AUTO_INCREMENT,
    nombre_establo VARCHAR(100) NOT NULL,
    capacidad_gen INT NOT NULL,
    cantidad_vacas INT NOT NULL,
    id_ubigeo INT NOT NULL,

    CONSTRAINT pk_establo PRIMARY KEY (id_establo),
    CONSTRAINT fk_establo_ubigeo FOREIGN KEY (id_ubigeo)
        REFERENCES Ubigeo(id_ubigeo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_establo_vacas CHECK (cantidad_vacas <= capacidad_gen),
    CONSTRAINT chk_establo_capacidad CHECK (capacidad_gen > 0)
) ENGINE=InnoDB;

-- Tabla: Usuario
CREATE TABLE Usuario (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(20) NOT NULL,
    estado BOOLEAN NOT NULL DEFAULT TRUE,
    id_socio INT NOT NULL,

    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
    CONSTRAINT uq_username UNIQUE (username),

    CONSTRAINT fk_usuario_socio FOREIGN KEY (id_socio)
        REFERENCES Socio(id_socio)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_rol CHECK (rol IN ('admin','operator','viewer'))
) ENGINE=InnoDB;

-- Tabla: Produccion_leche
CREATE TABLE Produccion_leche (
    id_produccion INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    litros_producidos DECIMAL(10,2) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    id_establo INT NOT NULL,

    CONSTRAINT pk_produccion PRIMARY KEY (id_produccion),

    CONSTRAINT fk_produccion_establo FOREIGN KEY (id_establo)
        REFERENCES Establo(id_establo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_litros CHECK (litros_producidos >= 0),
    CONSTRAINT chk_turno CHECK (turno IN ('mañana','tarde'))
) ENGINE=InnoDB;

-- Tabla: Venta (CABECERA)
CREATE TABLE Venta (
    id_venta INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    cantidad_leche DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    detalle VARCHAR(200),
    id_establo INT NOT NULL,
    id_comprador INT NOT NULL,

    CONSTRAINT pk_venta PRIMARY KEY (id_venta),

    CONSTRAINT fk_venta_establo FOREIGN KEY (id_establo)
        REFERENCES Establo(id_establo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_venta_comprador FOREIGN KEY (id_comprador)
        REFERENCES Comprador(id_comprador)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_cantidad CHECK (cantidad_leche > 0),
    CONSTRAINT chk_total CHECK (total > 0),
    CONSTRAINT chk_metodo CHECK (metodo_pago IN ('efectivo','transferencia','yape','plin'))
) ENGINE=InnoDB;

-- ============================================================
-- 4. TABLA DETALLE VENTA (OBLIGATORIO)
-- ============================================================

CREATE TABLE DetalleVenta (
    id_detalle INT NOT NULL AUTO_INCREMENT,
    id_venta INT NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    cantidad DECIMAL(10,2) NOT NULL,
    precio_unit DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT pk_detalle PRIMARY KEY (id_detalle),

    CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta)
        REFERENCES Venta(id_venta)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT chk_detalle_cantidad CHECK (cantidad > 0),
    CONSTRAINT chk_precio CHECK (precio_unit > 0),
    CONSTRAINT chk_subtotal CHECK (subtotal > 0)
) ENGINE=InnoDB;

-- ============================================================
-- FIN DE LA BASE DE DATOS
-- ============================================================