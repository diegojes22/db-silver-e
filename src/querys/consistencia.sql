/*
Silver Team

PostgreSQL AND Supabase : Database - e-commerce
*********************************************************************

Consultas de validacion en cuanto a la consistencia de la informacion agregada
en la base de datos.

Estas consultas permiten validar que la informacion de los registros en el archivo
`src/insert/data2.sql` sean correctos y consistentes en cuanto el estado de los envios,
fechas y montos acumulados.

Esto es parte de la actividad asignada en la clase, actividad denominada como:
"Construcción de la base de datos"
*/

/* 
    Consistencia financiera
Comparativa entre las tablas "pedidos" y "detalles_pedidos".
Se comparan que los importes del costo de los prodctos sean
consistentes entre ambas tablas.
*/
-- Comparativa entre el importe y la suma de los detalles del carrito
SELECT 
  p.id AS id_pedido,
  p.importe_productos AS importe,
  SUM(dp.cantidad * pro.precio) AS suma
FROM pedidos p
JOIN detalles_pedido dp ON p.id = dp.pedidos_id
JOIN productos pro ON pro.id = dp.productos_id
GROUP BY p.id, p.importe_productos;

-- Mostrar los pedidos los cuales tengan diferencias con la suma de los detalles carrito
WITH totales AS (
  SELECT 
    p.id AS id_pedido,
    p.importe_productos AS importe,
    SUM(dp.cantidad * pro.precio) AS suma
  FROM pedidos p
  JOIN detalles_pedido dp ON p.id = dp.pedidos_id
  JOIN productos pro ON pro.id = dp.productos_id
  GROUP BY p.id, p.importe_productos
)
SELECT
  id_pedido,
  importe,
  suma,
  (importe - suma) AS diferencia
FROM totales
WHERE importe <> suma;

-- Precios de los productos dentro de un detalle pedido
SELECT 
  pro.nombre,
  pro.precio,
  dp.cantidad,
  (pro.precio * dp.cantidad) AS importe
FROM pedidos p
JOIN detalles_pedido dp ON p.id = dp.pedidos_id
JOIN productos pro ON pro.id = dp.productos_id
WHERE p.id = 'a81396a1-7ff9-470b-b82d-a3bfaf7fae70'
;

/*
    Consistencia cronologica
Se identifican discrepancias o problemas con fechas de pedidos,
envios, etc. Ejemplo: pedidos con fecha de entrega anterior a 
la fecha de creación del pedido o pagos registrados antes de 
crear el pedido.

Pendiente verificar!
*/
-- Pedidos cuyas fecha de envio sean anteriores a la fecha de creacion de un pedido
SELECT
  *
FROM pedidos p
JOIN envios e ON p.id = e.pedios_id
WHERE e.fecha_entrega <= p.fecha
;

-- Pedidos cuyas fechas de pagos sean anteriores a la fecha de creacion del pedido
SELECT
  *
FROM pedidos p
WHERE e.fecha_entrega <= p.fecha
;

-- Pedidos cuya fecha de creacion de envio sea posterior a la fecha de pago del pedido
SELECT
  id,
  fecha,
  fecha_hora_pago,
  (fecha - fecha_hora_pago) AS diferencia
FROM pedidos p
WHERE (fecha_hora_pago <= fecha)
;

-- Diferencia entre las fecha de entrega y fecha de creacio del pedido
-- unicamente de los pedidos que si fueron entregados.
SELECT
  p.id,
  e.numero_seguimiento,
  p.fecha,
  p.fecha_hora_pago,
  e.fecha,
  e.fecha_entrega,
  (e.fecha_entrega - p.fecha) AS diferencia
FROM pedidos p
JOIN envios e ON p.id = e.pedidos_id
WHERE e.estado = 'ENTREGADO'
;

-- Pedidos cuyas entregas sean en el mismo dia en que se realizo
SELECT
  p.id,
  e.numero_seguimiento,
  p.fecha,
  p.fecha_hora_pago,
  e.fecha,
  e.fecha_entrega,
  (e.fecha_entrega - p.fecha) AS diferencia
FROM pedidos p
JOIN envios e ON p.id = e.pedidos_id
WHERE e.estado = 'ENTREGADO'
;

-- Pedidos cuyas fechas de pago que no superen la hora
SELECT
  id,
  fecha,
  fecha_hora_pago,
  (fecha_hora_pago - fecha) AS diferencia
FROM pedidos p
WHERE 
  (fecha_hora_pago IS NOT NULL) AND
  (fecha_hora_pago - fecha) <= '00:59:59' 
