-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `rfc` varchar(12) NOT NULL,
  `ra_social` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `num_ext` int NOT NULL,
  `num_int` int DEFAULT NULL,
  `colonia` varchar(45) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `municipio` varchar(45) NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`),
  KEY `fk_empresas_estados1_idx` (`id_estado`),
  CONSTRAINT `fk_empresas_estados1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'ABC123456789','Innovatek SA de CV','55-5675-5588','Av. Reforma',205,NULL,'Juarez','Mexico DF','Cuauhtemoc',7),(2,'DEF234567890','Nexum Corporation','55-8181-8181','Av. Universidad',1100,3,'Del Valle','San Pedro Garza Garcia','Monterrey',19),(3,'GHI345678901','Cygnus Technologies','55-3323-2333','Calle 5 de Mayo',100,44,'Centro','Guadalajara','Guadalajara',14),(4,'JKL456789012','Synapse Inc','664-6677-7766','Av. Tijuana',501,567,'Hipodromo','Tijuana','Tijuana',2),(5,'MNO567890123','Innovair SA de CV','55-5252-3535','Av. Insurgentes',555,56,'Condesa','Mexico DF','Cuauhtemoc',7),(6,'PQR678901234','Neurotech Corporation','55-9081-8190','Av. Lomas del Valle',777,22,'Lomas del Valle','San Pedro Garza Garcia','Monterrey',19),(7,'STU789012345','Vortex Technologies','55-3333-3333','Calle Prisciliano Sanchez',400,NULL,'Ladron de Guevara','Guadalajara','Guadalajara',15),(8,'VWX890123456','Oxbridge Inc','664-6666-6666','Av. Pacifico',90,165,'Playas de Tijuana','Tijuana','Tijuana',2),(9,'YZA901234567','Newwave SA de CV','55-5555-5555','Av. Patriotismo',555,77,'Narvarte','Ciudad de México','Benito Juarez',7),(10,'BCD012345678','Emergent Technologies','81-8181-8181','Av. Gomez Morin',777,NULL,'San Pedro Garza Garcia','San Pedro Garza Garcia','Monterrey',19);
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) NOT NULL,
  `abreviatura` varchar(6) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Aguascalientes','AGS'),(2,'Baja California','BC'),(3,'Baja California Sur','BCS'),(4,'Campeche','CC'),(5,'Chiapas','CS'),(6,'Chihuahua','CH'),(7,'Ciudad de México','CDMX'),(8,'Coahuila','CL'),(9,'Colima','CM'),(10,'Durango','DG'),(11,'Estado de México','EDOMEX'),(12,'Guanajuato','GTO'),(13,'Guerrero','GRO'),(14,'Hidalgo','HGO'),(15,'Jalisco','JC'),(16,'Michoacán','MN'),(17,'Morelos','MS'),(18,'Nayarit','NT'),(19,'Nuevo León','NL'),(20,'Oaxaca','OAX'),(21,'Puebla','PL'),(22,'Querétaro','QRO'),(23,'Quintana Roo','QR'),(24,'San Luis Potosí','SLP'),(25,'Sinaloa','SL'),(26,'Sonora','SR'),(27,'Tabasco','TC'),(28,'Tamaulipas','TS'),(29,'Tlaxcala','TL'),(30,'Veracruz','VZ'),(31,'Yucatán','YN'),(32,'Zacatecas','ZS');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuestos`
--

