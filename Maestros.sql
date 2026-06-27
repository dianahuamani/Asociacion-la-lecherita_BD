USE lecherita_db;

-- ============================================================
-- LIMPIEZA (IMPORTANTE PARA EVITAR DUPLICADOS)
-- ============================================================
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Usuario;
TRUNCATE TABLE Establo;
TRUNCATE TABLE Comprador;
TRUNCATE TABLE Socio;
TRUNCATE TABLE Ubigeo;

SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- UBIGEO (10 registros)
-- ============================================================
INSERT INTO Ubigeo (departamento, provincia, distrito, sector) VALUES
('Lima','Cañete','Cerro Azul','San Juan'),
('Lima','Cañete','Imperial','La Florida'),
('Lima','Cañete','Nuevo Imperial','Santa Rosa'),
('Lima','Cañete','San Vicente','Centro'),
('Lima','Cañete','Mala','Norte'),
('Lima','Cañete','Asia','Sur'),
('Lima','Cañete','Quilmana','Este'),
('Lima','Cañete','Calango','Oeste'),
('Lima','Cañete','Pacarán','Rural'),
('Lima','Cañete','Lunahuaná','Valle');

-- ============================================================
-- SOCIO (10 registros)
-- ============================================================
INSERT INTO Socio (nombres, apellidos, dni, telefono, correo, direccion, fecha_ingreso) VALUES
('Diana','Huamani','74125896','999654376','diana@lecherita.com','Cerro Azul','2026-06-18'),
('Ashton','Guevara','75236981','987654321','ashton@lecherita.com','Imperial','2026-06-18'),
('Carlos','Rojas','76321458','912345678','carlos@lecherita.com','Nuevo Imperial','2026-06-18'),
('Luis','Torres','74125897','987111111','luis@lecherita.com','San Vicente','2026-06-18'),
('Maria','Flores','74125898','987111112','maria@lecherita.com','Mala','2026-06-18'),
('Jose','Garcia','74125899','987111113','jose@lecherita.com','Asia','2026-06-18'),
('Ana','Perez','74125900','987111114','ana@lecherita.com','Quilmana','2026-06-18'),
('Pedro','Castro','74125901','987111115','pedro@lecherita.com','Calango','2026-06-18'),
('Rosa','Mendoza','74125902','987111116','rosa@lecherita.com','Pacarán','2026-06-18'),
('Miguel','Vargas','74125903','987111117','miguel@lecherita.com','Lunahuaná','2026-06-18');

-- ============================================================
-- COMPRADOR (10 registros)
-- ============================================================
INSERT INTO Comprador (nombre_comprador, tipo_comprador, dni, ruc, telefono, correo, direccion) VALUES
('Juan Perez','persona_natural','71458963',NULL,'945678123','juan@gmail.com','Cerro Azul'),
('Gloria S.A.','empresa',NULL,'20100070970','987654123','gloria@gloria.com','Lima'),
('Laive S.A.','empresa',NULL,'20100218612','912345789','laive@laive.com','Lima'),
('Nestle','empresa',NULL,'20111111111','987000001','nestle@nestle.com','Lima'),
('Alicorp','empresa',NULL,'20111111112','987000002','alicorp@alicorp.com','Lima'),
('Pedro Ruiz','persona_natural','71111111',NULL,'987000003','pedro@gmail.com','Mala'),
('Maria Lopez','persona_natural','72222222',NULL,'987000004','maria@gmail.com','Asia'),
('Carlos Torres','persona_natural','73333333',NULL,'987000005','carlos@gmail.com','Quilmana'),
('Agro SAC','empresa',NULL,'20111111113','987000006','agro@gmail.com','Lima'),
('Danper','empresa',NULL,'20111111114','987000007','danper@gmail.com','Lima');

-- ============================================================
-- ESTABLO (10 registros)
-- ============================================================
INSERT INTO Establo (nombre_establo, capacidad_gen, cantidad_vacas, id_ubigeo) VALUES
('Establo San Juan',100,80,1),
('Establo Florida',120,95,2),
('Establo Santa Rosa',90,70,3),
('Establo Andino',110,90,4),
('Establo Olivos',130,100,5),
('Establo Carmen',150,120,6),
('Establo Santa Fe',140,110,7),
('Establo Valle',160,130,8),
('Establo Palmeras',170,140,9),
('Establo Esperanza',180,150,10);

-- ============================================================
-- USUARIO (10 registros)
-- ============================================================
INSERT INTO Usuario (username, nombres, password, rol, estado, id_socio) VALUES
('diana_admin','Diana','admin123','admin',TRUE,1),
('ashton_op','Ashton','oper123','operator',TRUE,2),
('carlos_view','Carlos','view123','viewer',TRUE,3),
('luis_admin','Luis','admin123','admin',TRUE,4),
('maria_op','Maria','oper123','operator',TRUE,5),
('jose_view','Jose','view123','viewer',TRUE,6),
('ana_op','Ana','oper123','operator',TRUE,7),
('pedro_view','Pedro','view123','viewer',TRUE,8),
('rosa_op','Rosa','oper123','operator',TRUE,9),
('miguel_view','Miguel','view123','viewer',TRUE,10);

