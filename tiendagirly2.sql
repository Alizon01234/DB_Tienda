use tienda;


-- CATEGORIAS
SELECT * FROM Categorias;

INSERT INTO Categorias (Nombre, Descripcion) 
VALUES 
('Ropa Casual', 'Categoría de ropa casual y cómoda'),
('Ropa Formal', 'Categoría de ropa para eventos y trabajo'),
('Ropa Deportiva', 'Categoría de ropa para actividades físicas');

-- actualizar
UPDATE Categorias
SET Nombre = 'Ropa Formal', Descripcion = 'Categoría de ropa formal'
WHERE ID_Categoria = 1;

-- eliminar
DELETE FROM Categorias
WHERE ID_Categoria = 1;


-- MARCAS
SELECT * FROM Marcas;

INSERT INTO Marcas (Nombre, Descripcion) 
VALUES 
('LOFT', 'Marca reconocida por ropa casual femenina'),
('Adidas', 'Marca global de ropa y accesorios deportivos'),
('Dasy', 'Marca de ropa formal y semiformal');

-- actualizar
UPDATE Marcas
SET Nombre = 'Adidas', Descripcion = 'Marca de ropa deportiva'
WHERE ID_Marca = 1;

-- eliminar
DELETE FROM Marcas
WHERE ID_Marca = 1;


-- PROVEEDORES
SELECT * FROM Proveedores;

INSERT INTO Proveedores (Nombre, Telefono, Email, Direccion) 
VALUES 
('Proveedor A', '123456789', 'proveedora@gmail.com', 'Calle Principal 123, Ciudad A'),
('Proveedor B', '987654321', 'proveedorb@gmail.com', 'Avenida Secundaria 456, Ciudad B'),
('Proveedor C', '555444333', 'proveedorc@gmail.com', 'Boulevard Central 789, Ciudad C');


-- actualizar 
UPDATE Proveedores
SET Nombre = 'Proveedor B', Telefono = '987654321', Email = 'proveedorb@example.com', Direccion = 'Avenida 456'
WHERE ID_Proveedor = 1;

-- eliminar 
DELETE FROM Proveedores
WHERE ID_Proveedor = 1;



-- SUCURSALES
SELECT*FROM Sucursales;

INSERT INTO Sucursales (Nombre, Direccion, Telefono) 
VALUES 
('Sucursal Centro', 'Av. Principal 123, Ciudad A', '555-1234'),
('Sucursal Norte', 'Calle Secundaria 456, Ciudad B', '555-5678'),
('Sucursal Sur', 'Boulevard Tercer Nivel 789, Ciudad C', '555-9876');

UPDATE Sucursales
SET Nombre = 'Sucursal Este', Direccion = 'Avenida Este 321, Ciudad A', Telefono = '555-0000'
WHERE ID_Sucursal = 1;

-- Eliminar
DELETE FROM Sucursales
WHERE ID_Sucursal = 1;


-- PRODUCTOS
SELECT * FROM Productos;


INSERT INTO Productos (Nombre, Precio, Talla, Color, ID_Categoria, ID_Proveedor, ID_Marca) 
VALUES 
('Camisa Casual', 29.99, 'L', 'Azul', 1, 1, 1),
('Pantalón Formal', 49.99, 'M', 'Negro', 2, 2, 3),
(' Conjunto deportivo', 89.99, 'XL', 'Rojo', 3, 3, 2);

UPDATE Productos
SET Nombre = 'Camisa Elegante', Precio = 34.99, Color = 'Verde'
WHERE ID_Producto = 1;

-- eliminar
DELETE FROM Productos
WHERE ID_Producto = 1;


-- CLIENTES
SELECT * FROM Clientes;

INSERT INTO Clientes (Nombre, Telefono, Email, Direccion) 
VALUES 
('Juan Pérez', '555-1111', 'juan.perez@example.com', 'Calle 1, Ciudad A'),
('Ana Gómez', '555-2222', 'ana.gomez@example.com', 'Calle 2, Ciudad B'),
('Luis Martínez', '555-3333', 'luis.martinez@example.com', 'Calle 3, Ciudad C');

UPDATE Clientes
SET Nombre = 'Juan Pérez López', Email = 'juan.perez.lopez@example.com'
WHERE ID_Cliente = 1;

-- eliminar 
DELETE FROM Clientes
WHERE ID_Cliente = 1;



