USE lecherita_db;

START TRANSACTION;

-- =========================
-- PRODUCCION (10)
-- =========================
INSERT INTO Produccion_leche (fecha,litros_producidos,turno,id_establo) VALUES
('2026-06-01',450,'mañana',1),
('2026-06-01',380,'tarde',1),
('2026-06-02',500,'mañana',2),
('2026-06-02',420,'tarde',2),
('2026-06-03',470,'mañana',3),
('2026-06-03',390,'tarde',3),
('2026-06-04',520,'mañana',4),
('2026-06-05',410,'tarde',5),
('2026-06-06',495,'mañana',6),
('2026-06-07',405,'tarde',7);

-- =========================
-- VENTA (10)
-- =========================
INSERT INTO Venta (fecha,departamento,cantidad_leche,total,metodo_pago,detalle,id_establo,id_comprador) VALUES
('2026-06-01','Lima',200,500,'transferencia','Venta leche',1,1),
('2026-06-02','Lima',180,450,'efectivo','Venta leche',2,2),
('2026-06-03','Lima',250,625,'yape','Venta leche',3,3),
('2026-06-04','Lima',300,750,'transferencia','Venta leche',4,4),
('2026-06-05','Lima',220,550,'plin','Venta leche',5,5),
('2026-06-06','Lima',275,687.50,'efectivo','Venta leche',6,6),
('2026-06-07','Lima',190,475,'transferencia','Venta leche',7,7),
('2026-06-08','Lima',310,775,'yape','Venta leche',8,8),
('2026-06-09','Lima',260,650,'plin','Venta leche',9,9),
('2026-06-10','Lima',230,575,'transferencia','Venta leche',10,10);

-- =========================
-- DETALLE VENTA (1 A MUCHOS)
-- =========================
INSERT INTO DetalleVenta (id_venta,descripcion,cantidad,precio_unit,subtotal) VALUES
(1,'Leche 1L',200,2.5,500),
(2,'Leche 1L',100,2.5,250),
(2,'Leche 500ml',200,1.0,200),
(3,'Leche 1L',250,2.5,625),
(4,'Leche 1L',300,2.5,750),
(5,'Leche 1L',220,2.5,550),
(6,'Leche 1L',275,2.5,687.5),
(7,'Leche 1L',190,2.5,475),
(8,'Leche 1L',310,2.5,775),
(9,'Leche 1L',260,2.5,650),
(10,'Leche 1L',230,2.5,575);

COMMIT;

