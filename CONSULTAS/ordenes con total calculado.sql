use asopros_ventas;
-- consulta de ordenes con total calculado
SELECT o.id, o.fecha_orden, SUM(do.subtotal) AS total_calculado
FROM ordenes o
JOIN detalles_orden do ON o.id = do.orden_id
GROUP BY o.id, o.fecha_orden;
