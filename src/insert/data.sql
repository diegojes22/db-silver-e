/*
Silver Team

PostgreSQL AND Supabase : Database - e-commerce
*********************************************************************

Script de llenado de la base de datos.

Esta base de datos tendra una tematica de una tienda de electronica
(similar a Steren para que se hagan una idea), por los que las
entidades relacionadas con los prodocutos y sus catgorias se relacionan
con dicha tematica.

@Importante
  Ninguno de los datos aqui presentes es real, todos los registros son
  datos inventados (dummy) empleados en la validacion del modelo.

Este Script es mas autogenerado y sirve para realizar pruebas de forma
rapida. Se recomienda utilizar `./data2.sql` ya que el control y
consistencia de los datos precisa, lo que lo vuelve perfecto para pruebas
detalladas y validacion del modelo.
*/

/*
            USUARIOS
Registros insertados: 100

@Nota:
    Si queremos ingresar contrasenas hasheadas, el campo de contrasena debe admitir al menos 64
    caracteres parta guardar dicho hash. 
    FROM: diego. 22 oct 26 22:50
*/
INSERT INTO usuarios (nombre, email, telefono, sexo, fecha_nacimiento, contrasena) VALUES
    ('Gerardo Vargas Díaz', 'gerardo.diaz@outlook.com', '5554016400', 'H', '1989-12-03', '1234'),
    ('Héctor Cruz Jiménez', 'hcruz39@email.com', '5558240084', 'H', '1971-04-30', '1234'),
    ('Carmen Cortés Vargas', 'carmencortes54@outlook.com', '5551657262', 'M', '2006-10-22', '1234'),
    ('Valeria Herrera Salazar', 'valeria_herrera54@gmail.com', '5553815614', 'M', '2003-08-28', '1234'),
    ('Marta Sánchez González', 'marta.gonzalez@hotmail.com', '5558148932', 'M', '1993-07-18', '1234'),
    ('Jorge Morales Romero', 'jorge_morales72@hotmail.com', '5557770143', 'H', '1996-04-12', '1234'),
    ('Andrés Reyes Navarrete', 'reyesN12@hotmail.com', '5553289900', 'H', '1989-11-03', '1234'),
    ('Laura Sánchez Rodríguez', 'laura.rodriguez@hotmail.com', '5551034131', 'M', '1994-02-06', '1234'),
    ('Gerardo Flores Ramos', 'gerardoflores71@outlook.com', '5551317127', 'H', '1986-03-08', '1234'),
    ('Andrea Cruz Hernández', 'andrea_cruz90@gmail.com', '5556120047', 'M', '1970-06-02', '1234'),
    ('Fernando Martínez Pérez', 'fernandomartinez88@email.com', '5558451462', 'H', '2000-09-14', '1234'),
    ('Hugo Gómez Mendoza', 'hugogomez96@yahoo.com.mx', '5552337498', 'H', '1985-05-22', '1234'),
    ('Gabriela Medina Guerrero', 'gabriela_medina72@email.com', '5551128059', 'M', '1973-04-14', '1234'),
    ('Claudia Flores Jiménez', 'claudia.jimenez@gmail.com', '5559910229', 'M', '1964-06-18', '1234'),
    ('Arturo Ruiz Navarro', 'arturoruiz98@yahoo.com.mx', '5556705466', 'H', '1979-10-14', '1234'),
    ('Nicolas Paredes Barrera', 'nicoParedes55@email.com', '5554336678', 'H', '1994-06-12', '1234'),
    ('Rosa Herrera López', 'rosa.lopez@gmail.com', '5555198327', 'M', '1980-02-13', '1234'),
    ('Daniela Morales Núñez', 'daniela_morales73@hotmail.com', '5552219693', 'M', '2004-08-24', '1234'),
    ('Alejandra González Herrera', 'alejandragonzalez98@email.com', '5557240050', 'M', '1986-04-27', '1234'),
    ('Fernanda Ramos Soto', 'fernandaramos86@yahoo.com.mx', '5554124118', 'M', '1973-12-11', '1234'),
    ('Sofía Sánchez Guerrero', 'ssanchez56@outlook.com', '5553657661', 'M', '1988-01-15', '1234'),
    ('Héctor Jiménez Martínez', 'hector.martinez@hotmail.com', '5551586923', 'H', '1974-07-30', '1234'),
    ('Alejandro Romero Núñez', 'alejandroromero96@email.com', '5557758917', 'H', '2005-03-14', '1234'),
    ('Paula Gómez Pérez', 'paulagomez85@outlook.com', '5555667010', 'M', '1996-02-14', '1234'),
    ('José Hernández González', 'jose_hernandez75@outlook.com', '5555328710', 'H', '1969-11-01', '1234'),
    ('Jorge Salazar Hernández', 'jsalazar17@outlook.com', '5558248963', 'H', '1978-01-17', '1234'),
    ('Daniel Martínez Herrera', 'danielmartinez67@yahoo.com.mx', '5553561595', 'H', '1971-03-07', '1234'),
    ('Patricia González Fernández', 'lapatri_xX@email.com', '5558765412', 'M', '1992-02-27', '1234'),
    ('Andrea Ortiz Rodríguez', 'andreaortiz30@yahoo.com.mx', '5559049027', 'M', '2006-07-23', '1234'),
    ('Rosa Ramos Cruz', 'rramos4@hotmail.com', '5556541458', 'M', '1995-11-09', '1234'),
    ('Roberto Rodríguez Campos', 'robertorodriguez45@hotmail.com', '5551003309', 'H', '1973-09-02', '1234'),
    ('Julián González Romero', 'julian.romero@hotmail.com', '5555346247', 'H', '1988-05-13', '1234'),
    ('Daniel Torres Ramírez', 'daniel.ramirez@email.com', '5550205395', 'H', '1961-06-01', '1234'),
    ('Claudia Cortés Gutiérrez', 'claudiacortes37@gmail.com', '5559972787', 'M', '1990-12-18', '1234'),
    ('Natalia Soto Vargas', 'nataliasoto97@hotmail.com', '5554332003', 'M', '2002-08-17', '1234'),
    ('Paula Vega Vega', 'pvega59@yahoo.com.mx', '5552639821', 'M', '1984-10-13', '1234'),
    ('Daniela Aguilar Rivera', 'danielaaguilar34@outlook.com', '5555375564', 'M', '1997-10-26', '1234'),
    ('Lorena Ramos Vargas', 'lorena.vargas@hotmail.com', '5552961201', 'M', '1979-04-20', '1234'),
    ('Claudia Rodríguez Salazar', 'claudia.salazar@outlook.com', '5553545494', 'M', '1960-11-28', '1234'),
    ('Antonio López Ramírez', 'antoniolopez77@gmail.com', '5557015430', 'H', '1981-08-10', '1234'),
    ('Regina Álvarez Guerrero', 'reginaalvarez59@email.com', '5555451680', 'M', '2001-06-12', '1234'),
    ('Sofía García Ríos', 'sofia.rios@outlook.com', '5557520471', 'M', '1965-11-11', '1234'),
    ('Natalia Ramos Romero', 'natalia.romero@gmail.com', '5558236629', 'M', '1986-12-31', '1234'),
    ('Isabel Fernández Pérez', 'isabel.perez@hotmail.com', '5556542351', 'M', '1968-04-27', '1234'),
    ('Regina Sánchez Ríos', 'rsanchez60@gmail.com', '5555299124', 'M', '1969-09-12', '1234'),
    ('Gabriela Ramírez Ruiz', 'gramirez65@yahoo.com.mx', '5555160607', 'M', '1966-12-26', '1234'),
    ('Regina Navarro Jiménez', 'regina_navarro71@yahoo.com.mx', '5555685574', 'M', '1987-07-05', '1234'),
    ('Natalia Cortés Gutiérrez', 'ncortes33@outlook.com', '5554517123', 'M', '1995-08-27', '1234'),
    ('Gabriela Vega Medina', 'gabriela.medina@hotmail.com', '5554873471', 'M', '1985-08-19', '1234'),
    ('Carlos Asencio Hidalgo', 'Xx_AOX_Charritas_xX@email.com', '5558765413', 'H', '1985-09-18', '1234'),
    ('Gabriel Romero Ríos', 'gromero92@outlook.com', '5557632016', 'H', '1979-08-19', '1234'),
    ('Fernanda Jiménez Sánchez', 'fernanda.sanchez@hotmail.com', '5556899809', 'M', '1983-12-29', '1234'),
    ('Sergio Gómez Gómez', 'sergio_gomez18@outlook.com', '5552473178', 'H', '1968-10-13', '1234'),
    ('Hugo Núñez Ramos', 'hugo_nunez83@email.com', '5550766177', 'H', '1966-08-05', '1234'),
    ('Luis Aguilar Soto', 'luisaguilar10@yahoo.com.mx', '5553842513', 'H', '1993-02-24', '1234'),
    ('Rosa Torres Vega', 'rosatorres12@email.com', '5551615280', 'M', '1989-07-28', '1234'),
    ('Regina Jiménez Medina', 'regina_jimenez16@hotmail.com', '5553150983', 'M', '1979-10-04', '1234'),
    ('Francisco Hernández Flores', 'franciscohernandez53@outlook.com', '5559740344', 'H', '2000-09-24', '1234'),
    ('Beatriz Herrera Guerrero', 'beatriz_herrera20@hotmail.com', '5554309805', 'M', '1965-02-16', '1234'),
    ('Alejandro Cortés Navarro', 'alejandro.navarro@outlook.com', '5551870262', 'H', '1966-09-17', '1234'),
    ('Rosa Torres Morales', 'rosatorres19@gmail.com', '5553292127', 'M', '2001-08-15', '1234'),
    ('Gabriela Navarro Herrera', 'gabriela_navarro12@outlook.com', '5555655125', 'M', '1996-12-05', '1234'),
    ('María Sánchez Ortiz', 'msanchez75@gmail.com', '5550196556', 'M', '2005-11-18', '1234'),
    ('Valeria Mendoza Gómez', 'vmendoza74@outlook.com', '5553605766', 'M', '1973-08-24', '1234'),
    ('Mario López Torres', 'mlopez73@gmail.com', '5551318699', 'H', '1980-03-31', '1234'),
    ('Arturo Rodríguez Rivera', 'arturo.rivera@hotmail.com', '5554216073', 'H', '1977-11-26', '1234'),
    ('Alejandra Jiménez Pérez', 'alejandra.perez@gmail.com', '5550643171', 'M', '1979-01-11', '1234'),
    ('Jorge Morales Flores', 'jorge_morales63@outlook.com', '5553602606', 'H', '1983-10-17', '1234'),
    ('María Álvarez Gutiérrez', 'mariaalvarez73@email.com', '5559743953', 'M', '1977-01-21', '1234'),
    ('Elena Pérez Gómez', 'elena_perez35@yahoo.com.mx', '5553503056', 'M', '1984-01-08', '1234'),
    ('Paula Salazar Rodríguez', 'paula_salazar44@outlook.com', '5552729806', 'M', '1962-06-07', '1234'),
    ('Silvia Rodríguez Fernández', 'srodriguez88@outlook.com', '5559166978', 'M', '1982-07-22', '1234'),
    ('Raúl Aguilar Jiménez', 'raul_aguilar76@hotmail.com', '5556179640', 'H', '1993-03-29', '1234'),
    ('Lucía Cruz Álvarez', 'luciacruz1@hotmail.com', '5554324451', 'M', '1960-09-10', '1234'),
    ('Sergio Hernández Martínez', 'sergio.martinez@yahoo.com.mx', '5553473829', 'H', '2002-05-28', '1234'),
    ('Andrea Torres Hernández', 'atorres36@yahoo.com.mx', '5559856984', 'M', '2000-09-14', '1234'),
    ('Valeria Sánchez Aguilar', 'valeria.aguilar@outlook.com', '5554887719', 'M', '1963-07-30', '1234'),
    ('Claudia Campos González', 'ccampos20@hotmail.com', '5556231665', 'M', '2001-10-19', '1234'),
    ('Natalia Núñez Flores', 'natalianunez66@email.com', '5552191361', 'M', '1982-02-01', '1234'),
    ('Sergio Aguilar Ortiz', 'sergio_aguilar33@email.com', '5557482175', 'H', '1986-11-02', '1234'),
    ('Diana Álvarez Romero', 'diana.romero@outlook.com', '5550529751', 'M', '1999-03-07', '1234'),
    ('Ana Figueroa  Navarro', 'anafigueroa28@hotmail.com', '5558908386', 'M', '1979-10-11', '1234'),
    ('Claudia Soto Álvarez', 'claudiasoto43@yahoo.com.mx', '5556578091', 'M', '1981-01-22', '1234'),
    ('Lorena Ortiz Aguilar', 'lorena.aguilar@outlook.com', '5557136959', 'M', '1986-07-18', '1234'),
    ('Arturo Navarro Álvarez', 'arturonavarro51@gmail.com', '5555352181', 'H', '2005-10-01', '1234'),
    ('Andrea Campos Vega', 'andrea_campos56@yahoo.com.mx', '5554531473', 'M', '2001-09-09', '1234'),
    ('Alberto Jiménez Soto', 'alberto_jimenez81@outlook.com', '5550348247', 'H', '2003-06-27', '1234'),
    ('Emilio Pérez Martínez', 'emilio.martinez@email.com', '5559521456', 'H', '1975-10-04', '1234'),
    ('Carmen Álvarez García', 'carmen.garcia@email.com', '5557549651', 'M', '1980-12-22', '1234'),
    ('Javier Ramírez Sánchez', 'javier.sanchez@outlook.com', '5556724238', 'H', '1983-07-28', '1234'),
    ('Miguel Vargas Morales', 'mvargas73@hotmail.com', '5551839335', 'H', '1973-03-28', '1234'),
    ('Regina Ríos Soto', 'regina.soto@gmail.com', '5552717744', 'M', '1965-01-14', '1234'),
    ('Héctor Chávez Díaz', 'hector_chavez75@yahoo.com.mx', '5555777387', 'H', '1975-03-23', '1234'),
    ('Diana Ruiz Álvarez', 'druiz10@yahoo.com.mx', '5553149190', 'M', '1991-02-24', '1234'),
    ('Eduardo Díaz Ramírez', 'eduardo.ramirez@yahoo.com.mx', '5554078161', 'H', '1986-04-20', '1234'),
    ('Micheal Pérez Cabañas', 'michealperez4@gmail.com', '5553321819', 'H', '1997-11-07', '1234'),
    ('Valeria Medina Ramos', 'valeria_medina40@yahoo.com.mx', '5559091334', 'M', '1967-04-14', '1234'),
    ('Daniel Navarro Gómez', 'daniel_navarro15@yahoo.com.mx', '5553242102', 'H', '1987-08-06', '1234'),
    ('Lucía Guerrero Morales', 'luciaguerrero59@hotmail.com', '5557889579', 'M', '2005-04-14', '1234'),
    ('Ricardo López Martínez', 'ricardo.martinez@gmail.com', '5555341928', 'H', '1981-12-17', '1234')