;

-- Pedidos cuyas fechas de pago que si superen la hora
-- y obtener su metodo de pago
SELECT
  p.id,
  fecha,
  fecha_hora_pago,
  (fecha_hora_pago - fecha) AS diferencia,
  pay.nombre
FROM pedidos p
JOIN metodos_pago pay ON pay.id = p.metodos_pago_id
WHERE 
  (fecha_hora_pago IS NOT NULL) AND
  (fecha_hora_pago - fecha) > '00:59:59' 
;

-- Pedidos cuyas fechas de entrega sean previas a un dia
SELECT
  p.id,
  e.numero_seguimiento,
  p.fecha,
  p.fecha_hora_pago,
  e.fecha,
  e.fecha_entrega,
  (e.fecha_entrega - p.fecha) AS diferencia
FROM pedidos p
JOIN envios e ON p.id = e.pedidos_id
WHERE e.estado = 'ENTREGADO' AND (e.fecha_entrega - p.fecha) < '23:59:59'
;


-- Consulta generada
SELECT p.id AS pedido_id, 'PAGO_ANTES_DE_PEDIDO' AS anomalia,
       p.fecha AS fecha_referencia, p.fecha_hora_pago AS fecha_conflicto
FROM pedidos p
WHERE p.fecha_hora_pago < p.fecha

UNION ALL
SELECT e.pedidos_id, 'ENVIO_CREADO_ANTES_DEL_PEDIDO', p.fecha, e.fecha
FROM envios e JOIN pedidos p ON p.id = e.pedidos_id
WHERE e.fecha < p.fecha

UNION ALL
SELECT e.pedidos_id, 'ENVIO_CREADO_ANTES_DEL_PAGO', p.fecha_hora_pago, e.fecha
FROM envios e JOIN pedidos p ON p.id = e.pedidos_id
WHERE p.fecha_hora_pago IS NOT NULL AND e.fecha < p.fecha_hora_pago

UNION ALL
SELECT e.pedidos_id, 'ENTREGA_ANTES_DE_CREAR_ENVIO', e.fecha, e.fecha_entrega
FROM envios e
WHERE e.fecha_entrega < e.fecha

UNION ALL
SELECT e.pedidos_id, 'ENTREGA_ANTES_DEL_PEDIDO', p.fecha, e.fecha_entrega
FROM envios e JOIN pedidos p ON p.id = e.pedidos_id
WHERE e.fecha_entrega < p.fecha

UNION ALL
SELECT e.pedidos_id, 'ENTREGA_ANTES_DEL_PAGO', p.fecha_hora_pago, e.fecha_entrega
FROM envios e JOIN pedidos p ON p.id = e.pedidos_id
WHERE p.fecha_hora_pago IS NOT NULL AND e.fecha_entrega < p.fecha_hora_pago

UNION ALL
SELECT e.pedidos_id, 'ENTREGADO_SIN_PAGO', p.fecha, e.fecha_entrega
FROM envios e JOIN pedidos p ON p.id = e.pedidos_id
WHERE e.estado = 'ENTREGADO' AND p.fecha_hora_pago IS NULL

UNION ALL
SELECT p.id, 'PEDIDO_O_PAGO_EN_EL_FUTURO', now(), GREATEST(p.fecha, p.fecha_hora_pago)
FROM pedidos p
WHERE p.fecha > now() OR p.fecha_hora_pago > now()

ORDER BY pedido_id, anomalia;

/*
    Consistencia de Estados de Envío
Se identifican si hay conflictos con los estados del envio y el
resto de atributos de los propios envios y de los pedidos.

Ejemplo:
1. Si envios.estado = 'ENTREGADO', el campo fecha_entrega no debe ser nulo. 
2. Si el estado es 'PENDIENTE', fecha_entrega debe ser nulo.

Pendiente verificar!
*/
SELECT
    e.id, e.pedidos_id, e.estado, e.fecha, e.fecha_entrega,
    CASE
        WHEN e.estado = 'ENTREGADO' AND e.fecha_entrega IS NULL
            THEN 'ENTREGADO sin fecha_entrega'
        WHEN e.estado = 'PENDIENTE' AND e.fecha_entrega IS NOT NULL
            THEN 'PENDIENTE con fecha_entrega'
    END AS violacion
FROM envios e
WHERE (e.estado = 'ENTREGADO' AND e.fecha_entrega IS NULL)
   OR (e.estado = 'PENDIENTE' AND e.fecha_entrega IS NOT NULL);