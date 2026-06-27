Restricciones Aplicadas en la Base de Datos Lecherita DB
Descripción

En el sistema “Lecherita DB” se aplicaron diferentes tipos de restricciones con el objetivo de garantizar la integridad de los datos y el cumplimiento de las reglas de negocio establecidas en el modelo relacional.
1. PRIMARY KEY
Se utiliza para identificar de forma única cada registro dentro de una tabla.
Ejemplos:
Socio (id_socio)
Venta (id_venta)
DetalleVenta (id_detalle)
Usuario (id_usuario)
✔ Permite evitar registros duplicados y asegurar la identificación única de cada tabla.
 2. FOREIGN KEY
Establece relaciones entre las tablas y garantiza la integridad referencial.
Ejemplos:
Establo → Ubigeo
Usuario → Socio
Venta → Establo
Venta → Comprador
DetalleVenta → Venta
✔ Asegura que los registros relacionados existan en las tablas principales.
3. CHECK (REGLAS DE NEGOCIO)
Permite validar los datos antes de ser almacenados en la base de datos.
Reglas aplicadas:
cantidad_vacas ≤ capacidad_gen
capacidad_gen > 0
litros_producidos ≥ 0
turno IN ('mañana','tarde')
metodo_pago IN ('efectivo','transferencia','yape','plin')
cantidad > 0 en detalle de venta
precio_unit > 0
✔ Evita el ingreso de datos inválidos o fuera de las reglas del sistema.
 4. UNIQUE
Garantiza que no se repitan valores en campos importantes.
Ejemplos:
DNI en la tabla Socio
Username en la tabla Usuario
✔ Evita duplicidad de registros críticos.
 5. NOT NULL
Evita que los campos obligatorios queden vacíos.
✔ Asegura que toda la información necesaria sea registrada correctamente.
CONCLUSIÓN 
La base de datos “Lecherita DB” garantiza la integridad, consistencia y validez de la información mediante la aplicación de restricciones como Primary Key, Foreign Key, Check, Unique y Not Null, logrando un sistema confiable y bien estructurado.