;

/* 
            CATEGORIAS productos
*/
INSERT INTO categorias (nombre) VALUES
    ('televisiones y entretenimiento'),
    ('hardware de PC'),
    ('perifericos para PC'),
    ('gaming'),
    ('computadoras y laptops'),
    ('herramientas e instrumentacion'),
    ('microcontroladores'),
    ('electronica'),
    ('cables y adaptadores'),
    ('oficina'),
    ('hogar inteligente e IoT'),
    ('dispositivos moviles'),
    ('redes y telecomunicaciones'),
    ('software y licencias')
;

/*
    PRODUCTOS
Registros insertados: >46

@Nota:
    Un aspecto a mejorar es el campo SKU el cual tiene una longitud de 15 caracteres.
    recomiendo ampliarlo a almenos 20 caracteres.
    FROM: diego. 22 oct 26 22:47

Para la insercion hacemosuna especie de PA en la cual declaramos variables para los IDs de las categorias,
permitiendo una insercion mas dinamica y agil con respecto a las categorias de los productos.
*/

DO $$
DECLARE 
    id_categoria_dispositivos_moviles UUID;
    id_computadoras_equipos_completos UUID;
    id_categoria_microcontroladores UUID;
BEGIN
    SELECT
        id INTO STRICT id_categoria_dispositivos_moviles
    FROM categorias
    WHERE nombre LIKE 'dispositivos moviles';

    SELECT
        id INTO STRICT id_computadoras_equipos_completos
    FROM categorias
    WHERE nombre LIKE 'computadoras y laptops';

    SELECT
        id INTO STRICT id_categoria_microcontroladores
    FROM categorias
    WHERE nombre LIKE 'microcontroladores';

