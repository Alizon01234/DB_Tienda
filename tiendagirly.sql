create database tienda;
USE tienda;


CREATE TABLE Categorias 
(
    ID_Categoria INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion text
);

CREATE TABLE Marcas 
(
    ID_Marca INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(50),
    Descripcion TEXT
);

CREATE TABLE Proveedores 
(
    ID_Proveedor INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(50),
    Telefono VARCHAR(20),
    Email VARCHAR(50),
    Direccion TEXT
);

CREATE TABLE Sucursales 
(
    ID_Sucursal INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(50),
    Direccion TEXT,
    Telefono VARCHAR(20)
);

CREATE TABLE Productos 
(
    ID_Producto INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(50),
    Precio DECIMAL(10, 2),
    Talla VARCHAR(10),
    Color VARCHAR(50),
    ID_Categoria INT,
    ID_Proveedor INT,
    ID_Marca INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor),
    FOREIGN KEY (ID_Marca) REFERENCES Marcas(ID_Marca)
);

CREATE TABLE Clientes 
(
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Direccion TEXT
);

CREATE TABLE Empleados 
(
    ID_Empleado INT auto_increment PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(100),
    Puesto VARCHAR(50),
    Salario DECIMAL(10, 2),
    Telefono VARCHAR(20),
    Direccion TEXT
);

CREATE TABLE Ventas 
(
    ID_Venta INT auto_increment PRIMARY KEY,
    Fecha_Venta DATETIME,
    ID_Cliente INT,
    ID_Empleado INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado)
);

CREATE TABLE DetalleVentas 
(
    ID_Detalle INT,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    Precio DECIMAL(10, 2),
    PRIMARY KEY (ID_Producto, ID_Venta),
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);


CREATE TABLE Pedidos 
(
    ID_Pedido INT auto_increment PRIMARY KEY,
    Fecha_Pedido DATE,
    Fecha_Entrega DATETIME,
    Estado VARCHAR(20),
    ID_Proveedor INT,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
); 

CREATE TABLE DetallePedidos 
(
    ID_Detalle INT auto_increment PRIMARY KEY,
    ID_Pedido INT,
    Cantidad INT,
    Nombre_Producto VARCHAR (50),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido)
);

CREATE TABLE Devoluciones 
(
    ID_Devolucion INT auto_increment PRIMARY KEY,
    Fecha_Devolucion DATETIME,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    Motivo TEXT,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

CREATE TABLE Inventario 
(
    ID_Inventario INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Inventario DATE NOT NULL,
    ID_Producto INT NOT NULL,
    Umbral_Minimo INT DEFAULT 50, -- Valor mínimo de stock antes de reordenar
    Cantidad_Total INT DEFAULT 0, -- Cantidad total de este producto en el almacén
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_Modificacion DATETIME ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);


CREATE TABLE ComprobanteVenta 
(
    ID_Factura INT auto_increment PRIMARY KEY,
    Fecha_Emision DATETIME,
    Metodo_Pago VARCHAR(50),
    Cantidad_de_Productos DECIMAL(10, 2),
    ID_Venta INT,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta)
);

CREATE TABLE Gastos 
(
    ID_Gasto INT auto_increment PRIMARY KEY,
    Fecha DATE,
    Descripcion TEXT,
    Monto DECIMAL(10, 2),
    ID_Sucursal INT,
    FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales(ID_Sucursal)
);

CREATE TABLE Turnos 
(
    ID_Turno INT auto_increment PRIMARY KEY,
    ID_Empleado INT,
    Fecha DATE,
    Hora_Entrada TIME,
    Hora_Salida TIME,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado)
);

CREATE TABLE ProductoProveedor 
(
    ID_Producto INT,
    ID_Proveedor INT,
    PRIMARY KEY (ID_Producto, ID_Proveedor),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);

CREATE TABLE Promociones 
(
    ID_Promocion INT auto_increment PRIMARY KEY,
    Descripcion TEXT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Descuento DECIMAL(5, 2)
);



DROP TABLE Inventario;