-- EMPLLEADOS
SELECT * FROM Empleados;

INSERT INTO Empleados (Nombre, Apellido, Puesto, Salario, Telefono, Direccion) 
VALUES 
('Pedro', 'Gómez', 'Vendedor', 1500.00, '555-1111', 'Av. Libertad 123, Ciudad A'),
('María', 'Fernández', 'Gerente', 2500.00, '555-2222', 'Calle Estrella 456, Ciudad B'),
('Carlos', 'López', 'Caja', 1200.00, '555-3333', 'Boulevard Sol 789, Ciudad C');

-- actualizar
UPDATE Empleados
SET Salario = 1600.00, Puesto = 'Vendedor Senior'
WHERE ID_Empleado = 1;

-- eliminar
DELETE FROM Empleados
WHERE ID_Empleado = 3;



-- VENTAS
SELECT * FROM Ventas;

INSERT INTO Ventas (Fecha_Venta, ID_Cliente, ID_Empleado, Total) 
VALUES 
(NOW(), 1, 1, 89.99),
(NOW(), 2, 2, 149.99),
(NOW(), 3, 1, 249.99);

INSERT INTO Ventas (Fecha_Venta, ID_Cliente, ID_Empleado, Total) 
VALUES 
('2024-09-01 10:30:00', 1, 1, 89.99),
('2024-09-02 11:15:00', 2, 2, 149.99),
('2024-09-03 14:45:00', 3, 1, 249.99);


UPDATE Ventas
SET Total = 99.99
WHERE ID_Venta = 1;

DELETE FROM Ventas
WHERE ID_Venta = 3;



-- DETALLE DE VENTA
SELECT * FROM Ventas;

INSERT INTO DetalleVentas (ID_Detalle, ID_Venta, ID_Producto, Cantidad, Precio) 
VALUES 
(1, 1, 1, 1, 29.99),
(2, 1, 2, 2, 30.00),
(3, 2, 3, 1, 89.99);

-- actualizar
UPDATE DetalleVentas
SET Cantidad = 3, Precio = 28.99
WHERE ID_Venta = 1 AND ID_Producto = 1;


DELETE FROM DetalleVentas
WHERE ID_Venta = 1 AND ID_Producto = 2;




-- PEDIDOS
SELECT * FROM Pedidos;

INSERT INTO Pedidos (Fecha_Pedido, Fecha_Entrega, Estado, ID_Proveedor, Total) 
VALUES 
('2024-09-10', '2024-09-15 12:00:00', 'Enviado', 1, 299.99),
('2024-09-11', '2024-09-16 15:00:00', 'Pendiente', 2, 499.99),
('2024-09-12', '2024-09-17 10:00:00', 'Cancelado', 3, 150.00);

UPDATE Pedidos
SET Estado = 'Completo', Total = 320.00
WHERE ID_Pedido = 1;

DELETE FROM Pedidos
WHERE ID_Pedido = 3;



-- DETALLEPEDIDOS
SELECT * FROM DetallePedidos;

INSERT INTO DetallePedidos (ID_Pedido, Cantidad, Nombre_Producto) 
VALUES 
(1, 3, 'Camisa Casual'),
(2, 2, 'Pantalón Formal'),
(1, 1, 'Zapatillas Deportivas');

UPDATE DetallePedidos
SET Cantidad = 4
WHERE ID_Pedido = 1 AND Nombre_Producto = 'Camisa Casual';

DELETE FROM DetallePedidos
WHERE ID_Detalle = 3;


-- DEVOLUCIONES
SELECT * FROM Devoluciones;


INSERT INTO Devoluciones (Fecha_Devolucion, ID_Venta, ID_Producto, Cantidad, Motivo) 
VALUES 
('2024-09-03 14:00:00', 1, 1, 1, 'Talla incorrecta'),
('2024-09-06 16:30:00', 2, 2, 2, 'Defecto de fabricación'),
('2024-09-07 10:15:00', 3, 3, 1, 'Cambio de opinión');

UPDATE Devoluciones
SET Cantidad = 2, Motivo = 'Producto dañado'
WHERE ID_Devolucion = 1;

DELETE FROM Devoluciones
WHERE ID_Devolucion = 3;



-- INVENTARIO
SELECT * FROM Inventario;

-- Seleccionar un registro específico por ID
SELECT * FROM Inventario WHERE ID_Inventario = 1;

