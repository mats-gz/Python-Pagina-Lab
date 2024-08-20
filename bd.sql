-- Active: 1722942989265@@127.0.0.1@3306@CopaReno
CREATE DATABASE CopaReno

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Colegios'
-- 
-- ---

DROP TABLE IF EXISTS `Colegios`;
		
CREATE TABLE `Colegios` (
  `id_colegio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_colegio`)
);

-- ---
-- Table 'Equipos'
-- 
-- ---

DROP TABLE IF EXISTS `Equipos`;
		
CREATE TABLE `Equipos` (
  `id_equipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `id_colegio` INT NOT NULL,
  `entrenador` VARCHAR(100) NULL DEFAULT NULL,
  `categoria` varchar(20) NOT NULL COMMENT 'FUTBOL,VOLEY O BASQUET',
  `puntos_totales` int DEFAULT NULL,
  `clasificación_final` varchar(50) DEFAULT NULL COMMENT 'Posición Nº(X)',
  PRIMARY KEY (`id_equipo`)
);

-- ---
-- Table 'Participantes'
-- 
-- ---

DROP TABLE IF EXISTS `Participantes`;
		
CREATE TABLE `Participantes` (
  `id_participante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  `id_equipo` INT NOT NULL,
  `posicion` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_participante`)
);

-- ---
-- Table 'Partidos'
-- 
-- ---

DROP TABLE IF EXISTS `Partidos`;
		
CREATE TABLE `Partidos` (
  `id_partido` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `lugar` VARCHAR(100) NOT NULL,
  `equipo_local` INT NOT NULL,
  `equipo_visitante` INT NOT NULL,
  `resultado` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_partido`)
);

-- ---
-- Table 'Estadisticas'
-- 
-- ---

DROP TABLE IF EXISTS `Estadisticas`;
		
