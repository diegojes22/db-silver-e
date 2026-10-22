/*

PostgreSQL AND Supabase : Database - e-commerce
*********************************************************************

Este es el Script original compartido en la clase de Backend por el
profesor Heriberto Flores Chavez en el Instituto Tecnologico de la
Piedad (TecNM).

Este es material con fines educativos cuya fuente original es el Script
base MySQL. Este Script es exclusivo para bases de datos tipo PostgreSQL
*/

-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.categorias (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre character varying NOT NULL,
  CONSTRAINT categorias_pkey PRIMARY KEY (id)
);
CREATE TABLE public.usuarios (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre character varying NOT NULL,
  email character varying NOT NULL UNIQUE,
  telefono character NOT NULL,
  sexo USER-DEFINED NOT NULL,
  fecha_nacimiento date NOT NULL,
  contrasena character NOT NULL,
  fecha_registro timestamp with time zone NOT NULL DEFAULT now(),
  CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);
CREATE TABLE public.metodos_pago (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre character varying NOT NULL,
  comision numeric NOT NULL DEFAULT 1.50,
  CONSTRAINT metodos_pago_pkey PRIMARY KEY (id)
);
CREATE TABLE public.productos (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  nombre character varying NOT NULL,
  precio numeric NOT NULL,
  sku character NOT NULL UNIQUE,
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
CREATE TABLE public.pedidos (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  fecha timestamp with time zone NOT NULL DEFAULT now(),
  numero uuid NOT NULL DEFAULT gen_random_uuid() UNIQUE,
  importe_productos numeric NOT NULL,
  importe_envio numeric NOT NULL,
  usuarios_id uuid NOT NULL,
  metodos_pago_id uuid NOT NULL,
  fecha_hora_pago timestamp with time zone,
  importe_iva numeric DEFAULT round((importe_productos * 0.16), 2),
  total numeric DEFAULT ((importe_productos + importe_envio) + round((importe_productos * 0.16), 2)),
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