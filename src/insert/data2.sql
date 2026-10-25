/*
Silver Team

PostgreSQL AND Supabase : Database - e-commerce
*********************************************************************

Script de llenado de la base de datos mediante UUIDs generados
de forma manual para un control rigurodo de los datos.

Esta base de datos tendra una tematica de una tienda de electronica
(similar a Steren para que se hagan una idea), por los que las
entidades relacionadas con los prodocutos y sus catgorias se relacionan
con dicha tematica.

@Importante
Ninguno de los datos aqui presentes es real, todos los registros son
datos inventados (dummy) empleados en la validacion del modelo.
*/

/*  
    Usuarios  
*/
INSERT INTO usuarios (id, nombre, email, telefono, sexo, fecha_nacimiento, contrasena) VALUES
    ('9170894f-691d-4590-b46b-e1d2f6ca0a80', 'Gerardo Vargas Díaz',     'gerardo.diaz@outlook.com',         '5554016400', 'H', '1989-12-03', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a81', 'Héctor Cruz Jiménez',     'hcruz39@email.com',                '5558240084', 'H', '1971-04-30', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a82', 'Carmen Cortés Vargas',    'carmencortes54@outlook.com',       '5551657262', 'M', '2006-10-22', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a83', 'Valeria Herrera Salazar', 'valeria_herrera54@gmail.com',      '5553815614', 'M', '2003-08-28', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a84', 'Marta Sánchez González',  'marta.gonzalez@hotmail.com',       '5558148932', 'M', '1993-07-18', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a85', 'Jorge Morales Romero',    'jorge_morales72@hotmail.com',      '5557770143', 'H', '1996-04-12', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a86', 'Andrés Reyes Navarrete',  'reyesN12@hotmail.com',             '5553289900', 'H', '1989-11-03', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a87', 'Laura Sánchez Rodríguez', 'laura.rodriguez@hotmail.com',      '5551034131', 'M', '1994-02-06', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a88', 'Gerardo Flores Ramos',    'gerardoflores71@outlook.com',      '5551317127', 'H', '1986-03-08', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a89', 'Andrea Cruz Hernández',   'andrea_cruz90@gmail.com',          '5556120047', 'M', '1970-06-02', '1234'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a8A', 'Fernando Martínez Pérez', 'fernandomartinez88@email.com',     '5558451462', 'H', '2000-09-14', '1234')
;

/*  
    Categorias  
*/
INSERT INTO categorias (id, nombre) VALUES
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfa6', 'televisiones y entretenimiento'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfa7', 'hardware de PC'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfa8', 'perifericos para PC'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfa9', 'gaming'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfaa', 'computadoras y laptops'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfab', 'herramientas e instrumentacion'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfac', 'microcontroladores'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfad', 'electronica'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfae', 'cables y adaptadores'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfaf', 'oficina'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfb0', 'hogar inteligente e IoT'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfb1', 'dispositivos moviles'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfb2', 'redes y telecomunicaciones'),
    ('05e7b29a-db6a-4940-b30c-f2afe2c4bfb3', 'software y licencias')
;