CREATE TABLE `Estadisticas` (
  `id_estadistica` INT NOT NULL AUTO_INCREMENT,
  `id_partido` INT NOT NULL,
  `id_participante` INT NOT NULL,
  `goles` INT NULL DEFAULT NULL,
  `asistencias` INT NULL DEFAULT NULL,
  `tarjetas_amarillas` INT NULL DEFAULT NULL,
  `tarjetas_rojas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_estadistica`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Equipos` ADD FOREIGN KEY (id_colegio) REFERENCES `Colegios` (`id_colegio`);
ALTER TABLE `Participantes` ADD FOREIGN KEY (id_equipo) REFERENCES `Equipos` (`id_equipo`);
ALTER TABLE `Partidos` ADD FOREIGN KEY (equipo_local) REFERENCES `Equipos` (`id_equipo`);
ALTER TABLE `Partidos` ADD FOREIGN KEY (equipo_visitante) REFERENCES `Equipos` (`id_equipo`);
ALTER TABLE `Estadisticas` ADD FOREIGN KEY (id_partido) REFERENCES `Partidos` (`id_partido`);
ALTER TABLE `Estadisticas` ADD FOREIGN KEY (id_participante) REFERENCES `Participantes` (`id_participante`);

-- ---
-- Entidades adentro de las tablas, COLEGIO
-- ---

INSERT INTO Colegios (id_colegio, nombre, direccion, telefono, correo_electronico) VALUES 
(1, 'Monserrat', NULL, NULL, NULL),
(2, 'Manuel Belgrano', NULL, NULL, NULL),
(3, 'Instituto Técnico Renault', NULL, NULL, NULL),
(4, 'Dr. Alejandro Carbó', NULL, NULL, NULL),
(5, 'San José', NULL, NULL, NULL),
(6, 'Instituto Secundario Mariano Moreno', NULL, NULL, NULL),
(7, 'Santa Infancia', NULL, NULL, NULL),
(8, 'Taborin', NULL, NULL, NULL),
(9, 'Villada', NULL, NULL, NULL),
(10, 'San Pablo', NULL, NULL, NULL),
(11, 'Sagrado Corazón', NULL, NULL, NULL),
(12, 'Colegio Cristo Rey', NULL, NULL, NULL),
(13, 'San Pedro', NULL, NULL, NULL),
(14, 'La Salle', NULL, NULL, NULL),
(15, 'Instituto Juan Zorrilla de San Martín', NULL, NULL, NULL),
(16, 'Pías', NULL, NULL, NULL);



INSERT INTO Equipos (id_equipo, nombre, id_colegio, entrenador, categoria, puntos_totales, clasificación_final) VALUES
-- Monserrat
(1, 'Monserrat', 1, NULL, 'futbol', NULL, 'Posición Nº(3)'),
(2, 'Monserrat', 1, NULL, 'voley', NULL, 'Posición Nº(5)'),
(3, 'Monserrat', 1, NULL, 'basquet', NULL, 'Posición Nº(2)'),
-- Manuel Belgrano
(4, 'Manuel Belgrano', 2, NULL, 'futbol', NULL, 'Posición Nº(10)'),
(5, 'Manuel Belgrano', 2, NULL, 'voley', NULL, 'Posición Nº(1)'),
(6, 'Manuel Belgrano', 2, NULL, 'basquet', NULL, 'Posición Nº(7)'),
-- Instituto Técnico Renault
(7, 'Instituto Técnico Renault', 3, NULL, 'futbol', NULL, 'Posición Nº(8)'),
(8, 'Instituto Técnico Renault', 3, NULL, 'voley', NULL, 'Posición Nº(11)'),
(9, 'Instituto Técnico Renault', 3, NULL, 'basquet', NULL, 'Posición Nº(4)'),
-- Dr. Alejandro Carbó
(10, 'Dr. Alejandro Carbó', 4, NULL, 'futbol', NULL, 'Posición Nº(2)'),
(11, 'Dr. Alejandro Carbó', 4, NULL, 'voley', NULL, 'Posición Nº(13)'),
(12, 'Dr. Alejandro Carbó', 4, NULL, 'basquet', NULL, 'Posición Nº(8)'),
-- San José
(13, 'San José', 5, NULL, 'futbol', NULL, 'Posición Nº(7)'),
(14, 'San José', 5, NULL, 'voley', NULL, 'Posición Nº(4)'),
(15, 'San José', 5, NULL, 'basquet', NULL, 'Posición Nº(14)'),
-- Instituto Secundario Mariano Moreno
(16, 'Instituto Secundario Mariano Moreno', 6, NULL, 'futbol', NULL, 'Posición Nº(12)'),
(17, 'Instituto Secundario Mariano Moreno', 6, NULL, 'voley', NULL, 'Posición Nº(9)'),
(18, 'Instituto Secundario Mariano Moreno', 6, NULL, 'basquet', NULL, 'Posición Nº(1)'),
-- Santa Infancia
(19, 'Santa Infancia', 7, NULL, 'futbol', NULL, 'Posición Nº(15)'),
(20, 'Santa Infancia', 7, NULL, 'voley', NULL, 'Posición Nº(6)'),
(21, 'Santa Infancia', 7, NULL, 'basquet', NULL, 'Posición Nº(11)'),
-- Taborin
(22, 'Taborin', 8, NULL, 'futbol', NULL, 'Posición Nº(5)'),
(23, 'Taborin', 8, NULL, 'voley', NULL, 'Posición Nº(14)'),
(24, 'Taborin', 8, NULL, 'basquet', NULL, 'Posición Nº(16)'),
-- Villada
(25, 'Villada', 9, NULL, 'futbol', NULL, 'Posición Nº(9)'),
(26, 'Villada', 9, NULL, 'voley', NULL, 'Posición Nº(16)'),
(27, 'Villada', 9, NULL, 'basquet', NULL, 'Posición Nº(5)'),
-- San Pablo
(28, 'San Pablo', 10, NULL, 'futbol', NULL, 'Posición Nº(11)'),
(29, 'San Pablo', 10, NULL, 'voley', NULL, 'Posición Nº(2)'),
(30, 'San Pablo', 10, NULL, 'basquet', NULL, 'Posición Nº(15)'),
-- Sagrado Corazón
(31, 'Sagrado Corazón', 11, NULL, 'futbol', NULL, 'Posición Nº(4)'),
(32, 'Sagrado Corazón', 11, NULL, 'voley', NULL, 'Posición Nº(7)'),
(33, 'Sagrado Corazón', 11, NULL, 'basquet', NULL, 'Posición Nº(12)'),
-- Colegio Cristo Rey
(34, 'Colegio Cristo Rey', 12, NULL, 'futbol', NULL, 'Posición Nº(13)'),
(35, 'Colegio Cristo Rey', 12, NULL, 'voley', NULL, 'Posición Nº(8)'),
(36, 'Colegio Cristo Rey', 12, NULL, 'basquet', NULL, 'Posición Nº(10)'),
-- San Pedro
(37, 'San Pedro', 13, NULL, 'futbol', NULL, 'Posición Nº(14)'),
(38, 'San Pedro', 13, NULL, 'voley', NULL, 'Posición Nº(10)'),
(39, 'San Pedro', 13, NULL, 'basquet', NULL, 'Posición Nº(3)'),
-- La Salle
(40, 'La Salle', 14, NULL, 'futbol', NULL, 'Posición Nº(6)'),
(41, 'La Salle', 14, NULL, 'voley', NULL, 'Posición Nº(12)'),
(42, 'La Salle', 14, NULL, 'basquet', NULL, 'Posición Nº(6)'),
-- Instituto Juan Zorrilla de San Martín
(43, 'Instituto Juan Zorrilla de San Martín', 15, NULL, 'futbol', NULL, 'Posición Nº(16)'),
(44, 'Instituto Juan Zorrilla de San Martín', 15, NULL, 'voley', NULL, 'Posición Nº(15)'),
(45, 'Instituto Juan Zorrilla de San Martín', 15, NULL, 'basquet', NULL, 'Posición Nº(9)'),
-- Pías
(46, 'Pías', 16, NULL, 'futbol', NULL, 'Posición Nº(1)'),
(47, 'Pías', 16, NULL, 'voley', NULL, 'Posición Nº(3)'),
(48, 'Pías', 16, NULL, 'basquet', NULL, 'Posición Nº(13)');

-- ---
-- Table 'Cantina'
-- 
-- ---

DROP TABLE IF EXISTS `Cantina`;


CREATE TABLE `Cantina` (
  `id_plato` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `disponibilidad` BOOLEAN NOT NULL DEFAULT TRUE,
  `imagen` VARCHAR(255) NULL DEFAULT NULL, -- Columna para la URL de la imagen
  PRIMARY KEY (`id_plato`)
);

-- ---
-- Insertar platos en la tabla 'Cantina' con la misma URL de imagen
-- ---

INSERT INTO `Cantina` (`id_plato`, `nombre`, `descripcion`, `precio`, `disponibilidad`, `imagen`) VALUES
(1, 'Hamburguesa', 'Hamburguesa con lechuga, tomate, queso y papas fritas', 1200.00, TRUE, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Cheeseburger.jpg/1024px-Cheeseburger.jpg'),
(2, 'Choripán', 'Choripán con chimichurri y salsa criolla', 800.00, TRUE, 'https://img.freepik.com/fotos-premium/choripan-sandwich-tradicional-argentino-salsa-chorizo-chimichurri-aislado_123827-2326.jpg'),
(3, 'Pizza', 'Pizza de mozzarella con orégano y aceitunas', 1000.00, TRUE, 'https://media.istockphoto.com/id/496546118/photo/slice-of-fresh-italian-classic-original-pepperoni-pizza-isolated.jpg?s=612x612&w=0&k=20&c=7aYapAwoe4fO5jRiNMIFiflIztcBAA8s-GLqAmBiSgA='),
(4, 'Empanada', 'Empanada de carne o pollo, al horno o frita', 200.00, TRUE, 'https://betos.com.ar/wp-content/uploads/2019/08/empanada-arabes.png'),
(5, 'Lomito', 'Lomito completo con lechuga, tomate, jamón, queso y papas fritas', 1500.00, TRUE, 'https://media.tiempodesanjuan.com/p/d262e0dc0ded3cfa3eb4896aa4e225b3/adjuntos/331/imagenes/000/624/0000624382/790x0/smart/8260jpg.jpg'),
(6, 'Ensalada', 'Ensalada mixta con lechuga, tomate, cebolla y zanahoria', 500.00, TRUE, 'https://media.istockphoto.com/id/953810510/es/foto/ensalada-verde-con-vegetales-frescos.jpg?s=612x612&w=0&k=20&c=mq8z75Woc8NcW3spX-RGcBp9Mq_tAuBB3Qio_CYaKiM='),
(7, 'Papas Fritas', 'Papas fritas crujientes con sal', 400.00, TRUE, 'https://img.freepik.com/foto-gratis/papas-fritas_74190-1192.jpg');

-- ---
-- Table 'Sponsors'
-- 
-- ---

DROP TABLE IF EXISTS `Sponsors`;

CREATE TABLE `Sponsors` (
  `id_sponsor` INT NOT NULL AUTO_INCREMENT, -- ID único para cada patrocinador
  `nombre` VARCHAR(100) NOT NULL, -- Nombre del patrocinador
  `logo` VARCHAR(255) NULL DEFAULT NULL, -- URL o ruta del logo
  `descripcion` TEXT NULL DEFAULT NULL, -- Descripción del patrocinador
  PRIMARY KEY (`id_sponsor`) -- Llave primaria
);

-- Insertar datos de ejemplo en la tabla 'Sponsors'
INSERT INTO `Sponsors` (`nombre`, `logo`, `descripcion`) VALUES
('Pritty', 'https://www.pritty.com.ar/img/imgredes.jpg', 'Es una reconocida marca argentina de bebidas, famosa por su línea de gaseosas y aguas saborizadas. Fundada en 1968, Pritty se ha consolidado como un referente en el mercado de bebidas no alcohólicas en Argentina, ofreciendo productos que se destacan por su sabor refrescante y calidad.'),
('Coca-Cola Andina', 'https://ams3.digitaloceanspaces.com/graffica/2023/02/cocacola-logo-1024x696.jpeg', 'Coca-Cola Andina es una de las principales embotelladoras de Coca-Cola en Argentina, con operaciones en Córdoba. Se dedica a la producción, comercialización y distribución de bebidas de la marca Coca-Cola.'),
('Arcor', 'https://mir-s3-cdn-cf.behance.net/projects/404/1a76e5142362123.62a66f5815524.jpg', 'Arcor es una empresa multinacional argentina, líder en la producción de alimentos, golosinas y chocolates. Fundada en 1951 en Arroyito, Córdoba, Arcor se ha expandido internacionalmente y es conocida por su calidad e innovación en el sector alimenticio.'),
('Sancor', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5ECRjsN9JgaJNVbAjdcr2oYPRlxYhfZVqwg&s', 'Sancor es una de las principales cooperativas lácteas de Argentina, con sede en Sunchales, Santa Fe, y una fuerte presencia en Córdoba. Sancor ofrece una amplia gama de productos lácteos de alta calidad.'),
('La Voz del Interior', 'https://upload.wikimedia.org/wikipedia/commons/9/9c/La_Voz_del_Interior_logo.png', 'La Voz del Interior es uno de los principales diarios de Córdoba y de Argentina, fundado en 1904. Ofrece noticias locales, nacionales e internacionales y es una referencia importante en el periodismo cordobés.'),
('Grupo Edisur', 'https://seeklogo.com/images/L/la-voz-del-interior-logo-75C60A791E-seeklogo.com.png', 'Grupo Edisur es una destacada empresa desarrolladora de bienes raíces en Córdoba. Especializada en la construcción de viviendas, edificios y proyectos urbanísticos, se ha convertido en un referente del sector inmobiliario en la región.'),
('Tarjeta Naranja', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdossiernet.com%2Farticulo%2Fnaranja-presenta-su-nueva-imagen%2F11431&psig=AOvVaw0EEFyYYL3yK-lo4CRw1Ov-&ust=1724240830990000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLiqlofAg4gDFQAAAAAdAAAAABAE', 'Tarjeta Naranja es la principal emisora de tarjetas de crédito no bancarias en Argentina, con sede en Córdoba. Fundada en 1985, se destaca por su innovación y su fuerte presencia en el mercado financiero argentino.'),
('Bimbo', 'https://w7.pngwing.com/pngs/1015/945/png-transparent-mexico-bakery-grupo-bimbo-bimbo-bakeries-usa-business-people-dog-like-mammal-logo.png', 'Bimbo es una empresa multinacional mexicana de alimentos, famosa por su pan y productos de panadería. En Argentina, y específicamente en Córdoba, Bimbo tiene una fuerte presencia y es conocida por su variedad de productos de alta calidad.'),
('Bancor', 'https://play-lh.googleusercontent.com/Zv_iPYQaKUxHMwXDW3kHB_MSFbwWnXcS7L_0SJrV9v4uAwaDpllhHl6BMQYRuTHiRJs7', 'Bancor, el Banco de Córdoba, es una institución financiera líder en la provincia de Córdoba. Ofrece una amplia gama de servicios bancarios y financieros a individuos y empresas, destacándose por su compromiso con el desarrollo económico y social de la región.');

 