-- Seleccionar inventario para un producto específico
SELECT * FROM Inventario WHERE ID_Producto = 1;


-- Insertar un nuevo registro en Inventario
INSERT INTO Inventario (Fecha_Inventario, ID_Producto, Umbral_Minimo, Cantidad_Total)
VALUES ('2024-09-15', 1, 50, 100);

INSERT INTO Inventario (Fecha_Inventario, ID_Producto, Umbral_Minimo, Cantidad_Total)
VALUES ('2024-09-15', 2, 50, 200);

INSERT INTO Inventario (Fecha_Inventario, ID_Producto, Umbral_Minimo, Cantidad_Total)
VALUES ('2024-09-15', 3, 50, 300);


-- Actualizar la cantidad total de un producto en Inventario
UPDATE Inventario
SET Cantidad_Total = 120
WHERE ID_Inventario = 1;

-- Actualizar el umbral mínimo y cantidad total de un producto
UPDATE Inventario
SET Umbral_Minimo = 60, Cantidad_Total = 150
WHERE ID_Producto = 2;


-- Eliminar un registro específico por ID
DELETE FROM Inventario
WHERE ID_Inventario = 1;

-- Eliminar todos los registros de Inventario para un producto específico
DELETE FROM Inventario
WHERE ID_Producto = 3;



-- COMPROVANTEVENTA
SELECT * FROM ComprobanteVenta;

INSERT INTO ComprobanteVenta (Fecha_Emision, Metodo_Pago, Cantidad_de_Productos, ID_Venta) 
VALUES 
('2024-09-10 14:00:00', 'Tarjeta de Crédito', 2, 1),
('2024-09-11 15:30:00', 'Efectivo', 1, 2),
('2024-09-12 11:00:00', 'Transferencia Bancaria', 3, 3);

UPDATE ComprobanteVenta
SET Metodo_Pago = 'Cheque', Cantidad_de_Productos = 3
WHERE ID_Factura = 1;

-- eliminar
DELETE FROM ComprobanteVenta
WHERE ID_Factura = 2;




-- GASTOS
SELECT * FROM Gastos;

INSERT INTO Gastos (Fecha, Descripcion, Monto, ID_Sucursal) 
VALUES 
('2024-09-10', 'Compra de suministros', 500.00, 1),
('2024-09-11', 'Pago de servicios', 200.00, 2),
('2024-09-12', 'Reparación de equipo', 150.00, 1);

-- actualizar
UPDATE Gastos
SET Monto = 550.00, Descripcion = 'Compra de suministros actualizada'
WHERE ID_Gasto = 1;

-- eliminar
DELETE FROM Gastos
WHERE ID_Gasto = 3;




-- TURNOS
SELECT * FROM Turnos;

INSERT INTO Turnos (ID_Empleado, Fecha, Hora_Entrada, Hora_Salida) 
VALUES 
(1, '2024-09-10', '08:00:00', '16:00:00'),
(2, '2024-09-10', '09:00:00', '17:00:00'),
(3, '2024-09-11', '10:00:00', '18:00:00');

UPDATE Turnos
SET Hora_Entrada = '08:30:00', Hora_Salida = '16:30:00'
WHERE ID_Turno = 1;

DELETE FROM Turnos
WHERE ID_Turno = 3;



-- PROMOCIONES
SELECT * FROM Promociones;

INSERT INTO Promociones (Descripcion, Fecha_Inicio, Fecha_Fin, Descuento) 
VALUES 
('Descuento del 20% en todos los productos', '2024-09-01', '2024-09-30', 20.00),
('Descuento del 15% en productos seleccionados', '2024-09-10', '2024-09-20', 15.00),
('Descuento del 10% en compras mayores a $100', '2024-09-15', '2024-09-25', 10.00);

UPDATE Promociones
SET Descuento = 25.00, Fecha_Fin = '2024-10-15'
WHERE ID_Promocion = 1;

DELETE FROM Promociones
WHERE ID_Promocion = 2;



-- PRODUCTOPROVEEDOR
SELECT * FROM ProductoProveedor;














-- TRIGGER verificar fecha de devolucion

DELIMITER $$

