use asopros_ventas;
-- consulta el total de ventas por producto
SELECT p.nombre, SUM(do.cantidad) AS total_vendido
FROM productos p
JOIN detalles_orden do ON p.id = do.producto_id
GROUP BY p.nombre;
