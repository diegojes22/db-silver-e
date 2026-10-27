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

Usa este Script para realizar una validacion a detalle del modelo.
*/

/*  
    Usuarios  
*/
INSERT INTO usuarios (id, nombre, email, telefono, sexo, fecha_nacimiento, contrasena) VALUES
    ('9170894f-691d-4590-b46b-e1d2f6ca0a80', 'Gerardo Vargas Díaz',     'gerardo.diaz@outlook.com',         '5554016400', 'H', '1989-12-03', 'f4f62f839ac969cc9df51d91abbda0f4498f09aaf68e1eefd18c96a302e3d851'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a81', 'Héctor Cruz Jiménez',     'hcruz39@email.com',                '5558240084', 'H', '1971-04-30', 'eaa0164dd40927193f692469b35befd4a64bbd7a6045f8c1f7758d4095aec3a7'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a82', 'Carmen Cortés Vargas',    'carmencortes54@outlook.com',       '5551657262', 'M', '2006-10-22', '4486ef82d00ec066301adb310969525835c3696112c350cc52a8f2a8fb567ff6'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a83', 'Valeria Herrera Salazar', 'valeria_herrera54@gmail.com',      '5553815614', 'M', '2003-08-28', '4bd2846548d5acb5668266f05097c903de04c414b7ace4e51dcc9a72671eae6e'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a84', 'Marta Sánchez González',  'marta.gonzalez@hotmail.com',       '5558148932', 'M', '1993-07-18', 'f4f62f839ac969cc9df51d91abbda0f4498f09aaf68e1eefd18c96a302e3d851'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a85', 'Jorge Morales Romero',    'jorge_morales72@hotmail.com',      '5557770143', 'H', '1996-04-12', '183c92f4dbcbf1c5ee0bc9961080735a7ef6670f457a5e110ef416cbdc80f3a7'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a86', 'Andrés Reyes Navarrete',  'reyesN12@hotmail.com',             '5553289900', 'H', '1989-11-03', 'f4f62f839ac969cc9df51d91abbda0f4498f09aaf68e1eefd18c96a302e3d851'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a87', 'Laura Sánchez Rodríguez', 'laura.rodriguez@hotmail.com',      '5551034131', 'M', '1994-02-06', 'f4f62f839ac969cc9df51d91abbda0f4498f09aaf68e1eefd18c96a302e3d851'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a88', 'Gerardo Flores Ramos',    'gerardoflores71@outlook.com',      '5551317127', 'H', '1986-03-08', 'f4f62f839ac969cc9df51d91abbda0f4498f09aaf68e1eefd18c96a302e3d851'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a89', 'Andrea Cruz Hernández',   'andrea_cruz90@gmail.com',          '5556120047', 'M', '1970-06-02', 'f4f62f839ac969cc9df51d91abbda0f4498f09aaf68e1eefd18c96a302e3d851'),
    ('9170894f-691d-4590-b46b-e1d2f6ca0a8A', 'Fernando Martínez Pérez', 'fernandomartinez88@email.com',     '5558451462', 'H', '2000-09-14', '183c92f4dbcbf1c5ee0bc9961080735a7ef6670f457a5e110ef416cbdc80f3a7')
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
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cf8', 'Microsoft Copilot 365 Pro',   1999,      'msfcop365-pro', 'sin color', 'Microsoft',                   'Licencia anual pro de Copilot 365. Incluye todos los programas de la Suit de Office como Word, Excel, PowerPoint y acceso a Microsoft Copilot',     0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cf9', 'Sistema NexAquA Plus',        2599,      'naa-sas-plus',  'NexAquA',   'NexAquA',                     'Suscripcion mensual al SaaS de NexAqua con el nivel plus. Incluye asistencia por parte del equipo tecnico; mas info en nexaqua.com.mx',             0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cfa', 'DaiNet MICS',                 3500,      'dai-mics-acisp','sin color', 'DaiNet Telecomunicaciones',   'Acceso anual al panel de gestion MICS para la administracion de infraestructura de fibra optica. Orientado a ISPs; consulte dainetmx.com',          0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cfb', 'AdmonNet Enterprice Desktop', 1999,      'dai-adn-entdsk','sin color', 'DaiNet Telecomunicaciones',   'Acceso al cliente de AdmonNet Enterprice Edition. Sistema ERP y de gestion absoluta de una infraestructura de red. Licencia individual.',           0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('a6156750-11fd-44c5-bb25-3fd58bfc3cfc', 'Claude Fable 5.5',            4999,      'ant-clafab-20x','sin color', 'Anthropic',                   'Acceso a Claude Fable mas el plan pro 20x de anthropic. No es plan mensual.',                                                                       0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
    ('b7256750-11fd-44c5-bb25-3fd58bfc3cfd', 'Red Hat Enterprise Linux',    9999,      'rhel',          'Rojo',      'Red Hat',                     'Licencia de Red Hat Enterprise Linux para entornos empresariales. Disponibilidad y condiciones de suscripción sujetas al plan contratado.',         0,   '05e7b29a-db6a-4940-b30c-f2afe2c4bfb3'),
   
    -- Estos registros pertenecen a la categoria de 'electronica' con el uuid '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965cc', 'Kit de 600 resistencias 1/4W',        189,    'res-600-1/4',     'sin color',    'REXQualis',            'Kit de 600 resistencias de 1/4 de watt. Incluye 12 paquetes de 50 piezas cada uno con las resietncias mas comunes para proyectos de electronica junto con el codigo de colores.',   0.300, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965cd', 'transistor 2n2222a NPN',              20.0,   '2n2222anpn-g',    'Gris',         'NXP Semiconductors',   'Transistor de silicio de baja potencia y diseñado para aplicaciones de amplificación lineal y conmutación. Encapsulado de metal y forma cilidrica. No incluye hoja de datos',       0.003, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965ce', 'circuito integrado 555',              5.00,   'chip-555',        'Negro',        'Texas Instruments',    'temporizador y oscilador que permite generar pulsos de reloj, retardos de tiempo y oscilaciones de forma sencilla. Trabaja de 4.5V a 15V DC, DIP-8 ideal para protoboard.',         0.001, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965cf', 'Protoboard 830 puntos',               89.00,  'protoboard-830',  'Blanco',       'MB-102',               'Protoboard de 830 puntos de conexion para el montaje de circuitos electronicos sin necesidad de soldadura. Incluye rieles de alimentacion.',                                        0.180, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d0', 'Kit de cables Dupont 120 piezas',     75.00,  'dupont-120',      'Multicolor',   'Genérico',             'Kit de cables Dupont macho-macho, macho-hembra y hembra-hembra para conexiones en protoboard, Arduino y otros proyectos electronicos.',                                             0.120, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d1', 'LED rojo de 5 mm',                    1.50,   'led-5mm-rojo',    'Rojo',         'Kingbright',           'Diodo emisor de luz de 5 mm para indicadores visuales y proyectos electronicos. Requiere resistencia limitadora de corriente.',                                                     0.001, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d2', 'LED verde de 5 mm',                   1.50,   'led-5mm-verde',   'Verde',        'Kingbright',           'Diodo emisor de luz verde de 5 mm para indicadores de estado y circuitos electronicos. Requiere resistencia limitadora de corriente.',                                              0.001, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d3', 'Diodo rectificador 1N4007',           2.00,   'diodo-1n4007',    'Negro',        'Vishay',               'Diodo rectificador de silicio con corriente directa promedio de hasta 1 A y tension inversa repetitiva maxima de 1000 V.',                                                          0.001, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d4', 'Transistor BC547 NPN',                3.00,   'bc547-npn',       'Negro',        'Nexperia',             'Transistor bipolar NPN de proposito general para aplicaciones de amplificacion y conmutacion de baja potencia. Encapsulado TO-92.',                                                 0.001, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d5', 'MOSFET IRFZ44N',                      25.00,  'mosfet-irfz44n',  'Negro',        'Infineon',             'Transistor MOSFET de canal N para aplicaciones de conmutacion de potencia. Encapsulado TO-220. Verifique los requisitos de compuerta en la hoja de datos.',                         0.006, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d6', 'Potenciometro lineal de 10K',         12.00,  'pot-10k-lineal',  'Azul',         'Bourns',               'Potenciometro lineal de 10 kiloohms para ajustar niveles de senal, controlar entradas analogicas y regular parametros en circuitos electronicos.',                                  0.008, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d7', 'Condensador electrolitico 1000uF 25V',8.00,   'cap-1000uf-25v',  'Negro',        'Nichicon',             'Condensador electrolitico de 1000 microfaradios y 25 V para filtrado y estabilizacion de alimentacion. Componente polarizado.',                                                     0.005, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d8', 'Regulador de voltaje LM7805',         8.00,   'reg-lm7805',      'Negro',        'STMicroelectronics',   'Regulador lineal de tension positiva de 5 V para fuentes de alimentacion. Encapsulado TO-220. Requiere condiciones adecuadas de disipacion termica.',                               0.002, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965d9', 'Modulo sensor de temperatura LM35',   35.00,  'sensor-lm35',     'Negro',        'Texas Instruments',    'Sensor analogico de temperatura cuya tension de salida es proporcional a la temperatura en grados Celsius. Adecuado para proyectos de instrumentacion.',                            0.010, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965da', 'Modulo rele de 5V un canal',          25.00,  'rele-5v-1ch',     'Azul',         'Songle',               'Modulo de rele de un canal con bobina de 5 V para controlar cargas externas mediante una senal de control. Verifique el aislamiento y los limites electricos.',                     0.025, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965db', 'Modulo convertidor LM2596',           45.00,  'conv-lm2596',     'Azul',         'Texas Instruments',    'Modulo convertidor DC-DC reductor basado en LM2596 para ajustar una tension de salida inferior a la entrada. La corriente admisible depende del modulo y su refrigeracion.',        0.030, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965dc', 'Pantalla LCD 1602 con interfaz I2C',  65.00,  'lcd-1602-i2c',    'Azul',         'Generic',              'Pantalla LCD de 16 columnas por 2 filas con adaptador I2C para mostrar texto y datos de sensores en proyectos con microcontroladores.',                                             0.045, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965dd', 'Modulo RFID RC522',                   55.00,  'rfid-rc522',      'Rojo',         'NXP Semiconductors',   'Modulo lector RFID de 13.56 MHz compatible con tarjetas y etiquetas adecuadas. Comunica mediante SPI y se utiliza en proyectos de identificacion y control de acceso.',             0.015, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965de', 'Microcontrolador ATmega328P DIP-28',  65.00,  'atmega328p-dip',  'Negro',        'Microchip',            'Microcontrolador AVR de 8 bits en encapsulado DIP-28 para sistemas embebidos y proyectos electronicos. Requiere configuracion y programacion adecuadas.',                           0.002, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965df', 'Modulo Bluetooth HC-05',              95.00,  'bluetooth-hc05',  'Azul',         'Generic',              'Modulo Bluetooth serial para comunicacion inalambrica con microcontroladores y equipos compatibles. Permite transmitir datos mediante una interfaz UART.',                          0.010, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965e0', 'Ventilador DC 12V 40 mm',             35.00,  'fan-12v-40mm',    'Negro',        'Sunon',                'Ventilador compacto de corriente continua de 12 V para refrigeracion de gabinetes, fuentes y proyectos electronicos. Verifique dimensiones y consumo.',                             0.030, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965e1', 'Kit de pulsadores tactiles 12x12 mm', 18.00,  'pushbutton-12mm', 'Negro',       'Generic',               'Conjunto de pulsadores tactiles momentaneos de 12 x 12 mm para entradas digitales, prototipos y placas de circuito impreso.',                                                       0.020, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad'),
    ('e20c3e29-8faf-4bd3-afa7-a3b295b965e2', 'Kit de capacitores ceramicos',        49.00,  'cap-ceramicos',   'Multicolor',   'Varios',               'Kit surtido de capacitores ceramicos con diferentes valores de capacitancia para filtrado, desacoplamiento y experimentacion electronica.',                                         0.080, '05e7b29a-db6a-4940-b30c-f2afe2c4bfad')
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
    ('f9ead6e0-d81d-4e8d-8c55-f52f479f8ad7', 'tarjeta de débito',   1.5)
;

/*
    Domicilios de los usuarios
*/
INSERT INTO domicilios (id, numero, calle, colonia, cp, ciudad, estado, usuarios_id) VALUES
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3120', '12', 'Matamoros',           'Centro',               '59300', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a80'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3121', '55', 'Uruapan',             'Vasco de Quiroga',     '59380', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a80'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3122', '32', 'Vicente Guerrero',    'Los Ocotes',           '36933', 'Pénjamo',     'Guanajuato',   '9170894f-691d-4590-b46b-e1d2f6ca0a81'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3123', '33', 'Margaritas',          'Las Barranquillas',    '59426', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a82'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3124', '17', 'Veneto',              'Dos Plazas',           '59393', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a83'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3125', '507','Mariano Bárcena',     'Centro',               '44200', 'Guadalajara', 'Jalisco',      '9170894f-691d-4590-b46b-e1d2f6ca0a84'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3126', '12', 'Francisco I. Madero', 'Centro',               '59300', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a85'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3127', '445','Juárez',              'San Rafael',           '59370', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a85'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3128', '09', 'Hidalgo',             'Centro',               '36900', 'Pénjamo',     'Guanajuato',   '9170894f-691d-4590-b46b-e1d2f6ca0a86'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3129', '08', 'Morelos',             'Las Colonias',         '36905', 'Pénjamo',     'Guanajuato',   '9170894f-691d-4590-b46b-e1d2f6ca0a86'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3130', '133','Allende',             'Centro',               '59300', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a87'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3131', 'S\N','Zaragoza',            'Jardines del Carmen',  '59389', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a88'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3132', '442','Reforma',             'Centro',               '44100', 'Guadalajara', 'Jalisco',      '9170894f-691d-4590-b46b-e1d2f6ca0a88'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3133', '12', 'Insurgentes',         'Centro',               '59300', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a89'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3134', '99', 'Lázaro Cárdenas',     'Las Fuentes',          '59340', 'La Piedad',   'Michoacán',    '9170894f-691d-4590-b46b-e1d2f6ca0a89'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3135', '98', 'Miguel Hidalgo',      'Centro',               '36900', 'Pénjamo',     'Guanajuato',   '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),
    ('0d596de4-f3a7-4989-8ec7-f7d2d11b3136', 'S\N','5 de Mayo',           'San Miguel',           '36910', 'Pénjamo',     'Guanajuato',   '9170894f-691d-4590-b46b-e1d2f6ca0a8A')
