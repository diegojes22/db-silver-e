/*

PostgreSQL AND Supabase : Database - e-commerce
*********************************************************************

Este es el Script original compartido en la clase de Backend por el
profesor Heriberto Flores Chavez en el Instituto Tecnologico de la
Piedad (TecNM).

Este es material con fines educativos cuya fuente original es el Script
base MySQL. Este Script es exclusivo para bases de datos tipo PostgreSQL

Crear la DB en una instancia local: 
  Para cargar este Script en una instancia local de PostgreSQL es necsario
  crear una base de datos local dentro de PostgreSQL. Tras esto y antes de
  ejecutar el script, cambia el nombre `public` de todas las tablas por el
  nombre de la DB creada. Para esto usa el archivo `src/tmp.sql` y una vez
  este echo carga dicho Script a PostgreSQL y ejecutalo; debe funcionar
  correctamente.

@Nota:
  Queda pendiente ajustar los tipos de datos de la DB en base a los tipos
  de datos en el Script original para MySQL
  ATTE: diego. 25 oct 26 23:00
*/

/* Crear enums */
CREATE TYPE estados_envios AS ENUM ('PENDIENTE', 'EN_TRANSITO', 'ENTREGADO', 'CANCELADO');
CREATE TYPE generos AS ENUM ('MASCULINO', 'FEMENINO', 'NO_BINARIE');                        -- Espero que esto no genere polemica >:/

/* Crear entidades fuertes */
CREATE TABLE public.categorias (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre character varying NOT NULL,
  CONSTRAINT categorias_pkey PRIMARY KEY (id)
);

CREATE TABLE public.usuarios (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre VARCHAR(60) varying NOT NULL,
  email character varying NOT NULL UNIQUE,
  telefono character NOT NULL,
  sexo USER-DEFINED NOT NULL,
  fecha_nacimiento date NOT NULL,
  contrasena VARCHAR(64) NOT NULL,        
  fecha_registro timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);

CREATE TABLE public.metodos_pago (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre character varying NOT NULL,
  comision numeric NOT NULL DEFAULT 1.50,       -- La comision esta en porcentaje, con valores de 0 a 100
  CONSTRAINT metodos_pago_pkey PRIMARY KEY (id)
);

/* Crear entidades debiles */
CREATE TABLE public.productos (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre character varying NOT NULL,
  precio numeric NOT NULL,
  sku VARCHAR(15) NOT NULL UNIQUE,
  color character varying NOT NULL DEFAULT 'desconocido'::character varying,
  marca character varying NOT NULL,
  descripcion text,
  peso numeric NOT NULL,
  alto numeric NOT NULL DEFAULT 0.0,
  ancho numeric NOT NULL DEFAULT 0.0,
  profundidad numeric NOT NULL DEFAULT 0.0,
  categorias_id uuid NOT NULL,
  CONSTRAINT productos_pkey PRIMARY KEY (id),
  CONSTRAINT fk_productos_categorias FOREIGN KEY (categorias_id) REFERENCES public.categorias(id)
);

CREATE TABLE public.domicilios (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  calle character varying NOT NULL,
  numero character varying NOT NULL,
  colonia character varying NOT NULL,
  cp character NOT NULL,
  estado character varying NOT NULL,
  ciudad character varying NOT NULL,
  usuarios_id uuid NOT NULL,
  CONSTRAINT domicilios_pkey PRIMARY KEY (id),
  CONSTRAINT fk_domicilios_usuarios FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id)
);

/* Entidades debiles con mayor actividad */
CREATE TABLE public.pedidos (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  fecha timestamp with time zone NOT NULL DEFAULT now(),
  numero uuid NOT NULL DEFAULT gen_random_uuid() UNIQUE,
  importe_productos numeric NOT NULL,
  importe_envio numeric NOT NULL,
  usuarios_id uuid NOT NULL,
  metodos_pago_id uuid NOT NULL,
  fecha_hora_pago timestamp with time zone,
  importe_iva numeric GENERATED ALWAYS AS (round(importe_productos * 0.16, 2)) STORED,                                  -- esto fue cambiado para evitar errores al replicar la DB en Posgres
  total numeric GENERATED ALWAYS AS (importe_productos + importe_envio + round(importe_productos * 0.16, 2)) STORED,    -- aqui tambien . . .
  CONSTRAINT pedidos_pkey PRIMARY KEY (id),
  CONSTRAINT fk_pedidos_metodos_pago FOREIGN KEY (metodos_pago_id) REFERENCES public.metodos_pago(id),
  CONSTRAINT fk_pedidos_usuarios FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id)
);

CREATE TABLE public.detalles_pedido (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  cantidad smallint NOT NULL CHECK (cantidad > 0),
  precio numeric NOT NULL,
  productos_id uuid NOT NULL,
  pedidos_id uuid NOT NULL,
  CONSTRAINT detalles_pedido_pkey PRIMARY KEY (id),
  CONSTRAINT fk_detalles_pedido_pedidos FOREIGN KEY (pedidos_id) REFERENCES public.pedidos(id),
  CONSTRAINT fk_detalles_pedido_productos FOREIGN KEY (productos_id) REFERENCES public.productos(id)
);

CREATE TABLE public.detalles_carrito (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  cantidad smallint NOT NULL DEFAULT 1 CHECK (cantidad >= 0),
  precio numeric NOT NULL CHECK (precio >= 0::numeric),
  productos_id uuid NOT NULL,
  usuarios_id uuid NOT NULL,
  CONSTRAINT detalles_carrito_pkey PRIMARY KEY (id),
  CONSTRAINT fk_detalles_carrito_productos FOREIGN KEY (productos_id) REFERENCES public.productos(id),
  CONSTRAINT fk_detalles_carrito_usuarios FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id)
);

CREATE TABLE public.envios (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  fecha_entrega timestamp with time zone,
  fecha timestamp with time zone NOT NULL DEFAULT now(),
  estado USER-DEFINED NOT NULL DEFAULT 'PENDIENTE'::estado_envio,
  numero_seguimiento character varying NOT NULL UNIQUE,
  domicilios_id uuid NOT NULL,
  pedidos_id uuid NOT NULL,
  CONSTRAINT envios_pkey PRIMARY KEY (id),
  CONSTRAINT fk_envios_domicilios FOREIGN KEY (domicilios_id) REFERENCES public.domicilios(id),
  CONSTRAINT fk_envios_pedidos FOREIGN KEY (pedidos_id) REFERENCES public.pedidos(id)
);

/*
  Si llegaste hasta aqui es necesario mencionar las unidades empleadas 
  para la base de datos:
  1. Los precios se manejan en pesos mexicanos.
  2. el peso de los productos se maneja en kilogramos.
  3. las medidas de los productos (ancho, alto y profundidad) estan en metros.

  En general, la base de datos esta pensada para una app en Mexico.
*/
