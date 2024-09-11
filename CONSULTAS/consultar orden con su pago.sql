use asopros_ventas;
-- consulta ordenes con sus pagos
SELECT o.id AS orden_id, p.metodo_pago, p.cantidad_pagada
FROM ordenes o
JOIN pagos p ON o.id = p.orden_id;
