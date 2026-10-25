/*

MySQL - 8.0.17 : Database - e-commerce
*********************************************************************

Este es el Script original compartido en la clase de Backend por el
profesor Heriberto Flores Chavez en el Instituto Tecnologico de la
Piedad (TecNM).

Este es material con fines educativos

@Importante:
  No modificar este Script!
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`e-commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `e-commerce`;

/*Table structure for table `categorias` */

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `idx_nombre_fulltext` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de categorías de productos (MyISAM para optimizar lecturas)';

/*Table structure for table `detalles_carrito` */

DROP TABLE IF EXISTS `detalles_carrito`;

CREATE TABLE `detalles_carrito` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `precio` decimal(7,2) unsigned NOT NULL,
  `productos_id` smallint(5) unsigned NOT NULL,
  `usuarios_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_idx` (`productos_id`),
  KEY `fk_usuarios_idx` (`usuarios_id`),
  CONSTRAINT `fk_productos_idx` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_usuarios_idx` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Table structure for table `detalles_pedido` */

DROP TABLE IF EXISTS `detalles_pedido`;

CREATE TABLE `detalles_pedido` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` tinyint(3) unsigned NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `productos_id` smallint(5) unsigned NOT NULL,
  `pedidos_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productos_idx` (`productos_id`),
  KEY `idx_pedido_producto` (`pedidos_id`,`productos_id`),
  CONSTRAINT `fk_detalles_pedido_pedidos` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_detalles_pedido_productos` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `detalles_pedido_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de productos en pedidos (InnoDB para atomicidad)';

/*Table structure for table `domicilios` */

DROP TABLE IF EXISTS `domicilios`;

CREATE TABLE `domicilios` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) NOT NULL,
  `numero` varchar(10) NOT NULL COMMENT 'Ej: 123A, S/N, 456-B',
  `colonia` varchar(30) NOT NULL,
  `cp` char(5) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `usuarios_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_domicilios_usuarios_idx` (`usuarios_id`),
  KEY `idx_estado_ciudad` (`estado`,`ciudad`),
  CONSTRAINT `fk_domicilios_usuarios` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Direcciones de usuarios (InnoDB para relaciones críticas)';

/*Table structure for table `envios` */

DROP TABLE IF EXISTS `envios`;

CREATE TABLE `envios` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_entrega` datetime DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('PENDIENTE','EN_TRANSITO','ENTREGADO','CANCELADO') NOT NULL DEFAULT 'PENDIENTE',
  `numero_seguimiento` varchar(20) NOT NULL,
  `domicilios_id` smallint(5) unsigned NOT NULL,
  `pedidos_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_seguimiento_UNIQUE` (`numero_seguimiento`),
  KEY `idx_estado` (`estado`),
  KEY `idx_fecha_entrega` (`fecha_entrega`),
  KEY `fk_envios_domicilios` (`domicilios_id`),
  KEY `fk_envios_pedidos` (`pedidos_id`),
  CONSTRAINT `fk_envios_domicilios` FOREIGN KEY (`domicilios_id`) REFERENCES `domicilios` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_envios_pedidos` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Gestión de envíos (InnoDB para actualizaciones concurrentes)';

/*Table structure for table `metodos_pago` */

DROP TABLE IF EXISTS `metodos_pago`;

