use asopros_ventas;
-- ventas totales por cada cliente
SELECT c.nombre, c.email, SUM(o.total) AS total_compras
FROM clientes c
JOIN ordenes o ON c.id = o.cliente_id
GROUP BY c.nombre, c.email;