INSERT INTO productos (nombre, precio, sku, color, marca, descripcion, peso, categorias_id) VALUES
    /* Productos de dispositivos moviles */
    ('iphone 18 pro', 29999, 'iph18p-b63i256', 'Borgoña', 'apple', 'iphone 18 pro color rojo, pantalla de 6.3 pulgadas, 256 GB de almacenamiento.', 0.211, id_categoria_dispositivos_moviles),
    ('iphone 18 pro max', 31999, 'iph18pm-n512', 'Negro', 'apple', 'iphone 18 pro max color negro, pantalla de 6.7 pulgadas, 512 GB de almacenamiento, 30 horas de duracion de la bateria', 0.230, id_categoria_dispositivos_moviles),
    ('iphone duo', 47999, 'iphduo-be', 'Blanco', 'apple', 'iphone duo con pantalla plegable', 0.254, id_categoria_dispositivos_moviles),
    ('Galaxy S26 Ultra', 32999, 'sam-s26u-n512', 'Negro', 'Samsung', 'Samsung Galaxy S26 Ultra, pantalla de 6.9 pulgadas, 12 GB de RAM, 512 GB de almacenamiento y camara principal de 200 MP.', 0.218, id_categoria_dispositivos_moviles),
    ('Galaxy S26', 21999, 'sam-s26-a8256', 'Azul', 'Samsung', 'Samsung Galaxy S26, pantalla de 6.2 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.167, id_categoria_dispositivos_moviles),
    ('Galaxy Z Flip7', 25999, 'sam-zf7-l12256', 'Lavanda', 'Samsung', 'Samsung Galaxy Z Flip7 plegable, pantalla interna de 6.9 pulgadas, 12 GB de RAM y 256 GB de almacenamiento.', 0.188, id_categoria_dispositivos_moviles),
    ('Galaxy A56 5G', 8999, 'sam-a56-g8256', 'Gris', 'Samsung', 'Samsung Galaxy A56 5G, pantalla AMOLED de 6.7 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.198, id_categoria_dispositivos_moviles),
    ('Galaxy A36 5G', 6999, 'sam-a36-n8128', 'Negro', 'Samsung', 'Samsung Galaxy A36 5G, pantalla de 6.7 pulgadas, 8 GB de RAM y 128 GB de almacenamiento.', 0.195, id_categoria_dispositivos_moviles),
    ('Pixel 10 Pro', 24999, 'goo-px10p-p256', 'Porcelana', 'Google', 'Google Pixel 10 Pro, pantalla de 6.3 pulgadas, 16 GB de RAM y 256 GB de almacenamiento.', 0.207, id_categoria_dispositivos_moviles),
    ('Pixel 10', 17999, 'goo-px10-o128', 'Obsidiana', 'Google', 'Google Pixel 10, pantalla de 6.3 pulgadas, 12 GB de RAM y 128 GB de almacenamiento.', 0.204, id_categoria_dispositivos_moviles),
    ('Xiaomi 15T Pro', 16999, 'xia-15tp-n512', 'Negro', 'Xiaomi', 'Xiaomi 15T Pro, pantalla de 6.83 pulgadas, 12 GB de RAM, 512 GB de almacenamiento y carga rapida de 90 W.', 0.210, id_categoria_dispositivos_moviles),
    ('Redmi Note 14 Pro', 6499, 'xia-rn14p-256', 'Azul', 'Xiaomi', 'Redmi Note 14 Pro, pantalla AMOLED de 6.67 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.190, id_categoria_dispositivos_moviles),
    ('Redmi 14C', 2499, 'xia-r14c-v4128', 'Verde', 'Xiaomi', 'Redmi 14C, pantalla de 6.88 pulgadas, 4 GB de RAM y 128 GB de almacenamiento.', 0.204, id_categoria_dispositivos_moviles),
    ('POCO X7 Pro', 7299, 'xia-px7p-256', 'Amarillo', 'Xiaomi', 'POCO X7 Pro, pantalla de 6.67 pulgadas a 120 Hz, 12 GB de RAM y 256 GB de almacenamiento.', 0.195, id_categoria_dispositivos_moviles),
    ('Edge 60 Pro', 12999, 'mot-e60p-512', 'Verde', 'Motorola', 'Motorola Edge 60 Pro, pantalla curva pOLED de 6.7 pulgadas, 12 GB de RAM y 512 GB de almacenamiento.', 0.186, id_categoria_dispositivos_moviles),
    ('Moto G85 5G', 5499, 'mot-g85-az8256', 'Azul', 'Motorola', 'Motorola Moto G85 5G, pantalla de 6.67 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.172, id_categoria_dispositivos_moviles),
    ('Moto G15', 2299, 'mot-g15-g4128', 'Gris', 'Motorola', 'Motorola Moto G15, pantalla de 6.72 pulgadas, 4 GB de RAM y 128 GB de almacenamiento.', 0.185, id_categoria_dispositivos_moviles),
    ('Razr 60', 15999, 'mot-rz60-r8256', 'Rosa', 'Motorola', 'Motorola Razr 60 plegable, pantalla interna de 6.9 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.188, id_categoria_dispositivos_moviles),
    ('OnePlus 13', 20999, 'onp-13-n12256', 'Negro', 'OnePlus', 'OnePlus 13, pantalla de 6.82 pulgadas, 12 GB de RAM, 256 GB de almacenamiento y bateria de 6000 mAh.', 0.210, id_categoria_dispositivos_moviles),
    ('Nothing Phone 3a', 8999, 'nth-ph3a-b8256', 'Blanco', 'Nothing', 'Nothing Phone 3a, pantalla AMOLED de 6.77 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.201, id_categoria_dispositivos_moviles),
    ('Magic7 Lite', 6999, 'hon-m7l-p8256', 'Plata', 'Honor', 'Honor Magic7 Lite, pantalla AMOLED de 6.78 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.189, id_categoria_dispositivos_moviles),
    ('Reno13 5G', 10999, 'opp-r13-m8256', 'Morado', 'Oppo', 'Oppo Reno13 5G, pantalla AMOLED de 6.59 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.181, id_categoria_dispositivos_moviles),
    ('Realme 14 Pro', 8499, 'rlm-14p-b8256', 'Azul', 'Realme', 'Realme 14 Pro, pantalla de 6.77 pulgadas, 8 GB de RAM y 256 GB de almacenamiento.', 0.187, id_categoria_dispositivos_moviles),

    /* Productos de computadoras y equipos completos */
    ('macbook neo', 14999, 'macbn-i8r256', 'Indigo', 'apple', 'macbook neo, pantalla de 13 pulgadas, 8 GB de memoria RAM y 256 GB de almacenamiento, teclado en español y procesador A18 Pro', 1.23, id_computadoras_equipos_completos),
    ('elitebook 845 G8', 15399, 'hpelb-845g8', 'Plata', 'HP', 'HP elitebook con procesador Ryzen 5 pro 5650U (velocidad base de 2.3 GHz) y graficos integrados de AMD. Pantalla de 14 pulgadas, 16 GB RAM DDR4 y 256 GB NVMe.', 1.37, id_computadoras_equipos_completos),
    ('MacBook Air 13 M4', 24999, 'mba13m4-c16256', 'Cielo', 'apple', 'MacBook Air de 13 pulgadas con chip M4, 16 GB de memoria unificada y 256 GB de almacenamiento SSD.', 1.24, id_computadoras_equipos_completos),
    ('MacBook Air 15 M4', 29999, 'mba15m4-m16512', 'Medianoche', 'apple', 'MacBook Air de 15 pulgadas con chip M4, 16 GB de memoria unificada y 512 GB de almacenamiento SSD.', 1.51, id_computadoras_equipos_completos),
    ('MacBook Pro 14 M4 Pro', 49999, 'mbp14m4p-24512', 'Negro espacial', 'apple', 'MacBook Pro de 14 pulgadas con chip M4 Pro, 24 GB de memoria unificada y 512 GB de almacenamiento SSD.', 1.55, id_computadoras_equipos_completos),
    ('MacBook Pro 16 M4 Max', 79999, 'mbp16m4m-481tb', 'Negro espacial', 'apple', 'MacBook Pro de 16 pulgadas con chip M4 Max, 48 GB de memoria unificada y 1 TB de almacenamiento SSD.', 2.15, id_computadoras_equipos_completos),
    ('XPS 13', 35999, 'xps13-p16512', 'Platino', 'Dell', 'Dell XPS 13, pantalla de 13.4 pulgadas, procesador Intel Core Ultra 7, 16 GB de RAM y 512 GB NVMe.', 1.19, id_computadoras_equipos_completos),
    ('Inspiron 15', 12999, 'insp15-n8512', 'Negro', 'Dell', 'Dell Inspiron 15, pantalla de 15.6 pulgadas, procesador Intel Core i5, 8 GB de RAM y 512 GB SSD.', 1.65, id_computadoras_equipos_completos),
    ('Latitude 5450', 22999, 'lat5450-g16512', 'Gris', 'Dell', 'Dell Latitude 5450, pantalla de 14 pulgadas, procesador Intel Core Ultra 5, 16 GB de RAM y 512 GB SSD.', 1.45, id_computadoras_equipos_completos),
    ('Pavilion 15', 13499, 'hp-pav15-p8512', 'Plata', 'HP', 'HP Pavilion 15, pantalla de 15.6 pulgadas, procesador AMD Ryzen 5, 8 GB de RAM y 512 GB SSD.', 1.69, id_computadoras_equipos_completos),
    ('Victus 16', 19999, 'hp-vic16-16512', 'Negro', 'HP', 'HP Victus 16 para juegos, pantalla de 16.1 pulgadas a 144 Hz, Ryzen 7, GeForce RTX 4050, 16 GB de RAM y 512 GB SSD.', 2.30, id_computadoras_equipos_completos),
    ('OmniBook 5', 17999, 'hp-omn5-p16512', 'Plata', 'HP', 'HP OmniBook 5, pantalla OLED de 14 pulgadas, Snapdragon X, 16 GB de RAM y 512 GB SSD.', 1.40, id_computadoras_equipos_completos),
    ('ThinkPad E14 Gen 6', 16999, 'tpe14g6-n16512', 'Negro', 'Lenovo', 'Lenovo ThinkPad E14 Gen 6, pantalla de 14 pulgadas, Intel Core Ultra 5, 16 GB de RAM y 512 GB SSD.', 1.41, id_computadoras_equipos_completos),
    ('ThinkPad X1 Carbon Gen 12', 42999, 'x1cg12-n321tb', 'Negro', 'Lenovo', 'Lenovo ThinkPad X1 Carbon Gen 12, pantalla de 14 pulgadas, Intel Core Ultra 7, 32 GB de RAM y 1 TB SSD.', 1.09, id_computadoras_equipos_completos),
    ('IdeaPad Slim 3', 9999, 'len-ips3-g8256', 'Gris', 'Lenovo', 'Lenovo IdeaPad Slim 3, pantalla de 15.6 pulgadas, procesador AMD Ryzen 5, 8 GB de RAM y 256 GB SSD.', 1.62, id_computadoras_equipos_completos),
    ('Legion 5i', 29999, 'leg5i-g16512', 'Gris', 'Lenovo', 'Lenovo Legion 5i para juegos, pantalla de 15.6 pulgadas a 165 Hz, Intel Core i7, GeForce RTX 4060, 16 GB de RAM y 512 GB SSD.', 2.40, id_computadoras_equipos_completos),
    ('Vivobook 15', 10499, 'viv15-p8512', 'Plata', 'ASUS', 'ASUS Vivobook 15, pantalla de 15.6 pulgadas, procesador Intel Core i5, 8 GB de RAM y 512 GB SSD.', 1.70, id_computadoras_equipos_completos),
    ('Zenbook 14 OLED', 24999, 'zen14o-a16512', 'Azul', 'ASUS', 'ASUS Zenbook 14 OLED, pantalla OLED de 14 pulgadas, Intel Core Ultra 7, 16 GB de RAM y 512 GB SSD.', 1.20, id_computadoras_equipos_completos),
    ('ROG Strix G16', 38999, 'rogg16-n161tb', 'Negro', 'ASUS', 'ASUS ROG Strix G16 para juegos, pantalla de 16 pulgadas a 240 Hz, Intel Core i9, GeForce RTX 4070, 16 GB de RAM y 1 TB SSD.', 2.50, id_computadoras_equipos_completos),
    ('Aspire 5', 11499, 'ace-asp5-p8512', 'Plata', 'Acer', 'Acer Aspire 5, pantalla de 15.6 pulgadas, procesador Intel Core i5, 8 GB de RAM y 512 GB SSD.', 1.77, id_computadoras_equipos_completos),
    ('Nitro V 15', 18999, 'nitv15-n16512', 'Negro', 'Acer', 'Acer Nitro V 15 para juegos, pantalla de 15.6 pulgadas a 144 Hz, Intel Core i5, GeForce RTX 4050, 16 GB de RAM y 512 GB SSD.', 2.10, id_computadoras_equipos_completos),
    ('Modern 14', 12499, 'mod14-g16512', 'Gris', 'MSI', 'MSI Modern 14, pantalla de 14 pulgadas, procesador Intel Core i5, 16 GB de RAM y 512 GB SSD.', 1.40, id_computadoras_equipos_completos),

    /* Microcontroladores */
    ('ESP32', 357, 'esp32-32pin', 'negro', 'ESP', 'tarjeta ESP32 con wifi y bluetooth, usb tipo C', 0.200, id_categoria_microcontroladores)
;

END $$ ;

/* 
            METODOS_PAGO
*/
INSERT INTO metodos_pago (nombre, comision) VALUES
    ('paypal', 3.5),
    ('pago en efectivo', 0.0),
    ('oxxo', 3),
    ('Apple Pay', 30)
;

/*
            DOMICILIOS
Parta consultar y validar si estos registros estan cargados
ve y ecuta las consultas en `/src/querys/q.sql`
*/

/* Un domicilio por usuario */
WITH calles(calle) AS (
  VALUES
    ('Av. Insurgentes Sur'), ('Calle Durango'), ('Av. Universidad'),
    ('Calle Amsterdam'), ('Av. Revolución'), ('Calle Zacatecas'),
    ('Av. Coyoacán'), ('Calle Orizaba'), ('Av. Patriotismo'),
    ('Calle Tlaxcala'), ('Av. Chapultepec'), ('Calle Puebla')
),
ubicaciones(colonia, cp, ciudad, estado) AS (
  VALUES
    ('Roma Norte',        '06700', 'Ciudad de México', 'Ciudad de México'),
    ('Condesa',           '06140', 'Ciudad de México', 'Ciudad de México'),
    ('Del Valle Centro',  '03100', 'Ciudad de México', 'Ciudad de México'),
    ('Narvarte Poniente', '03020', 'Ciudad de México', 'Ciudad de México'),
    ('Coyoacán Centro',   '04000', 'Ciudad de México', 'Ciudad de México'),
    ('Polanco',           '11560', 'Ciudad de México', 'Ciudad de México'),
    ('Nápoles',           '03810', 'Ciudad de México', 'Ciudad de México'),
    ('Doctores',          '06720', 'Ciudad de México', 'Ciudad de México'),
    ('Lindavista',        '07300', 'Ciudad de México', 'Ciudad de México'),
    ('Ciudad Satélite',   '53100', 'Naucalpan',        'Estado de México')
)
INSERT INTO public.domicilios (calle, numero, colonia, cp, estado, ciudad, usuarios_id)
SELECT
  c.calle,
  (floor(random() * 999) + 1)::int::text,
  l.colonia,
  l.cp,
  l.estado,
  l.ciudad,
  u.id
FROM public.usuarios u
CROSS JOIN LATERAL (
  SELECT calle FROM calles
  WHERE u.id IS NOT NULL          -- fuerza a re-evaluar por cada usuario
  ORDER BY random() LIMIT 1
) c
CROSS JOIN LATERAL (
  SELECT * FROM ubicaciones
  WHERE u.id IS NOT NULL
  ORDER BY random() LIMIT 1
) l
WHERE NOT EXISTS (                -- evita duplicar si lo corres dos veces
  SELECT 1 FROM public.domicilios d WHERE d.usuarios_id = u.id
);

/* un segundo domicilio para algunos usuarios */
WITH calles(calle) AS (
  VALUES ('Av. Insurgentes Sur'), ('Calle Durango'), ('Av. Universidad'),
         ('Calle Amsterdam'), ('Av. Revolución'), ('Calle Zacatecas')
),
ubicaciones(colonia, cp, ciudad, estado) AS (
  VALUES
    ('Roma Norte',   '06700', 'Ciudad de México', 'Ciudad de México'),
    ('Condesa',      '06140', 'Ciudad de México', 'Ciudad de México'),
    ('Polanco',      '11560', 'Ciudad de México', 'Ciudad de México'),
    ('Lindavista',   '07300', 'Ciudad de México', 'Ciudad de México')
)
INSERT INTO public.domicilios (calle, numero, colonia, cp, estado, ciudad, usuarios_id)
SELECT
  c.calle,
  (floor(random() * 999) + 1)::int::text,
  l.colonia, l.cp, l.estado, l.ciudad,
  u.id
FROM public.usuarios u
CROSS JOIN LATERAL (
  SELECT calle FROM calles WHERE u.id IS NOT NULL ORDER BY random() LIMIT 1
) c
CROSS JOIN LATERAL (
  SELECT * FROM ubicaciones WHERE u.id IS NOT NULL ORDER BY random() LIMIT 1
) l
WHERE random() < 0.3;