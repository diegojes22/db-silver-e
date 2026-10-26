/* 
Luego nombrare este archivo a algo mas especifico,
solo lo hice para guardar las consultas que validan
los domicilios de los usuarios
*/
-- domicilios de un usuario
SELECT
    usr.nombre,
    usr.email,
    dom.numero,
    dom.calle,
    dom.ciudad,
    dom.estado
FROM usuarios usr
JOIN domicilios dom ON usr.id = dom.usuarios_id;

-- domicilio de un usuario en especifico
SELECT
    dom.id,
    dom.numero,
    dom.calle,
    dom.ciudad,
    dom.estado
FROM usuarios usr
JOIN domicilios dom ON usr.id = dom.usuarios_id
WHERE usr.nombre LIKE 'Marta Sánchez González';

-- Usuarios sin domicilio
SELECT u.id, u.nombre
FROM public.usuarios u
LEFT JOIN public.domicilios d ON d.usuarios_id = u.id
WHERE d.id IS NULL;

-- Domicilios por usuario
SELECT u.nombre, count(*) AS total
FROM public.usuarios u
JOIN public.domicilios d ON d.usuarios_id = u.id
GROUP BY u.nombre
ORDER BY total DESC;


-- Lista de pedidos
SELECT 
    usr.nombre,
    usr.telefono,
    pd.numero,
    pd.fecha_hora_pago,
    pd.importe_productos,
    pd.importe_envio,
    pd.importe_iva,
    pd.total
FROM usuarios usr
JOIN pedidos pd ON usr.id = pd.usuarios_id
JOIN metodos_pago pay ON pay.id = pd.metodos_pago_id
;

-- productos de un pedido en especifico
SELECT 
    dpd.cantidad,
    pro.nombre,
    pro.precio,
    pro.descripcion,
    dpd.cantidad * pro.precio AS importe_producto
FROM pedidos pd
JOIN detalles_pedido dpd ON pd.id = dpd.pedidos_id
JOIN productos pro ON pro.id = dpd.productos_id
WHERE pd.id = 'a81396a1-7ff9-470b-b82d-a3bfaf7fae70';
