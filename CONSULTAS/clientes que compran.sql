use asopros_ventas;
-- consulta clientes que han hecho compra 
SELECT c.nombre, c.email, COUNT(o.id) AS total_ordenes
FROM clientes c
JOIN ordenes o ON c.id = o.cliente_id
GROUP BY c.nombre, c.email
HAVING total_ordenes > 0;
