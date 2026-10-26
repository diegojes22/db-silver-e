
/*

*/
-- Eliminacion de tablas (de las mas debiles a las mas fuertes)
DROP TABLE detalles_carrito;
DROP TABLE envios;
DROP TABLE detalles_pedido;
DROP TABLE pedidos;
DROP TABLE productos;
DROP TABLE categorias;
DROP TABLE metodos_pago;
DROP TABLE domicilios;
DROP TABLE usuarios;

-- Eliminacion unicamente del contenido de las tablas
DELETE FROM detalles_carrito;
DELETE FROM envios;
DELETE FROM detalles_pedido;
DELETE FROM pedidos;
DELETE FROM productos;
DELETE FROM categorias;
DELETE FROM metodos_pago;
DELETE FROM domicilios;
DELETE FROM usuarios;