/*  
    Productos 

@Recuerda:
    - El precio se maneja en pesos mexicanos
    - El peso se maneja en Kilogramos
*/
INSERT INTO productos (id, nombre, precio, sku, color, marca, descripcion, peso, categorias_id) VALUES
    -- Estos registros pertenecen a la categoria 'dispositivos moviles' con uuid '05e7b29a-db6a-4940-b30c-f2afe2c4bfb1'
    ('4a59bd7d-4d9d-4b7a-9ca4-4281c07b7092', 'iphone 18 pro',       29999, 'iph18p-b63i256',    'Borgoña',  'apple',   'iphone 18 pro color rojo, pantalla de 6.3 pulgadas, 256 GB de almacenamiento.',                                            0.211, '05e7b29a-db6a-4940-b30c-f2afe2c4bfb1'),
    ('4a59bd7d-4d9d-4b7a-9ca4-4281c07b7093', 'iphone 18 pro max',   31999, 'iph18pm-n512',      'Negro',    'apple',   'iphone 18 pro max color negro, pantalla de 6.7 pulgadas, 512 GB de almacenamiento, 30 horas de duracion de la bateria',    0.230, '05e7b29a-db6a-4940-b30c-f2afe2c4bfb1'),
    ('4a59bd7d-4d9d-4b7a-9ca4-4281c07b7094', 'iphone duo',          47999, 'iphduo-be256',      'Blanco',   'apple',   'iphone duo con pantalla plegable. Esta bien caro!',                                                                        0.254, '05e7b29a-db6a-4940-b30c-f2afe2c4bfb1'),
    ('4a59bd7d-4d9d-4b7a-9ca4-4281c07b7095', 'Galaxy S26 Ultra',    32999, 'sam-s26u-n512',     'Negro',    'samsung', 'Samsung Galaxy S26 Ultra, pantalla de 6.9 pulgadas, 12 GB de RAM, 512 GB de almacenamiento y camara principal de 200 MP.', 0.218, '05e7b29a-db6a-4940-b30c-f2afe2c4bfb1'),
    
    -- Estos registros pertenecen a categoria 'computadoras y laptops' con uuid '05e7b29a-db6a-4940-b30c-f2afe2c4bfaa'
    ('94b016d4-f851-4867-87ff-5f54f66c81da', 'macbook neo',         14999, 'macbn-i8r256',      'Indigo',   'apple',   'macbook neo, pantalla de 13 pulgadas, 8 GB de memoria RAM y 256 GB de almacenamiento, teclado en español y procesador A18 Pro',                                  1.23, '05e7b29a-db6a-4940-b30c-f2afe2c4bfaa'),
    ('94b016d4-f851-4867-87ff-5f54f66c81db', 'elitebook 845 G8',    15399, 'hpelb-845g8',       'Plata',    'hp',      'HP elitebook con procesador Ryzen 5 pro 5650U (velocidad base de 2.3 GHz) y graficos integrados de AMD. Pantalla de 14 pulgadas, 16 GB RAM DDR4 y 256 GB NVMe.', 1.37, '05e7b29a-db6a-4940-b30c-f2afe2c4bfaa'),
    
    -- Estos registros pertenecen a la categoria de 'microcontroladores' con el uuid '05e7b29a-db6a-4940-b30c-f2afe2c4bfac'
    ('8306300e-9b9b-4e59-bb79-fc394e566cf2', 'ESP32',               357.0, 'esp32-32pin',       'Negro', 'Espressif',   'placa de desarrollo ESP32 con wifi y bluetooth, usb tipo C. Compatible con Arduino IDE. Núcleo simple o doble (Xtensa LX6 a 240 MHz en su versión clásica, además de variantes LX7 o RISC-V)',                         0.230, '05e7b29a-db6a-4940-b30c-f2afe2c4bfac'),
    ('8306300e-9b9b-4e59-bb79-fc394e566cf3', 'Arduino UNO',         428.0, 'arduno-adan',       'Negro', 'Adafruit',    'placa de desarrollo arduino UNO con cable incluido. Basada en el chip ATmega328P de 16 MHz, muy popular para proyectos de electrónica, sensores y robótica pero Tellez no lo aprueba',                                 0.201, '05e7b29a-db6a-4940-b30c-f2afe2c4bfac'),
    ('8306300e-9b9b-4e59-bb79-fc394e566cf4', 'Blue Pill',           125.99,'bpl-devm-az',       'Azul',  'desconocido', 'placa de desarrollo BluePill. placa de desarrollo económica y compacta basada en el microcontrolador STM32F103C8T6 con arquitectura ARM Cortex-M3 de 32 bits. Compatible con el IDE STM32 y esta aprobado por Tellez', 0.139, '05e7b29a-db6a-4940-b30c-f2afe2c4bfac'),

    -- Estos registros pertenecen a la categoria de 'software y licencias' con el uuid '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cf8', 'Microsoft Copilot 365 Pro',   1999,      'msfcop365-pro', 'Microsoft',                  'sin color',    'Licencia anual pro de Copilot 365. Incluye todos los programas de la Suit de Office como Word, Excel, PowerPoint y acceso a Microsoft Copilot',     0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cf9', 'Sistema NexAquA Plus',        2599,      'naa-sas-plus',  'NexAquA',                    'NexAquA',      'Suscripcion mensual al SaaS de NexAqua con el nivel plus. Incluye asistencia por parte del equipo tecnico; mas info en nexaqua.com.mx',             0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cfa', 'DaiNet MICS',                 3500,      'dai-mics-acisp','DaiNet Telecomunicaciones',  'sin color',    'Acceso anual al panel de gestion MICS para la administracion de infraestructura de fibra optica. Orientado a ISPs; consulte dainetmx.com',          0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cfb', 'AdmonNet Enterprice Desktop', 1999,      'dai-adn-entdsk','DaiNet Telecomunicaciones',  'sin color',    'Acceso al cliente de AdmonNet Enterprice Edition. Sistema ERP y de gestion absoluta de una infraestructura de red. Licencia individual.',           0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cfc', 'Claude Fable 5.5',            4999,      'ant-clafab-20x','Anthropic',                  'sin color',    'Acceso a Claude Fable mas el plan pro 20x de anthropic. No es plan mensual.'                                                                        0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('b7256750-11fd-44c5-bb25-3fd58bfc3cfd', 'Red Hat Enterprise Linux',    9999,      'rhel',          'Red Hat',                    'Rojo',         'Licencia de Red Hat Enterprise Linux para entornos empresariales. Disponibilidad y condiciones de suscripción sujetas al plan contratado.',         0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3')
;

/*  
    Metodos de pago 

@Recuerda: La comision esta en porcentaje y el valor debe estar entre 0 y 100
*/
INSERT INTO metodos_pago (id, nombre, comision) VALUES
    ('f9ead6e0-d81d-4e8d-8c55-f52f479f8ad1', 'paypal',              3.5),
    ('f9ead6e0-d81d-4e8d-8c55-f52f479f8ad2', 'pago en efectivo',    0.0),
    ('f9ead6e0-d81d-4e8d-8c55-f52f479f8ad3', 'oxxo',                0.0),
    ('f9ead6e0-d81d-4e8d-8c55-f52f479f8ad5', 'tarjeta de crédito',  2.9),
    ('f9ead6e0-d81d-4e8d-8c55-f52f479f8ad6', 'transferencia SPEI',  0.0),
    ('f9ead6e0-d81d-4e8d-8c55-f52f479f8ad7', 'tarjeta de débito',   1.5);