DROP TABLE IF EXISTS `presupuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuestos` (
  `id_presupuesto` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `costo_materiales` float NOT NULL,
  `total_salarios` float NOT NULL,
  `costos_prod` float NOT NULL,
  `precio_fin` float DEFAULT NULL,
  PRIMARY KEY (`id_presupuesto`),
  UNIQUE KEY `id_proyecto_UNIQUE` (`id_proyecto`),
  KEY `fk_presupuestos_proyectos1_idx` (`id_proyecto`),
  CONSTRAINT `fk_presupuestos_proyectos1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuestos`
--

LOCK TABLES `presupuestos` WRITE;
/*!40000 ALTER TABLE `presupuestos` DISABLE KEYS */;
INSERT INTO `presupuestos` VALUES (1,1,80000,95000,20000,195000),(2,2,250000,500000,150000,900000),(3,3,20000,50000,15000,85000),(4,4,2000000,3500000,1500000,7000000),(5,5,60000,40000,10000,110000),(6,6,200000,100000,30000,330000),(7,7,50000,85000,15000,150000),(8,8,10000,25000,10000,45000),(9,9,30000,40000,10000,80000),(10,10,100000,1600000,30000,1730000),(11,11,20000,35000,15000,70000),(12,12,600000,400000,90000,1090000),(13,13,3000000,1500000,1000000,5500000),(14,14,50000,10000,15000,75000),(15,15,20000,20000,10000,50000);
/*!40000 ALTER TABLE `presupuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  `fecha_prev_fin` datetime NOT NULL,
  `datos` varchar(500) NOT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `fk_proyectos_empresas1_idx` (`id_empresa`),
  CONSTRAINT `fk_proyectos_empresas1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,1,'2021-03-01 00:00:00','2021-08-31 00:00:00','2021-08-31 00:00:00','Proyecto de desarrollo de un sistema de gestión de inventarios'),(2,3,'2021-07-01 00:00:00','2022-01-31 00:00:00','2022-01-31 00:00:00','Proyecto de investigación en energías renovables'),(3,3,'2021-08-01 00:00:00','2022-02-28 00:00:00','2022-02-28 00:00:00','Proyecto de capacitación en habilidades sociales'),(4,2,'2021-09-01 00:00:00','2022-03-31 00:00:00','2022-03-31 00:00:00','Proyecto de investigación en biotecnología'),(5,8,'2022-01-01 00:00:00','2022-02-28 00:00:00','2022-03-01 00:00:00','Proyecto de Capacitación en Ventas'),(6,2,'2022-01-15 00:00:00','2022-03-15 00:00:00','2022-03-20 00:00:00','Proyecto de Desarrollo de Software'),(7,10,'2022-02-01 00:00:00','2022-07-31 00:00:00','2023-07-31 00:00:00','Proyecto de consultoría en finanzas'),(8,3,'2022-02-01 00:00:00','2022-03-31 00:00:00','2022-03-31 00:00:00','Proyecto de Marketing Digital'),(9,10,'2022-02-01 00:00:00','2022-03-31 00:00:00','2022-04-15 00:00:00','Proyecto de Investigación de Mercado'),(10,4,'2022-02-15 00:00:00','2022-04-15 00:00:00','2022-04-30 00:00:00','Proyecto de Redes de Computadoras'),(11,5,'2022-03-01 00:00:00','2022-04-30 00:00:00','2022-05-15 00:00:00','Proyecto de Recursos Humanos'),(12,6,'2022-03-01 00:00:00','2022-05-31 00:00:00','2022-06-15 00:00:00','Proyecto de Consultoría de Negocios'),(13,6,'2022-03-01 00:00:00','2022-08-31 00:00:00','2022-08-31 00:00:00','Proyecto de investigación en inteligencia artificial'),(14,7,'2022-04-01 00:00:00','2022-06-30 00:00:00','2022-06-30 00:00:00','Proyecto de Diseño Gráfico'),(15,7,'2022-04-01 00:00:00','2022-10-31 00:00:00','2022-10-31 00:00:00','Proyecto de diseño de un sitio web');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_trabajadores`
--

DROP TABLE IF EXISTS `proyectos_trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos_trabajadores` (
  `id_proyecto_trabajador` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `id_trabajador` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_proyecto_trabajador`),
  KEY `fk_proyectos_has_trabajadores_trabajadores1_idx` (`id_trabajador`),
  KEY `fk_proyectos_has_trabajadores_proyectos1_idx` (`id_proyecto`),
  KEY `fk_proyectos_trabajadores_roles1_idx` (`id_rol`),
  CONSTRAINT `fk_proyectos_has_trabajadores_proyectos1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_proyectos_has_trabajadores_trabajadores1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_proyectos_trabajadores_roles1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_trabajadores`
--

LOCK TABLES `proyectos_trabajadores` WRITE;
/*!40000 ALTER TABLE `proyectos_trabajadores` DISABLE KEYS */;
INSERT INTO `proyectos_trabajadores` VALUES (1,1,1,2),(2,1,2,3),(3,1,3,3),(4,1,4,3),(5,1,5,3),(6,1,6,2),(7,2,4,2),(8,2,6,3),(9,2,8,1),(10,2,9,1),(11,2,10,1),(12,2,2,1),(13,2,15,3),(14,3,1,1),(15,3,8,2),(16,3,15,2),(17,3,14,2),(18,3,19,3),(19,4,13,2),(20,4,7,3),(21,4,2,1),(22,4,1,2),(23,4,16,1),(24,4,20,1),(25,5,1,2),(26,5,14,1),(27,5,3,1),(28,5,12,2),(29,5,4,1),(30,5,6,1),(31,6,12,3),(32,6,1,1),(33,6,14,2),(34,6,7,3),(35,6,20,1),(36,6,9,2),(37,7,11,3),(38,7,6,2),(39,7,17,1),(40,7,2,3),(41,7,14,1),(42,7,8,2),(43,8,10,2),(44,8,15,3),(45,8,5,1),(46,8,3,2),(47,8,16,1),(48,8,9,3),(49,9,15,2),(50,9,3,1),(51,9,19,2),(52,9,6,1),(53,9,10,3),(54,9,12,1),(55,9,8,2),(56,9,14,1),(57,9,1,3),(58,10,13,2),(59,10,7,3),(60,10,2,1),(61,10,1,2),(62,10,16,1),(63,10,20,1),(64,11,8,1),(65,11,14,2),(66,11,5,3),(67,11,17,1),(68,11,3,2),(69,11,19,3),(70,12,9,2),(71,12,18,3),(72,12,7,1),(73,12,5,2),(74,12,16,1),(75,12,3,3),(76,13,8,2),(77,13,17,3),(78,13,10,1),(79,13,3,2),(80,13,16,1),(81,13,6,1),(82,14,9,1),(83,14,17,3),(84,14,6,1),(85,14,8,2),(86,14,12,1),(87,14,5,3),(88,15,8,2),(89,15,17,3),(90,15,4,1),(91,15,13,2),(92,15,6,1),(93,15,19,1);
/*!40000 ALTER TABLE `proyectos_trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_pagos`
--

DROP TABLE IF EXISTS `registro_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `monto_pago` float NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `fk_pagos_proyectos_idx` (`id_proyecto`),
  CONSTRAINT `fk_pagos_proyectos` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_pagos`
--

LOCK TABLES `registro_pagos` WRITE;
/*!40000 ALTER TABLE `registro_pagos` DISABLE KEYS */;
INSERT INTO `registro_pagos` VALUES (1,1,'2021-03-01 00:00:00',119000),(2,1,'2021-04-01 00:00:00',19000),(3,1,'2021-05-01 00:00:00',19000),(4,1,'2021-06-01 00:00:00',19000),(5,1,'2021-07-01 00:00:00',19000),(6,1,'2021-08-01 00:00:00',19000),(7,2,'2021-07-01 00:00:00',483334),(8,2,'2021-08-01 00:00:00',83333),(9,2,'2021-09-01 00:00:00',83333),(10,2,'2021-10-01 00:00:00',83333),(11,2,'2021-11-01 00:00:00',83333),(12,2,'2021-12-01 00:00:00',83333),(13,2,'2022-01-01 00:00:00',83333),(14,3,'2021-08-01 00:00:00',43334),(15,3,'2021-09-01 00:00:00',8333),(16,3,'2021-10-01 00:00:00',8333),(17,3,'2021-11-01 00:00:00',8333),(18,3,'2021-12-01 00:00:00',8333),(19,3,'2022-01-01 00:00:00',8333),(20,3,'2022-02-01 00:00:00',8333),(21,4,'2021-09-01 00:00:00',4200000),(22,4,'2021-10-01 00:00:00',700000),(23,4,'2021-11-01 00:00:00',700000),(24,4,'2021-12-01 00:00:00',700000),(25,4,'2022-01-01 00:00:00',700000),(26,4,'2022-02-01 00:00:00',700000),(27,4,'2022-03-01 00:00:00',700000),(28,5,'2022-01-01 00:00:00',90000),(29,6,'2022-01-15 00:00:00',180000),(30,6,'2022-02-15 00:00:00',50000),(31,6,'2022-03-15 00:00:00',50000),(32,7,'2022-02-01 00:00:00',152000),(33,7,'2022-03-01 00:00:00',17000),(34,7,'2022-04-01 00:00:00',17000),(35,7,'2022-05-01 00:00:00',17000),(36,7,'2022-06-01 00:00:00',17000),(37,7,'2022-07-01 00:00:00',17000),(38,8,'2022-02-01 00:00:00',60000),(39,9,'2022-02-01 00:00:00',90000),(40,10,'2022-02-15 00:00:00',2430000),(41,10,'2022-03-15 00:00:00',800000),(42,10,'2022-04-15 00:00:00',800000),(43,11,'2022-03-01 00:00:00',85000),(44,12,'2022-03-01 00:00:00',690000),(45,12,'2022-04-01 00:00:00',200000),(46,12,'2022-05-01 00:00:00',200000),(47,13,'2022-03-01 00:00:00',1900000),(48,13,'2022-04-01 00:00:00',300000),(49,13,'2022-05-01 00:00:00',300000),(50,13,'2022-06-01 00:00:00',300000),(51,13,'2022-07-01 00:00:00',300000),(52,13,'2022-08-01 00:00:00',300000),(53,14,'2022-04-01 00:00:00',30000),(54,14,'2022-05-01 00:00:00',5000),(55,14,'2022-06-01 00:00:00',5000),(56,15,'2022-04-01 00:00:00',32000),(57,15,'2022-05-01 00:00:00',2000),(58,15,'2022-06-01 00:00:00',2000),(59,15,'2022-07-01 00:00:00',2000),(60,15,'2022-08-01 00:00:00',2000),(61,15,'2022-09-01 00:00:00',2000),(62,15,'2022-10-01 00:00:00',2000);
/*!40000 ALTER TABLE `registro_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'analista'),(2,'jefe de proyecto'),(3,'programador'),(4,'administrador de diseño');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sueldos`
--

DROP TABLE IF EXISTS `sueldos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sueldos` (
  `id_sueldo` int NOT NULL AUTO_INCREMENT,
  `monto_x_hora` float NOT NULL,
  `horas_trab` datetime NOT NULL,
  `sueldo_total` float NOT NULL,
  PRIMARY KEY (`id_sueldo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sueldos`
--

LOCK TABLES `sueldos` WRITE;
/*!40000 ALTER TABLE `sueldos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sueldos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `id_trabajador` int NOT NULL AUTO_INCREMENT,
  `rfc` varchar(13) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `ap_paterno` varchar(30) NOT NULL,
  `ap_materno` varchar(30) DEFAULT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `num_ext` int NOT NULL,
  `num_int` int DEFAULT NULL,
  `colonia` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `municipio` varchar(45) NOT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_trabajador`),
  UNIQUE KEY `rfc_UNIQUE` (`rfc`),
  KEY `fk_trabajadores_estados1_idx` (`id_estado`),
  CONSTRAINT `fk_trabajadores_estados1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (1,'GAFA860102JL2','Gabriela','Fernández','Alonso','5551234567','gfernandez@example.com','Av. Juárez',10,NULL,'Centro','Ciudad de México','Cuauhtémoc',7),(2,'RAMG910927HG7','Rosa María','González','Méndez','5553456789','rgonzalez@example.com','Calle 5 de Mayo',20,NULL,'La Merced','Ciudad de México','Venustiano Carranza',7),(3,'CAMC880604H5A','Carlos','Montes','Castillo','5554567890','cmontes@example.com','Calle Revolución',150,NULL,'Las Águilas','Ciudad de México','Álvaro Obregón',7),(4,'ALJG810624H45','Ana','López','Jiménez','5557890123','alopez@example.com','Av. Universidad',245,NULL,'Copilco Universidad','Ciudad de México','Coyoacán',7),(5,'DIAF800904IU3','Diego','Álvarez','Fernández','5559012345','dalvarez@example.com','Calle Ayuntamiento',50,NULL,'Santa María la Ribera','Ciudad de México','Cuauhtémoc',7),(6,'TJTRK981026T5','Karla','Téllez','Ramírez','4422778899','karla.tellez@gmail.com','Calle Tulipanes',25,102,'Colonia Las Flores','Querétaro','Querétaro',22),(7,'MORLN8611036Z','Luis','Moreno','López','4492345678','luis.moreno@outlook.com','Calle Mirador',45,53,'Fraccionamiento La Vista','Aguascalientes','Aguascalientes',1),(8,'PGZCS901012P2','Samantha','Pérez','Guzmán','9843657890','samantha.perez@gmail.com','Calle 10 de Mayo',110,NULL,'Fraccionamiento Los Pinos','Playa del Carmen','Solidaridad',23),(9,'JRRVZ940101F2','Víctor','Jiménez','Rivera','2293876543','victor.jimenez@hotmail.com','Calle Naranjos',11,87,'Fraccionamiento San Martín','Veracruz','Veracruz',30),(10,'RVLRR931224H3','Ricardo','Valdez','López','6562345678','ricardo.valdez@yahoo.com','Calle América',22,NULL,'Colonia Los Arcos','Ciudad Juárez','Juárez',8),(11,'CRLLC9111045V','Luisa','Carrillo','López','9512345678','luisa.carrillo@hotmail.com','Calle Reforma',45,NULL,'Fraccionamiento Las Palmas','Oaxaca de Juárez','Oaxaca',20),(12,'LPLCG9408247J','Gabriela','López','Pérez','3334567890','gabriela.lopez@gmail.com','Calle Hidalgo',8,92,'Fraccionamiento La Cima','Guadalajara','Jalisco',15),(13,'BDRDN890312T2','Natalia','Barrera','Durán','4445678901','natalia.barrera@hotmail.com','Calle Paseo de las Flores',15,NULL,'Fraccionamiento Santa Fe','San Luis Potosí','San Luis Potosí',24),(14,'SOMA930125HDF','Sofía','Maldonado','Salcedo','8112345678','sofiamaldonado@gmail.com','Av. Hidalgo',22,203,'Centro','Monterrey','Monterrey',19),(15,'VAAD680527HDF','Valentín','Álvarez','Dávila','8187654321','valentinalvarez@hotmail.com','Calle Victoria',102,205,'Del Valle','San Pedro Garza García','San Pedro Garza García',19),(16,'NURA760712HDF','Nuria','Ramírez','López','5556789012','nurialopez@gmail.com','Av. de los Insurgentes',65,1204,'Juárez','Puebla','Puebla',21),(17,'ALEV921218MDF','Alexis','Vega','Lara','5523456789','alexisvega@hotmail.com','Av. Juárez',206,1205,'San Felipe de Jesús','Ciudad de México','Ciudad de México',7),(18,'MARN900501HDF','Mario','Núñez','Aguilar','5567890123','marionunez@hotmail.com','Calle del Bosque',23,4,'Lomas de Chapultepec','Ciudad de México','Ciudad de México',7),(19,'LORO940513HDF','Lorena','Rojas','Torres','5558901234','lorenarojas@gmail.com','Calle 5 de Mayo',304,405,'Centro','Toluca','Toluca',11),(20,'VITA910610HDF','Víctor','Talamantes','Tovar','5589012345','victortalamantes@gmail.com','Calle Morelos',2,1,'Centro','Tlaxcala','Tlaxcala',29);
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores_sueldos`
--

DROP TABLE IF EXISTS `trabajadores_sueldos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores_sueldos` (
  `id_trabajador_sueldo` int NOT NULL AUTO_INCREMENT,
  `id_trabajador` int NOT NULL,
  `id_sueldo` int NOT NULL,
  PRIMARY KEY (`id_trabajador_sueldo`),
  KEY `fk_trabajadores_has_sueldos_sueldos1_idx` (`id_sueldo`),
  KEY `fk_trabajadores_has_sueldos_trabajadores1_idx` (`id_trabajador`),
  CONSTRAINT `fk_trabajadores_has_sueldos_sueldos1` FOREIGN KEY (`id_sueldo`) REFERENCES `sueldos` (`id_sueldo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_trabajadores_has_sueldos_trabajadores1` FOREIGN KEY (`id_trabajador`) REFERENCES `trabajadores` (`id_trabajador`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores_sueldos`
--

LOCK TABLES `trabajadores_sueldos` WRITE;
/*!40000 ALTER TABLE `trabajadores_sueldos` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajadores_sueldos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-16 11:37:28