CREATE TABLE `metodos_pago` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `comision` decimal(4,2) NOT NULL DEFAULT '1.50',
  PRIMARY KEY (`id`),
  KEY `idx_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Métodos de pago disponibles (MyISAM para datos estáticos)';

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numero` char(36) NOT NULL COMMENT 'UUID v4',
  `importe_productos` decimal(10,2) NOT NULL,
  `importe_envio` decimal(6,2) NOT NULL,
  `usuarios_id` smallint(5) unsigned NOT NULL,
  `metodos_pago_id` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `fecha_hora_pago` datetime DEFAULT NULL,
  `importe_iva` decimal(7,2) GENERATED ALWAYS AS ((`importe_productos` * 0.16)) STORED,
  `total` decimal(8,2) GENERATED ALWAYS AS (((`importe_productos` + `importe_envio`) + `importe_iva`)) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_UNIQUE` (`numero`),
  KEY `idx_fecha` (`fecha`),
  KEY `idx_usuario_fecha` (`usuarios_id`,`fecha`),
  KEY `fk_pedidos_metodos_pago_idx` (`metodos_pago_id`),
  CONSTRAINT `fk_pedidos_metodos_pago` FOREIGN KEY (`metodos_pago_id`) REFERENCES `metodos_pago` (`id`),
  CONSTRAINT `fk_pedidos_usuarios` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Pedidos principales (InnoDB para transacciones ACID)';

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `precio` decimal(7,2) NOT NULL,
  `sku` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Código único del producto',
  `color` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'desconocido',
  `marca` varchar(20) NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `peso` decimal(5,1) NOT NULL COMMENT 'En kilogramos',
  `alto` decimal(5,1) NOT NULL DEFAULT '0.0',
  `ancho` decimal(5,1) NOT NULL DEFAULT '0.0',
  `profundidad` decimal(5,1) NOT NULL DEFAULT '0.0',
  `categorias_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_UNIQUE` (`sku`),
  KEY `idx_marca` (`marca`),
  KEY `idx_precio` (`precio`),
  KEY `fk_productos_categorias_idx` (`categorias_id`),
  FULLTEXT KEY `idx_nombre_desc_fulltext` (`nombre`,`descripcion`),
  CONSTRAINT `fk_productos_categorias` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Productos del sistema (InnoDB para consistencia de inventario)';

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` char(10) NOT NULL,
  `sexo` enum('H','M') NOT NULL COMMENT 'H: Hombre, M: Mujer',
  `fecha_nacimiento` date NOT NULL,
  `contrasena` char(60) NOT NULL COMMENT 'Hash BCrypt',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `idx_email_unico` (`email`),
  KEY `idx_fecha_registro` (`fecha_registro`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Usuarios del sistema (InnoDB para integridad transaccional)';

/*Table structure for table `vista_envios_pendientes` */

DROP TABLE IF EXISTS `vista_envios_pendientes`;

/*!50001 DROP VIEW IF EXISTS `vista_envios_pendientes` */;
/*!50001 DROP TABLE IF EXISTS `vista_envios_pendientes` */;

/*!50001 CREATE TABLE  `vista_envios_pendientes`(
 `id` smallint(5) unsigned ,
 `seguimiento_formateado` varchar(33) ,
 `cliente` varchar(45) ,
 `email` varchar(60) ,
 `direccion_completa` varchar(104) ,
 `valor_pedido` decimal(8,2) ,
 `dias_pendiente` int(7) 
)*/;

/*Table structure for table `vista_estadisticas_ventas` */

DROP TABLE IF EXISTS `vista_estadisticas_ventas`;

/*!50001 DROP VIEW IF EXISTS `vista_estadisticas_ventas` */;
/*!50001 DROP TABLE IF EXISTS `vista_estadisticas_ventas` */;

/*!50001 CREATE TABLE  `vista_estadisticas_ventas`(
 `año` int(5) ,
 `mes` int(2) ,
 `total_pedidos` bigint(21) ,
 `ingresos_totales` decimal(30,2) ,
 `ticket_promedio` decimal(12,6) ,
 `venta_minima` decimal(8,2) ,
 `venta_maxima` decimal(8,2) 
)*/;

/*Table structure for table `vista_inventario_optimizado` */

DROP TABLE IF EXISTS `vista_inventario_optimizado`;

/*!50001 DROP VIEW IF EXISTS `vista_inventario_optimizado` */;
/*!50001 DROP TABLE IF EXISTS `vista_inventario_optimizado` */;

/*!50001 CREATE TABLE  `vista_inventario_optimizado`(
 `categoria` varchar(40) ,
 `total_productos` bigint(21) ,
 `precio_promedio` decimal(11,6) 
)*/;

/*Table structure for table `vista_pedidos_atencion` */

DROP TABLE IF EXISTS `vista_pedidos_atencion`;

/*!50001 DROP VIEW IF EXISTS `vista_pedidos_atencion` */;
/*!50001 DROP TABLE IF EXISTS `vista_pedidos_atencion` */;

/*!50001 CREATE TABLE  `vista_pedidos_atencion`(
 `id` smallint(5) unsigned ,
 `numero` char(36) ,
 `usuarios_id` smallint(5) unsigned ,
 `importe_productos` decimal(10,2) ,
 `importe_envio` decimal(6,2) ,
 `fecha` datetime 
)*/;

/*Table structure for table `vista_productos_gestion` */

DROP TABLE IF EXISTS `vista_productos_gestion`;

/*!50001 DROP VIEW IF EXISTS `vista_productos_gestion` */;
/*!50001 DROP TABLE IF EXISTS `vista_productos_gestion` */;

/*!50001 CREATE TABLE  `vista_productos_gestion`(
 `id` smallint(5) unsigned ,
 `nombre` varchar(60) ,
 `precio` decimal(7,2) ,
 `peso` decimal(5,1) ,
 `sku` char(15) ,
 `marca` varchar(20) ,
 `categorias_id` tinyint(3) unsigned 
)*/;

/*Table structure for table `vista_productos_premium` */

DROP TABLE IF EXISTS `vista_productos_premium`;

/*!50001 DROP VIEW IF EXISTS `vista_productos_premium` */;
/*!50001 DROP TABLE IF EXISTS `vista_productos_premium` */;

/*!50001 CREATE TABLE  `vista_productos_premium`(
 `nombre` varchar(60) ,
 `precio` decimal(7,2) ,
 `nombre_categoria` varchar(40) ,
 `marca` varchar(20) 
)*/;

/*Table structure for table `vista_rendimiento_categorias` */

DROP TABLE IF EXISTS `vista_rendimiento_categorias`;

/*!50001 DROP VIEW IF EXISTS `vista_rendimiento_categorias` */;
/*!50001 DROP TABLE IF EXISTS `vista_rendimiento_categorias` */;

/*!50001 CREATE TABLE  `vista_rendimiento_categorias`(
 `categoria` varchar(40) ,
 `productos_activos` bigint(21) ,
 `unidades_vendidas` bigint(21) ,
 `ingresos_totales` decimal(32,2) ,
 `precio_promedio` decimal(11,6) ,
 `producto_mas_caro` decimal(7,2) ,
 `producto_mas_barato` decimal(7,2) ,
 `valor_promedio_pedido` decimal(33,2) 
)*/;

/*Table structure for table `vista_resumen_pedidos` */

DROP TABLE IF EXISTS `vista_resumen_pedidos`;

/*!50001 DROP VIEW IF EXISTS `vista_resumen_pedidos` */;
/*!50001 DROP TABLE IF EXISTS `vista_resumen_pedidos` */;

/*!50001 CREATE TABLE  `vista_resumen_pedidos`(
 `id` smallint(5) unsigned ,
 `numero` char(36) ,
 `cliente` varchar(45) ,
 `metodo_pago` varchar(25) ,
 `total` decimal(8,2) ,
 `fecha` datetime 
)*/;

/*View structure for view vista_envios_pendientes */

/*!50001 DROP TABLE IF EXISTS `vista_envios_pendientes` */;
/*!50001 DROP VIEW IF EXISTS `vista_envios_pendientes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_envios_pendientes` AS select `e`.`id` AS `id`,concat('Seguimiento: ',`e`.`numero_seguimiento`) AS `seguimiento_formateado`,`u`.`nombre` AS `cliente`,`u`.`email` AS `email`,concat(`d`.`calle`,', ',`d`.`numero`,', ',`d`.`ciudad`) AS `direccion_completa`,`p`.`total` AS `valor_pedido`,(to_days(now()) - to_days(`e`.`fecha`)) AS `dias_pendiente` from (((`envios` `e` join `pedidos` `p` on((`e`.`pedidos_id` = `p`.`id`))) join `usuarios` `u` on((`p`.`usuarios_id` = `u`.`id`))) join `domicilios` `d` on((`e`.`domicilios_id` = `d`.`id`))) where (`e`.`estado` = 'PENDIENTE') */;

/*View structure for view vista_estadisticas_ventas */

/*!50001 DROP TABLE IF EXISTS `vista_estadisticas_ventas` */;
/*!50001 DROP VIEW IF EXISTS `vista_estadisticas_ventas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_estadisticas_ventas` AS select year(`p`.`fecha`) AS `a├▒o`,month(`p`.`fecha`) AS `mes`,count(0) AS `total_pedidos`,sum(`p`.`total`) AS `ingresos_totales`,avg(`p`.`total`) AS `ticket_promedio`,min(`p`.`total`) AS `venta_minima`,max(`p`.`total`) AS `venta_maxima` from `pedidos` `p` where (`p`.`fecha` >= '2025-01-01') group by year(`p`.`fecha`),month(`p`.`fecha`) order by `a├▒o` desc,`mes` desc */;

/*View structure for view vista_inventario_optimizado */

/*!50001 DROP TABLE IF EXISTS `vista_inventario_optimizado` */;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_optimizado` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_inventario_optimizado` AS select `c`.`nombre` AS `categoria`,count(0) AS `total_productos`,avg(`p`.`precio`) AS `precio_promedio` from (`productos` `p` join `categorias` `c` on((`p`.`categorias_id` = `c`.`id`))) group by `c`.`nombre` */;

/*View structure for view vista_pedidos_atencion */

/*!50001 DROP TABLE IF EXISTS `vista_pedidos_atencion` */;
/*!50001 DROP VIEW IF EXISTS `vista_pedidos_atencion` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_pedidos_atencion` AS select `pedidos`.`id` AS `id`,`pedidos`.`numero` AS `numero`,`pedidos`.`usuarios_id` AS `usuarios_id`,`pedidos`.`importe_productos` AS `importe_productos`,`pedidos`.`importe_envio` AS `importe_envio`,`pedidos`.`fecha` AS `fecha` from `pedidos` where (`pedidos`.`fecha` >= '2025-01-01') WITH CASCADED CHECK OPTION */;

/*View structure for view vista_productos_gestion */

/*!50001 DROP TABLE IF EXISTS `vista_productos_gestion` */;
/*!50001 DROP VIEW IF EXISTS `vista_productos_gestion` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_productos_gestion` AS select `productos`.`id` AS `id`,`productos`.`nombre` AS `nombre`,`productos`.`precio` AS `precio`,`productos`.`peso` AS `peso`,`productos`.`sku` AS `sku`,`productos`.`marca` AS `marca`,`productos`.`categorias_id` AS `categorias_id` from `productos` where (`productos`.`precio` > 0) */;

/*View structure for view vista_productos_premium */

/*!50001 DROP TABLE IF EXISTS `vista_productos_premium` */;
/*!50001 DROP VIEW IF EXISTS `vista_productos_premium` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_productos_premium` AS select `p`.`nombre` AS `nombre`,`p`.`precio` AS `precio`,`c`.`nombre` AS `nombre_categoria`,`p`.`marca` AS `marca` from (`productos` `p` join `categorias` `c` on((`p`.`categorias_id` = `c`.`id`))) where (`p`.`precio` >= 5000) order by `p`.`precio` desc */;

/*View structure for view vista_rendimiento_categorias */

/*!50001 DROP TABLE IF EXISTS `vista_rendimiento_categorias` */;
/*!50001 DROP VIEW IF EXISTS `vista_rendimiento_categorias` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_rendimiento_categorias` AS select `c`.`nombre` AS `categoria`,count(distinct `p`.`id`) AS `productos_activos`,count(`dp`.`productos_id`) AS `unidades_vendidas`,sum((`dp`.`precio` * `dp`.`cantidad`)) AS `ingresos_totales`,avg(`dp`.`precio`) AS `precio_promedio`,max(`dp`.`precio`) AS `producto_mas_caro`,min(`dp`.`precio`) AS `producto_mas_barato`,round((sum((`dp`.`precio` * `dp`.`cantidad`)) / count(distinct `ped`.`id`)),2) AS `valor_promedio_pedido` from (((`categorias` `c` left join `productos` `p` on((`c`.`id` = `p`.`categorias_id`))) left join `detalles_pedido` `dp` on((`p`.`id` = `dp`.`productos_id`))) left join `pedidos` `ped` on((`dp`.`pedidos_id` = `ped`.`id`))) group by `c`.`id`,`c`.`nombre` having (`ingresos_totales` > 0) order by `ingresos_totales` desc */;

/*View structure for view vista_resumen_pedidos */

/*!50001 DROP TABLE IF EXISTS `vista_resumen_pedidos` */;
/*!50001 DROP VIEW IF EXISTS `vista_resumen_pedidos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_resumen_pedidos` AS select `p`.`id` AS `id`,`p`.`numero` AS `numero`,`u`.`nombre` AS `cliente`,`mp`.`nombre` AS `metodo_pago`,`p`.`total` AS `total`,`p`.`fecha` AS `fecha` from ((`pedidos` `p` join `usuarios` `u` on((`p`.`usuarios_id` = `u`.`id`))) join `metodos_pago` `mp` on((`p`.`metodos_pago_id` = `mp`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;