CREATE TRIGGER verificar_fecha_devolucion
BEFORE INSERT ON Devoluciones
FOR EACH ROW
BEGIN
    -- Variable para almacenar la fecha de la venta
    DECLARE fecha_venta DATETIME;
    
    -- Obtiene la fecha de la venta correspondiente al ID_Venta en la nueva devolución
    SELECT Fecha_Venta INTO fecha_venta
    FROM Ventas
    WHERE ID_Venta = NEW.ID_Venta;

    -- Verifica si la fecha de devolución es dentro de los 5 días posteriores a la fecha de la venta
    IF TIMESTAMPDIFF(DAY, fecha_venta, NEW.Fecha_Devolucion) > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de devolución está fuera del período permitido de 5 días después de la compra.';
    END IF;
END$$

DELIMITER ;






-- TRIGGER QUE VERIFICA SI LOS PRODUCTOS ESTAN POR DEBAJO DEL UMBRAL MINIMO

DELIMITER $$

CREATE TRIGGER check_inventory_threshold
AFTER UPDATE ON Inventario
FOR EACH ROW
BEGIN
    -- Verifica si la cantidad total está por debajo del umbral mínimo
    IF NEW.Cantidad_Total < NEW.Umbral_Minimo THEN
        -- Inserta un registro en la tabla Bitacora o realiza alguna acción
        INSERT INTO Bitacora (Accion, Tabla, Registro_Afectado, Detalles)
        VALUES ('Alerta de inventario bajo', 'Inventario', NEW.ID_Inventario, 
                CONCAT('El producto con ID ', NEW.ID_Producto, ' tiene una cantidad total de ', 
                NEW.Cantidad_Total, ', que está por debajo del umbral mínimo de ', 
                NEW.Umbral_Minimo));
    END IF;
END $$

DELIMITER ;

DROP TRIGGER IF EXISTS check_inventory_threshold;





CREATE TABLE Bitacora (
    ID_Bitacora INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Accion VARCHAR(100),
    Tabla VARCHAR(50),
    Registro_Afectado INT,
    Detalles TEXT
);





-- VISTAS

CREATE VIEW VistaProductosCategoriasProveedores AS
SELECT p.ID_Producto, p.Nombre AS Nombre_Producto, c.Nombre AS Nombre_Categoria, pr.Nombre AS Nombre_Proveedor
FROM Productos p
JOIN Categorias c ON p.ID_Categoria = c.ID_Categoria
JOIN Proveedores pr ON p.ID_Proveedor = pr.ID_Proveedor;



CREATE VIEW VistaProductosCategoriasProveedoresMarcas AS
SELECT p.ID_Producto, 
       p.Nombre AS Nombre_Producto, 
       c.Nombre AS Nombre_Categoria, 
       pr.Nombre AS Nombre_Proveedor,
       m.Nombre AS Nombre_Marca
FROM Productos p
JOIN Categorias c ON p.ID_Categoria = c.ID_Categoria
JOIN Proveedores pr ON p.ID_Proveedor = pr.ID_Proveedor
JOIN Marcas m ON p.ID_Marca = m.ID_Marca;




-- PROCEDIMIENTOS


DELIMITER //

CREATE PROCEDURE AgregarProducto (
    IN p_Nombre VARCHAR(50),
    IN p_Precio DECIMAL(10, 2),
    IN p_Talla VARCHAR(10),
    IN p_Color VARCHAR(50),
    IN p_ID_Categoria INT,
    IN p_ID_Proveedor INT,
    IN p_ID_Marca INT
)
BEGIN
    INSERT INTO Productos (Nombre, Precio, Talla, Color, ID_Categoria, ID_Proveedor, ID_Marca)
    VALUES (p_Nombre, p_Precio, p_Talla, p_Color, p_ID_Categoria, p_ID_Proveedor, p_ID_Marca);
END //

DELIMITER ;


CALL AgregarProducto('Chaqueta Negra', 49.99, 'L', 'Negro', 2, 1, 3);




-- Mostrar usuarios existentes
SELECT * FROM MYSQL.USER;

-- Crear usuario
CREATE USER 'mooxxie'@'localhost' IDENTIFIED BY 'pepito';

-- Modificar usuario
RENAME USER mooxxie@'localhost' TO 'mooxxie_nuevo'@'localhost';
ALTER USER mooxxie_nuevo@'localhost' IDENTIFIED BY 'pepito_nuevo';

-- Eliminar usuario
DROP USER mooxxie_nuevo@'localhost';

-- Asignar privilegios
GRANT ALL PRIVILEGES ON tienda.* TO 'mooxxie'@'localhost';






