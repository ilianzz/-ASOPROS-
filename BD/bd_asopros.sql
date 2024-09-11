DROP DATABASE IF EXISTS asopros_ventas;
CREATE DATABASE asopros_ventas;
USE asopros_ventas;
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    imagen_url VARCHAR(255),
    precio DECIMAL(10, 3),
    stock INT DEFAULT 0
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    direccion TEXT 
);

CREATE TABLE ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha_orden DATETIME  DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2) ,
    estado VARCHAR(20)  DEFAULT 'Pendiente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE detalles_orden (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    producto_id INT,
    cantidad INT ,
    precio DECIMAL(10, 2) ,
    subtotal DECIMAL(10, 2) ,
    FOREIGN KEY (orden_id) REFERENCES ordenes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    metodo_pago VARCHAR(50),
    cantidad_pagada DECIMAL(10, 2),
    FOREIGN KEY (orden_id) REFERENCES ordenes(id)
);

-- aqui tenemos la estructura para insertar productos
INSERT INTO productos (nombre, descripcion, imagen_url, precio, stock)
VALUES 
('Chocolate Orgánico', 'Chocolate 100% cacao orgánico', 'producto1.jpg', 20.000, 100),
('Miel de Musílago', 'Jalea natural de musílago de cacao', 'producto2.jpg', 5.000, 50),
('Cocada', 'Cocada mezclada con chocolate', 'producto3.jpg', 2.000, 40),
('Jalea de Borojo', 'Jalea natural de borojo','producto4.jpg',7.000,30);

-- en esta para insertar clientes
INSERT INTO clientes (nombre, email, telefono, direccion)
VALUES 
('Juan Pérez', 'juan@gmail.com', '3145653312', 'Primero de Enero, Mocoa'),
('Ana García', 'ana@gmail.com', '3214537281', 'Puerto Rosario, Puerto Guzmán'),
('Maria Rosales', 'maria@gmail.com', '3115459816', 'La Unión, Mocoa'),
('Sergio Moles', 'sergio@gmail.com', '3147591795', 'Primero de Enero, Mocoa');
-- en esta para insertar órdenes
INSERT INTO ordenes (cliente_id, total, estado)
VALUES 
(1, 40.000, 'Pendiente'),
(2, 5.000, 'Pendiente'),
(3, 40.000, 'Pendiente'),
(4, 7.000, 'Pagado');

-- en esta para insertar detalles de órdenes
INSERT INTO detalles_orden (orden_id, producto_id, cantidad, precio, subtotal)
VALUES 
(1, 1, 2, 20.00, 40.00),
(2, 2, 1, 5.00, 5.00),
(3, 1, 2, 20.00, 40.00),
(4, 4, 2, 7.000, 14.000);

-- en esta para insertar pagos
INSERT INTO pagos (orden_id, metodo_pago, cantidad_pagada)
VALUES 
(1, 'tarjeta de Crédito', 40.000),
(2, 'efectivo', 5.000),
(3, 'tarjeta de crédito', 40.000),
(4, 'efectivo', 14.000);

