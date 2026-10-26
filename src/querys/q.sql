/*
    Consultas de domicilios
*/
-- domicilios de los usuarios
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
SELECT 
    u.id, 
    u.nombre,
    u.email
FROM public.usuarios u
LEFT JOIN public.domicilios d ON d.usuarios_id = u.id
WHERE d.id IS NULL;

-- Cantidad de domicilios registrados por un usuario
SELECT 
    u.nombre, 
    COUNT(d.id) AS total
FROM public.usuarios u
LEFT JOIN public.domicilios d ON d.usuarios_id = u.id
GROUP BY u.nombre
ORDER BY total DESC;

/*
    Consultas sobre los pedidos
*/

-- Lista de pedidos realizados
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

-- Envios entregados
SELECT 
    u.nombre,
    u.email,
    d.numero,
    d.calle,
    d.colonia,
    d.ciudad,
    d.cp,
    en.numero_seguimiento,
    p.total,
    en.fecha_entrega
FROM pedidos p
JOIN envios en ON p.id = en.pedidos_id
JOIN domicilios d ON d.id = en.domicilios_id
JOIN usuarios u ON u.id = d.usuarios_id
WHERE en.estado = 'ENTREGADO'
;

/*
    Consultas del carrito
*/
-- Productos que un usuario tiene en el carrito
SELECT
    car.cantidad,    
    p.nombre,
    p.precio AS precio_unitario,
    (car.cantidad * p.precio) AS importe
FROM usuarios u
JOIN detalles_carrito car ON u.id = car.usuarios_id
JOIN productos p ON p.id = car.productos_id
WHERE u.nombre LIKE 'Laura Sánchez Rodríguez';

-- Total a pagar en los carritos de los usuarios
SELECT
    u.nombre,
    SUM(car.cantidad) AS cantidad_productos,
    SUM(p.precio * car.cantidad) AS importe
FROM usuarios u
JOIN detalles_carrito car ON u.id = car.usuarios_id
JOIN productos p ON p.id = car.productos_id
GROUP BY u.nombre
;

-- Productos mas agregados en el carrito
SELECT
    p.nombre,
    SUM(car.cantidad) AS cantidad
FROM productos p
JOIN detalles_carrito car ON p.id = car.productos_id
GROUP BY p.nombre
ORDER BY cantidad DESC
;

-- productos que no han sido agregados ningun carrito
SELECT
    p.nombre
FROM productos p
LEFT JOIN detalles_carrito car ON p.id = car.productos_id
WHERE car.id IS NULL
GROUP BY p.nombre
ORDER BY cantidad DESC
;