;

-- Hora de insertar las tablas con mas movimiento
/*
    detalles_carrito
*/
INSERT INTO detalles_carrito (cantidad, precio, productos_id, usuarios_id) VALUES
    -- Gerardo Vargas Díaz (9170894f-691d-4590-b46b-e1d2f6ca0a80)
    (2, 714.0,   '8306300e-9b9b-4e59-bb79-fc394e566cf2', '9170894f-691d-4590-b46b-e1d2f6ca0a80'),    -- esp32
    (1, 4999.0,  'a6156750-11fd-44c5-bb25-3fd58bfc3cfc', '9170894f-691d-4590-b46b-e1d2f6ca0a80'),    -- Claude Fable 5.5
    (1, 29999,   '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7092', '9170894f-691d-4590-b46b-e1d2f6ca0a80'),    -- iphone 18 pro

    -- Héctor Cruz Jiménez (9170894f-691d-4590-b46b-e1d2f6ca0a81)
    (10, 3570,   '8306300e-9b9b-4e59-bb79-fc394e566cf2', '9170894f-691d-4590-b46b-e1d2f6ca0a81'),    -- esp32 (corregido el productos_id)

    -- Carmen Cortés Vargas (9170894f-691d-4590-b46b-e1d2f6ca0a82)
    (1, 14999,   '94b016d4-f851-4867-87ff-5f54f66c81da', '9170894f-691d-4590-b46b-e1d2f6ca0a82'),    -- macbook neo
    (1, 125.99,  '8306300e-9b9b-4e59-bb79-fc394e566cf4', '9170894f-691d-4590-b46b-e1d2f6ca0a82'),    -- blue pill

    -- Valeria Herrera Salazar (9170894f-691d-4590-b46b-e1d2f6ca0a83)
    (1, 32999,   '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7095', '9170894f-691d-4590-b46b-e1d2f6ca0a83'),    -- Galaxy S26 Ultra
    (1, 1999,    'a6156750-11fd-44c5-bb25-3fd58bfc3cf8', '9170894f-691d-4590-b46b-e1d2f6ca0a83'),    -- Microsoft Copilot 365 Pro

    -- Marta Sánchez González (9170894f-691d-4590-b46b-e1d2f6ca0a84)
    (1, 15399,   '94b016d4-f851-4867-87ff-5f54f66c81db', '9170894f-691d-4590-b46b-e1d2f6ca0a84'),    -- elitebook 845 G8
    (1, 1999,    'a6156750-11fd-44c5-bb25-3fd58bfc3cf8', '9170894f-691d-4590-b46b-e1d2f6ca0a84'),    -- Microsoft Copilot 365 Pro

    -- Jorge Morales Romero (9170894f-691d-4590-b46b-e1d2f6ca0a85)
    (2, 856.0,   '8306300e-9b9b-4e59-bb79-fc394e566cf3', '9170894f-691d-4590-b46b-e1d2f6ca0a85'),    -- Arduino UNO
    (1, 75.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965d0', '9170894f-691d-4590-b46b-e1d2f6ca0a85'),    -- Kit cables Dupont
    (2, 178.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965cf', '9170894f-691d-4590-b46b-e1d2f6ca0a85'),    -- Protoboard 830
    (10, 15.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965d1', '9170894f-691d-4590-b46b-e1d2f6ca0a85'),    -- LED rojo
    (10, 15.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965d2', '9170894f-691d-4590-b46b-e1d2f6ca0a85'),    -- LED verde
    (1, 189.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965cc', '9170894f-691d-4590-b46b-e1d2f6ca0a85'),    -- Kit 600 resistencias

    -- Andrés Reyes Navarrete (9170894f-691d-4590-b46b-e1d2f6ca0a86)
    (1, 3500,    'a6156750-11fd-44c5-bb25-3fd58bfc3cfa', '9170894f-691d-4590-b46b-e1d2f6ca0a86'),    -- DaiNet MICS
    (3, 5997,    'a6156750-11fd-44c5-bb25-3fd58bfc3cfb', '9170894f-691d-4590-b46b-e1d2f6ca0a86'),    -- AdmonNet Enterprice Desktop
    (1, 9999,    'b7256750-11fd-44c5-bb25-3fd58bfc3cfd', '9170894f-691d-4590-b46b-e1d2f6ca0a86'),    -- Red Hat Enterprise Linux

    -- Laura Sánchez Rodríguez (9170894f-691d-4590-b46b-e1d2f6ca0a87)
    (1, 31999,   '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7093', '9170894f-691d-4590-b46b-e1d2f6ca0a87'),    -- iphone 18 pro max
    (1, 2599,    'a6156750-11fd-44c5-bb25-3fd58bfc3cf9', '9170894f-691d-4590-b46b-e1d2f6ca0a87'),    -- Sistema NexAquA Plus

    -- Gerardo Flores Ramos (9170894f-691d-4590-b46b-e1d2f6ca0a88)
    (5, 629.95,  '8306300e-9b9b-4e59-bb79-fc394e566cf4', '9170894f-691d-4590-b46b-e1d2f6ca0a88'),    -- Blue Pill
    (2, 190.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965df', '9170894f-691d-4590-b46b-e1d2f6ca0a88'),    -- Bluetooth HC-05
    (3, 135.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965db', '9170894f-691d-4590-b46b-e1d2f6ca0a88'),    -- Convertidor LM2596
    (2, 70.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965e0', '9170894f-691d-4590-b46b-e1d2f6ca0a88'),    -- Ventilador DC 12V

    -- Andrea Cruz Hernández (9170894f-691d-4590-b46b-e1d2f6ca0a89)
    (1, 47999,   '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7094', '9170894f-691d-4590-b46b-e1d2f6ca0a89'),    -- iphone duo
    (1, 4999,    'a6156750-11fd-44c5-bb25-3fd58bfc3cfc', '9170894f-691d-4590-b46b-e1d2f6ca0a89'),    -- Claude Fable 5.5

    -- Fernando Martínez Pérez (9170894f-691d-4590-b46b-e1d2f6ca0a8A)
    (1, 357.0,   '8306300e-9b9b-4e59-bb79-fc394e566cf2', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- esp32
    (1, 55.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965dd', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- RFID RC522
    (1, 65.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965dc', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- LCD 1602 I2C
    (2, 50.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965da', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- Módulo relé 5V
    (3, 105.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965d9', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- Sensor LM35
    (4, 100.0,   'e20c3e29-8faf-4bd3-afa7-a3b295b965d5', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- MOSFET IRFZ44N
    (2, 16.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965d8', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- Regulador LM7805
    (5, 60.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965d6', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- Potenciómetro 10K
    (10, 200.0,  'e20c3e29-8faf-4bd3-afa7-a3b295b965cd', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),    -- Transistor 2N2222A
    (5, 25.0,    'e20c3e29-8faf-4bd3-afa7-a3b295b965ce', '9170894f-691d-4590-b46b-e1d2f6ca0a8A')     -- CI 555
;

/*
    pedidos, detalles_pedidos, envios
*/

-- Primer pedido del usuario 'Gerardo Vargas Díaz' con uuid '9170894f-691d-4590-b46b-e1d2f6ca0a80', 
INSERT INTO pedidos (id, fecha, importe_productos, importe_envio, fecha_hora_pago, metodos_pago_id, usuarios_id) VALUES
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae70', '2026-10-01 13:30:21-05', 213, 0, '2026-10-01 13:30:23-09', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad2', '9170894f-691d-4590-b46b-e1d2f6ca0a80')
;

INSERT INTO detalles_pedido (id, cantidad, precio, productos_id, pedidos_id) VALUES
    ('944a49f1-f1c0-41e7-a432-a2f7973ca680', 10,        1.50,       'e20c3e29-8faf-4bd3-afa7-a3b295b965d1', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae70'),  -- LED ROJO
    ('944a49f1-f1c0-41e7-a432-a2f7973ca681',  1,        20.0,       'e20c3e29-8faf-4bd3-afa7-a3b295b965cd', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae70'),  -- Transistor 2N2222A
    ('944a49f1-f1c0-41e7-a432-a2f7973ca682',  2,        89.0,       'e20c3e29-8faf-4bd3-afa7-a3b295b965cf', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae70')   -- Protoboard
;

INSERT INTO envios (id, fecha, fecha_entrega, estado, numero_seguimiento, domicilios_id, pedidos_id) VALUES
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200f6', '2026-10-01 13:31:12-01', '2026-10-02 17:00:09-01', 'ENTREGADO', '17877991805734474998', '0d596de4-f3a7-4989-8ec7-f7d2d11b3120', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae70')
;

-- Pedido del usuario 'Marta Sánchez González' con UUID '9170894f-691d-4590-b46b-e1d2f6ca0a84'
INSERT INTO pedidos (id, fecha, importe_productos, importe_envio, fecha_hora_pago, metodos_pago_id, usuarios_id) VALUES
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae71', '2026-10-01 17:09:15-01', 31999, 59, '2026-10-01 17:15:57-01', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad1', '9170894f-691d-4590-b46b-e1d2f6ca0a84')
;

INSERT INTO detalles_pedido (id, cantidad, precio, productos_id, pedidos_id) VALUES
    ('944a49f1-f1c0-41e7-a432-a2f7973ca683', 1, 31999, '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7093', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae71')
;

INSERT INTO envios (id, fecha, fecha_entrega, estado, numero_seguimiento, domicilios_id, pedidos_id) VALUES
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200f7', '2026-10-02 17:10:00-01', '2026-10-05 12:39:05-01', 'ENTREGADO', '17877991805734474337', '0d596de4-f3a7-4989-8ec7-f7d2d11b3125', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae71')
;

-- Pedido del usuario 'Andrés Reyes Navarrete' con UUID '9170894f-691d-4590-b46b-e1d2f6ca0a86'
INSERT INTO pedidos (id, fecha, importe_productos, importe_envio, fecha_hora_pago, metodos_pago_id, usuarios_id) VALUES
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae72', '2026-10-02 13:39:19-01', 31999, 59, '2026-10-05 17:00:09-01', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad1', '9170894f-691d-4590-b46b-e1d2f6ca0a86')
;

INSERT INTO detalles_pedido (cantidad, precio, productos_id, pedidos_id) VALUES
    (1, 31999, '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7093', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae72')
;

INSERT INTO envios (fecha, fecha_entrega, estado, numero_seguimiento, domicilios_id, pedidos_id) VALUES
    ('2026-10-02 17:10:00-01', '2026-10-05 12:39:05-01', 'ENTREGADO', '17877991805734474338', '0d596de4-f3a7-4989-8ec7-f7d2d11b3128', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae72')
;


/* Envios, pedidos y detallas pedidos generados de forma automatizada */
/*
    pedidos
*/
INSERT INTO pedidos (id, fecha, importe_productos, importe_envio, fecha_hora_pago, metodos_pago_id, usuarios_id) VALUES
    -- Jorge Morales Romero | tarjeta de debito
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae73', '2026-10-03 11:42:18-06',  1328.00,  59, '2026-10-03 11:43:05-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad7', '9170894f-691d-4590-b46b-e1d2f6ca0a85'),
    -- Fernando Martinez Perez | oxxo (pago al dia siguiente)
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae74', '2026-10-06 19:22:40-06',  1033.00,  59, '2026-10-07 12:05:11-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad3', '9170894f-691d-4590-b46b-e1d2f6ca0a8A'),
    -- Gerardo Flores Ramos | tarjeta de credito
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae75', '2026-10-09 20:14:33-06',  1024.95,  59, '2026-10-09 20:14:51-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad5', '9170894f-691d-4590-b46b-e1d2f6ca0a88'),
    -- Valeria Herrera Salazar | tarjeta de credito
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae76', '2026-10-12 14:03:27-06', 32999.00,  99, '2026-10-12 14:04:10-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad5', '9170894f-691d-4590-b46b-e1d2f6ca0a83'),
    -- Carmen Cortes Vargas | transferencia SPEI
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae77', '2026-10-14 10:51:02-06', 15124.99,  99, '2026-10-14 10:58:44-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad6', '9170894f-691d-4590-b46b-e1d2f6ca0a82'),
    -- Andres Reyes Navarrete | oxxo, nunca se pago (pedido cancelado)
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae78', '2026-10-15 16:48:09-06', 15399.00,  99, NULL,                      'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad3', '9170894f-691d-4590-b46b-e1d2f6ca0a86'),
    -- Gerardo Vargas Diaz | paypal
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae79', '2026-10-17 15:20:44-06',   714.00,  59, '2026-10-17 15:21:30-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad1', '9170894f-691d-4590-b46b-e1d2f6ca0a80'),
    -- Laura Sanchez Rodriguez | paypal
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae7a', '2026-10-19 18:36:12-06', 31999.00,  99, '2026-10-19 18:37:01-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad1', '9170894f-691d-4590-b46b-e1d2f6ca0a87'),
    -- Hector Cruz Jimenez | pago en efectivo (contra entrega, aun sin pagar)
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae7b', '2026-10-21 09:25:50-06',  3570.00,  99, NULL,                      'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad2', '9170894f-691d-4590-b46b-e1d2f6ca0a81'),
    -- Andrea Cruz Hernandez | tarjeta de credito
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae7c', '2026-10-23 21:12:09-06', 47999.00,  99, '2026-10-23 21:13:30-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad5', '9170894f-691d-4590-b46b-e1d2f6ca0a89'),
    -- Marta Sanchez Gonzalez | tarjeta de debito
    ('a81396a1-7ff9-470b-b82d-a3bfaf7fae7d', '2026-10-24 12:40:17-06', 15399.00,  99, '2026-10-24 12:41:02-06', 'f9ead6e0-d81d-4e8d-8c55-f52f479f8ad7', '9170894f-691d-4590-b46b-e1d2f6ca0a84')
;
 
/*
    detalles_pedido
*/
INSERT INTO detalles_pedido (id, cantidad, precio, productos_id, pedidos_id) VALUES
    -- fae73 | Jorge Morales Romero (total productos: 1328.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca684', 10,   15.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965d1', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae73'),  -- LED rojo
    ('944a49f1-f1c0-41e7-a432-a2f7973ca685', 10,   15.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965d2', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae73'),  -- LED verde
    ('944a49f1-f1c0-41e7-a432-a2f7973ca686',  2,  856.00, '8306300e-9b9b-4e59-bb79-fc394e566cf3', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae73'),  -- Arduino UNO
    ('944a49f1-f1c0-41e7-a432-a2f7973ca687',  1,   75.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965d0', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae73'),  -- Kit cables Dupont
    ('944a49f1-f1c0-41e7-a432-a2f7973ca688',  2,  178.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965cf', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae73'),  -- Protoboard 830
    ('944a49f1-f1c0-41e7-a432-a2f7973ca689',  1,  189.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965cc', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae73'),  -- Kit 600 resistencias
 
    -- fae74 | Fernando Martinez Perez (total productos: 1033.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca68a',  1,  357.00, '8306300e-9b9b-4e59-bb79-fc394e566cf2', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- ESP32
    ('944a49f1-f1c0-41e7-a432-a2f7973ca68b',  1,   55.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965dd', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- RFID RC522
    ('944a49f1-f1c0-41e7-a432-a2f7973ca68c',  1,   65.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965dc', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- LCD 1602 I2C
    ('944a49f1-f1c0-41e7-a432-a2f7973ca68d',  2,   50.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965da', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- Modulo rele 5V
    ('944a49f1-f1c0-41e7-a432-a2f7973ca68e',  3,  105.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965d9', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- Sensor LM35
    ('944a49f1-f1c0-41e7-a432-a2f7973ca68f',  4,  100.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965d5', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- MOSFET IRFZ44N
    ('944a49f1-f1c0-41e7-a432-a2f7973ca690',  2,   16.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965d8', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- Regulador LM7805
    ('944a49f1-f1c0-41e7-a432-a2f7973ca691',  5,   60.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965d6', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- Potenciometro 10K
    ('944a49f1-f1c0-41e7-a432-a2f7973ca692', 10,  200.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965cd', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- Transistor 2N2222A
    ('944a49f1-f1c0-41e7-a432-a2f7973ca693',  5,   25.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965ce', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),  -- CI 555
 
    -- fae75 | Gerardo Flores Ramos (total productos: 1024.95)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca694',  5,  629.95, '8306300e-9b9b-4e59-bb79-fc394e566cf4', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae75'),  -- Blue Pill
    ('944a49f1-f1c0-41e7-a432-a2f7973ca695',  2,  190.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965df', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae75'),  -- Bluetooth HC-05
    ('944a49f1-f1c0-41e7-a432-a2f7973ca696',  3,  135.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965db', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae75'),  -- Convertidor LM2596
    ('944a49f1-f1c0-41e7-a432-a2f7973ca697',  2,   70.00, 'e20c3e29-8faf-4bd3-afa7-a3b295b965e0', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae75'),  -- Ventilador DC 12V
 
    -- fae76 | Valeria Herrera Salazar (total productos: 32999.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca698',  1, 32999.00, '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7095', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae76'), -- Galaxy S26 Ultra
 
    -- fae77 | Carmen Cortes Vargas (total productos: 15124.99)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca699',  1, 14999.00, '94b016d4-f851-4867-87ff-5f54f66c81da', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae77'), -- macbook neo
    ('944a49f1-f1c0-41e7-a432-a2f7973ca69a',  1,   125.99, '8306300e-9b9b-4e59-bb79-fc394e566cf4', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae77'), -- Blue Pill
 
    -- fae78 | Andres Reyes Navarrete (total productos: 15399.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca69b',  1, 15399.00, '94b016d4-f851-4867-87ff-5f54f66c81db', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae78'), -- elitebook 845 G8
 
    -- fae79 | Gerardo Vargas Diaz (total productos: 714.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca69c',  2,   714.00, '8306300e-9b9b-4e59-bb79-fc394e566cf2', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae79'), -- ESP32
 
    -- fae7a | Laura Sanchez Rodriguez (total productos: 31999.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca69d',  1, 31999.00, '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7093', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7a'), -- iphone 18 pro max
 
    -- fae7b | Hector Cruz Jimenez (total productos: 3570.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca69e', 10,  3570.00, '8306300e-9b9b-4e59-bb79-fc394e566cf2', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7b'), -- ESP32
 
    -- fae7c | Andrea Cruz Hernandez (total productos: 47999.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca69f',  1, 47999.00, '4a59bd7d-4d9d-4b7a-9ca4-4281c07b7094', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7c'), -- iphone duo
 
    -- fae7d | Marta Sanchez Gonzalez (total productos: 15399.00)
    ('944a49f1-f1c0-41e7-a432-a2f7973ca6a0',  1, 15399.00, '94b016d4-f851-4867-87ff-5f54f66c81db', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7d')  -- elitebook 845 G8
;
 
/*
    envios
    (fecha de "hoy" en el escenario: 2026-10-26)
*/
INSERT INTO envios (id, fecha, fecha_entrega, estado, numero_seguimiento, domicilios_id, pedidos_id) VALUES
    -- Jorge Morales Romero (La Piedad)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200f8', '2026-10-05 09:10:00-06', '2026-10-07 14:25:37-06', 'ENTREGADO',  '17877991805734474401', '0d596de4-f3a7-4989-8ec7-f7d2d11b3126', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae73'),
    -- Fernando Martinez Perez (Penjamo)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200f9', '2026-10-08 10:30:00-06', '2026-10-12 11:48:26-06', 'ENTREGADO',  '17877991805734474402', '0d596de4-f3a7-4989-8ec7-f7d2d11b3135', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae74'),
    -- Gerardo Flores Ramos (Guadalajara)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200fa', '2026-10-12 10:05:00-06', '2026-10-14 16:32:09-06', 'ENTREGADO',  '17877991805734474403', '0d596de4-f3a7-4989-8ec7-f7d2d11b3132', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae75'),
    -- Valeria Herrera Salazar (La Piedad)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200fb', '2026-10-13 09:40:00-06', '2026-10-15 12:18:44-06', 'ENTREGADO',  '17877991805734474404', '0d596de4-f3a7-4989-8ec7-f7d2d11b3124', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae76'),
    -- Carmen Cortes Vargas (La Piedad)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200fc', '2026-10-15 11:20:00-06', '2026-10-16 15:07:31-06', 'ENTREGADO',  '17877991805734474405', '0d596de4-f3a7-4989-8ec7-f7d2d11b3123', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae77'),
    -- Andres Reyes Navarrete (Penjamo) - pedido sin pagar, cancelado
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200fd', '2026-10-19 08:00:00-06', NULL,                     'CANCELADO',  '17877991805734474406', '0d596de4-f3a7-4989-8ec7-f7d2d11b3128', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae78'),
    -- Gerardo Vargas Diaz (La Piedad)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200fe', '2026-10-19 09:50:00-06', '2026-10-21 13:15:52-06', 'ENTREGADO',  '17877991805734474407', '0d596de4-f3a7-4989-8ec7-f7d2d11b3121', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae79'),
    -- Laura Sanchez Rodriguez (La Piedad)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d200ff', '2026-10-20 10:15:00-06', NULL,                     'EN_TRANSITO','17877991805734474408', '0d596de4-f3a7-4989-8ec7-f7d2d11b3130', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7a'),
    -- Hector Cruz Jimenez (Penjamo)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d20100', '2026-10-22 11:00:00-06', NULL,                     'EN_TRANSITO','17877991805734474409', '0d596de4-f3a7-4989-8ec7-f7d2d11b3122', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7b'),
    -- Andrea Cruz Hernandez (La Piedad)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d20101', '2026-10-26 08:45:00-06', NULL,                     'PENDIENTE',  '17877991805734474410', '0d596de4-f3a7-4989-8ec7-f7d2d11b3133', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7c'),
    -- Marta Sanchez Gonzalez (Guadalajara)
    ('3fe0e6c3-1920-4d80-ba1c-599df0d20102', '2026-10-26 09:10:00-06', NULL,                     'PENDIENTE',  '17877991805734474411', '0d596de4-f3a7-4989-8ec7-f7d2d11b3125', 'a81396a1-7ff9-470b-b82d-a3bfaf7fae7d')
;

-- a81396a1-7ff9-470b-b82d-a3bfaf7fae7b